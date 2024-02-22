<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User5::modify</title>
	</head>
	<body>
		<h3>User5 수정</h3>
		<form action="/ch10/user5/modify.do" method="post">
			<table border="1">
			<tr>
			<td>일련번호</td>
			<td><input type="text" name="seq" readonly="readonly" value="${user.seq}"></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="${user.name}"></td>
			</tr>
			
			<tr>
				<td>성별</td>
				
				<c:choose>
				<c:when test="${user.gender eq 'M'}">
				<td>
				<input type="radio" name="gender" value="M" id="M" checked="checked">
				<label for="M">M</label>	
				<input type="radio" name="gender" value="F" id="F">
				<label for="F">F</label>
				</td>
				</c:when>
				
				<c:otherwise>
				<td>	
				<input type="radio" name="gender" value="M" id="M">
				<label for="F">M</label>
				<input type="radio" name="gender" value="F" id="F" checked="checked">
				<label for="M">F</label>
				</td>
				</c:otherwise>
				
				</c:choose>
			</tr>
			
			<tr>
			<td>나이</td>
			<td><input type="number" name="age" value="${user.age}"></td>
			</tr>
			
			<tr>
			<td>주소</td>
			<td><input type="text" name="addr" value="${user.addr}"></td>
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