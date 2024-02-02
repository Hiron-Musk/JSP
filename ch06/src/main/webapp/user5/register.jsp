<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>usr5::register</title>
	</head>
	<body>
		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" value="M" id="M">
					<label for="M">M</label>	
					<input type="radio" name="gender" value="F" id="F">
					<label for="F">F</label>
					</td>
				</tr>
				
				<tr>
					<td>나이</td>
					<td><input type="number" name="age"></td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="등록하기">
					</td>
				</tr>
			
			</table>
		
		</form>
	</body>
</html>