
<%@page import="dto.User5DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq=request.getParameter("seq");
	
	User5DTO dto=new User5DTO();
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="jsa7868";
	String pass="abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		String sql="SELECT * FROM `User5` WHERE `seq`=?";
		PreparedStatement psmt=conn.prepareStatement(sql);
		
		psmt.setString(1, seq);
		
		ResultSet rs=psmt.executeQuery();
		if(rs.next()){
			dto.setSeq(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getString(4));
			dto.setAddr(rs.getString(5));
		}
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::modify</title>
	</head>
	<body>
		<h3>user5 수정</h3>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
			<tr>
			<td>일련번호</td>
			<td><input type="text" name="seq" value="<%=dto.getSeq() %>"></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
			</tr>
			
			<tr>
				<td>성별</td>
				<% if(dto.getGender().equals("M")){%>
				<td><input type="radio" name="gender" value="M" id="M" checked="checked">
				<label for="M">M</label>	
				<input type="radio" name="gender" value="F" id="F">
				<label for="F">F</label>
				<%}else{%>
				<td>	
				<input type="radio" name="gender" value="M" id="M">
				<label for="F">M</label>
				<input type="radio" name="gender" value="F" id="F" checked="checked">
				<label for="M">F</label>
				<%}%>
				</td>
			</tr>
			
			<tr>
			<td>나이</td>
			<td><input type="number" name="age" value="<%=dto.getAge() %>"></td>
			</tr>
			
			<tr>
			<td>주소</td>
			<td><input type="text" name="addr" value="<%=dto.getAddr() %>"></td>
			</tr>
			
			<tr>
			<td colspan="2" align="right">
			<input type="submit" value="수정하기">
			</td>
			</tr>
			
			</table>
		
		</form>
	</body>
</html>