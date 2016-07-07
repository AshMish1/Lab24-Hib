<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.ashish.hibernate.DAO"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hibernate Example</title>
</head>
<body>
<h1>Hibernate Example</h1>
<jsp:useBean id="obj" class="com.ashish.hibernate.Product">  
</jsp:useBean>  
<jsp:setProperty property="*" name="obj"/>
<%  
int i=DAO.addProduct(obj); 
if (i > 0)  
	out.print("Product successfully added");  
else
	out.println("Error: product not added");
%>  
</body>
</html>