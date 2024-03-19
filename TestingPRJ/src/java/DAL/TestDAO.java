package DAL;

import Model.Test;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestDAO extends DBContext {

    public TestDAO() {
        super();
    }

    public List<Test> getAllTests() {
        List<Test> tests = new ArrayList<>();
        String query = "SELECT * FROM Test";
        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Test test = mapResultSetToTest(rs);
                tests.add(test);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tests;
    }
    
    public List<Test> getAllTestsActive() {
        List<Test> tests = new ArrayList<>();
        String query = "SELECT * FROM Test WHERE status = 'Active'";
        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Test test = mapResultSetToTest(rs);
                tests.add(test);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tests;
    }

    public Test getTestByID(int testID) {
        Test test = null;
        String query = "SELECT * FROM Test WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, testID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    test = mapResultSetToTest(rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return test;
    }

    public boolean addTest(Test test) {
        String query = "INSERT INTO Test (title, status) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, test.getTitle());
            ps.setString(2, test.getStatus());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateTest(Test test) {
        String query = "UPDATE Test SET title = ?, status = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, test.getTitle());
            ps.setString(2, test.getStatus());
            ps.setInt(3, test.getId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deleteTest(int testID) {
        String query = "DELETE FROM Test WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, testID);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private Test mapResultSetToTest(ResultSet rs) throws SQLException {
        Test test = new Test();
        test.setId(rs.getInt("id"));
        test.setTitle(rs.getString("title"));
        test.setStatus(rs.getString("status"));
        return test;
    }
}
