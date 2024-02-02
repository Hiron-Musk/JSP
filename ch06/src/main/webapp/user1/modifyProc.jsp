<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	//데이터 수신
	String uid=request.getParameter("uid");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String hp=request.getParameter("hp");
	String age=request.getParameter("age");
	
	//데이터베이스 작업
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="jsa7868";
	String pass="abc1234";
	
	
	try{
		//1단계-JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2단계-데이터베이스 접속
		Connection conn=DriverManager.getConnection(host,user,pass);
		
		//3단계-SQL 실행객체 생성
		String sql="UPDATE `User1` SET `name`=?,`birth`=?,`hp`=?,`age`=? WHERE `uid`=?";
		PreparedStatement psmt=conn.prepareStatement(sql);
		psmt.setString(1,name);
		psmt.setString(2,birth);
		psmt.setString(3,hp);
		psmt.setString(4,age);
		psmt.setString(5,uid);
		
		//4단계-SQL 실행
		psmt.executeUpdate();
		
		//5단계-결과 처리(SELECT 경우)
		
		
		//6단계-데이터베이스 종료
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동
	response.sendRedirect("./list.jsp");
	
%>