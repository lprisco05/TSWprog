package arduinoTSW.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import arduinoTSW.model.*;

public class ProductDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ProductDao(Connection con) {
		this.con = con;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();

		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));

				products.add(row);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<>();

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select * from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();

					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public Product getSingleProduct(int id) {
		Product row = null;

		try {

			query = "select * from products where id = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));

			}

		} catch (Exception e) {
			return null;
		}
		return row;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select price from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();

					while (rs.next()) {
						sum += rs.getDouble("price") * item.getQuantity();

					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sum;
	}

	public void updateProduct(Product product) {
		String sql = "UPDATE products SET name=?, category=?, price=?, image=? WHERE id=?";

		try (PreparedStatement statement = con.prepareStatement(sql)) {
			statement.setString(1, product.getName());
			statement.setString(2, product.getCategory());
			statement.setDouble(3, product.getPrice());
			statement.setString(4, product.getImage());
			statement.setInt(5, product.getId());

			int rowsUpdated = statement.executeUpdate();
			if (rowsUpdated > 0) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteProduct(int id) {
		String sql = "DELETE FROM products WHERE id = ?";
		try (PreparedStatement statement = con.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	public void addProduct(Product product) {
		
	}
	

}
