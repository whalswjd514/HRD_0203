<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		cnt=0;
		var gender=document.getElementsByName("gender");
		for(var i=0;i<gender.length;i++){
			if(gender[i].checked==true){
				cnt++;
				break;
			}
		}
		
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.password.value==""){
			alert("비밀번호를 입력하세요.");
			document.form.password.focus();
		}else if(document.form.password_check.value==""){
			alert("확인비밀번호를 입력하세요.");
			document.form.password_check.focus();
		}else if(document.form.password.value!=document.form.password_check.value){
			alert("비밀번호와 확인비밀번호가 일치하지 않습니다.");
			document.form.password.focus();
		}else if(cnt==0){
			alert("성별을 입력하세요.");
			document.form.gender.focus();
		}else{
			document.form.submit();
		}
	}
	
	function mail_change(){
		if(document.form.email.options[document.form.email.selectedIndex].value=="0"){
			document.form.email2.disabled=true;
			document.form.email2.value=="";
		}
		if(document.form.email.options[document.form.email.selectedIndex].value=="9"){
			document.form.email2.disabled=false;
			document.form.email2.focus();
		}else{
			document.form.email2.disabled=true;
			document.form.email2.value=document.form.email.options[document.form.email.selectedIndex].value;
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");

	try{
		String sql="select * from member0203 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String password=rs.getString("password");
			String gender=rs.getString("gender");
			String birth=rs.getString("birth");
			String birth_yy=birth.substring(0,4);
			String birth_mm=birth.substring(5,7);
			String birth_dd=birth.substring(8,10);
			String email=rs.getString("email");
			String ary[]=email.split("@");
			String email1="", email2="";
			for(int i=0;i<ary.length;i++){
				email1=ary[0];
				email2=ary[1];
			}
			String phone=rs.getString("phone");
			String address=rs.getString("address");
			String interest=rs.getString("interest");
			String arr[]=interest.split(",");

%>
<form name="form" method="post" action="memberUpdate_Process.jsp">
<h1>회원 가입 수정 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">아이디</th>
		<td><input type="text" name="id" value="<%=id %>"></td>
	</tr>
	<tr>
		<th id="th1">성 명</th>
		<td><input type="text" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<th id="th1">비밀번호</th>
		<td><input type="password" name="password" value="<%=password %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">비밀번호 확인</th>
		<td><input type="password" name="password_check" value="<%=password %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">성 별</th>
		<td><input type="radio" name="gender" value="1" <%if(gender.equals("1")){%>checked<%}%>>남성
			<input type="radio" name="gender" value="2" <%if(gender.equals("2")){%>checked<%}%>>여성
		</td>
	</tr>
	<tr>
		<th id="th1">생 일</th>
		<td>
			<input type="number" name="birth1" min="1930" max="2022" step="1" value="<%=birth_yy %>">년
			<input type="number" name="birth2" min="1" max="12" step="1" value="<%=birth_mm %>">월
			<input type="number" name="birth3" min="1" max="31" step="1" value="<%=birth_dd %>">일
		</td>
	</tr>
	<tr>
		<th id="th1">이메일</th>
		<td>
			<input type="text" name="email1" value="<%=email1 %>" onfocus="this.value='';">@
			<input type="text" name="email2" value="<%=email2 %>">
		</td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone" value="<%=phone %>"></td>
	</tr>
	<tr>
		<th id="th1">주소</th>
		<td><input type="text" name="address" value="<%=address %>" id="in2"></td>
	</tr>
	<tr>
		<th id="th1">관심분야</th>
		<td>
			<input type="checkbox" name="interest" value="프로그램" <%for(int i=0;i<arr.length;i++)if("프로그램".equals(arr[i])) out.print("checked"); %>>프로그램
			<input type="checkbox" name="interest" value="독서" <%for(int i=0;i<arr.length;i++)if("독서".equals(arr[i])) out.print("checked"); %>>독서
			<input type="checkbox" name="interest" value="등산" <%for(int i=0;i<arr.length;i++)if("등산".equals(arr[i])) out.print("checked"); %>>등산
			<input type="checkbox" name="interest" value="여행" <%for(int i=0;i<arr.length;i++)if("여행".equals(arr[i])) out.print("checked"); %>>여행
			<input type="checkbox" name="interest" value="컴퓨터" <%for(int i=0;i<arr.length;i++)if("컴퓨터".equals(arr[i])) out.print("checked"); %>>컴퓨터
			<input type="checkbox" name="interest" value="영화" <%for(int i=0;i<arr.length;i++)if("영화".equals(arr[i])) out.print("checked"); %>>영화
			<input type="checkbox" name="interest" value="운동" <%for(int i=0;i<arr.length;i++)if("운동".equals(arr[i])) out.print("checked"); %>>운동
			<input type="checkbox" name="interest" value="진학" <%for(int i=0;i<arr.length;i++)if("진학".equals(arr[i])) out.print("checked"); %>>진학
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="수정" id="btn1" onclick="check()">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>