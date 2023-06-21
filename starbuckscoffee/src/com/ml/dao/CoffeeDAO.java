package com.ml.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ml.util.CONSTANTS;
import com.ml.util.DBUtil;
//COFFEE表的数据库操作类，封装表的增删改查操作
public class CoffeeDAO {
public int add(Map<String,String>r)throws Exception{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(CONSTANTS.DBURL);
	String sql="INSERT INTO coffee (name,series,price,description) VALUE (?,?,?,?)";
	PreparedStatement psmt=con.prepareStatement(sql);
	psmt.setString(1, r.get("name"));
	psmt.setString(2, r.get("series"));
	psmt.setString(3, r.get("price"));
	psmt.setString(4, r.get("description"));
	int result=psmt.executeUpdate();
	psmt.close();
	con.close();
	return result;
}
//带分页、带筛选功能的商品列表，返回的数据包括：数据列表和总记录数两部分
public List<Object> List(String where,int pageStartIndex,int pageSize) throws Exception{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(CONSTANTS.DBURL);
	String sql1="select * from coffee"+where+" order by id desc limit "+pageStartIndex+","+pageSize;
	System.out.println("sql1:"+sql1);
	PreparedStatement psmt1=con.prepareStatement(sql1);
	ResultSet rs1=psmt1.executeQuery();
	List<Map<String,String>> datalist=DBUtil.getHashMap(rs1);
	List<Object> data=new ArrayList<Object>();
	data.add(datalist);
	String sql2="select count(*) total from coffee"+where;
	PreparedStatement psmt2=con.prepareStatement(sql2);
	ResultSet rs2=psmt2.executeQuery();
	String total=DBUtil.getHashMap(rs2).get(0).get("total");
	data.add(total);
	rs1.close();
	rs2.close();
	psmt1.close();
	psmt2.close();
	con.close();
	return data;
}
//商品删除，添加成功返回1，否则返回0
public int del(String id)throws Exception{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(CONSTANTS.DBURL);
	String sql="delete from coffee where id=?";
	PreparedStatement psmt=con.prepareStatement(sql);
	psmt.setString(1, id);
	int result=psmt.executeUpdate();
	psmt.close();
	con.close();
	return result;
}

//查询单个商品信息,查询到的单个商品信息放入Map<String,String>集合中
public Map<String,String> get(String id)throws Exception{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(CONSTANTS.DBURL);
	String sql="select * from coffee where id=?";
	PreparedStatement psmt=con.prepareStatement(sql);
	psmt.setString(1, id);
	ResultSet rs=psmt.executeQuery();
	List<Map<String,String>> datalist=DBUtil.getHashMap(rs);
	Map<String,String> data=datalist.get(0);
	rs.close();
	psmt.close();
	con.close();
	return data;
}
//商品修改，修改成功返回1，否则返回0
public int edit(Map<String,String>r)throws Exception{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(CONSTANTS.DBURL);
	String sql="update coffee set name=?,series=?,price=?,description=? where id=?";
	PreparedStatement psmt=con.prepareStatement(sql);
	psmt.setString(1,r.get("name"));
	psmt.setString(2,r.get("series"));
	psmt.setString(3,r.get("price"));
	psmt.setString(4,r.get("description"));
	psmt.setString(5,r.get("id"));
	int result=psmt.executeUpdate();
	psmt.close();
	con.close();
	return result;
}
}