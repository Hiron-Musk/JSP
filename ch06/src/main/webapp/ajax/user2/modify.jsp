<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajax::User2 수정</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>
			window.onload=function(){
				const formUser=document.getElementsByTagName('form')[0];
				const btnSubmit=formUser.submit;
				
				btnSubmit.onclick=(e)=>{
					e.preventDefault();
					
					const uid=formUser.uid.value;
					const name=formUser.name.value;
					const birth=formUser.birth.value;
					const addr=formUser.addr.value;
					
					const jsonData={
							"uid":uid,
							"name":name,
							"birth":birth,
							"addr":addr
					};
					
					$.ajax({
					    method: 'POST',
					    url: './proc/putUser2.jsp',
					    data: jsonData,
					    success: function(data){
					        console.log(data);
					        if(data.result > 0){
					            alert('수정완료!');
					            location.href = './list.jsp';
					        }
					    }
					});
				}
				
				const url=location.href;
				const params=url.split('?')[1];
				const value=params.split('=')[1];
				
				const xhr=new XMLHttpRequest(); 
				xhr.open('GET','./proc/getUser1.jsp?uid='+value);
				xhr.send();
				
				xhr.onreadystatechange=function(){
					if(xhr.status==200){
						const resData=JSON.parse(xhr.responseText);
						
						formUser.uid.value=resData.uid;
						formUser.name.value=resData.name;
						formUser.birth.value=resData.birth;
						formUser.addr.value=resData.addr;
						
					}else{
						console.log('요청실패')
					}
				}
				
			}
		
		</script>
		
	</head>
	<body>
	<h3>User2 수정</h3>
	<a href="./list.jsp">목록이동</a>
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
				<input type="submit" name="submit" value="수정하기">
				</td>
			</tr>
			
		
		</table>
		
		</form>
	</body>
</html>