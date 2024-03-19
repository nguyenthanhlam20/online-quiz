package Controller;

import DAL.TestDAO;
import Model.Test;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tests")
public class TestController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TestDAO testDAO;

    public void init() {
        testDAO = new TestDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Test> tests = testDAO.getAllTests();
        request.setAttribute("tests", tests);
        request.getRequestDispatcher("/test-list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "delete":
                    deleteTest(request, response);
                    break;
                case "add":
                    addTest(request, response);
                    break;
                case "update":
                    updateTest(request, response);
                    break;
                default:
                    // Invalid action
                    response.sendRedirect(request.getContextPath() + "/tests");
                    break;
            }
        } else {
            // No action specified
            response.sendRedirect(request.getContextPath() + "/tests");
        }
    }

    private void deleteTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int testID = Integer.parseInt(request.getParameter("testID"));
        boolean deleted = testDAO.deleteTest(testID);
        if (deleted) {
            response.sendRedirect(request.getContextPath() + "/tests?success=delete");
        } else {
            response.sendRedirect(request.getContextPath() + "/tests?fail=delete");
        }
    }

    private void addTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve test details from the form
        String title = request.getParameter("title");
        String status = request.getParameter("status");

        // Create a new Test object
        Test newTest = new Test();
        newTest.setTitle(title);
        newTest.setStatus(status);

        // Add the new test to the database
        boolean added = testDAO.addTest(newTest);
        if (added) {
            response.sendRedirect(request.getContextPath() + "/tests?success=add");
        } else {
            response.sendRedirect(request.getContextPath() + "/tests?fail=add");
        }
    }

    private void updateTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve test details from the form
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String status = request.getParameter("status");

        // Create a Test object with updated details
        Test updatedTest = new Test();
        updatedTest.setId(id);
        updatedTest.setTitle(title);
        updatedTest.setStatus(status);

        // Update the test in the database
        boolean updated = testDAO.updateTest(updatedTest);
        if (updated) {
            response.sendRedirect(request.getContextPath() + "/tests?success=update");
        } else {
            response.sendRedirect(request.getContextPath() + "/tests?fail=update");
        }
    }

}
