<%@page import="kr.co.jboard1.dto.User3DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	User3DTO dto=new User3DTO();
	request.setCharacterEncoding("UTF-8");
	String uid=request.getParameter("uid");
	
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="jsa7868";
	String pass="abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		String sql="SELECT * FROM `User3` WHERE `uid`=?";
		PreparedStatement psmt=conn.prepareStatement(sql);
		psmt.setString(1,uid);
		
		ResultSet rs=psmt.executeQuery();
		
		if(rs.next()){
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setBirth(rs.getString(3));
			dto.setHp(rs.getString(4));
			dto.setAddr(rs.getString(5));
		}
		
		rs.close();
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
		<title>user3::modify</title>
	</head>
	<body>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly="readonly" value="<%=dto.getUid()%>"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
				</tr>
				
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth" value="<%=dto.getBirth()%>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%=dto.getHp()%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%=dto.getAddr()%>"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정하기"></td>
				</tr>
				
			
			</table>
		
		
		</form>
	</body>
</html>