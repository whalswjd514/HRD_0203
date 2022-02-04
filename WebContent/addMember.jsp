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
	int no=0;
	
	try{
		String sql="select max(id) from member0203";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1)+1;
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("마지막번호+1 조회 에레");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="addMember_Process.jsp">
<h1>회원 가입 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">아이디</th>
		<td><input type="text" name="id" value="<%=no %>">(마지막번호+1)</td>
	</tr>
	<tr>
		<th id="th1">성 명</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th id="th1">비밀번호</th>
		<td><input type="password" name="password" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">비밀번호 확인</th>
		<td><input type="password" name="password_check" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">성 별</th>
		<td><input type="radio" name="gender" value="1" checked>남성
			<input type="radio" name="gender" value="2">여성
		</td>
	</tr>
	<tr>
		<th id="th1">생 일</th>
		<td>
			<input type="number" name="birth1" min="1930" max="2022" step="1" value="2020">년
			<input type="number" name="birth2" min="1" max="12" step="1" value="5">월
			<input type="number" name="birth3" min="1" max="31" step="1" value="15">일
		</td>
	</tr>
	<tr>
		<th id="th1">이메일</th>
		<td>
			<input type="text" name="email1" placeholder="이메일" onfocus="this.value='';">@
			<input type="text" name="email2" value="" disabled>
			<select name="email" onchange="mail_change();">
				<option value="0">선택하세요</option>
				<option value="9">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="gmail.com">gmail.com</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<th id="th1">주소</th>
		<td><input type="text" name="address" id="in2"></td>
	</tr>
	<tr>
		<th id="th1">관심분야</th>
		<td>
			<input type="checkbox" name="interest" value="프로그램">프로그램
			<input type="checkbox" name="interest" value="독서">독서
			<input type="checkbox" name="interest" value="등산">등산
			<input type="checkbox" name="interest" value="여행">여행
			<input type="checkbox" name="interest" value="컴퓨터">컴퓨터
			<input type="checkbox" name="interest" value="영화">영화
			<input type="checkbox" name="interest" value="운동">운동
			<input type="checkbox" name="interest" value="진학">진학
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" id="btn1" onclick="check()">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>