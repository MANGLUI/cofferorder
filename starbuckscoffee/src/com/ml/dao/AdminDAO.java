package com.ml.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ml.util.CONSTANTS;
public class AdminDAO {
	public int Login(String adminname,String password) throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(CONSTANTS.DBURL);
		String sql="select * from admin where adminname=? and password=?";
		PreparedStatement psmt=con.prepareStatement(sql);
		psmt.setString(1, adminname);
		psmt.setString(2, password);
		ResultSet rs=psmt.executeQuery();
		int result=0;
		if(rs.next()){
			result=1;
		}
		rs.close();
		psmt.close();
		con.close();
		return result;
	}
}
