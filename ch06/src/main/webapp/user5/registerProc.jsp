<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String age=request.getParameter("age");
	String addr=request.getParameter("addr");
	
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="jsa7868";
	String pass="abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		String sql="INSERT INTO `User5` (`name`, `gender`, `age`, `addr`) VALUES (?, ?, ?, ?)";
		PreparedStatement psmt=conn.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		
		psmt.executeUpdate();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	

%>