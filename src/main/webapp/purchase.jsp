<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
     <%@page import="rems_beans.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ESH Ethiopia's Best Property Dealer</title>
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
if(session.getAttribute("email")!=null)
{
%>   
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_4.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Properties</h1>
            <p class="breadcrumbs"><span class="mr-2">Purchase</i></a></span> <span>Properties <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
	<center>
	<div class="col-lg-9">
            <div class="row">
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img"><br><br>
                    <img src="images/work-1.jpg" class="img-fluid" alt="Colorlib Template">
                  <div class="text">
                      <span>Sale</span>
                      <h3><a href="properties-1.html">Family<br>Vila</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br7 Billion</h4>
                    <p class="h-info"><span class="location"><b>5 killo,Addis Ababa</b></span> <span class="details">&mdash; 1,139-2,721 sq.ft</span></p>
                 
                   <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img"><br><br>
                    <img src="images/work-2.jpg" class="img-fluid" alt="Colorlib Template">
 <div class="text">
                      <span>Rent</span>
                      <h3><a href="properties-2.html"> Office<br>Complex</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br8 Billion</h4>
                    <p class="h-info"><span class="location"><b>kazanchis,Addis Ababa</b></span> <span class="details">&mdash; 8,54-9,00 Sq.ft</span></p>
                  
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img"><br><br>
                    <img src="images/work-3.jpg" class="img-fluid" alt="Colorlib Template">

 <div class="text">
                      <span>Sale</span>
                      <h3><a href="properties-3.html">Galaxy<br>Vila</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br6 Billion</h4>
                    <p class="h-info"><span class="location"><b>Gonder</b></span> <span class="details">&mdash; 1,450-3,100 Sq.ft</span></p>
                
                    <button class="btn btn-dark btn-block"><a href="login.html">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img">
                    <img src="images/work-4.jpg" class="img-fluid" alt="Colorlib Template">


 <div class="text">
                      <span>Sale</span>
                      <h3><a href="properties-4.html">Abay<br>House</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br4 Billion</h4>
                    <p class="h-info"><span class="location"><b>Bahir Dar</b></span> <span class="details">&mdash; 1,690-2,651 Sq.ft</span></p>
                  
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img">
                    <img src="images/work-5.jpg" class="img-fluid" alt="Colorlib Template">
<div class="text">
                      <span>Sale</span>
                      <h3><a href="properties-5.html">Hallem<br>Mansion</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br6 Billion</h4>
                    <p class="h-info"><span class="location"><b>Hawassa</b></span> <span class="details">&mdash; 3,245-3,502 Sq.ft</span></p>
               
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img">
                    <img src="images/work-6.jpg" class="img-fluid" alt="Colorlib Template">
                    <div class="text">
                      <span>Rent</span>
                      <h3><a href="properties-6.html">Muna<br>Apartment</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br5 Billion<h4>
                    <p class="h-info"><span class="location"><b>Dire Dawa</b></span> <span class="details">&mdash; 1,500-2,000 Sq.ft</span></p>
                  
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img">
                    <img src="images/work-7.jpg" class="img-fluid" alt="Colorlib Template">
               <div class="text">
                      <span>Rent</span>
                      <h3><a href="properties-7.html">Asumbar<br>Apartment</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br6 Billion</h4>
                    <p class="h-info"><span class="location"><b>Harar</b></span> <span class="details">&mdash; 1,550-1,850 Sq.ft</span></p>
               
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img">
                    <img src="images/work-8.jpg" class="img-fluid" alt="Colorlib Template">
<div class="text">
                      <span>Sale</span>
                      <h3><a href="properties-8.html">Addis<br>House</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br77.89 Million</h4>
                    <p class="h-info"><span class="location"><b>Addia Ababa</b></span> <span class="details">&mdash; 2,200-3,081 Sq.ft</span></p>
              
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                  <div class="img">
                    <img src="images/work-9.jpg" class="img-fluid" alt="Colorlib Template">
                     <div class="text">
                      <span>Sale</span>
                      <h3><a href="properties-9.html">Geda<br>Mansion</a></h3>
                    </div>
                  </div>
                  <div class="desc pt-3">
                    <h4 class="price">Br99 Million</h4>
                    <p class="h-info"><span class="location"><b>Jimma</b></span> <span class="details">&mdash; 1,890-2,356 Sq.ft</span></p>
                 
                    <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
                  </div>
                 </div>
                 </div>
                 </div>
                 </div>
    <div class="col-lg-9">
     <div class="row">
    <% 
      Connection con;
      PreparedStatement pst;
      ResultSet rs;
      String nm;
      try {
        DBConnector dbc = new DBConnector();
        con = dbc.getDbconnection();

        pst = con.prepareStatement("select * from properties;");

        rs = pst.executeQuery();
        int count = 0;
        while (rs.next()) {
          String propertyId = rs.getString("id");
    %>
    <div class="col-md-4 col-lg-4 ftco-animate">
      <div class="project">
        <div class="img"><br><br><br>
          <img src="<%=rs.getString("image") %>" class="img-fluid" alt="Colorlib Template">
          <div class="text">
            <span><%=rs.getString("status") %></span>
            <h3><a href="propertyDetail.jsp?id=<%= propertyId %>" class="text-primary font-weight-bold">details</a></h3>
          </div>
        </div>
        <div class="desc pt-3">
          <h4 class="price"><%=rs.getString("pribr") %></h4>
          <p class="h-info"><span class="location"><%=rs.getString("location") %></span> <span class="details">&mdash; <%=rs.getString("lotarea") %> sq.ft</span></p>
          <button class="btn btn-dark btn-block"><a href="book.jsp">Book</a></button>
        </div>
      </div>
    </div>
    <% 
      count++;
      if (count % 3 == 0) {
    %>
  </div>
  <div class="row">
    <% 
      }
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
  %>
  </div>
</div>
	
    
  
<%
}
else
{
	%>
	<center>
	<br>
	<h4 style="color:red">Invalid Session</h4>
	<hr>
	<a href="login.html"><h5>Login Now</h5></a>
	
	<%
}
%>
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