package com.daylyweb.studentinfo.beans;

import java.util.ArrayList;

import com.daylyweb.studentinfo.dao.ClassDAO;
import com.daylyweb.studentinfo.dao.SelCourseDAO;
import com.daylyweb.studentinfo.dao.TeacherDAO;

public class ClassBean implements java.io.Serializable {
	private ClassDAO dao;
	TeacherDAO teacherdao = new TeacherDAO();
	private ArrayList<Class> allclass;
	private int page=1;
	private int size;
	private int allpage=1;
	private int alter=4;
	public ClassBean()
	{
		 dao = new ClassDAO();
	}
	
	public ArrayList<Class> getAllclass()
	{
		return allclass;
	}
	public int getSize()
	{
		return allclass.size();
	}
	public Class getStudent(int index)
	{
		return allclass.get(index);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page=page;
	}
	public int getAllpage()
	{
		if(allclass.size()<=9){return 1;}
		this.allpage=(int)(Math.ceil((double)(allclass.size())/10));
		return allpage;
	}
	public void setAlter(int alter)  /*1 添加    2 修改    3删除*/
	{
		this.alter=alter;
	}
	public String alter(Class Class)
	{
		String msg="";
		boolean flag = dao.isExistById(Class.getId());
		if(alter==1 && flag)
		{
			return "id已存在！请修改！";
		}
		else if(alter!=1 && !flag)
		{
			return "要操作的id不存在！请修改！";
		}
		else if(alter!=3 && !teacherdao.isExistById(Class.getTeacher()))
		{
			return "教师id不存在！请修改！";
		}
		switch(alter)
		{
			case 1:if(dao.insert(Class)){msg="添加成功！";}else{msg="添加失败！";} break;
			case 2:if(dao.upadte(Class)){msg="修改成功！";}else{msg="修改失败！";} break;
			case 3:
				if(new SelCourseDAO().isExist(Class.getId())) msg="删除失败！课程已被学生选择！";
				else if(dao.delete(Class.getId())){msg="删除成功！";}else{msg="删除失败！";}
				break;
			default:msg="未知操作！";
		}
		return msg;
	}
	public Class queryById(int id)
	{
		return dao.queryById(id);
	}

	public ClassDAO getDao() {
		return dao;
	}

	public int getAlter() {
		return alter;
	}

	public void setAllclass(ArrayList<Class> allclass) {
		this.allclass = dao.queryAll();
	}

}
