<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/Updating Bug</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table align="center" width="700" bgcolor="#FFFFFF">
<tr><td height="70">&nbsp;</td></tr>
<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr><td>

</td></tr>
<tr><td height="300" valign="top"><div align="center">
You can update Priority, Status and Responsible Expert for this Bug.</div>
<form name="form" method="post" action="updatebug1.jsp">
<input type="hidden" name="bugid" value="<%=(String)request.getParameter("bugid")%>" />
<table align="center" cellpadding="2" width="500" cellspacing="4">
<tr bgcolor="#0054A8" class="whitetext" align="center">
<td colspan="4">Bug Detail</td></tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bugtrack","root","");
Statement stmt = con.createStatement();
	String query = "select * from bug where bugid="+(String)request.getParameter("bugid");
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()){
	out.print("<tr><td bgcolor=#F2F2F2>Bug ID</td><td>"+rs.getString("bugid")+"</td><td bgcolor=#F2F2F2>Author</td><td>"+rs.getString("author")+"</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Product Name</td><td colspan=3>"+rs.getString("prodname")+"</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Environment</td><td>"+rs.getString("env")+"</td><td bgcolor=#F2F2F2>Type</td><td>"+rs.getString("type")+"</td></tr>");
	out.print("<tr><td colspan=4 bgcolor=#F2F2F2>Description</td></tr>");	
	out.print("<tr><td colspan=4 >"+rs.getString("description")+"</td></tr>");
	
	out.print("<tr bgcolor=#F2F2F2><td>&nbsp;</td><td>Current Stage</td><td>New Stage</td><td>&nbsp;</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Priority</td><td>"+rs.getString("priority")+"</td>");
	out.print("<td>");
	out.print("<select name=priority class=inputtext>");
	out.print("<option value='Low'>Low</option><option value='Medium'>Medium</option><option value='High'>High</option>");
	out.print("</select>");	
	out.print("</td><td>&nbsp;</td></tr>");
	
	out.print("<tr><td bgcolor=#F2F2F2>Status</td><td>"+rs.getString("status")+"</td>");
	out.print("<td>");
	out.print("<select name=status class=inputtext>");
	out.print("<option value='New'>New</option><option value='Assigned'>Assigned</option><option value='Fixed'>Fixed</option><option value='Closed'>Closed</option>");
	out.print("</select>");	
	out.print("</td><td>&nbsp;</td></tr>");
	
	out.print("<tr><td bgcolor=#F2F2F2>Responsible</td><td>"+rs.getString("assign_to")+"</td>");
	out.print("<td>");
	out.print("<select name=assign_to class=inputtext>");
	
	query = "select loginid, name from login where loginid in (select expertid from experts where prodid='"+rs.getString("prodid")+"')";
	System.out.print(query);
	ResultSet rs1 = stmt.executeQuery(query);
	while(rs1.next()){
		out.print("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");		
	}	
	rs1.close();
	out.print("</select>");	
	out.print("</td><td>&nbsp;</td></tr>");
	}
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	System.out.print(e);
}  
%>
<td colspan="4" align="center"><input type="submit" name="update" value="Update"</td></tr>
</table>
</form>
<table align="center" cellpadding="2" width="500" cellspacing="4">
<tr><td colspan="2" bgcolor="#0054A8" class="whitetext">Audit Trail</td></tr>
<tr bgcolor=#F2F2F2><td class="smalltext" width="150">Expert</td><td class="smalltext">Comments</td></tr>
<%

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bug","bug");
	Statement stmt = con.createStatement();
	String query = "select * from solutions where bugid="+(String)request.getParameter("bugid");
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()){
	out.print("<tr>");
	out.print("<td class=smalltext>"+rs.getString("expert")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("soln")+"</td>");
	out.print("</tr>");	
	}
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	System.out.print(e);
}  

%>
</table>
<div align="center"><hr width="100" /><a href="bugsadmin.jsp">Back</a><hr width="100" /></div>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
