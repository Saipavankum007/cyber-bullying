<%@ page  language="java" import="java.sql.*" errorPage="" %>
<%@page import="network.DbConnection"%>
<%
   String name = null,smail=null,id=null,mail=null,sname=null,dob=null,sch=null,col=null,emp=null;

try{

   Connection con;
   con =  DbConnection.getConnection();  
   Statement st = con.createStatement();

   smail=(String)session.getAttribute("email");
  
   String s = "select id,name,sname,mail,dob,sch,col,emp from reg where mail='"+smail+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   name=rs.getString(2);
   sname=rs.getString(3);
   smail=rs.getString(4);
   dob=rs.getString(5);
   sch=rs.getString(6);
   col=rs.getString(7);
   emp=rs.getString(8);
  session.setAttribute("id",id);
   

  
   }
   else
   out.print("Please check your login credentials");
  
   
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Online Social Network </title>
<link rel="stylesheet" href="cs\user.css" type="text/css" />
<link rel="stylesheet" href="cs\main_style.css" type="text/css" />
<link rel="stylesheet" href="cs\style.css" type="text/css" />
</head>
<body class="login">
<!-- header starts here -->
<div id="facebook-Bar">
  <div id="facebook-Frame">
    <div id="logo"> <a href="http://w3lessons.info">Cyberbullying Detection based on Semantic-Enhanced Marginalized Denoising Auto-Encoder</a> </div>       
<br></br><br><div >
         <form action="searchaction1.jsp" method="get" id="login_form" name="login_form">
          <table border="0" style="border:none">
            <tr>
              <td><img src="img\fb_icon.png" style="width:24px;height:24px;"></img></td>
              <td ><input type="text" tabindex="1"  id="email" placeholder="Search Your Friends" name="search" class="inputtext radius1" value=""></td>
              <td ><input type="submit" class="fbbutton" name="Search" value="Search" /></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="viewimage.jsp?id=<%=id%>" style="width:30px;height:24px;"></img></td>

              <td><a href="user_profile.jsp" style="font: 2px; color: #ffffff"><%=name%></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="uhome.jsp" style="font: 2px; color: #ffffff">Home</a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" ><img src="img\user_png.png" width="30" height="24" /></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" ><img src="img\chat1_1.png" width="30" height="24" /></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp" ><img src="img\logout1.png" width="80" height="28" /></a></td>
            </tr>
          </table>
        </form>
       </div> 
   </div>
</div>

<!-- header ends here -->
<!-- body start here -->
<!--- start--->
<div id="nav">

        <br></br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="viewimage.jsp?id=<%=id%>" style="width:300px;height:300px;"></img><br></br>
        <center><h2> 
       <font color="red"><font size="5"> <%=name%>&nbsp;<%=sname%></font></font>
            </h2></center>
</div>
   
     
<br></br><br></br>
<div id="content">


		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
		<%
                String  name12=(String)session.getAttribute("sesname");
	int fid=0;
	String rid=null,rid1=null,rid2=null,fname=null;
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String status="waiting for approve";
	String sql="select distinct id,name from request where id!='"+id+"' and status = '"+status+"' and fname = '"+name12+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/osn","root","root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		
		%>
		<form name="f1" ENCTYPE="multipart/form-data" action="#" method="post">
		<div style="position:absolute; left:450px; top:325px; width: 358px; height: 166px;">
		
		<fieldset>
      
   <legend><font color="#FF8000"><strong><font size="4">View Request</font></strong></font></legend>
		<table align="center" height="150">
			<%while(rs2.next()){
			fid=rs2.getInt("id");
			fname=rs2.getString("name");
			rid=id+","+name+","+Integer.toString(fid)+","+fname;
			rid1=id+","+name+","+Integer.toString(fid)+","+fname+",Confirm";
			rid2=id+","+name+","+Integer.toString(fid)+","+fname+",Ignore";
			%>
			<tr><td>Name:&nbsp;&nbsp;&nbsp;<%=rs2.getString("name")%></td></tr>
			<tr><td><img src="viewimage.jsp?id=<%=fid%>" alt="" width="120" height="99" /></td></tr>
			<tr>
            <td><a href="viewrequest1.jsp?id=<%=rid1%>"><font color="green"><strong>Confirm</strong></font></a>&nbsp;&nbsp;&nbsp;<a href="ignore.jsp?id=<%=rid2%>"><font color="red"><strong>Ignore</strong></font></a></td>
          </tr>
			<%}%>
		</table>
		</fieldset>
		</div>
		</form>
		<%
		}
catch(Exception ex)
	{
		System.out.println(ex);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
 

  %>
		</div><!--end fragment-2-->
			
		</div>
  
      
<div id="section">
 <!--  Table Start  -->
                    
     
 
  <!--  Table end  -->
</div>

<!--- end--->

<br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br>
<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2016 <a>Maverick</a>
                          <%
 
}
catch(Exception e)
{
System.out.println(e);
}
%>
    </div> 
</div>   
<!-- body  ends here -->
</body>

</html>
