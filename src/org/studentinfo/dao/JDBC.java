package org.studentinfo.dao;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
public class JDBC {
	static Connection con=null;
	static String driver;
	static String jdbcUrl;
	static Properties pro;
	static
	{
		pro = new Properties();
		try {
			pro.load(new BufferedInputStream(JDBC.class.getResourceAsStream("jdbc.properties")));
			driver = pro.getProperty("driverClass", "com.mysql.jdbc.Driver");
			jdbcUrl = pro.getProperty("jdbcUrl", "jdbc:mysql://localhost:3306/yicou?userUnicode=true&characterEncoding=utf-8");
			Class.forName(driver);
			con = DriverManager.getConnection(jdbcUrl, pro);
		} catch (IOException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public JDBC()
	{
		
	}
	
	public static Connection getConnection()
	{
		try {
			if(con.isClosed())
			{
				con = DriverManager.getConnection(jdbcUrl, pro);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return con;
	}
	
	public static boolean closeConnection()
	{
		try {
			con.close();
			if(con.isClosed()) return true;
			return false;
		} catch (SQLException e) {
			System.out.println("数据库连接关闭失败！"+e.getMessage());
			return false;
		}
	}
}
