package org.studentinfo.beans;

import java.sql.Connection;
import java.util.ArrayList;

import org.studentinfo.beans.*;
import org.studentinfo.dao.UserDAO;


public class UserBean implements java.io.Serializable{
	private UserDAO dao;
	private User User;
	private ArrayList<User> alluser;
	private int page=1;
	private int allpage=1;
	private int size=0;
	private int alter=4;
	public UserBean()
	{
		dao = new UserDAO();
	}
	
	public User logincheck(User User)
	{
		String user=User.getUsername();
		  User temp;
		  temp= dao.queryByUserName(user);
		  if(temp==null)
		  {
			  if(this.isNum(user))
			  {
				  temp=dao.queryByUserId(Integer.parseInt(user));
				  if(temp!=null)
				  {
					  if(temp.getPassword().equals(User.getPassword()))
						{
							return temp;
						}
				  }
			  }
			  return null;
		  }
		  else
		  {
				if(temp.getPassword().equals(User.getPassword()))
				{
					return temp;
				}
				return null;
		  }
	}
	
	
	
	public boolean isNum(String str)
	{
		String regex="^\\d+$";
		if(str.matches(regex))
		{
			return true;
		}
		return false;
	}

	public User getUser() {
		return User;
	}

	public void setUser(User User) {
		this.User = User;
	}

	public ArrayList<User> getAlluser()
	{
		return alluser;
	}
	public int getSize()
	{
		return alluser.size();
	}
	public User getUser(int index)
	{
		return alluser.get(index);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page=page;
	}
	public int getAllpage()
	{
		if(alluser.size()<=9){return 1;}
		this.allpage=(int)(Math.ceil((double)(alluser.size())/10));
		return allpage;
	}
	public void setAlter(int alter)  /*1 添加    2 修改    3删除*/
	{
		this.alter=alter;
	}
	public String alter(User user)
	{
		String msg="";
		User temp= dao.queryByUserId(user.getUserid());
		if(alter==1 && temp!=null)
		{
			return "id已存在！请修改！";
		}
		else if(alter!=1 && temp==null)
		{
			return "要操作的id不存在！请修改！";
		}
		switch(alter)
		{
			case 1:if(dao.insert(user)){msg="添加成功！";}else{msg="添加失败！";} break;
			case 2:if(dao.upadte(user)){msg="修改成功！";}else{msg="修改失败！";} break;
			case 3:if(dao.delete(user.getUserid())){msg="删除成功！";}else{msg="删除失败！";} break;
			case 4:
				if(user.getUsername().equals((dao.queryByUserId(user.getUserid())).getPassword())==false) //用username充当一下旧密码
				{
					msg="原密码错误！";
					return msg;
				}
				if(dao.alterpass(user)){msg="修改成功！请牢记新密码！";}else{msg="修改失败！";} break;
			default:msg="未知操作！";
		}
		return msg;
	}
	public org.studentinfo.beans.User queryById(int id)
	{
		return dao.queryByUserId(id);
	}

	public UserDAO getDao() {
		return dao;
	}

	public int getAlter() {
		return alter;
	}

	public void setAlluser(ArrayList<User> alluser) {
		this.alluser = dao.queryAll();
	}
}
