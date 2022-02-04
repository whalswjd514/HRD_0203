<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>상품 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>단가</th>
		<th>상세정보</th>
		<th>제조사</th>
		<th>분류</th>
		<th>재고수</th>
		<th>상태</th>
		<th>구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from product0203";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String productId=rs.getString(1);
			String name=rs.getString(2);
			String unitprice=rs.getString(3);
			String description=rs.getString(4);
			String category=rs.getString(5);
			String manufacturer=rs.getString(6);
			String unitsInstock=rs.getString(7);
			String condition=rs.getString(8);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><a href="productUpdate.jsp?productId=<%=productId %>"><%=productId %></a></td>
		<td><%=name %></td>
		<td><%=unitprice %></td>
		<td><%=description %></td>
		<td><%=category %></td>
		<td><%=manufacturer %></td>
		<td><%=unitsInstock %></td>
		<td><%=condition %></td>
		<td><a href="productDelete.jsp?productId=<%=productId %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group1" align=center>
	<button type="button" onclick="location.href='addProduct.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>