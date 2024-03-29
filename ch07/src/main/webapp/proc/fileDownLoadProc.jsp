<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="ch07.dto.fileDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fno=request.getParameter("fno");
	//다운로드 파일 정보 조회
	fileDTO fileDTO=null;
	try{
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		DataSource ds=(DataSource)ctx.lookup("jdbc/studydb");
		Connection conn=ds.getConnection();
		
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery("SELECT * FROM `fileTest` WHERE `fno`="+fno);
		
		while(rs.next()){
			fileDTO=new fileDTO();
			fileDTO.setFno(rs.getInt(1));
			fileDTO.setTitle(rs.getString(2));
			fileDTO.setoName(rs.getString(3));
			fileDTO.setsName(rs.getString(4));
			fileDTO.setRdate(rs.getString(5));
		}
		rs.close();
		stat.close();
		conn.close();
			
	}catch(Exception e){
	e.printStackTrace();
	}
	
	
	//다운로드 헤더 설정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fileDTO.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	//response 파일 스트림 작업
	String uploadsPath=application.getRealPath("/uploads");
	
	File file=new File(uploadsPath+File.separator+fileDTO.getsName());
	out.clear();
	out=pageContext.pushBody();
	
	BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		int data=bis.read();
		if(data==-1){
			break;
		}
		bos.write(data);
		
	}
	
	bos.close();
	bis.close();
	
%>