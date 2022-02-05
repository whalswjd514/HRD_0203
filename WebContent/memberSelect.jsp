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
	int no=0;
	
	try{
		String sql="select count(*) from member0203";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1);
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("총 회원 수 읽기 실패");
		e.printStackTrace();
	}
	
%>
<h1>회원 목록</h1>
<p id="p1">총 <%=no %>명의 회원이 있습니다.
<hr>
<table border=1 id="tab2">
	<tr>
		<th>id</th>
		<th>성명</th>
		<th>비밀번호</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>주소</th>
		<th>관심분야</th>
		<th>구본</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	try{
		String sql="select * from member0203";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(3);
			String password=rs.getString(2);
			String gender=rs.getString(4);
			if(gender.equals("1")){
				gender="남성";
			}else{
				gender="여성";
			}
			String birth=rs.getString(5);
			String email=rs.getString(6);
			String phone=rs.getString(7);
			String address=rs.getString(8);
			String interest=rs.getString(9);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=password %></td>
		<td><%=gender %></td>
		<td><%=birth %></td>
		<td><%=email %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=interest %></td>
		<td><a href="memberUpdate.jsp?id=<%=id %>">수정</a> / 
			<a href="memberDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
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
	<button type="button" onclick="location.href='addMember.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>