<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User4::modify</title>
	</head>
	<body>
		<h3>user4 수정</h3>
		<form action="/ch10/user4/modify.do" method="post">
			<table border="1">
			<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" value="${user.uid}"></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="${user.name}"></td>
			</tr>
			
			<tr>
			<td>성별</td>
			
			<td>
				<select name="gender">
				<c:choose>
					<c:when test="${user.gender eq 'F'}">
						<option value="F" selected="selected">F</option>
						<option value="M">M</option>
					</c:when>
					<c:otherwise>
						<option value="F">F</option>
						<option value="M" selected="selected">M</option>
					</c:otherwise>
					</c:choose>
				</select>
			</td>
			
			</tr>
			
			<tr>
			<td>나이</td>
			<td><input type="number" name="age" value="${user.age}"></td>
			</tr>
			
			<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp" value="${user.hp}"></td>
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