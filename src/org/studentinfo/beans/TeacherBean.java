package org.studentinfo.beans;

import java.util.ArrayList;

import org.studentinfo.dao.StudentDAO;
import org.studentinfo.dao.TeacherDAO;
import org.studentinfo.dao.UserDAO;

public class TeacherBean {
	private TeacherDAO dao;
	UserDAO userdao = new UserDAO();
	private ArrayList<Teacher> allteacher;
	private int page=1;
	private int allpage=1;
	private int size=0;
	private int alter=4;
	public TeacherBean()
	{
		 dao =new TeacherDAO();
	}
	
	public ArrayList<Teacher> getAllteacher()
	{
		return allteacher;
	}
	public int getSize()
	{
		return allteacher.size();
	}
	public Teacher getTeacher(int index)
	{
		return allteacher.get(index);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page=page;
	}
	public int getAllpage()
	{
		if(allteacher.size()<=9){return 1;}
		this.allpage=(int)(Math.ceil((double)(allteacher.size())/10));
		return allpage;
	}
	public void setAlter(int alter)  /*1 添加    2 修改    3删除*/
	{
		this.alter=alter;
	}
	public String alter(Teacher teacher)
	{
		String msg="";
		boolean flag = dao.isExistById(teacher.getId());
		if(alter==1 && flag)
		{
			return "id已存在！请修改！";
		}
		else if(alter!=1 && !flag)
		{
			return "要操作的id不存在！请修改！";
		}
		switch(alter)
		{
			case 1:
				User user = new User(teacher.getId(),String.valueOf(teacher.getId()),"123456",2);
				userdao.delete(user.getUserid());
				if(dao.insert(teacher) && userdao.insert(user)){msg="添加成功！";}else{msg="添加失败！";} break;
			case 2:if(dao.upadte(teacher)){msg="修改成功！";}else{msg="修改失败！";} break;
			case 3:
				if(dao.delete(teacher.getId()) && userdao.delete(teacher.getId())){msg="删除成功！";}else{msg="删除失败！";} break;
			default:msg="未知操作！";
		}
		return msg;
	}
	public Teacher queryById(int id)
	{
		return dao.queryById(id);
	}

	public TeacherDAO getDao() {
		return dao;
	}

	public int getAlter() {
		return alter;
	}

	public void setAllteacher(ArrayList<Teacher> allteacher) {
		this.allteacher = dao.queryAll();
	}
}
