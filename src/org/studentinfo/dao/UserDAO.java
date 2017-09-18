 package org.studentinfo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.studentinfo.beans.Teacher;
import org.studentinfo.beans.User;

public  class UserDAO {
	Connection con;
	ArrayList<User> users = new ArrayList();
	public UserDAO()
	{
	}
	
	public boolean insert(User User)
	{
			boolean flag = false;
			PreparedStatement ps;
			try {
				con=JDBC.getConnection();
				ps = con.prepareStatement("insert into user(userid,username,password,type) values(?,?,?,?)");
				ps.setInt(1, User.getUserid());
				ps.setString(2, User.getUsername());
				ps.setString(3, User.getPassword());
				ps.setInt(4, User.getType());
				if(ps.executeUpdate()==1) {ps.close();flag=true;}
				else flag= false;
				JDBC.closeConnection();
			} catch (SQLException e) {
				flag=false;
				e.printStackTrace();
			}
			return flag;
	}
	
	public boolean upadte(User User)
	{
		boolean flag = false;
		PreparedStatement ps;
		try {
			con=JDBC.getConnection();
			ps = con.prepareStatement("update user set username=?,password=?,type=? where userid=?");
			ps.setString(1, User.getUsername());
			ps.setString(2, User.getPassword());
			ps.setInt(3, User.getType());
			ps.setInt(4, User.getUserid());
			if(ps.executeUpdate()==1) {flag=true;}
			else flag= false;
			if(!ps.isClosed()) ps.close();
			JDBC.closeConnection();
			
		} catch (SQLException e) {
			flag=false;
		}
		return flag;
	}
	
	
	public boolean delete(int userid)
	{
		boolean flag = false;
		try {
			con=JDBC.getConnection();
			if(con.createStatement().executeUpdate("delete from user where userid="+userid)==1) {flag=true;}
			else flag= false;
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return flag;
	}
	
	public User queryByUserName(String username)
	{
		ResultSet rs;
		User User = null;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from user where username='"+username+"'");
				while(rs.next())
				{
					User = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
				}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			User=null;
		}
		return User;
	}
	
	public User queryByUserId(int id)
	{
		ResultSet rs;
		User User = null;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from user where userid="+id);
				while(rs.next())
				{
					User = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
				}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			User=null;
		}
		return User;
	}
	
	public boolean alterpass(User User)
	{
		boolean flag = false;
		PreparedStatement ps;
		try {
			con=JDBC.getConnection();
			ps = con.prepareStatement("update user set password=? where userid=?");
			ps.setString(1, User.getPassword());
			ps.setInt(2, User.getUserid());
			if(ps.executeUpdate()==1) {flag=true;}
			else flag= false;
			if(!ps.isClosed()) ps.close();
			JDBC.closeConnection();
			
		} catch (SQLException e) {
			flag=false;
		}
		return flag;
	}
	
	public ArrayList<User> queryAll() {
		ResultSet rs;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from user where type !=1");
				while(rs.next())
				{
					users.add(new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
				}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			users=null;
		}
		return users;
	}
}
