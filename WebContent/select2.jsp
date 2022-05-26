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
	<form name=form>
		<br><h3 style="text-align:center; font-size:1.5em;">직원 정보 조회</h3><br>
		<table border=3 style="width:70%; margin: 0 auto;">
			<tr>
				<th style="height:40px;">No</th>
				<th>성명</th>
				<th>사번</th>
				<th>직급</th>
				<th>직책</th>
				<th>연락처</th>
				<th>소속부서</th>
				<th>구분</th>
			</tr>
<%@ include file="DBConn.jsp" %>
<%
	try{
		sql="select * from person0526";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		Integer no=0;
		while(rs.next()){
			no++;
			String id=rs.getString(1);
			String name=rs.getString(2);
			String dept=rs.getString(3);
			String position=rs.getString(4);
			String duty=rs.getString(5);
			String phone=rs.getString(6);
%>

			<tr>
				<td style="text-align:center; height: 40px;"><%=no %></td>
				<td style="text-align:center;"><%=name %></td>
				<td style="text-align:center;"><%=id %></td>
				<td style="text-align:center;"><%=position %></td>
				<td style="text-align:center;"><%=duty %></td>
				<td style="text-align:center;"><%=phone %></td>
				<td style="text-align:center;"><%=dept %></td>
				<td style="text-align:center;"><a href="update2.jsp?id=<%=id %>" style="color:white;text-decoration:none;">수정하기</a></td>
			</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
		</table>
	</form>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>