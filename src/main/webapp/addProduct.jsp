<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
  <title>Property Form</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
  <br><br>
    <h2>Property Form</h2>       
         <form name="frm2" method="post" action="AddPropertyServlet" enctype="multipart/form-data">
    <div class="form px-3 pt-3 rounded">
        <div class="form-row">
            <div class="col">
            	Image:<input type="file" name="image" class="form-control" required>
            	Image:<input type="file" name="image1" class="form-control" required>
            	Image:<input type="file" name="image2" class="form-control" required>
                Name:<input type="text" name="loc" class="form-control" placeholder="location" required>
                Description:<input type="text" name="des" class="form-control" placeholder="descr" required>
                Price:<input type="number" name="pri" class="form-control" placeholder="pribr" required>
                Booking amount:<input type="number" name="boo" class="form-control" placeholder="bookamt" required>
                Area:<input type="text" class="form-control"  name="lot" required>
                Bedrooms:<input type="number" class="form-control"  name="bed" required>
               Bath rooms:<input type="number" class="form-control"  name="bat" required>
            </div>
            <div class="col">
             
                Kitchen:<input type="number" class="form-control"  name="kit" required>
                Age:<input type="text" class="form-control"  name="age" required>
                Year Build: <input type="text" class="form-control"  name="yea" required>
                Roof: <input type="text" class="form-control"  name="roo" required>
                Garage:<input type="number" class="form-control"  name="gar" required>
                Floor: <input type="text" class="form-control"  name="flo" required>
                Stories: <input type="text" class="form-control"  name="sto" required>
                Premium: <input type="text" class="form-control" name="pre" required>
               	Status: <input type="text" class="form-control" name="status" required>
            </div>
        </div>
        <input type="submit" value="Add" class="btn btn-success btn-block "></input>
        <br><br>
    </div>
</form>
</body>
</html>


