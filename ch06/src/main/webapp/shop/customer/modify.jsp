<%@page import="dto.CustomerDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	CustomerDTO dto=null;
	request.setCharacterEncoding("UTF-8");
	String custId=request.getParameter("custId");
	
	try{
		//1단계-JNDI 서비스 객체 생성
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		
		//2단계-커넥션 풀에서 커넥션 가져오기
		DataSource ds=(DataSource)ctx.lookup("jdbc/shop");
		
		Connection conn=ds.getConnection();
		String sql="SELECT * FROM `Customer` WHERE `custId`=?";

		PreparedStatement psmt=conn.prepareStatement(sql);
		psmt.setString(1, custId);
		
		ResultSet rs=psmt.executeQuery();
		
		if(rs.next()){
			dto=new CustomerDTO();
			
			dto.setCustId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddr(rs.getString(4));
			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>


<html>
<head>
	<meta charset="EUC-KR">
	<title>customer::modify</title>
</head>
<body>
	<h3>customer 수정</h3>
	<a href="../../2.DBCP.jsp">처음으로</a>
	<a href="./list.jsp">목록보기</a>
	
	<form action="./modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custId" readonly="readonly" value="<%=dto.getCustId() %>"></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
			</tr>
			
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=dto.getHp() %>"></td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=dto.getAddr() %>"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정하기"></td>
			</tr>
			
		</table>
	
	</form>
</body>
</html>