<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>AJAX::User2 등록</title>
		<script>
			window.onload=function(){
				const btnSubmit=document.getElementsByName('submit')[0];
				const formUser2 = document.querySelector('form');
				
				btnSubmit.onclick=(e)=>{
					e.preventDefault();
					
					const uid=formUser2.uid.value;
					const name=formUser2.name.value;
					const birth=formUser2.birth.value;
					const addr=formUser2.addr.value;
					
					//json 객체 생성
					const jsonData={
							"uid":uid,
							"name":name,
							"birth":birth,
							"addr":addr
					};
					
					const strJson=JSON.stringify(jsonData);
					console.log('strJson : ' + strJson);
					
					fetch('./proc/postUser2.jsp',{
						method:'POST',
						headers:{
							"Content-type":"application/json",
						},
						body:strJson
					})
						.then(response=>response.json())
						.then((data)=>{
							console.log(data);
							if(data.result>0){
								alert('등록성공!');
								location.href='./list.jsp';
							}else{
								alert('등록실패!')
							}
						})
						.catch((err)=>{
							console.log(err);
						});
				}
				
				
			}
		
		</script>
	</head>
	<body>
		<h3>User2 등록</h3>
		<form action="#">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" name="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>