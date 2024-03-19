package DAL;

import Model.Question;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO extends DBContext {

    public QuestionDAO() {
        super();
    }

    public List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT * FROM Question";
        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Question question = mapResultSetToQuestion(rs);
                questions.add(question);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return questions;
    }

    public List<Question> getQuestionsByTestId(int testId) {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT * FROM Question WHERE testId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, testId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Question question = mapResultSetToQuestion(rs);
                    questions.add(question);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return questions;
    }

    public boolean addQuestion(Question question) {
        String query = "INSERT INTO Question (testId, question, answer, correct_answer) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, question.getTestId());
            ps.setString(2, question.getQuestion());
            ps.setString(3, question.getAnswer());
            ps.setString(4, question.getCorrectAnswer());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deleteQuestion(int questionId) {
        String query = "DELETE FROM Question WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, questionId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public boolean updateQuestion(Question question) {
        String query = "UPDATE Question SET testId = ?, question = ?, answer = ?, correct_answer = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, question.getTestId());
            ps.setString(2, question.getQuestion());
            ps.setString(3, question.getAnswer());
            ps.setString(4, question.getCorrectAnswer());
            ps.setInt(5, question.getId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private Question mapResultSetToQuestion(ResultSet rs) throws SQLException {
        Question question = new Question();
        question.setId(rs.getInt("id"));
        question.setTestId(rs.getInt("testId"));
        question.setQuestion(rs.getString("question"));
        question.setAnswer(rs.getString("answer"));
        question.setCorrectAnswer(rs.getString("correct_answer"));
        return question;
    }
}
