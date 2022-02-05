<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.orderDate.value==""){
			alert("주문일자를  입력하세요.");
			document.form.orderDate.focus();
		}else if(document.form.orderName.value==""){
			alert("주문자이름을 입력하세요.");
			document.form.orderName.focus();
		}else if(document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.unitprice.value==""){
			alert("단가를 입력하세요.");
			document.form.unitprice.focus();
		}else if(document.form.orderQty.value==""){
			alert("주문수량을 입력하세요.");
			document.form.orderQty.focus();
		}else if(document.form.address.value==""){
			alert("주문주소를 입력하세요.");
			document.form.address.focus();
		}else{
			form.action="addOrder_Process.jsp"
		}
	}
	
	function changesubmit(){
		document.form.submit();
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
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String productId=request.getParameter("productId");
	String orderQty=request.getParameter("orderQty");
	String name="";
	int unitprice=0;
	int pQty=0, stock=0, total=0;
	
	if(orderDate==null){
		orderDate="";
	}
	if(orderName==null){
		orderName="";
	}
	if(orderQty==null){
		orderQty="";
		pQty=0;
	}else{
		pQty=Integer.parseInt(orderQty);
	}
	
	try{
		String sql="select name,unitprice,unitsInstock from product0203 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString(1);
			unitprice=rs.getInt(2);
			stock=rs.getInt(3);
			total=unitprice*pQty;
			if(pQty>stock){
				%>
				<script>
					alert("주문수량이 재고수량보다 많습니다.");
					history.back(-1);
				</script>
				<%
			}
		}else if(productId==null || productId.equals("")){
			productId="";
		}else{
			%>
			<script>
				alert("등록되지 않은 코드입니다.");
				history.back(-1);
			</script>
			<%
		}
	}catch(SQLException e){
		System.out.println("데이터베이스 에러");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="addOrder.jsp">
<h1>주문정보 등록</h1>
<table border=1 id="tab1">
	<tr>
		<th>주문일자</th>
		<td><input type="text" name="orderDate" value="<%=orderDate %>"></td>
		<th>주문자 이름</th>
		<td><input type="text" name="orderName" value="<%=orderName %>"></td>
	</tr>
	<tr>
		<th>상품코드</th>
		<td><input type="text" name="productId" value="<%=productId %>" onchange="changesubmit();"></td>
		<th>상 품 명</th>
		<td><input type="text" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<th>단 가</th>
		<td><input type="text" name="unitprice" value="<%=unitprice %>"></td>
		<th>주문수량</th>
		<td><input type="text" name="orderQty" value="<%=pQty %>" onchange="changesubmit();"></td>
	</tr>
	<tr>
		<th>주문금액</th>
		<td><input type="text" name="total" value="<%=total %>"></td>
		<th>주문주소</th>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="목록" onclick="location.href='orderSelect.jsp'" id="btn1">
			<input type="submit" value="저장" onclick="check()" id="btn1">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>