package org.studentinfo.beans;

import java.util.ArrayList;

import org.studentinfo.beans.Student;
import org.studentinfo.dao.StudentDAO;
import org.studentinfo.dao.UserDAO;

public class StudentBean implements java.io.Serializable {
	private StudentDAO dao;
	UserDAO userdao = new UserDAO();
	private ArrayList<Student> allstudent;
	private int page=1;
	private int allpage=1;
	private int size=0;
	private int alter=4;
	public StudentBean()
	{
		 dao =new StudentDAO();
	}
	
	public ArrayList<Student> getAllstudent()
	{
		return allstudent;
	}
	public int getSize()
	{
		return allstudent.size();
	}
	public Student getStudent(int index)
	{
		return allstudent.get(index);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page=page;
	}
	public int getAllpage()
	{
		if(allstudent.size()<=9){return 1;}
		this.allpage=(int)(Math.ceil((double)(allstudent.size())/10));
		return allpage;
	}
	public void setAlter(int alter)  /*1 添加    2 修改    3删除*/
	{
		this.alter=alter;
	}
	public String alter(Student stu)
	{
		String msg="";
		boolean flag= dao.isExistById(stu.getId());

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
				User user = new User(stu.getId(),String.valueOf(stu.getId()),"123456",3);
				userdao.delete(user.getUserid());
				if(dao.insert(stu) && userdao.insert(user)){msg="添加成功！";}else{msg="添加失败！";} break;
			case 2:if(dao.upadte(stu)){msg="修改成功！";}else{msg="修改失败！";} break;
			case 3:if(dao.delete(stu.getId())&&userdao.delete(stu.getId())){msg="删除成功！";}else{msg="删除失败！";} break;
			default:msg="未知操作！";
		}
		return msg;
	}
	public Student queryById(int id)
	{
		return dao.queryById(id);
	}

	public StudentDAO getDao() {
		return dao;
	}

	public int getAlter() {
		return alter;
	}

	public void setAllstudent(ArrayList<Student> allstudent) {
		this.allstudent = dao.queryAll();
	}

}
