<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.name.value==""){
			alert("상품명을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.name.value.length<4 || document.form.name.value.length>50){
			alert("[상품명]\n 최소 4자에서 최대 50자까지 입력하세요.");
			document.form.name.focus();
		}else if(document.form.unitprice.value==""){
			alert("가격을 입력하세요.");
			document.form.unitprice.focus();
		}else if(document.form.unitprice.value.length==0 || isNaN(document.form.unitprice.value)){
			alert("[가격]\n 숫자만 입력하세요.");
			document.form.name.focus();
		}else if(document.form.unitprice.value<0){
			alert("[가격]\n 음수를 입력할 수 없습니다.");
			document.form.unitprice.focus();
		}else if(document.form.unitsInstock.value.length==0 || isNaN(document.form.unitsInstock.value)){
			alert("[재고]\n 숫자만 입력하세요.");
			document.form.unitsInstock.focus();
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
<form name="form" method="post" action="addProduct_Process.jsp">
<h1>상품 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">상품코드</th>
		<td><input type="text" name="productId"></td>
	</tr>
	<tr>
		<th id="th1">상품명</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th id="th1">가 격</th>
		<td><input type="text" name="unitprice"></td>
	</tr>
	<tr>
		<th id="th1">상세정보</th>
		<td><input type="text" name="description"></td>
	</tr>
	<tr>
		<th id="th1">제조사</th>
		<td><input type="text" name="manufacturer"></td>
	</tr>
	<tr>
		<th id="th1">분류</th>
		<td>
			<select name="category">
				<option value="10" selected>it 제품</option>
				<option value="20">주방제품</option>
				<option value="30">전자제품</option>
				<option value="40">일반 잡화</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">재고수</th>
		<td><input type="text" name="unitsInstock"></td>
	</tr>
	<tr>
		<th id="th1">상 태</th>
		<td>
			<input type="radio" name="condition" value="신규제품" checked>신규제품
			<input type="radio" name="condition" value="중고제품">중고제품
			<input type="radio" name="condition" value="재생제품">재생제품
		<td>
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