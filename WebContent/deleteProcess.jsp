<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	try{
		sql="select name from person0526 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name2=rs.getString(1);
			if(name.equals(name2)){
				sql="delete from person0526 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
%>
<script>
	alert("퇴사 처리 성공");
	location.href="delete.jsp";
</script>
<%
			}else{
%>
<script>
	alert("이름이 일치하지 않습니다.");
	location.href="delete.jsp";
</script>
<%
			}
		}else{
%>
<script>
	alert("유효하지 않은 아이디입니다.");
	location.href="delete.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>