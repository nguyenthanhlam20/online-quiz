package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.User;
import DAL.UserDAO;
import DAL.UserTestDAO;

@WebServlet(name = "ranking", urlPatterns = {"/ranking"})
public class RankingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("topScore", new UserTestDAO().getTopUsersByHighestAverageScore(5));
        request.setAttribute("topTaken", new UserTestDAO().getTopUsersByTotalTestsTaken(5));
        request.getRequestDispatcher("ranking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
