<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.time.LocalDate" %>
<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>User Dashboard</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
    <link href="css/real-estate.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.css">
    
    <script>
    window.onload = function() {
        var logoutMessage = "<h4>You Are Successfully Logged Out..!</h4>";
        var popupContainer = document.createElement('div');
        popupContainer.id = "logoutMessageContainer";
        
        var popup = document.createElement('div');
        popup.id = "logoutMessage";
        popup.innerHTML = logoutMessage;
        
        var logoutLink = document.getElementById("logoutLink");
        logoutLink.addEventListener("click", function(event) {
            event.preventDefault(); // Prevents the default click behavior (navigating to the href)
            
            document.body.classList.add("logoutBlur"); // Applies the "logoutBlur" class to the body
            
            popupContainer.appendChild(popup);
            document.body.appendChild(popupContainer);
            
            setTimeout(function() {
                document.body.classList.remove("logoutBlur"); // Removes the "logoutBlur" class from the body
                document.body.removeChild(popupContainer);
                window.location.href = "index.html";
            }, 4000);
        });
    };
    document.addEventListener("DOMContentLoaded", function() {
        var welcomeMessage = document.getElementById("welcomeMessage");
        var links = document.querySelectorAll("a");

        links.forEach(function(link) {
            link.addEventListener("click", function() {
                welcomeMessage.style.display = "none";
            });
        });
    });

</script>

<style>
.container {
   display: flex;
   flex-direction: row;
   margin-left: 300px; 
}
/* Sidebar Styles */
.sidebar {
    background-color: #D9D9D9;
    padding: 50px;
    width: 350px;
    height:750px;
    position: fixed; /* Position the sidebar */
    top: 0; /* Position from the top */
    left: 0; /* Position from the left */
    margin: 0; /* Remove default margin */
    margin-top:55px
  
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    margin-bottom: 20px;
}

.sidebar ul li a {
    text-decoration: none;
    color: #000;
}

  #logoutMessageContainer {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 9999;
    }
    
    #logoutMessage {
    background-color: #f8f9fa;
    border: 1px solid #ced4da;
    border-radius: 5px; /* Add border radius value here */
    padding: 20px;
    text-align: center;
    color: black;
}


body {
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background-color: #OOFFOO;
}

.wrapper {
  flex: 1;
}

.content {
  padding: 20px;
}

.footer {
  background-color: #343a40;
  color: #fff;
  padding: 10px;
  text-align: center;
  width:100vh
  }


    
    /* Add your other styles here */

</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
<div class ="wrapper">
<!-- Navigation -->
<%
if(session.getAttribute("email")!=null)
{
	%>
	   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top style="margin_left:0px">
    <div class="container">
      <a class="navbar-brand" href="adminpanel.jsp">ESH Realstate</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" style="background-color: #343a40">
          <li class="nav-item active">
            <a class="nav-link" id="navlink" href="userdashboard.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="navlink" href="purchaseproperty.jsp">All Properties</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="navlink" href="showprofile1.jsp">Your Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="navlink" href="contact.html">Contact</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="navlink" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="logoutLink" href="logout.jsp">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
	  <br>
	  <br>
	  <br>
	 

	<%
  
  
  
  
  

String uid=String.valueOf(session.getAttribute("email"));
%>
<div class="container">
  <!-- Sidebar -->
  <aside class="sidebar">
    <ul>
      <li><a href="showprofile1.jsp" target="resultFrame"><i class="fas fa-user"></i> Show My Profile</a></li>
      <li><a href="changepassword1.jsp" target="resultFrame"><i class="fas fa-key"></i> Change Password</a></li>
      <li><a href="purchase.jsp" target="resultFrame"><i class="fas fa-shopping-cart"></i> Purchase Property</a></li>
      <li><a href="showpurchasepro.html" target="resultFrame"><i class="fas fa-home"></i> Search Purchase Property</a></li>
    </ul>
  </aside>

  <!-- Content -->
  <div class="content" style="margin-left:70px">
    
    <div id="welcomeMessage">
	
              
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
                  </div>
                  
                </div>
              </div>
            </div>	
            </div>	
            </div>
    <iframe name="resultFrame" src="" frameborder="0" width=1000px" height="700px"></iframe>
  </div>
</div>	  

<%
}
else
{
	%>
	<center>
	<h4 style="color:red">Invalid Session</h4>
	<hr><br>
	<a href="login.html"><h5>Login Now</h5></a>
	<%
}
%>
</div>
<!-- Footer -->
<footer class="py-2 bg-dark">
   
             <div class="col-md-12 text-center">
    <p style="color:white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | ESh <br><i class="icon-heart" aria-hidden="true"></i>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
  
</footer>

<script type='text/javascript' src=''></script>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
<script type='text/javascript'></script>
</body>
</html>