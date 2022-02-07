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
		}else if(document.form.orderAddress.value==""){
			alert("주문주소를 입력하세요.");
			document.form.orderAddress.focus();
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
	String orderDate=request.getParameter("orderDate");  //getParameter는 폼에서 넘어온 값
	String orderName=request.getParameter("orderName");
	
	try{
		String sql="select to_char(a.orderDate,'yyyy-mm-dd'),a.orderName,a.productId,b.name,a.unitprice,a.orderQty,a.orderAddress from order0203 a,product0203 b where a.productId=b.productId and a.orderDate=? and a.orderName=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String productId=rs.getString(3);  //String은 그냥 변수 선언
			String name=rs.getString(4);       //b.name a.unitprice처럼 a. b.이 붙으면 "name"말고 숫자로 해야함!
			int unitprice=rs.getInt(5);
			int pQty=rs.getInt(6);
			int total=unitprice*pQty;         //total은 테이블에 없으므로 값을 곱해서 넘겨줘야 함
			String orderAddress=rs.getString(7);   //rs.getString("orderAddress")는 위의 sql문에서 넘어온 이름
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="orderUpdate_Process.jsp">
<h1>주문정보 수정</h1>
<table border=1 id="tab1">
	<tr>
		<th>주문일자</th>
		<td><input type="text" name="orderDate" value="<%=orderDate %>"></td>
		<th>주문자 이름</th>
		<td><input type="text" name="orderName" value="<%=orderName %>"></td>
	</tr>
	<tr>
		<th>상품코드</th>
		<td><input type="text" name="productId" value="<%=productId %>" disabled></td>
		<th>상 품 명</th>
		<td><input type="text" name="name" value="<%=name %>" disabled></td>
	</tr>
	<tr>
		<th>단 가</th>
		<td><input type="text" name="unitprice" value="<%=unitprice %>" disabled></td>
		<th>주문수량</th>
		<td><input type="text" name="orderQty" value="<%=pQty %>" disabled></td>
	</tr>
	<tr>
		<th>주문금액</th>
		<td><input type="text" name="total" value="<%=total %>" disabled></td>
		<th>주문주소</th>
		<td><input type="text" name="orderAddress" value="<%=orderAddress %>"></td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="목록" onclick="location.href='orderSelect.jsp'" id="btn1">
			<input type="button" value="수정" onclick="check()" id="btn1">
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