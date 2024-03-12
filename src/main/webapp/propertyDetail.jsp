<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="rems_beans.DBConnector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
  
    
    <%
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    try {
        DBConnector dbc = new DBConnector();
        con = dbc.getDbconnection();

        String propertyId = request.getParameter("id"); // Assuming you pass the propertyId as a parameter

        pst = con.prepareStatement("SELECT * FROM properties WHERE id = ?;");
        pst.setString(1, propertyId);

        rs = pst.executeQuery();
        if (rs.next()) {
%>
    <div class="container">
    <div class="vertical-center">
    
			<br>
         		<center>
         		<div class="col-md-9 properties-single">
      			<div class="single-slider owl-carousel">
      				<div class="item">
      					<div class="properties-img" style="background-image: url(<%=rs.getString("image")%>);"></div>
      				</div>
      				<div class="item">
      					<div class="properties-img" style="background-image: url(<%=rs.getString("image1")%>);"></div>
      				</div>
      				<div class="item">
      					<div class="properties-img" style="background-image: url(<%=rs.getString("image2")%>);"></div>
      				</div>
      				</div>
      				</div>
      				
      			
        		<div class="col-md-12 Properties-single mt-4 mb-5 ftco-animate">
        			<h2>Villa</h2>
        			<p class="rate mb-4">
        				<span class="loc"><%=rs.getString("location")%></span>
  						</p>
  						<p><%=rs.getString("descr")%></p>
  						</div></div>
  						<div class="d-md-flex mt-5 mb-5">
  							<ul>
  							    <li><span>Price Breakup: </span> <%=rs.getString("pribr")%></li>
  							    <li><span>Booking Amount: </span> <%=rs.getString("bookamt")%></li>
    							<li><span>Lot Area: </span> <%=rs.getString("lotarea")%></li>
    							<li><span>Bed Rooms: </span><%=rs.getString("bed")%><li>
    							<li><span>Bath Rooms: </span><%=rs.getString("bath")%></li>
    							<li><span>Hall & Kitchen: </span><%=rs.getString("kitc")%></li>
    							<li><span>Garage: </span><%=rs.getString("gara")%></li>
    						</ul>
    						<ul class="ml-md-5">
    						    <li><span>Age of Construction: </span> <%=rs.getString("age")%></li>
    							
    							<li><span>Flooring: </span><%=rs.getString("floor")%></li>
    							<li><span>Year Build:</span> <%=rs.getString("yearb")%></li>
    							<li><span>Stories: </span> <%=rs.getString("stories")%></li>
    							<li><span>Roofing: </span><%=rs.getString("roof")%></li>
    						</ul>
  						</div>
  						<p><b>PREMIUM AMENITIES:<%=rs.getString("premium")%></p>
        		</div>
        		<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
		</section>
	
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>