<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.storeName.value==""){
			alert("거래처이름을 입력하세요.");
			document.form.storeName.focus();
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
	String storeNo=request.getParameter("storeNo");
	
	try{
		String sql="select * from store0203 where storeNo=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, storeNo);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String storeName=rs.getString("storeName");
			String storeTel=rs.getString("storeTel");
			String ary[]=storeTel.split("-");
			String storeTel1="", storeTel2="", storeTel3="";
			storeTel1=storeTel.substring(0,3);
			storeTel2=storeTel.substring(4,7);
			storeTel3=storeTel.substring(8,12);
			String storeAddress=rs.getString("storeAddress");
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="storeUpdate_Process.jsp">
<h1>거래처 수정 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th height="30px">거래처코드</th>
		<td height="30px"><input type="text" name="storeNo" value="<%=storeNo %>" id="in1">(sequence 발생)</td>
	</tr>
	<tr>
		<th height="30px">거래처 이름</th>
		<td height="30px"><input type="text" name="storeName" value="<%=storeName %>" id="in1"></td>
	</tr>
	<tr>
		<th height="30px">거래처전화번호</th>
		<td height="30px">
			<select name="storeTel1">
				<option value="02" <%if(storeTel1.equals("02")){%>selected<%}%>>02</option>
				<option value="031" <%if(storeTel1.equals("031")){%>selected<%}%>>031</option>
				<option value="032" <%if(storeTel1.equals("032")){%>selected<%}%>>032</option>
				<option value="033" <%if(storeTel1.equals("033")){%>selected<%}%>>033</option>
				<option value="041" <%if(storeTel1.equals("041")){%>selected<%}%>>041</option>
				<option value="042" <%if(storeTel1.equals("042")){%>selected<%}%>>042</option>
				<option value="043" <%if(storeTel1.equals("043")){%>selected<%}%>>043</option>
				<option value="044" <%if(storeTel1.equals("044")){%>selected<%}%>>044</option>
				<option value="051" <%if(storeTel1.equals("051")){%>selected<%}%>>051</option>
				<option value="052" <%if(storeTel1.equals("052")){%>selected<%}%>>052</option>
				<option value="053" <%if(storeTel1.equals("053")){%>selected<%}%>>053</option>
				<option value="054" <%if(storeTel1.equals("054")){%>selected<%}%>>054</option>
				<option value="055" <%if(storeTel1.equals("055")){%>selected<%}%>>055</option>
				<option value="061" <%if(storeTel1.equals("061")){%>selected<%}%>>061</option>
				<option value="062" <%if(storeTel1.equals("062")){%>selected<%}%>>062</option>
				<option value="063" <%if(storeTel1.equals("063")){%>selected<%}%>>063</option>
				<option value="064" <%if(storeTel1.equals("064")){%>selected<%}%>>064</option>
			</select>-
			<input type="text" name="storeTel2" value="<%=storeTel2 %>" id="in3">-
			<input type="text" name="storeTel3" value="<%=storeTel3 %>" id="in3">
		</td>
	</tr>
	<tr>
		<th height="30px">거래처주소</th>
		<td height="30px"><input type="text" name="storeAddress" value="<%=storeAddress %>" id="in2"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="수정" onclick="check()" id="btn1">
			<input type="reset" value="취소" id="btn1">
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