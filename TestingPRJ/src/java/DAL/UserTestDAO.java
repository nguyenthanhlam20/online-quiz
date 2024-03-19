package DAL;

import Model.UserTest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserTestDAO extends DBContext {

    public UserTestDAO() {
        super();
    }

    public List<UserTest> getAllUserTests() {
        List<UserTest> userTests = new ArrayList<>();
        String query = "SELECT * FROM UserTest";
        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UserTest userTest = mapResultSetToUserTest(rs);
                userTests.add(userTest);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return userTests;
    }

    public List<UserTest> getUserTestsByUserId(int userId) {
        List<UserTest> userTests = new ArrayList<>();
        String query = "SELECT * FROM UserTest WHERE userId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    UserTest userTest = mapResultSetToUserTest(rs);
                    userTests.add(userTest);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return userTests;
    }

    public double getAverageScoreByUserId(int userId) {
        String query = "SELECT AVG(score) FROM UserTest WHERE userId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble(1);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0; // Return 0 if no average score found
    }

    public int getTotalTestsTakenByUserId(int userId) {
        String query = "SELECT COUNT(*) FROM UserTest WHERE userId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0; // Return 0 if no tests taken found
    }

    public double getAverageScoreByTestId(int testId) {
        String query = "SELECT AVG(score) FROM UserTest WHERE testId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, testId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble(1);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0; // Return 0 if no average score found
    }

    public int getTotalTestsTakenByTestId(int testId) {
        String query = "SELECT COUNT(*) FROM UserTest WHERE testId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, testId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0; // Return 0 if no tests taken found
    }

    public boolean addUserTest(UserTest userTest) {
        String query = "INSERT INTO UserTest (userId, testId, score, created_at) VALUES (?, ?, ?, GETDATE())";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userTest.getUserId());
            ps.setInt(2, userTest.getTestId());
            ps.setDouble(3, userTest.getScore());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<UserTest> getTopUsersByHighestAverageScore(int limit) {
        List<UserTest> topUsers = new ArrayList<>();
        String query = "SELECT userId, AVG(score) AS avgScore FROM UserTest GROUP BY userId ORDER BY avgScore DESC OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                int id = 1; // Start assigning IDs from 1
                while (rs.next()) {
                    int userId = rs.getInt("userId");
                    double avgScore = rs.getDouble("avgScore");
                    UserTest userTest = new UserTest();
                    userTest.setId(id++); // Assign IDs from 1 to 5
                    userTest.setUserId(userId);
                    userTest.setScore(avgScore);
                    topUsers.add(userTest);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return topUsers;
    }

    public List<UserTest> getTopUsersByTotalTestsTaken(int limit) {
        List<UserTest> topUsers = new ArrayList<>();
        String query = "SELECT userId, COUNT(*) AS totalTests FROM UserTest GROUP BY userId ORDER BY totalTests DESC OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                int id = 1; // Start assigning IDs from 1
                while (rs.next()) {
                    int userId = rs.getInt("userId");
                    int totalTests = rs.getInt("totalTests");
                    UserTest userTest = new UserTest();
                    userTest.setId(id++); // Assign IDs from 1 to 5
                    userTest.setUserId(userId);
                    userTest.setScore(totalTests);
                    topUsers.add(userTest);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return topUsers;
    }

    private UserTest mapResultSetToUserTest(ResultSet rs) throws SQLException {
        UserTest userTest = new UserTest();
        userTest.setId(rs.getInt("id"));
        userTest.setUserId(rs.getInt("userId"));
        userTest.setTestId(rs.getInt("testId"));
        userTest.setScore(rs.getDouble("score"));
        userTest.setCreatedAt(rs.getTimestamp("created_at"));
        return userTest;
    }
}
