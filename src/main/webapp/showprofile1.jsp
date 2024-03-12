<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="rems_beans.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <style>
    body {
      background-color: #ffffff;
      font-family: Arial, sans-serif;
    }

    h2 {
      color: green;
    }

    .profile-info {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin: 20px;
    }

    .profile-info div {
      margin-bottom: 10px;
    }

    a {
      color: #0000FF;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .error {
      color: red;
    }
  </style>
</head>
<body>
<%
if (session.getAttribute("email") != null) {
  String uid = String.valueOf(session.getAttribute("email"));
  Connection con = null;
  PreparedStatement pst = null;
  ResultSet rs = null;

  try {
    DBConnector dbc = new DBConnector();
    con = dbc.getDbconnection();
    pst = con.prepareStatement("select * from new_table where email=?;");
    pst.setString(1, uid);
    rs = pst.executeQuery();

    if (rs.next()) { // Move the cursor to the first row
%>
  <center>
    
    
    <div class="profile-info">
    <h2>User Profile for <%= uid %></h2>
      <div>
        <strong>Name:</strong> <%= rs.getString("name") %>
      </div>
      <div>
        <strong>Email ID:</strong> <%= rs.getString("email") %>
      </div>
      <div>
        <strong>Mobile No.:</strong> <%= rs.getString("number") %>
      </div>
    </div>
   
    
  </center>
<%
} else {
  // Handle the case where no data is found for the user
}
} catch (Exception e) {
  out.println(e);
} finally {
  if (rs != null) { rs.close(); }
  if (pst != null) { pst.close(); }
  if (con != null) { con.close(); }
}
} else {
%>
  <center>
    <h3 class="error">Invalid Session</h3>
    <hr>
    <a href="login.html"><h4>Login Now</h4></a>
  </center>
<%
}
%>
</body>
</html>