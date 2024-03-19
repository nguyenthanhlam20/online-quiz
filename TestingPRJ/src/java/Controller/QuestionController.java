package Controller;

import DAL.QuestionDAO;
import Model.Question;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/questions")
public class QuestionController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private QuestionDAO questionDAO;

    public void init() {
        questionDAO = new QuestionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String testIdParam = request.getParameter("id");

        if (testIdParam != null && !testIdParam.isEmpty()) {

            // If testId parameter is provided, list questions by testId
            int testId = Integer.parseInt(testIdParam);
            List<Question> questions = questionDAO.getQuestionsByTestId(testId);
            request.setAttribute("questions", questions);
            request.getRequestDispatcher("/question-list.jsp").forward(request, response);
        } else {

            // If testId parameter is not provided, list all questions
            List<Question> questions = questionDAO.getAllQuestions();
            request.setAttribute("questions", questions);
            request.getRequestDispatcher("/question-list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "delete":
                    deleteQuestion(request, response);
                    break;
                case "add":
                    addQuestion(request, response);
                    break;
                case "update":
                    updateQuestion(request, response);
                    break;
                default:
                    // Invalid action
                    response.sendRedirect(request.getContextPath() + "/questions");
                    break;
            }
        } else {
            // No action specified
            response.sendRedirect(request.getContextPath() + "/questions");
        }
    }

    private void deleteQuestion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int questionID = Integer.parseInt(request.getParameter("questionID"));
        boolean deleted = questionDAO.deleteQuestion(questionID);
        if (deleted) {
            response.sendRedirect(request.getContextPath() + "/questions?idsuccess=delete");
        } else {
            response.sendRedirect(request.getContextPath() + "/questions?fail=delete");
        }
    }

    private void addQuestion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String questionText = request.getParameter("question");
        int testId = Integer.parseInt(request.getParameter("testId"));
        String answer = request.getParameter("answer");
        String correctAnswer = request.getParameter("correctAnswer");

        Question newQuestion = new Question();
        newQuestion.setQuestion(questionText);
        newQuestion.setTestId(testId);
        newQuestion.setAnswer(answer);
        newQuestion.setCorrectAnswer(correctAnswer);

        boolean added = questionDAO.addQuestion(newQuestion);
        if (added) {
            response.sendRedirect(request.getContextPath() + "/questions?id=" + testId + "&success=add");
        } else {
            response.sendRedirect(request.getContextPath() + "/questions?id=" + testId + "&fail=add");
        }
    }

    private void updateQuestion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int questionId = Integer.parseInt(request.getParameter("id"));
        String questionText = request.getParameter("question");
        int testId = Integer.parseInt(request.getParameter("testId"));
        String answer = request.getParameter("answer");
        String correctAnswer = request.getParameter("correctAnswer");

        Question updatedQuestion = new Question();
        updatedQuestion.setId(questionId);
        updatedQuestion.setQuestion(questionText);
        updatedQuestion.setTestId(testId);
        updatedQuestion.setAnswer(answer);
        updatedQuestion.setCorrectAnswer(correctAnswer);

        boolean updated = questionDAO.updateQuestion(updatedQuestion);
        if (updated) {
            response.sendRedirect(request.getContextPath() + "/questions?id=" + testId + "&success=update");
        } else {
            response.sendRedirect(request.getContextPath() + "/questions?id=" + testId + "&fail=update");
        }
    }
}
