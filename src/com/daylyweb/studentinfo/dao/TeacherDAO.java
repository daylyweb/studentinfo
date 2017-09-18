package com.daylyweb.studentinfo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.daylyweb.studentinfo.beans.Teacher;

public class TeacherDAO {
	Connection con;
	public TeacherDAO()
	{
	}

	public boolean insert(Teacher teacher)
	{
		try {
			con=JDBC.getConnection();
			PreparedStatement ps =con.prepareStatement("insert into Teacher(id,name,sex,birthyear,edu,title,entryyear,school) values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, teacher.getId());
			ps.setString(2, teacher.getName());
			ps.setString(3, teacher.getSex());
			ps.setString(4, teacher.getBirthyear());
			ps.setString(5, teacher.getEdu());
			ps.setString(6, teacher.getTitle());
			ps.setString(7, teacher.getEntryyear());
			ps.setString(8,teacher.getSchool());
			if(ps.executeUpdate()==1) {ps.close();JDBC.closeConnection();return true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean upadte(Teacher teacher)
	{
		boolean flag = false;
		PreparedStatement ps;
		try {
			con=JDBC.getConnection();
			ps = con.prepareStatement("update teacher set name=?,sex=?,birthyear=?,edu=?,title=?,entryyear=?,school=? where id=?");
			ps.setString(1, teacher.getName());
			ps.setString(2,teacher.getSex());
			ps.setString(3,teacher.getBirthyear());
			ps.setString(4,teacher.getEdu());
			ps.setString(5,teacher.getTitle());
			ps.setString(6, teacher.getEntryyear());
			ps.setString(7, teacher.getSchool());
			ps.setInt(8, teacher.getId());
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
			if(con.createStatement().executeUpdate("delete from teacher where id="+id)==1) {flag=true;}
			else flag= false;
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return flag;
	}
	
	public Teacher queryById(int id)
	{
		ResultSet rs;
		Teacher teacher =null;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from teacher where id="+id);
			if(rs.getMetaData().getColumnCount()<1){teacher=null;}
			else
			{
				while(rs.next())
				{
					teacher = new Teacher(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				}
				rs.close();
			}
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return teacher;
	}
	
	public ArrayList<Teacher> queryAll()
	{
		ArrayList<Teacher> teachers=new ArrayList<Teacher>();
		try {
			con=JDBC.getConnection();
			ResultSet rs=con.createStatement().executeQuery("select * from teacher");
			if(rs.getMetaData().getColumnCount()<1){teachers=null;}
				while(rs.next())
				{
					teachers.add(new Teacher(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
				}
			rs.close();
			JDBC.closeConnection();
			return teachers;
		} catch (SQLException e) {
			return null;
		}
	}
	
	public String queryNameById(int id)
	{
		String name = null;
		ResultSet rs;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select name from teacher where id="+id);
			if(rs.next())
			{
				
				name= rs.getString(1);
			}
			rs.close();
			JDBC.closeConnection();
		}catch(SQLException e) {
			return null;
		}
		return name;
	}
	
	public boolean isExistById(int id)
	{
		ResultSet rs;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from teacher where id="+id);
			if(rs.next()){rs.close();return  true;}
			rs.close();
			JDBC.closeConnection();
		}catch(SQLException e) {
			return false;
		}
		return false;
	}
}
