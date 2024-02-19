<%@page import="java.nio.file.Files"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ch07.dto.fileDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<fileDTO>file=new ArrayList<>();
	try{
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		DataSource ds=(DataSource)ctx.lookup("jdbc/studydb");
		Connection conn=ds.getConnection();
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery("SELECT * FROM `fileTest`");
		
		while(rs.next()){
			fileDTO dto=new fileDTO();
			dto.setFno(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setoName(rs.getString(3));
			dto.setsName(rs.getString(4));
			dto.setRdate(rs.getString(5));
			file.add(dto);
		}
		rs.close();
		stat.close();
		conn.close();
			
		}catch(Exception e){
		e.printStackTrace();
	}


%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.file Download</title>
	</head>
	<body>
		<h3>2.파일 다운로드</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>원본 파일명</th>
				<th>저장 파일명</th>
				<th>날짜</th>
				<th>관리</th>
			</tr>
			<%for(fileDTO files: file){ %>
			<tr>
				<td><%=files.getFno() %></td>
				<td><%=files.getTitle() %></td>
				<td><%=files.getoName() %></td>
				<td><%=files.getsName() %></td>
				<td><%=files.getRdate() %></td>
				<td>
					<a href="./proc/fileDownLoadProc.jsp?fno=<%=files.getFno()%>">다운로드</a>
					<a href="./proc/fileDownLoadProc.jsp?fno=<%=files.getFno()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		
		</table>
	</body>
</html>