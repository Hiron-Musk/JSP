<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prodName=request.getParameter("prodName");
	String stock=request.getParameter("stock");
	String price=request.getParameter("price");
	String company=request.getParameter("company");

	try{
		//1단계-JNDI 서비스 객체 생성
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		
		//2단계-커넥션 풀에서 커넥션 가져오기
		DataSource ds=(DataSource)ctx.lookup("jdbc/shop");
		Connection conn=ds.getConnection();
		String sql="INSERT INTO `Product` (`prodName`, `stock`, `price`, `company`) VALUES (?, ?, ?, ?)";
		PreparedStatement psmt=conn.prepareStatement(sql);
		
		psmt.setString(1,prodName);
		psmt.setString(2,stock);
		psmt.setString(3,price);
		psmt.setString(4,company);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");
%>  