<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.student.StudentBean" %>
<!DOCTYPE html>
<html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Submitted Student Details</title>
<style>body{font-family:Arial;background:#f2f7f3;color:#203126}.card{max-width:650px;margin:40px auto;background:white;padding:25px;border-radius:12px;box-shadow:0 4px 18px #0001}h1{color:#23613b}dt{font-weight:bold;margin-top:12px}dd{margin:4px 0}a{display:inline-block;margin:12px 12px 0 0;background:#23613b;color:white;padding:10px 14px;border-radius:6px;text-decoration:none}</style></head>
<body><div class="card">
<h1>Student Details Submitted</h1>
<jsp:useBean id="stu" class="com.example.student.StudentBean" scope="request" />
<dl>
<dt>Name</dt><dd><jsp:getProperty name="stu" property="name"/></dd>
<dt>Register No</dt><dd><jsp:getProperty name="stu" property="reg"/></dd>
<dt>Department</dt><dd><jsp:getProperty name="stu" property="dept"/></dd>
<dt>Year</dt><dd><jsp:getProperty name="stu" property="year"/></dd>
<dt>Email</dt><dd><jsp:getProperty name="stu" property="email"/></dd>
</dl>
<a href="index.jsp">Register another student</a>
<a href="index.jsp#ajax">Open AJAX student list</a>
</div></body></html>
