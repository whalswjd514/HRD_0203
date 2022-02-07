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
<h1>주문 목록 (주문자별 수량 및 금액 합계)</h1>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>주문자 성명</th>
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
		String sql="select orderName,sum(orderQty),sum(unitprice*orderQty) from order0203 group by orderName order by orderName";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String orderName=rs.getString(1);
			int orderQty=rs.getInt(2);
			int total=rs.getInt(3);
			no++;
			sumQty=sumQty+orderQty;
			sum=sum+total;
%>
	<tr>
		<td><%=no %></td>
		<td><%=rs.getString(1) %></td>
		<td align="right"><%=rs.getInt(2) %></td>
		<td align="right"><%=fo.format(rs.getInt(3)) %></td>
	</tr>
<%
		}
%>
	<tr>
		<td colspan=2>합계</td>
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