/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.TestDAO;
import Model.Test;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="HomeController", urlPatterns={"/home"})
public class HomeController extends HttpServlet {
    
    private static int countStep = 100;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String countString = request.getParameter("count");
        int count = countString==null ? countStep : Integer.parseInt(countString);
        
//        if (request.getParameter("random") != null) {
//            Post post = new PostDAO().getRandomActivePost();
//            response.sendRedirect("post-detail?id=" + post.getPostID());
//            return;
//        }
        
        List<Test> list = new TestDAO().getAllTestsActive();
        
//        request.setAttribute("listPost", list); 
        request.setAttribute("listPost", countPost(count, list));
        request.setAttribute("count", count);
        request.setAttribute("countStep", countStep);
        request.getRequestDispatcher("home.jsp").forward(request, response);
        
    } 
    
    private List<Test> countPost(int count, List<Test> list) {
        
        List<Test> ans = new ArrayList<>();
        
        for (Test post : list)
            if (count-- > 0)
                ans.add(post);
        
        return ans;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
