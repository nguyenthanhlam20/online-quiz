package Controller;

import DAL.QuestionDAO;
import DAL.TestDAO;
import DAL.UserTestDAO;
import Model.Question;
import Model.User;
import Model.UserTest;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "taketest", urlPatterns = {"/take-test"})
public class TakeTestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("test", new TestDAO().getTestByID(id));
        request.setAttribute("questions", new QuestionDAO().getQuestionsByTestId(id));

        request.getRequestDispatcher("take-test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int testId = Integer.parseInt(request.getParameter("testId"));
        User user = (User) request.getSession().getAttribute("user");

        // Get the user's answers from the request parameters
        List<Question> questions = new QuestionDAO().getQuestionsByTestId(testId);
        double score = calculateScore(request, questions);

        // Save the user's test score to the database
        UserTest userTest = new UserTest();
        userTest.setUserId(user.getUserID());
        userTest.setTestId(testId);
        userTest.setScore(score);
        boolean added = new UserTestDAO().addUserTest(userTest);

        if (added) {
            response.sendRedirect(request.getContextPath() + "/take-test?id=" + userTest.getTestId() + "&success=submit&score=" + score);
        } else {
            response.sendRedirect(request.getContextPath() + "/take-test?id=" + userTest.getTestId() + "&fail=submit");
        }
    }

    private double calculateScore(HttpServletRequest request, List<Question> questions) {
        double totalQuestions = questions.size();
        double correctAnswers = 0;

        for (Question question : questions) {
            String[] userAnswers = request.getParameterValues("answers[" + question.getId() + "]");
            String[] correctAnswersArray = question.getCorrectAnswer().split(",");

            // Convert correct answers to a List for easier comparison
            List<String> correctAnswersList = Arrays.asList(correctAnswersArray);

            // Check if all correct answers are selected by the user
            boolean allCorrect = true;
            if (userAnswers != null) {
                for (String userAnswer : userAnswers) {
                    // Check if user's answer matches any correct answer
                    if (!correctAnswersList.contains(userAnswer.trim())) {
                        allCorrect = false;
                        break;
                    }
                }
            } else {
                allCorrect = false; // User did not select any answer
            }

            if (allCorrect) {
                correctAnswers++;
            }
        }

        // Calculate the score
        return (correctAnswers / totalQuestions) * 100;
    }

}
