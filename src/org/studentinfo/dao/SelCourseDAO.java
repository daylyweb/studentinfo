package org.studentinfo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.studentinfo.beans.Class;
import org.studentinfo.beans.SelCourse;
	
public class SelCourseDAO {
	Connection con;
	ClassDAO classdao = new ClassDAO();
	public boolean insert(SelCourse selcourse)
	{
			con=JDBC.getConnection();
			try {
				PreparedStatement ps = con.prepareStatement("insert into selcourse(classid,studentid,grade) values(?,?,?)");
				ps.setInt(1, selcourse.getClassid());
				ps.setInt(2, selcourse.getStudentid());
				ps.setInt(3, selcourse.getGrade());
				if(ps.executeUpdate()==1){ps.close();return true;}
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			return false;
	}
	
	public boolean upadte(SelCourse selcourse)
	{
		boolean flag = false;
		PreparedStatement ps;
		con=JDBC.getConnection();
		try {
			ps = con.prepareStatement("update selcourse set grade=? where studentid=? and classid=?");
			ps.setInt(1,selcourse.getGrade());
			ps.setInt(2, selcourse.getStudentid());
			ps.setInt(3,selcourse.getClassid());
			if(ps.executeUpdate()==1){ps.close();flag=true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	
	public boolean delete(int id)
	{
		boolean flag = false;
		try {
			con=JDBC.getConnection();
			if(con.createStatement().executeUpdate("delete from selcourse where studentid="+id)==1) {flag=true;}
			else flag= false;
			JDBC.closeConnection();
		} catch (SQLException e) {
		}
		return flag;
	}
	
	public boolean delete(SelCourse selcourse)
	{
		boolean flag = false;
			con=JDBC.getConnection();
			try {
				if(con.createStatement().executeUpdate("delete from selcourse where classid="+selcourse.getClassid()+" and studentid="+selcourse.getStudentid())>0);
				{return true;}
			
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
	}
	
	public ArrayList<Class> queryByStudentId(int studentid)
	{
		ResultSet rs;
		ArrayList<Class> classes=new ArrayList();
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select classid from selcourse where studentid="+studentid);
			while(rs.next())
			{
				classes.add(classdao.queryById(rs.getInt(1)));
			}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return classes;
	}
	public ArrayList<Class> queryOkByStudentId(int studentid)
	{
		ResultSet rs;
		ArrayList<Class> classes=new ArrayList();
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select classid from selcourse where studentid="+studentid+" and grade > -1");
			while(rs.next())
			{
				classes.add(classdao.queryById(rs.getInt(1)));
			}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return classes;
	}
	public boolean isExist(int classid)
	{
		ResultSet rs;
		boolean flag=false;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from selcourse where classid="+classid);
			if(rs.next()){flag=true;}
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public boolean isExist(int classid,int studentid)
	{
		ResultSet rs;
		boolean flag=false;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from selcourse where studentid="+studentid+" and classid="+classid);
			if(rs.next()){flag=true;}
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public boolean isOk(int classid,int studentid)
	{
		if(queryGrade(classid,studentid)!=-1)	return true;
		return false;
	}
	public int queryGrade(int classid,int studentid)
	{
		ResultSet rs;
		int grade=-1;
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select grade from selcourse where studentid="+studentid+" and classid="+classid);
			if(rs.next())
			{
				grade=rs.getInt(1);
			}
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return grade;

	}
	public ArrayList<SelCourse> queryByClassId(int classid)
	{
		ResultSet rs;
		ArrayList<SelCourse> students=new ArrayList();
		try {
			con=JDBC.getConnection();
			rs = con.createStatement().executeQuery("select * from selcourse where classid="+classid);
			while(rs.next())
			{
				students.add(new SelCourse(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
			}
			rs.close();
			JDBC.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
}
