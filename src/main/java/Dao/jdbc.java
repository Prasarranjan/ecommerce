package Dao;

import entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class jdbc {
    public static java.sql.Connection getConnection() {

        java.sql.Connection Con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom", "root", "prasar123");
            if (Con != null) {
                System.out.println("database successfully connected");
            } else {
                System.out.println("database connection failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Con;
    }
    public static List<Product> show(int typeid){
        ArrayList<Product> list = new ArrayList<>();
        Connection conn = getConnection();  {
            String sql = "SELECT name,image,price,typeid,productid FROM product WHERE typeid = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, typeid);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    Product pd=new Product();
                    pd.setProductName(rs.getString("name"));
                    pd.setProductImage(rs.getString("image"));
                    pd.setPrice(rs.getDouble("price"));
                    pd.setTypeId(rs.getInt("typeid"));
                    pd.setProductId(rs.getInt("productid"));
                    list.add(pd);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
        }
    }

