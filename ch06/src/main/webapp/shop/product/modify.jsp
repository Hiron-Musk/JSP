<%@page import="kr.co.jboard1.dto.ProductDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	ProductDTO dto=null;
	request.setCharacterEncoding("UTF-8");
	String prodNo=request.getParameter("prodNo");
	
	try{
		//1단계-JNDI 서비스 객체 생성
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		
		//2단계-커넥션 풀에서 커넥션 가져오기
		DataSource ds=(DataSource)ctx.lookup("jdbc/shop");
		Connection conn=ds.getConnection();
		String sql="SELECT * FROM `Product` WHERE `prodNo`=?";
		PreparedStatement psmt=conn.prepareStatement(sql);
		
		psmt.setString(1, prodNo);
		
		ResultSet rs=psmt.executeQuery();
		
		if(rs.next()){
			dto=new ProductDTO();
			dto.setProdNo(rs.getString(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
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
		<title>product::modify</title>
	</head>
	<body>
		<h3>product 수정</h3>
		<a href="./list.jsp">뒤로가기</a>
		<form action="./modifyProc.jsp">
			<table border="1">
				<tr>
					<td>제품번호</td>
					<td><input type="text" name="prodNo" value="<%=dto.getProdNo()%>" readonly="readonly"></td>
				</tr>
				
			
				<tr>
					<td>제품명</td>
					<td><input type="text" name="prodName" value="<%=dto.getProdName()%>"></td>
				</tr>
				
				<tr>
					<td>재고량</td>
					<td><input type="number" name="stock" value="<%=dto.getStock()%>"></td>
				</tr>
				
				<tr>
					<td>단가</td>
					<td><input type="number" name="price" value="<%=dto.getPrice()%>"></td>
				</tr>
				
				<tr>
					<td>제조업체</td>
					<td><input type="text" name="company" value="<%=dto.getCompany()%>"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정하기"></td>
					
				</tr>
			
			</table>
		
		</form>
	</body>
</html>