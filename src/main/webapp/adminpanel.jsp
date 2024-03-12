<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.time.LocalDate" %>
      <%@page import="java.sql.*" %>
     <%@page import="rems_beans.*" %>
<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Admin Panel</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
    <link href="css/real-estate.css" rel="stylesheet">
    <link href='' rel='stylesheet'>

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
</script>

    
<style>
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
    background-color: #OOFFOO;
}

.card {
    width: 400px;
    border: none;
    margin: 100px;
}

.btr {
    border-top-right-radius: 5px !important
}

.btl {
    border-top-left-radius: 5px !important
}

.btn-dark {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd
}

.btn-dark:hover {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd
}

.nav-pills {
    display: table !important;
    width: 100%
}

.nav-pills .nav-link {
    border-radius: 0px;
    border-bottom: 1px solid #0d6efd40
}

.nav-item {
    display: table-cell;
    background: #0d6efd2e
}

.form {
    padding: 10px;
    height: 300px
}

.form input {
    margin-bottom: 12px;
    border-radius: 3px
}

.form input:focus {
    box-shadow: none
}

.form button {
    margin-top: 20px
}

#navlink {
    background-color: #343a40;
}
.sidebar {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 100;
    padding: 90px 0 0;
    box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
    z-index: 99;
}

@media (max-width: 767.98px) {
    .sidebar {
        top: 11.5rem;
        padding: 0;
    }
}
    
.navbar {
    box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
}

@media (min-width: 767.98px) {
    .navbar {
        top: 0;
        position: sticky;
        z-index: 999;
    }
}

.sidebar .nav-link {
    color: #333;
}

.sidebar .nav-link.active {
    color: #0d6efd;
}

</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>

<!-- Navigation -->-
<%
if(session.getAttribute("email")!=null)
{
%>
<%
String uid=String.valueOf(session.getAttribute("email"));
String name=String.valueOf(session.getAttribute("name"));
%>
  
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="adminpanel.jsp">ESH Realstate</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" style="background-color: #343a40">
          <li class="nav-item active">
            <a class="nav-link" id="navlink" href="adminpanel.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="navlink" href="purchaseproperty.jsp">All Properties</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="navlink" href="showprofile2.jsp">Your Profile</a>
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
    <div class="container-fluid">
        <div class="row">
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            
                  <ul class="nav flex-column">
				  <li class="nav-item">
				    <a class="nav-link active mb-3" aria-current="page" href="showprofile2.jsp">
				      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
				  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
				</svg>
				      <span class="ml-2">Profile</span>
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link mb-3" href="changepassword2.jsp">
				    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
				  <path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8m4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5"/>
				  <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
				</svg>
				      <span class="ml-2">Change Password</span>
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link mb-3" href="showusers.jsp">
				      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
				  <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4"/>
				</svg>
				      <span class="ml-2">All Users</span>
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link mb-3" href="addProduct.jsp">
				      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
</svg>
				      <span class="ml-2">Add Property</span>
				    </a>
				  </li>
				  
				  <li class="nav-item">
				    <a class="nav-link mb-3" href="purchaseprodt.jsp">
				      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
				      <span class="ml-2">Purchase Property Details</span>
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link mb-3" href="messages.jsp">
				      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-text" viewBox="0 0 16 16">
				  <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
				  <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8m0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5"/>
				</svg>
				      <span class="ml-2">Messages</span>
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link mb-3" href="subscribe.jsp">
				      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
				  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
				</svg>
				      <span class="ml-2">Subscribers List</span>
				    </a>
				  </li>
				</ul>
        
            </nav>
            <br><br>
            <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4 content" id="content">
<center>            
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
                nm = rs.getString("descr");
        %>
        <div class="col-md-4 ftco-animate"> <!-- Adjusted column classes -->
            <div class="project">
                <div class="img"><br><br>
                    <img src="<%= rs.getString("image")%>" class="img-fluid">
                    <a href="propertyDetail.jsp?id=<%= propertyId %>" class="text-primary font-weight-bold">details</a>
      
      
               
                </div>
                <div class="text">
                    <span><%= rs.getString("status") %></span>
                </div>
                <a href="Deleteproperty.jsp?id=<%=propertyId%>" class="btn btn-danger">Delete property</a>
            </div>
        </div>
        
        <% 
            count++;
            if (count % 3 == 0) {  // Start a new row after every 3 items
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

</main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    	  var sidebarLinks = document.querySelectorAll('.sidebar a');
    	  sidebarLinks.forEach(function(link) {
    	    link.addEventListener('click', function(event) {
    	      event.preventDefault();
    	      var url = this.getAttribute('href');
    	      loadFile(url);
    	    });
    	  });
    	});

    	function loadFile(url) {
    	  var xhttp = new XMLHttpRequest();
    	  xhttp.onreadystatechange = function() {
    	    if (this.readyState == 4 && this.status == 200) {
    	      document.getElementById('content').innerHTML = this.responseText;
    	    }
    	  };
    	  xhttp.open('GET', url, true);
    	  xhttp.send();
    	}
        new Chartist.Line('#traffic-chart', {
            labels: ['January', 'Februrary', 'March', 'April', 'May', 'June'],
            series: [
                [23000, 25000, 19000, 34000, 56000, 64000]
            ]
            }, {
            low: 0,
            showArea: true
        });
    </script>
  <%
}
else
{
	%>
	<center>
	
	<hr><br>
	<a href="login.html"><b>Login Now</b></a>
	
	<%
}
%>
</body>
<script type='text/javascript' src=''></script>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
    <script type='text/javascript'></script>
</html>
