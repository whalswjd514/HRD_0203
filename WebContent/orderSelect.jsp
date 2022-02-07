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
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no1=0;
	
	try{
		String sql="select count(*) from order0203";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no1=rs.getInt(1);		
		}else{
			no1=0;
		}
	}catch(SQLException e){
		System.out.println("총 주문정보 읽기 실패");
		e.printStackTrace();
	}
 %>
<h1>주문 목록</h1>
<p id="p1">총 <%=no1 %>개의 주문정보가 있습니다.</p>
<hr>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>주문일자</th>
		<th>주문자 성명</th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>단가</th>
		<th>주문수량</th>
		<th>주문자주소</th>
		<th>구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	int no=0;
	
	try{
		String sql="select to_char(a.orderDate,'yyyy-mm-dd'),a.orderName,a.productId,b.name,a.unitprice,a.orderQty,a.orderAddress from order0203 a,product0203 b where a.productId=b.productId";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String orderDate=rs.getString(1);
			String orderName=rs.getString(2);
			String productId=rs.getString(3);
			String name=rs.getString(4);
			String unitprice=rs.getString(5);
			String orderQty=rs.getString(6);
			String orderAddress=rs.getString(7);
			no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=orderDate %></td>
		<td><%=orderName %></td>
		<td><%=productId %></td>
		<td><%=name %></td>
		<td><%=unitprice %></td>
		<td><%=orderQty %></td>
		<td><%=orderAddress %></td>
		<td><a href="orderUpdate.jsp?orderDate=<%=orderDate %>&orderName=<%=orderName %>">수정</a> / 
			<a href="orderDelete.jsp?orderDate=<%=orderDate %>&orderName=<%=orderName %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group" align=center>
	<button type="button" onclick="location.href='addOrder.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>