<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
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
<h1>주문 목록(주문일자/상품별)</h1>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>주문일자</th>
		<th>주문수량</th>
		<th>주문금액</th>
	</tr>
<%
	DecimalFormat fo=new DecimalFormat("###,###");
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	int sumQty=0;
	int sum=0;
	
	try{
		String sql="select a.productId,b.name,to_char(a.orderDate,'yyyy-mm-dd'),sum(a.orderQty),sum(a.unitprice*a.orderQty) from order0203 a,product0203 b where a.productId=b.productId group by a.productId,b.name,a.orderDate order by a.productId";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String productId=rs.getString(1);
			String name=rs.getString(2);
			String orderDate=rs.getString(3);
			int orderQty=rs.getInt(4);
			int total=rs.getInt(5);
			sumQty=sumQty+orderQty;
			sum=sum+total;
			no++;

%>
	<tr>
		<td><%=no %></td>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td align="right"><%=rs.getInt(4) %></td>
		<td align="right"><%=fo.format(rs.getInt(5)) %></td>
	</tr>
<%
		}
%>
	<tr>
		<td colspan=4>합계</td>
		<td align="right"><%=sumQty %></td>
		<td align="right"><%=fo.format(sum) %></td>
	</tr>
<%
		
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