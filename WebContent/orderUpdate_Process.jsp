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
	ResultSet rs=null;
	
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String address=request.getParameter("address");
	System.out.println("orderAddress"+orderDate+orderName+address);
	
	try{
		String sql="select * from order0203 where orderDate=? and orderName=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="update order0203 set orderAddress=? where orderDate=? and orderName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, address);
			pstmt.setString(2, orderDate);
			pstmt.setString(3, orderName);
			pstmt.executeUpdate();
			System.out.println("데이터 수정 성공");
			%>
			<script>
				alert("수정을 성공하였습니다!");
				location.href="orderSelect.jsp";
			</script>
			<%
		}else{
			%>
			<script>
				alert("일치하는 데이터가 없습니다.");
				history.back(-1);
			</script>
			<%
		}
		
		
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