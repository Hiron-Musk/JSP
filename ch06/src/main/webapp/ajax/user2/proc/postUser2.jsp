<%@page import="com.google.gson.JsonObject"%>
<%@page import="dto.User2DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	BufferedReader reader=request.getReader();
	StringBuilder requestBody=new StringBuilder();
	String line;
	
	while((line=reader.readLine())!=null){
		requestBody.append(line);
	}
	reader.close();
	
	//JSON 객체를 Java 객체로 변환
	Gson gson=new Gson();
	User2DTO user2=gson.fromJson(requestBody.toString(),User2DTO.class);
	System.out.println(user2);
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn=ds.getConnection();
		PreparedStatement psmt=conn.prepareStatement("INSERT INTO `User2` VALUES(?,?,?,?)");
		psmt.setString(1, user2.getUid());
		psmt.setString(2, user2.getName());
		psmt.setString(3, user2.getBirth());
		psmt.setString(4, user2.getAddr());
		
		//영향받은 행의 수 반환(성공시 1, 실패시 0)
		int result=psmt.executeUpdate();
		System.out.println(result);
		
		psmt.close();
		conn.close();
		
		JsonObject json=new JsonObject();
		json.addProperty("result", result);
		out.print(json.toString());
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>