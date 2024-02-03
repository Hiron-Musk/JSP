<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProductDTO>users=new ArrayList<>();
	try{
		//1단계-JNDI 서비스 객체 생성
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		
		//2단계-커넥션 풀에서 커넥션 가져오기
		DataSource ds=(DataSource)ctx.lookup("jdbc/shop");
		Connection conn=ds.getConnection();
		String sql="SELECT * FROM `Product`";
		PreparedStatement psmt=conn.prepareStatement(sql);
		
		ResultSet rs=psmt.executeQuery();
		
		while(rs.next()){
			ProductDTO dto=new ProductDTO();
			dto.setProdNo(rs.getString(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
			
			users.add(dto);
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
		<title>product::list</title>
	</head>
	<body>
		<h3>product 목록</h3>
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>재고량</th>
				<th>단가</th>
				<th>제조업체</th>
				<th>관리</th>
			</tr>
			<%for(ProductDTO dto:users){ %>
			<tr>
				<td><%=dto.getProdNo() %></td>
				<td><%=dto.getProdName() %></td>
				<td><%=dto.getStock() %></td>
				<td><%=dto.getPrice() %></td>
				<td><%=dto.getCompany() %></td>
				<td>
				<a href="./modify.jsp?prodNo=<%=dto.getProdNo() %>">수정</a>
				<a href="./delete.jsp?prodNo=<%=dto.getProdNo() %>">삭제</a>
				</td>
			</tr>
			<%} %>

				

		</table>
	</body>
</html>