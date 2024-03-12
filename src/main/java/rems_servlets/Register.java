package rems_servlets;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rems_beans.DBConnector;

import javax.servlet.annotation.WebServlet;
import org.mindrot.jbcrypt.BCrypt;

/**
 *  implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nm, emid, ps, mob;
        nm = request.getParameter("usrnm");
        emid = request.getParameter("em");
        mob = request.getParameter("mn");
        ps = request.getParameter("psw");

        PrintWriter out = response.getWriter();
        Connection con;
        PreparedStatement pst;

        try {
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();

            // Check if user already exists
            PreparedStatement checkUser = con.prepareStatement("SELECT * FROM new_table WHERE email = ?");
            checkUser.setString(1, emid);
            ResultSet rs = checkUser.executeQuery();
            if (rs.next()) {
                out.println("<html>");
                out.println("<center>");
                out.println("<h2 style='color:red'>User with this email already exists!</h2><hr>");
                out.println("<a href='login.html'><b>Login</b></a> | <a href='contact.html'><b>Contact Us</b></a>");
                out.println("</center>");
                out.println("</html>");
            } else {
                // Hash the password
                String hashedPassword = BCrypt.hashpw(ps, BCrypt.gensalt());

                // Register the user
                pst = con.prepareStatement("INSERT INTO new_table (name, email, number, password) VALUES (?,?,?,?);");
                pst.setString(1, nm);
                pst.setString(2, emid);
                pst.setString(3, mob);
                pst.setString(4, hashedPassword); // Store the hashed password in the database
                pst.executeUpdate();

                out.println("<html>");
                out.println("<script>");
                out.println("window.onload = function() {");
                out.println("  var successMessage = \"<h2 style='text-align: center; border: 2px solid #ced4da; width: 370px; height: 120px; margin:150px auto; background-color: #f2f2f2; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);'>Registration Successfully Completed!</h2>\";");
                out.println("  var popupContainer = document.createElement('div');");
                out.println("  popupContainer.id = \"successMessageContainer\";");
                out.println("");
                out.println("  var popup = document.createElement('div');");
                out.println("  popup.id = \"successMessage\";");
                out.println("  popup.innerHTML = successMessage;");
                out.println("");
                out.println("  popupContainer.appendChild(popup);");
                out.println("  document.body.appendChild(popupContainer);");
                out.println("");
                out.println("  setTimeout(function() {");
                out.println("    document.body.removeChild(popupContainer);");
                out.println("    window.location.href = 'login.html';");
                out.println("  }, 4000);");
                out.println("};");
                out.println("</script>");
                out.println("</html>");
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
}