<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    </head>
    <body>
 
        <% 
              String s1=request.getParameter("airport_id");
              String s2=request.getParameter("name");
              String s3=request.getParameter("city");
              String s4=request.getParameter("country");
             
             try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded..");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/db1","root","root");
           System.out.println("Connection Success");
           PreparedStatement ps=con.prepareStatement("Select * from airport where airport_id = ? or name=? or city=? or country=?");
           ps.setString(1,s1);
           ps.setString(2,s2); 
           ps.setString(3,s3);
           ps.setString(4,s4);
          
           
           ResultSet rs=ps.executeQuery();
%> 
<TABLE cellpadding="15" border="1" style="background-color: #acdff3;"> 
<TR>
    <th>ID</th>
    <th>Name</th>
    <th>City</th>
    <th>Country</th>
     <th>IATA</th>
      <th>ICAO</th>
       <th>Latitude</th>
        <th>Longitude</th>
         <th>altitude</th>
          <th>Timezone</th>
           <th>DST</th>
            <th>tzdatatime</th>
   
</tr>
<% 
while (rs.next()) { 
    session.setAttribute("airport_id",rs.getInt(1));
    session.setAttribute("name",rs.getString(2));
    session.setAttribute("city",rs.getString(3));
     session.setAttribute("country",rs.getString(4));
     session.setAttribute("IATA",rs.getString(5));
     session.setAttribute("ICAO",rs.getString(6));
     session.setAttribute("latitude",rs.getBigDecimal(7));
     session.setAttribute("longitude",rs.getBigDecimal(8));
     session.setAttribute("altitude",rs.getBigDecimal(9));
     session.setAttribute("timezone",rs.getBigDecimal(10));
     session.setAttribute("DST",rs.getString(11));
     session.setAttribute("tzdatatime",rs.getString(12));
%> 

<TR> 
    <TD><%=rs.getInt(1)%></TD> 
    <TD><%=rs.getString(2)%></TD> 
    <TD><%=rs.getString(3)%></TD> 
    <TD><%=rs.getString(4)%></TD> 
    <TD><%=rs.getString(5)%></TD>  
    <TD><%=rs.getString(6)%></TD>
    <TD><%=rs.getBigDecimal(7)%></TD>
    <TD><%=rs.getBigDecimal(8)%></TD>
    <TD><%=rs.getBigDecimal(9)%></TD>
    <TD><%=rs.getBigDecimal(10)%></TD>
    <TD><%=rs.getString(11)%></TD>
    <TD><%=rs.getString(12)%></TD>
    
    
    
    
    

</TR> 
<% } %> 
</table>

<%

rs.close();
ps.close();
con.close();
out.println("<br><br>");

}
                  
                   
           catch(Exception e)
                                     {
               System.out.println("Error Occured"+e);
           }
        %>
    </body>
</html>
