package arduinoTSW.dao;


import java.sql.*;
import java.util.*;

import arduinoTSW.model.Order;
import arduinoTSW.model.Product;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrder(Order model) {
		boolean result = false;
		try {
			
			//o_id p_id u_id o_quantity o_date price_at_purchase
			query = "insert into orders (p_name, u_id, o_quantity, o_date, price_at_purchase) values(?,?,?,?,?)";
			pst = this.con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, model.getName());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4,model.getDate());
			pst.setDouble(5,model.getTotal());
			pst.executeUpdate();
			result=true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public List<Order> userOrders(int Userid)
	{
		List<Order> list = new ArrayList<>();
		
		try 
		{
			query = "select * from orders where u_id = ? order by orders.o_id desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1,  Userid);
			rs = pst.executeQuery();
			
			while(rs.next())
			{
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con); 
				//int pId = rs.getInt("p_id");
				//oid pname uid quantity pricealcomprare
				//Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("o_id"));
				order.setName(rs.getString("p_name"));
				order.setPrice(rs.getDouble("price_at_purchase")); 
				order.setQuantity(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				list.add(order);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
		
	}
	public void cancelOrder(int id)
	{
		try 
		{
			query = "delete from orders where o_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("o_id"));
                order.setName(rs.getString("p_name"));
                order.setUid(rs.getInt("u_id"));
                System.out.println("questo è u.id = "+ order.getUid());
                order.setTotal(rs.getDouble("price_at_purchase"));
                order.setQuantity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
	
	
	
	 public List<Order> getOrdersByDate(String date) {
	        List<Order> list = new ArrayList<>();
	        try {
	            query = "select * from orders where o_date = ? order by orders.o_id desc";
	            pst = this.con.prepareStatement(query);
	            pst.setString(1, date);
	            rs = pst.executeQuery();
	            while (rs.next()) {
	                Order order = new Order();
	                order.setOrderId(rs.getInt("o_id"));
	                order.setName(rs.getString("p_name"));
	                order.setTotal(rs.getDouble("price_at_purchase"));
	                order.setUid(rs.getInt("u_id"));
	                System.out.println("questo è u.id = "+ order.getUid());
	                order.setQuantity(rs.getInt("o_quantity"));
	                order.setDate(rs.getString("o_date"));
	                list.add(order);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	 
	 
	 
	    public List<Order> getOrdersByUserEmail(String email) {
	        List<Order> list = new ArrayList<>();
	        try {
	            query = "select * from orders o join users u on o.u_id = u.id where u.email = ? order by o.o_id desc";
	            pst = this.con.prepareStatement(query);
	            pst.setString(1, email);
	            rs = pst.executeQuery();
	            while (rs.next()) {
	                Order order = new Order();
	                order.setOrderId(rs.getInt("o_id"));
	                order.setName(rs.getString("p_name"));
	                order.setUid(rs.getInt("u_id"));
	                System.out.println("questo è u.id = "+ order.getUid());
	                order.setTotal(rs.getDouble("price_at_purchase"));
	                order.setQuantity(rs.getInt("o_quantity"));
	                order.setDate(rs.getString("o_date"));
	                list.add(order);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	    
	    
	 // Metodo per ottenere gli ordini in base alla data e all'email dell'utente
	    public List<Order> getOrdersByDateAndUserEmail(String date, String email) {
	        List<Order> list = new ArrayList<>();
	        try {
	            query = "select * from orders o join users u on o.u_id = u.id where o.o_date = ? and u.email = ? order by o.o_id desc";
	            pst = this.con.prepareStatement(query);
	            pst.setString(1, date);
	            pst.setString(2, email);
	            rs = pst.executeQuery();
	            
	            while (rs.next()) {
	                Order order = new Order();
	                order.setOrderId(rs.getInt("o_id"));
	                order.setName(rs.getString("p_name"));
	                order.setPrice(rs.getDouble("price_at_purchase"));
	                order.setUid(rs.getInt("u_id"));
	                order.setQuantity(rs.getInt("o_quantity"));
	                order.setDate(rs.getString("o_date"));
	                list.add(order);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }

}
