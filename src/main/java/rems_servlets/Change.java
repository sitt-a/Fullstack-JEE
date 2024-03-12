package rems_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import rems_beans.DBConnector;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/Change")
public class Change extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Change() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con;
        PreparedStatement pst;
        String id, curps, newps, conps;
        id = request.getParameter("uid");
        curps = request.getParameter("curps");
        newps = request.getParameter("newps");
        conps = request.getParameter("conps");

        if (newps.equals(conps)) {
            try {
                DBConnector dbc = new DBConnector();
                con = dbc.getDbconnection();

                // Retrieve the hashed password from the database
                pst = con.prepareStatement("SELECT password FROM new_table WHERE email = ?");
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    String hashedPassword = rs.getString("password");

                    // Check if the entered current password matches the hashed password in the database
                    if (BCrypt.checkpw(curps, hashedPassword)) {
                        // Hash the new password
                        String hashedNewPassword = BCrypt.hashpw(newps, BCrypt.gensalt());

                        // Update the password in the database
                        pst = con.prepareStatement("UPDATE new_table SET password = ? WHERE email = ?");
                        pst.setString(1, hashedNewPassword);
                        pst.setString(2, id);
                        int cnt = pst.executeUpdate();

                        if (cnt > 0) {
                        	  out.println("<html>");
                        	    out.println("<head>");
                        	    out.println("<style>");
                        	    out.println("body {");
                        	    out.println("  height: 30vh;"); // Set the body height to the viewport height
                        	    out.println("  display: flex;");
                        	    out.println("  justify-content: center;"); // Center horizontally
                        	    out.println("  align-items: center;"); // Center vertically
                        	    out.println("}");
                        	    out.println(".popup {");
                        	    out.println("  background-color: #f2f2f2;");
                        	    out.println("  padding: 20px;");
                        	    out.println("  border: 1px solid #888;");
                        	    out.println("  text-align: center;");
                        	    out.println("  border-radius: 4px;");
                        	    out.println("}");
                        	    out.println("</style>");
                        	    out.println("</head>");
                        	    out.println("<body>");
                        	    out.println("<div class='popup'>");
                        	    out.println("<h2 style='color: green;'>Password Changed Successfully!</h2><hr>");
                        	    out.println("<a href='userdashboard.jsp'><b>Go to User Dashboard</b></a>");
                        	    out.println("</div>");
                        	    out.println("</body>");
                        	    out.println("</html>");
                        } else {
                            out.println("<html><center><h2 style='color: red;'>Failed to update password</h2><hr><a href='changepassword.jsp'><b>Back</b></a></center></html>");
                        }
                    } else {
                        out.println("<html><center><h2 style='color: red;'>Current Password is Incorrect</h2><hr><a href='changepassword1.jsp'><b>Back</b></a></center></html>");
                    }
                } else {
                    out.println("<html><center><h2 style='color: red;'>User not found</h2><hr><a href='changepassword1.jsp'><b>Back</b></a></center></html>");
                }

                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        } else {
            out.println("<html><center><h2 style='color: red;'>New Passwords Mismatched</h2><hr><a href='changepassword1.jsp'><b>Back</b></a></center></html>");
        }
    }
}
