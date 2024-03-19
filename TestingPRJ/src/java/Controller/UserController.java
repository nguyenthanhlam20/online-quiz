/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.UserDAO;
import Model.User;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/users")
public class UserController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/user-list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "delete":
                    deleteUser(request, response);
                    break;
                case "add":
                    addUser(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                default:
                    // Invalid action
                    response.sendRedirect(request.getContextPath() + "/users");
                    break;
            }
        } else {
            // No action specified
            response.sendRedirect(request.getContextPath() + "/users");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        boolean deleted = userDAO.deleteUser(userID);
        if (deleted) {
            response.sendRedirect(request.getContextPath() + "/users?success=delete");
        } else {
            response.sendRedirect(request.getContextPath() + "/users?fail=delete");
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user details from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Create a new User object
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setUserRole("User");
        newUser.setStatus(true);

        // Add the new user to the database
        boolean added = userDAO.addUser(newUser);
        if (added) {
            response.sendRedirect(request.getContextPath() + "/users?success=add");
        } else {
            response.sendRedirect(request.getContextPath() + "/users?fail=add");
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user details from the form
        int userID = Integer.parseInt(request.getParameter("userID"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role"); // Retrieve role from request parameter
        boolean status = Boolean.parseBoolean(request.getParameter("status")); // Retrieve status from request parameter

        // Create a User object with updated details
        User updatedUser = new User();
        updatedUser.setUserID(userID);
        updatedUser.setUsername(username);
        updatedUser.setPassword(password);
        updatedUser.setEmail(email);
        updatedUser.setUserRole(role); // Set user role
        updatedUser.setStatus(status); // Set user status

        // Update the user in the database
        boolean updated = userDAO.updateUser(updatedUser);
        if (updated) {
            response.sendRedirect(request.getContextPath() + "/users?success=update");
        } else {
            response.sendRedirect(request.getContextPath() + "/users?fail=update");
        }
    }

}
