<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
     <%@page import="rems_beans.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="col-lg-9">
    <div class="row">
        <div class="col-md-6 col-lg-4 ftco-animate">
            <div class="project">
                <div class="img"><br><br>
                    <img src="images/work-1.jpg" class="img-fluid" alt="Colorlib Template">
                    <a href="propertiesDetail.jsp" class="text-primary font-weight-bold">details</a>
                </div>
                <% 
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                String nm;
                try {
                    DBConnector dbc = new DBConnector();
                    con = dbc.getDbconnection();

                    pst = con.prepareStatement("select status from properties;");

                    rs = pst.executeQuery();
                    while (rs.next()) {
                %>
                <div class="text">
                    <span><%= rs.getString("status") %></span>
                    
                </div>
                <% 
                }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>