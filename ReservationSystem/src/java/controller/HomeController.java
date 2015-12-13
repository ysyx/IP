package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String userPath = request.getServletPath();
        if(userPath.equals("/home")){
            HttpSession sess = request.getSession(true);
            if(sess.getAttribute("USERID") != null){
                if(sess.getAttribute("USERTYPE").equals("1")){
                    request.getRequestDispatcher("/WEB-INF/admin/home.jsp").include(request, response);
                }
            }else{
                response.sendRedirect("account"); 
              
            }
        }
        
        
            
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
