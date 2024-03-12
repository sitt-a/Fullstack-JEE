<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Purchase Property Form</title>
    <style>
        body {
            background-color: #F2F2F2;
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        h2 {
            color: black;
        }
        h3, h4 {
            color: red;
        }
        table {
            margin: 0 auto;
            width: 60%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="number"], input[type="submit"], input[type="radio"] {
            padding: 10px;
            margin: 5px 0;
            width: 80%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: #0000FF;
        }
        .radio-label {
            display: flex;
            align-items: center;
            padding:0;
        }
    </style>
</head>
<body>
    <center>
        <h2><b>Purchase Property Form</b></h2>
        <hr>
        
        <br>
        <form name="frm" method="post" action="Purchase">
            <table>
                <tr>
                    <td><b>Your Name</b></td>
                    <td><input type="text" name="nm" placeholder="Enter Your Name" required></td>
                </tr>
                <tr>
                    <td><br><b>Property Name</b></td>
                    <td><br><input type="text" name="pnm" placeholder="Enter Property Name" required></td>
                </tr>
                <tr>
                    <td><br><b>Property Price</b></td>
                    <td><br><input type="text" name="ppr" placeholder="Ex.5.11 Lac/Cr" required></td>
                </tr>
                <tr>
                    <td><br><b>Your Mobile No.</b></td>
                    <td><br><input type="number" name="mob" placeholder="10 Digit Mob.No" required></td>
                </tr>
                <tr>
                    <td><br><b>Your Address & City</b></td>
                    <td><br><input type="text" name="ads" placeholder="Address" required></td>
                </tr>
                <tr>
                    <td><br><b>Token Amount</b></td>
                    <td><br><input type="number" name="amt" placeholder="*To Pay-50000*" required></td>
                </tr>

                <tr>
                    <td><b>Mode</b></td>
                    <td class="radio-label">
                        <input type="radio" name="opt" value="CBE">
                        <b>CBE</b>
                    </td>
                    <td class="radio-label">
                        <input type="radio" name="opt" value="Credit Card">
                        <b>Credit Card</b>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><br><input type="submit" value="Submit"></td>
                </tr>

                <tr>
                    <td></td>
                    <td><br><a href="purchaseproperty.jsp"><b><i>Back</i></b></a></td>
                </tr>

            </table>

        </form>

    </center>

</body>

</html>