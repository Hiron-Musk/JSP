<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="_header.jsp" %>
<%
	List<ArticleDTO> article=ArticleDAO.getInstance().selectArticles();

%>


<main>
    <section class="list">
        <h3>글목록</h3>
        <article>
            <table border="0">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회</th>
                </tr>
                <%for(ArticleDTO dto:article) {%>
                <tr>
                    <td><%=dto.getNo() %></td>
                    <td><a href="#"><%=dto.getTitle() %></a>&nbsp;[3]</td>
                    <td><%=dto.getWriter() %></td>
                    <td><%=dto.getRdate() %></td>
                    <td><%=dto.getHit() %></td>
                </tr>
                <%}%>
            </table>
        </article>

        <!-- 페이지 네비게이션 -->
        <div class="paging">
            <a href="#" class="prev">이전</a>
            <a href="#" class="num current">1</a>                
            <a href="#" class="num">2</a>                
            <a href="#" class="num">3</a>                
            <a href="#" class="next">다음</a>
        </div>

        <!-- 글쓰기 버튼 -->
        <a href="/jboard1/write.jsp" class="btnWrite">글쓰기</a>
    </section>
</main>
<%@ include file="_footer.jsp" %>