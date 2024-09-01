package controller;


import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Cell;
import entity.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

@WebServlet("/downloadInvoice")
public class DownloadInvoiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        double grandTotal = calculateGrandTotal(cart);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=invoice.pdf");

        try (OutputStream outputStream = response.getOutputStream()) {
            PdfWriter pdfWriter = new PdfWriter(outputStream);
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            Document document = new Document(pdfDocument);

            document.add(new Paragraph("Invoice").setFontSize(20).setBold());

            Table table = new Table(new float[]{4, 2, 2, 2});
            table.addHeaderCell(new Cell().add(new Paragraph("Product Name")));
            table.addHeaderCell(new Cell().add(new Paragraph("Price")));
            table.addHeaderCell(new Cell().add(new Paragraph("Quantity")));
            table.addHeaderCell(new Cell().add(new Paragraph("Total")));

            if (cart != null) {
                for (CartItem item : cart.values()) {
                    double itemTotal = item.getProductPrice() * item.getQuantity();
                    table.addCell(new Cell().add(new Paragraph(item.getProductName())));
                    table.addCell(new Cell().add(new Paragraph(String.format("₹%.2f", item.getProductPrice()))));
                    table.addCell(new Cell().add(new Paragraph(String.valueOf(item.getQuantity()))));
                    table.addCell(new Cell().add(new Paragraph(String.format("₹%.2f", itemTotal))));
                }
            }

            document.add(table);
            document.add(new Paragraph("Grand Total: ₹" + String.format("%.2f", grandTotal)).setBold());

            document.close();
        }
    }

    private double calculateGrandTotal(Map<Integer, CartItem> cart) {
        double grandTotal = 0.0;
        if (cart != null) {
            for (CartItem item : cart.values()) {
                grandTotal += item.getProductPrice() * item.getQuantity();
            }
        }
        return grandTotal;
    }
}

