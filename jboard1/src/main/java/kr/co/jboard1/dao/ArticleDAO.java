package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {
	
	private static ArticleDAO instance=new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
		
	}
	private ArticleDAO() {}
	
	public void insertArticle(ArticleDTO article) {
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setString(3, article.getWriter());
			psmt.setString(4, article.getRegip());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	public List<ArticleDTO> selectArticles() {
		List<ArticleDTO>article=new ArrayList<>();
		try{
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_ARTICLES);

			
			ResultSet rs=psmt.executeQuery();
			
			while(rs.next()){
				ArticleDTO dto=new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setComment(rs.getInt(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getInt(7));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));
				
				article.add(dto);
				
			}
			
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return article;
	}
	public void updateArticle(ArticleDTO article) {
		
	}
	public void deleteArticle(int no) {
		
	}
	
	


}
