<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.storeName.value==""){
			alert("거래처이름을 입력하세요.");
			document.form.storeName.focus();
		}else{
			document.form.submit();
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
		String sql="select storeNo_seq.nextval from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1);
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("시퀀스 조회 실패");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="addStore_Process.jsp">
<h1>거래처 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th height="30px">거래처코드</th>
		<td height="30px"><input type="text" name="storeNo" value="<%=no %>" id="in1">(sequence 발생)</td>
	</tr>
	<tr>
		<th height="30px">거래처 이름</th>
		<td height="30px"><input type="text" name="storeName" id="in1"></td>
	</tr>
	<tr>
		<th height="30px">거래처전화번호</th>
		<td height="30px">
			<select name="storeTel1">
				<option value="02" selected>서울(02)</option>
				<option value="031">경기(031)</option>
				<option value="032">인천(032)</option>
				<option value="033">강원(033)</option>
				<option value="041">충남(041)</option>
				<option value="042">대전(042)</option>
				<option value="043">충북(043)</option>
				<option value="044">세종(044)</option>
				<option value="051">부산(051)</option>
				<option value="052">울산(052)</option>
				<option value="053">대구(053)</option>
				<option value="054">경북(054)</option>
				<option value="055">경남(055)</option>
				<option value="061">전남(061)</option>
				<option value="062">광주(062)</option>
				<option value="063">전북(063)</option>
				<option value="064">제주(064)</option>
			</select>-
			<input type="text" name="storeTel2" id="in3">-
			<input type="text" name="storeTel3" id="in3">
		</td>
	</tr>
	<tr>
		<th height="30px">거래처주소</th>
		<td height="30px"><input type="text" name="storeAddress" id="in2"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" onclick="check()" id="btn1">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>