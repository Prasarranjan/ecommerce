package entity;

public class Product {
    private int productId;
    private String productName;
    private String productImage;
    private int typeId;
    private double price;

    // Constructor


    // Getter for productId
    public int getProductId() {
        return productId;
    }

    // Setter for productId
    public void setProductId(int productId) {
        this.productId = productId;
    }

    // Getter for productName
    public String getProductName() {
        return productName;
    }

    // Setter for productName
    public void setProductName(String productName) {
        this.productName = productName;
    }

    // Getter for productImage
    public String getProductImage() {
        return productImage;
    }

    // Setter for productImage
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    // Getter for typeId
    public int getTypeId() {
        return typeId;
    }

    // Setter for typeId
    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    // Getter for price
    public double getPrice() {
        return price;
    }

    // Setter for price
    public void setPrice(double price) {
        this.price = price;
    }

    // Optional: Override toString for easy display
    @Override
    public String toString() {
        return "Product [productId=" + productId + ", productName=" + productName +
                ", productImage=" + productImage + ", typeId=" + typeId + ", price=" + price + "]";
    }
}
