
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password Form</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
 <link href="css/real-estate.css" rel="stylesheet">
 <style>
  .card {
    max-width: 450px;
    width: 800px;
    height:800;
    margin-top: 50px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}</style>
</head>
<body bgcolor="CornSilk">
<%
if(session.getAttribute("email")!=null)
{
%>

<div class="d-flex justify-content-center align-items-center mt-5">
    <div class="card">
        <h3 style="color:black">Change Password</h3>
        <form name="frm2" method="post" action="Change">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"></ul>
            <div class="form px-3 pt-3 rounded">
                Email:<input style=" background-color: #eeeee;" type="text" name="uid" class="form-control" required>
                Current Password:<input style=" background-color: #eeeee;" type="password" name="curps" class="form-control" required>
                New Password: <input  style=" background-color: #eeeee;"type="password" name="newps" id="newps" class="form-control" required>
                Confirm Password: <input style=" background-color: #eeeee;" type="password" name="conps" id="conps" class="form-control" required>
                
                <span id="password-error" class="text-danger"></span>
                            </div>
                            <button class="btn btn-success btn-block my-2 w-75 m-auto">Change</button>
                            
        </form>
    </div>
</div>

<script>
    document.querySelector('form[name="frm2"]').addEventListener('submit', function(e) {
        var newPasswordInput = document.getElementById('newps');
        var confirmPasswordInput = document.getElementById('conps');
        var passwordError = document.getElementById('password-error');
        var newPassword = newPasswordInput.value;
        var confirmPassword = confirmPasswordInput.value;
        var passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (!passwordPattern.test(newPassword)) {
            e.preventDefault();
            passwordError.textContent = 'New password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character.';
            newPasswordInput.classList.add('is-invalid');
        } else {
            passwordError.textContent = '';
            newPasswordInput.classList.remove('is-invalid');
        }

        if (newPassword !== confirmPassword) {
            e.preventDefault();
            passwordError.textContent = 'Passwords do not match.';
            confirmPasswordInput.classList.add('is-invalid');
        } else {
            passwordError.textContent = '';
            confirmPasswordInput.classList.remove('is-invalid');
        }
    });
</script>
<%
}
else 
{
%>
    <center>
	<h3 style="color:red">Invalid Session</h3>
	<hr>
	<a href="userdashboard.jsp"><h4>Login Now</h4></a>
	
<%
}
%>

</body>
</html>