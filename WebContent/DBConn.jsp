<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql=null;
	try{
		String url="jdbc:oracle:thin:@//localhost:1521/xe";
		String user="system";
		String pass="3811";
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection(url,user,pass);
	}catch(Exception e){
		e.printStackTrace();
	}
%>