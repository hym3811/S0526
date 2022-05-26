<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		var doc=document.form;
		if(doc.name.value==""){
			alert("[성명]\n성명을 입력하세요.");
			doc.name.focus();
		}else if(isNaN(doc.id.value)==true){
			alert("[사원번호]\n사원번호는 숫자만 입력가능합니다.");
			doc.id.focus();
		}else if(doc.id.value==""||doc.id.value==0){
			alert("[사원번호]\n사원번호를 입력하세요.\n사원번호는 숫자만 입력가능합니다.");
			doc.id.focus();
		}else{
			doc.action="deleteProcess.jsp";
			doc.submit();
		}
	}
	function search(){
		var doc=document.form;
		if(doc.id.value==""){
			alert("사원정보 조회창으로 이동합니다.");
			location.href("select3.jsp");
		}else{
			doc.action="delete.jsp";
			doc.submit();
		}
	}
</script>
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
	<form name=form>
		<br><h3 style="text-align:center; font-size:1.5em;">인사관리 사원정보 삭제 화면</h3><br>
		<table border=2 style="width:30%; margin:0 auto;">
		<%@ include file="DBConn.jsp" %>
		<%
			String id=null;
			if(request.getParameter("id")!=null){
				id=request.getParameter("id");
			}
			String name=null;
			if(id!=null){
				try{
					sql="select name from person0526 where id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					if(rs.next()){
						name=rs.getString(1);
					}else{
		%>
		<script>
			alert("[아이디]\n유효하지 않은 아이디입니다.");
			location.href="delete.jsp";
		</script>
		<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		%>
			<tr>
				<th style="height:40px;">성명</th>
				<td><input type=text name=name style="width:100%; height:40px; fone-size:1.1em;" value="<%=name==null ? "" : name%>"></td>
			</tr>
			<tr>
				<th style="height:40px;">사원번호</th>
				<td><input type=number name=id style="width:85%; height:40px; fone-size:1.1em;" placeholder="입력값 없이 조회버튼 입력시 조회로 이동" value="<%=id==null ? "" : id%>"><input type=button value="조회" onclick=search() style="width:13%;height:40px;font-size:1.2em;"></td>
			</tr>
			<tr>
				<td colspan=2 style="height:40px; text-align:center;">
				<input type=button value="삭제" onclick=check() style="height:40px; width:15%; font-size:1.2em; background-color:black;color:white;margin:0 20px;">
				<input type=button value="취소" onclick=reset() style="height:40px; width:15%; font-size:1.2em; background-color:black;color:white;margin:0 20px;">
				</td>
			</tr>
		</table>
	</form>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>