<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.User2DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User2DTO>user2s=new ArrayList<>(); 
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn=ds.getConnection();
		Statement stmt=conn.createStatement();
		
		ResultSet rs=stmt.executeQuery("SELECT * FROM `user2`");
		
		while(rs.next()){
			User2DTO dto=new User2DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setBirth(rs.getString(3));
			dto.setAddr(rs.getString(4));
			
			user2s.add(dto);
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Gson gson=new Gson();
	String strJson=gson.toJson(user2s);
	out.print(strJson);

%>