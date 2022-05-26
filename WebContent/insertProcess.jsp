<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String duty=request.getParameter("duty");
	String phone=request.getParameter("phone");
	try{
		sql="insert into person0526 values(?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, duty);
		pstmt.setString(6, phone);
		pstmt.executeUpdate();
%>
<script>
	alert("사원등록 완료");
	location.href="insertForm.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>