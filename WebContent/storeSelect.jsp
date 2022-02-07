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
<h1>거래처 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>거래처 코드</th>
		<th>거래처 이름</th>
		<th>거래처 전화번호</th>
		<th>거래처주소</th>
		<th>구분</th>
	</tr>
<%
	request.getParameter("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from store0203";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String storeNo=rs.getString(1);
			String storeName=rs.getString(2);
			String storeTel=rs.getString(3);
			String storeAddress=rs.getString(4);
			no++;
%>
	<tr>
		<td id="td1"><%=no %></td>
		<td id="td1"><a href="storeUpdate.jsp?storeNo=<%=storeNo %>" id="a1"><%=storeNo %></a></td>
		<td id="td1"><%=storeName %></td>
		<td id="td1"><%=storeTel %></td>
		<td id="td1"><%=storeAddress %></td>
		<td id="td1"><a href="storeDelete.jsp?storeNo=<%=storeNo %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
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
	<button type="button" onclick="location.href='addStore.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>