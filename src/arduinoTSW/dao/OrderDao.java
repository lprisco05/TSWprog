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
			query = "insert into orders(p_id, u_id, o_quantity, o_date,total) values(?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4,model.getDate());
			pst.setDouble(5, model.getQuantity()*model.getPrice());
			pst.executeUpdate();
			result=true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public List<Order> userOrders(int id)
	{
		List<Order> list = new ArrayList<>();
		
		try 
		{
			query = "select * from orders where u_id = ? order by orders.o_id desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1,  id);
			rs = pst.executeQuery();
			
			while(rs.next())
			{
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con); 
				int pId = rs.getInt("p_id");
				//qua fa male perché prendo i prodotti ma nun è cos
				Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("o_id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setPrice(product.getPrice()*rs.getInt("o_quantity")); 
				order.setCategory(product.getCategory());
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
}
