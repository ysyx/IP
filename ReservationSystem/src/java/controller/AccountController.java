package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.AccountBean;

public class AccountController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String userPath = request.getServletPath();
        
        if ( userPath.equals("/account/login") || userPath.equals("/account")) {
            HttpSession sess = request.getSession(true);
            if(sess.getAttribute("USERID") != null){
                if(userPath.equals("/account")){
                    response.sendRedirect("home"); 
                }else if(userPath.equals("/account/login")){
                    response.sendRedirect("../home"); 
                }
            }else{
                request.getRequestDispatcher("/WEB-INF/share/login.jsp").forward(request, response);
            }
             
        }if ( userPath.equals("/account/error") ) {
            HttpSession sess = request.getSession(true);
            if(sess.getAttribute("USERID") != null){
                response.sendRedirect("../home"); 
            }else{
                request.getRequestDispatcher("/WEB-INF/share/login_error.jsp").forward(request, response);
            }
             
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String userPath = request.getServletPath();
        String url = "";
        
        if (userPath.equals("/account/verifylogin")) {
            boolean login_status;
            AccountBean account_bean = new AccountBean();
            account_bean.setEmail(request.getParameter("email"));
            account_bean.setPassword(request.getParameter("password"));
            login_status = account_bean.verify_login();
            if(login_status == true){
                HttpSession sess = request.getSession(true);
                sess.setAttribute("USERTYPE", account_bean.getType());
                sess.setAttribute("USERID",account_bean.getPk_id());
                sess.setAttribute("ISLOGIN",true);
                sess.setMaxInactiveInterval(360);
                response.sendRedirect("../home"); 
            }else if(login_status == false){
                response.sendRedirect("../account/error");
            }
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
