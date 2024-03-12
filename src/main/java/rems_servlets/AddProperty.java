package rems_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import rems_beans.DBConnector;

/**
 * Servlet implementation class AddProperty
 */
@WebServlet("/AddPropertyServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddProperty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProperty() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part imagePart = request.getPart("image");
        String fileName = imagePart.getSubmittedFileName();
        Part imagePart1 = request.getPart("image1");
        String fileName1 = imagePart1.getSubmittedFileName();
        Part imagePart2 = request.getPart("image2");
        String fileName2 = imagePart2.getSubmittedFileName();
        String saveDirectory = "images/";
        String imagePath = saveDirectory + fileName;
        String imagePath1 = saveDirectory + fileName1;
        String imagePath2 = saveDirectory + fileName2;
        String location = request.getParameter("loc");

        String descr = request.getParameter("des");
        String pribr = request.getParameter("pri");
        String bookamt = request.getParameter("boo");
        String lotarea = request.getParameter("lot");
        String bed = request.getParameter("bed");
        String bath = request.getParameter("bat");
        String kitc = request.getParameter("kit");
        String gara = request.getParameter("gar");
        String age = request.getParameter("age");

        String floor = request.getParameter("flo");
        String yearb = request.getParameter("yea");
        String stories = request.getParameter("sto");
        String roof = request.getParameter("roo");
        String premium = request.getParameter("pre");
        String status = request.getParameter("status");
        PrintWriter out = response.getWriter();
        Connection con;
        PreparedStatement pst;

        try {
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();

            pst = con.prepareStatement("INSERT INTO properties(location,descr,pribr,bookamt,lotarea,bed,bath,kitc,gara,age,floor,yearb,stories,roof,premium,status,image,image1,image2) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
            pst.setString(1, location);
            pst.setString(2, descr);
            pst.setString(3, pribr);
            pst.setString(4, bookamt);
            pst.setString(5, lotarea);
            pst.setString(6, bed);
            pst.setString(7, bath);
            pst.setString(8, kitc);
            pst.setString(9, gara);
            pst.setString(10, age);
            pst.setString(11, floor);
            pst.setString(12, yearb);
            pst.setString(13, stories);
            pst.setString(14, roof);
            pst.setString(15, premium);
            pst.setString(16, status);
            pst.setString(17, imagePath);

            pst.setString(18, imagePath1);
            pst.setString(19, imagePath2);
            int count = pst.executeUpdate();
            
            if (count == 1) {
                out.println("<html>");
                out.println("<head>");
                out.println("<style>");
                out.println(".popup-message {");
                out.println("    position: fixed;");
                out.println("    top: 30%;");
                out.println("    left: 50%;");
                out.println("    transform: translate(-50%, -50%);");
                out.println("    background-color: #f2f2f2;");
                out.println("    padding: 20px;");
                out.println("    border: 1px solid #ccc;");
                out.println("    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);");
                out.println("    text-align: center;");
                out.println("}");
                out.println("</style>");
                out.println("<script>");
                out.println("setTimeout(function(){ window.location.href = 'adminpanel.jsp'; }, 4000);");
                out.println("</script>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='popup-message'>");
                out.println("<h2 style='color: green'>Property Registration Successfully Completed!</h2>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
}