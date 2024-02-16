<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>AJAX::User2</title>
		<script>
			window.onload=function(){
				const table=document.getElementsByTagName('table')[0];
				
				fetch('./proc/getUser2s.jsp')
					.then(response=>response.json())
					.then((data)=>{
						console.log(data);
						for(const user of data){
							const tr=document.createElement('tr');
							const td1=document.createElement('td');
							const td2=document.createElement('td');
							const td3=document.createElement('td');
							const td4=document.createElement('td');
							
							const td5=document.createElement('td');
							const a1=document.createElement('a');
							const a2=document.createElement('a');
							
							td1.innerText=user.uid;
							td2.innerText=user.name;
							td3.innerText=user.birth;
							td4.innerText=user.addr;
							a1.href='#';
							a1.innerText='수정';
							a2.href='#';
							a2.innerText='삭제';
							
							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							tr.appendChild(td5);
							
							td5.appendChild(a1);
							td5.appendChild(a2);
							
							table.appendChild(tr);
						}
					})
					.catch((err)=>{
						console.log(err);
					});
			}
		
		</script>
	</head>
	<body>
		<h3>User2 목록</h3>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>		
				<th>이름</th>		
				<th>생년월일</th>		
				<th>주소</th>		
				<th>관리</th>		
			</tr>
		</table>
	</body>
</html>