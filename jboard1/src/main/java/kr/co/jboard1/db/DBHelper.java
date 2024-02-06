package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {
	protected Connection conn=null;
	protected PreparedStatement psmt=null;
	protected PreparedStatement psmtEtc1=null;//여분
	protected PreparedStatement psmtEtc2=null;//여분
	protected Statement stmt=null;
	protected ResultSet rs=null;
	
	public Connection getConnection() throws NamingException, SQLException {
		Context ctx=(Context) new InitialContext().lookup("java:comp/env");//JNDI 기본 환경 이름
		DataSource ds=(DataSource)ctx.lookup("jdbc/jboard");
		return ds.getConnection();
		
	}
	public void closeAll() throws SQLException {
		if(rs!=null) {
			rs.close();
		}
		if(stmt!=null) {
			stmt.close();
		}
		if(psmt!=null) {
			psmt.close();
		}
		if(psmtEtc1!=null) {
			psmt.close();
		}
		if(psmtEtc2!=null) {
			psmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
		
	}

}
