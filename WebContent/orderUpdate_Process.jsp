<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String productId=request.getParameter("productId");
	String unitprice=request.getParameter("unitprice");
	String orderQty=request.getParameter("orderQty");
	String address=request.getParameter("address");
	
	try{
		String sql="update order0203 set productId=?,unitprice=?,orderQty=?,orderAddress=? where orderDate=? and orderName=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(5, orderDate);
		pstmt.setString(6, orderName);
		pstmt.setString(1, productId);
		pstmt.setString(2, unitprice);
		pstmt.setString(3, orderQty);
		pstmt.setString(4, address);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		%>
		<script>
			alert("수정을 성공하였습니다!");
			location.href="orderSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("수정을 실패하였습니다!");
			history.back(-1);
		</script>
</body>
</html>