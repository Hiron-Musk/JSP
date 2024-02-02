<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq=request.getParameter("seq");
	
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="jsa7868";
	String pass="abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		String sql="DELETE FROM `User5` WHERE `seq`=?";
		PreparedStatement psmt=conn.prepareStatement(sql);
		psmt.setString(1, seq);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("./list.jsp");
%>