package org.studentinfo.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.studentinfo.beans.Class;
import org.studentinfo.beans.Student;
public class ClassDAO {
	Connection con;
	public ClassDAO()
	{
	}
	
	public boolean insert(Class Class)
	{
		try {
			con=JDBC.getConnection();
			PreparedStatement ps =con.prepareStatement("insert into class(id,name,teacher,time,classroom,weeks,type,grade) values(?,?,?,?,?,?,?,?)");
			ps.setInt(1,Class.getId());
			ps.setString(2, Class.getName());
			ps.setInt(3,Class.getTeacher());
			ps.setString(4,Class.getTime());
			ps.setString(5,Class.getClassroom());
			ps.setString(6,Class.getWeeks());
			ps.setString(7,Class.getType());
			ps.setDouble(8, Class.getGrade());
			if(ps.executeUpdate()==1) {ps.close();return true;}
			JDBC.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean upadte(Class Class)
	{
		boolean flag = false;
		PreparedStatement ps;
		try {
			con=JDBC.getConnection();
			ps = con.prepareStatement("update class set name=?,teacher=?,time=?,classroom=?,weeks=?,type=?,grade=? where id=?");
			ps.setString(1, Class.getName());
			ps.setInt(2,Class.getTeacher());
			ps.setString(3,Class.getTime());
			ps.setString(4,Class.getClassroom());
			ps.setString(5,Class.getWeeks());
			ps.setString(6, Class.getType());
			ps.setDouble(7, Class.getGrade());
			ps.setInt(8, Class.getId());
			if(ps.executeUpdate()==1) {flag=true;}
			else flag= false;
			if(!ps.isClosed()) ps.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			flag=false;
		}
		return flag;
	}
	
	public boolean delete(int id)
	{
		boolean flag = false;
		try {
			con=JDBC.getConnection();
			if(con.createStatement().executeUpdate("delete from class where id="+id)==1) {flag=true;}
			else flag= false;
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return flag;
	}
	
	public Class queryById(int id)
	{
		ResultSet rs;
		Class Class =null;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from class where id="+id);
			if(rs.getMetaData().getColumnCount()<1){Class=null;}
			else
			{
				while(rs.next())
				{
					Class = new Class(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getDouble(8));
				}
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Class;
	}
	
	public ArrayList<Class> queryAll()
	{
		ArrayList<Class> Classes=new ArrayList<Class>();
		try {
			con=JDBC.getConnection();
			ResultSet rs=con.createStatement().executeQuery("select * from class");
			if(rs.getMetaData().getColumnCount()<1){Classes=null;}
				while(rs.next())
				{
					Classes.add(new Class(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getDouble(8)));
				}
			rs.close();
			JDBC.closeConnection();
			return Classes;
		} catch (SQLException e) {
			return null;
		}
	}
	
	
	public boolean isExistById(int id)
	{
		ResultSet rs;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from class where id="+id);
			if(rs.next()){rs.close();JDBC.closeConnection();return  true;}
		}catch(SQLException e) {
			return false;
		}
		return false;
	}
	public ArrayList<Class> queryByTeacher(int teacherid)
	{
		ArrayList<Class> Classes = new ArrayList();
		try {
			con=JDBC.getConnection();
			ResultSet rs=con.createStatement().executeQuery("select * from class where teacher="+teacherid);
				while(rs.next())
				{
					Classes.add(new Class(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8)));
				}
			rs.close();
			JDBC.closeConnection();
			return Classes;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
