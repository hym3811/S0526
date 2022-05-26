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
		}else if(doc.name.value.length>30){
			alert("[성명]\n성명은 30자 까지만 입력가능합니다.");
			doc.name.focus();
		}else if(doc.dept.value==""){
			alert("[소속부서]\n소속부서를 선택하세요.");
			doc.dept.focus();
		}else if(doc.position.value==""){
			alert("[직급]\n직급을 선택하세요.");
			doc.position.focus();
		}else if(doc.duty.value==""){
			alert("[직책]\n직책을 입력하세요.");
			doc.duty.focus();
		}else if(doc.phone.value==""){
			alert("[연락처]\n연락처를 입력하세요.");
			doc.phone.focus();
		}else{
			doc.action="updateProcess.jsp";
			doc.submit();
		}
	}
</script>
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
	<br><h3 style="font-size:1.5em; text-align:center;">인사관리 사원정보 수정 화면</h3><br>
	<form name=form>
		<table border=2 style="width:50%; margin: 0 auto;">
			<tr>
				<th style="height:40px;">사원번호</th>
				<%@ include file="DBConn.jsp" %>
				<%
					String id=request.getParameter("id");
					
					String name=null;
					String dept=null;
					String position=null;
					String duty=null;
					String phone=null;
					
					try{
						sql="select * from person0526 where id=?";
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1,id);
						rs=pstmt.executeQuery();
						if(rs.next()){
							name=rs.getString(2);
							dept=rs.getString(3);
							position=rs.getString(4);
							duty=rs.getString(5);
							phone=rs.getString(6);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
				<td><input type=text name=id value="<%=id %>" readonly style="height:40px; width:100%; font-size:1.1em;"></td>
			</tr>
			<tr>
				<th style="height:40px;">성명</th>
				<td><input type=text name=name value="<%=name%>" style="height:40px; width:100%; font-size:1.1em;"></td>
			</tr>
			<tr>
				<th style="height:40px;">소속부서</th>
				<td><select name=dept style="height:40px; width:100%; font-size:1.1em;">
					<option value="">소속부서를 선택하세요.</option>
					<option value="인사부" <%=dept.equals("인사부") ? "selected" : "" %>>인사부</option>
					<option value="경리부" <%=dept.equals("경리부") ? "selected" : "" %>>경리부</option>
					<option value="홍보부" <%=dept.equals("홍보부") ? "selected" : "" %>>홍보부</option>
					<option value="기획부" <%=dept.equals("기획부") ? "selected" : "" %>>기획부</option>
					<option value="영업부" <%=dept.equals("영업부") ? "selected" : "" %>>영업부</option>
				</select></td>
			</tr>
			<tr>
				<th style="height:40px;">직급</th>
				<td><select name=position style="height:40px; width:100%; font-size:1.1em;">
					<option value="">직급을 선택하세요.</option>
					<option value="1" <%=position.equals("1") ? "selected" : "" %>>1급</option>
					<option value="2" <%=position.equals("2") ? "selected" : "" %>>2급</option>
					<option value="3" <%=position.equals("3") ? "selected" : "" %>>3급</option>
					<option value="4" <%=position.equals("4") ? "selected" : "" %>>4급</option>
				</select></td>
			</tr>
			<tr>
				<th style="height:40px;">직책</th>
				<td><input type=text name=duty value="<%=duty%>" style="height:40px; width:100%; font-size:1.1em;"></td>
			</tr>
			<tr>
				<th style="height:40px;">연락처</th>
				<td><input type=text name=phone value="<%=phone%>" style="height:40px; width:100%; font-size:1.1em;"></td>
			</tr>
			<tr>
				<td colspan=2 style="height:40px; text-align:center;">
				<input type=button value="수정" onclick=check() style="height:40px; width:15%; font-size:1.2em; background-color:black;color:white;margin:0 20px;">
				<input type=button value="취소" onclick=reset() style="height:40px; width:15%; font-size:1.2em; background-color:black;color:white;margin:0 20px;">
				</td>
			</tr>
		</table>
	</form>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>