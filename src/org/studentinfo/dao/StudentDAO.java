package org.studentinfo.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.studentinfo.beans.Student;
public class StudentDAO {
	Connection con;
	public StudentDAO()
	{
	}
	
	public boolean insert(Student student)
	{
		try {
			con=JDBC.getConnection();
			PreparedStatement ps =con.prepareStatement("insert into student(id,name,sex,birthyear,entrydate,school) values(?,?,?,?,?,?)");
			ps.setInt(1, student.getId());
			ps.setString(2, student.getName());
			ps.setString(3, student.getSex());
			ps.setString(4, student.getBirthyear());
			ps.setString(5, student.getEntrydate());
			ps.setString(6, student.getSchool());
			if(ps.executeUpdate()==1) {ps.close();return true;}
			JDBC.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean upadte(Student student)
	{
		boolean flag = false;
		PreparedStatement ps;
		try {
			con=JDBC.getConnection();
			ps = con.prepareStatement("update student set name=?,sex=?,birthyear=?,entrydate=?,school=? where id=?");
			ps.setString(1, student.getName());
			ps.setString(2,student.getSex());
			ps.setString(3,student.getBirthyear());
			ps.setString(4,student.getEntrydate());
			ps.setString(5,student.getSchool());
			ps.setInt(6, student.getId());
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
			if(con.createStatement().executeUpdate("delete from student where id="+id)==1) {flag=true;}
			else flag= false;
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return flag;
	}
	
	public Student queryById(int id)
	{
		ResultSet rs;
		Student student =null;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from student where id="+id);
			if(rs.getMetaData().getColumnCount()<1){student=null;}
			else
			{
				while(rs.next())
				{
					student = new Student(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
				}
				rs.close();
			}
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return student;
	}
	
	public String queryNameById(int id)
	{
		ResultSet rs;
		String name="";
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select name from student where id="+id);
			while(rs.next())
			{
				name = rs.getString(1);
			}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	
	public ArrayList<Student> queryAll()
	{
		ArrayList<Student> students=new ArrayList<Student>();
		try {
			con=JDBC.getConnection();
			ResultSet rs=con.createStatement().executeQuery("select * from student");
			if(rs.getMetaData().getColumnCount()<1){students=null;}
				while(rs.next())
				{
					students.add(new Student(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
				}
			rs.close();
			JDBC.closeConnection();
			return students;
		} catch (SQLException e) {
			return null;
		}
	}
	
	
	public boolean isExistById(int id)
	{
		ResultSet rs;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from student where id="+id);
			if(rs.next()){rs.close();return  true;}
			rs.close();
			JDBC.closeConnection();
		}catch(SQLException e) {
			return false;
		}
		return false;
	}
}
