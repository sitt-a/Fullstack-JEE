package rems_servlets;

import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import rems_beans.DBConnector;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Check() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emid, ps, ty, name;
        PrintWriter out = response.getWriter();
        name = request.getParameter("usrnm");
        emid = request.getParameter("em");
        ps = request.getParameter("psw");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        try {
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();
            pst = con.prepareStatement("select * from new_table where email=?;");
            pst.setString(1, emid);
            rs = pst.executeQuery();
            if (rs.next()) {
                // Retrieve the hashed password from the database
                String hashedPassword = rs.getString("password");
                ty = rs.getString("Name");
                if (BCrypt.checkpw(ps, hashedPassword)) {
                    HttpSession ses = request.getSession(true);
                    ses.setAttribute("email", emid);
                    ses.setAttribute("name", name);
                    if (ty.equals("Admincase"))
                        response.sendRedirect("adminpanel.jsp");
                    else
                        response.sendRedirect("userdashboard.jsp");
                } else {
                    response.sendRedirect("failure.jsp");
                }
            } else {
                response.sendRedirect("failure.jsp");
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
}