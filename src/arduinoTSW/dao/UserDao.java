package arduinoTSW.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import arduinoTSW.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public UserDao(Connection con) 
	{
		this.con = con;
	}
	
	public User userLogin(String email, String password)
	{
		User user = null;
		try {
			
			query = "select * from users where email = ? and password = ?"; //prevent injections
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next())
			{
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAdmin(rs.getBoolean("admin"));
				
			}
			
		}catch (Exception e)
		{
			e.printStackTrace();
			
		}
		
		return user;
	}
	public String getUserEmailById(int userId) {
        String email = null;
        try {
            query = "select email from users where id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, userId);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                email = rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }

}
