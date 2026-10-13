<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Information System</title>
<style>
body{font-family:Arial,sans-serif;background:#f2f7f3;margin:0;color:#203126}
main{max-width:850px;margin:32px auto;padding:24px;background:white;border-radius:14px;box-shadow:0 4px 18px #0001}
h1{text-align:center;color:#23613b}.tabs{display:flex;gap:10px;justify-content:center;flex-wrap:wrap;margin:20px 0}
.tabs a,button{background:#23613b;color:white;border:0;border-radius:7px;padding:11px 16px;text-decoration:none;cursor:pointer}
form{display:grid;grid-template-columns:1fr 1fr;gap:14px}label{display:flex;flex-direction:column;gap:6px}
input{padding:10px;border:1px solid #b9c9bd;border-radius:6px}button{font-size:15px}
.wide{grid-column:1/-1}.muted{color:#5c6d61;font-size:14px}
table{border-collapse:collapse;width:100%;margin-top:15px}th,td{border:1px solid #d5e0d8;padding:8px;text-align:left}th{background:#e5f0e8}
@media(max-width:600px){main{margin:12px;padding:16px}form{grid-template-columns:1fr}}
</style>
</head>
<body><main>
<h1>STUDENT INFORMATION SYSTEM</h1>
<div class="tabs">
<a href="#servlet">Servlet</a><a href="#jsp">JSP + JavaBean</a><a href="#ajax">AJAX</a>
</div>
<section id="servlet">
<h2>Student Registration</h2>
<p class="muted">Enter student details and submit to save them for this running application.</p>
<form action="RegisterServlet" method="post">
<label>Name<input name="name" required></label>
<label>Register No<input name="reg" required></label>
<label>Department<input name="dept" required></label>
<label>Year<input name="year" required></label>
<label class="wide">Email<input name="email" type="email" required></label>
<div class="wide"><button type="submit">Submit Details</button></div>
</form>
</section>
<hr style="margin:28px 0;border:0;border-top:1px solid #d5e0d8">
<section id="jsp"><h2>JSP + JavaBean</h2><p>Submitting the form opens a JSP page that displays the submitted student using the JavaBean.</p></section>
<hr style="margin:28px 0;border:0;border-top:1px solid #d5e0d8">
<section id="ajax">
<h2>AJAX — Stored Student List</h2>
<button type="button" onclick="loadStudents()">Load Students</button>
<p id="status" class="muted" aria-live="polite"></p>
<div id="studentTable"></div>
</section>
</main>
<script>
async function loadStudents(){
 const status=document.getElementById('status');
 const area=document.getElementById('studentTable');
 status.textContent='Loading students...';
 try{
   const response=await fetch('students');
   if(!response.ok) throw new Error('HTTP '+response.status);
   const students=await response.json();
   if(!students.length){area.textContent='No students registered yet.';status.textContent='';return;}
   const table=document.createElement('table');
   const headers=['Name','Register No','Department','Year','Email'];
   const thead=table.createTHead().insertRow();
   headers.forEach(h=>{const th=document.createElement('th');th.textContent=h;thead.appendChild(th);});
   const tbody=table.createTBody();
   students.forEach(s=>{
     const row=tbody.insertRow();
     ['name','reg','dept','year','email'].forEach(k=>{const cell=row.insertCell();cell.textContent=s[k]||'';});
   });
   area.replaceChildren(table);status.textContent='Loaded '+students.length+' student(s).';
 }catch(e){status.textContent='Could not load students. Check that the application is running.';area.replaceChildren();}
}
</script>
</body></html>
