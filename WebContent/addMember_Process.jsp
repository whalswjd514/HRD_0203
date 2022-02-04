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
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("birth1")+"-"+request.getParameter("birth2")+"-"+request.getParameter("birth3");
	String email=request.getParameter("email1")+"@"+request.getParameter("email");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String []val=request.getParameterValues("interest");
	String interest="";
	for(int i=0;i<val.length;i++){
		if(i==(val.length-1)){
			interest+=val[i];
		}else{
			interest+=val[i]+",";
		}
	}
	
	try{
		String sql="insert into member0203 values(?,?,?,?,?,?,?,?,?,sysdate)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth);
		pstmt.setString(6, email);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.setString(9, interest);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("등록이 완료되었습니다!");
			location.href="memberSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("등록을 실패했습니다!");
			history.back(-1);
		</script>
</body>
</html>