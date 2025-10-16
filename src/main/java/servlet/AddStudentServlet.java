package servlet;

import dao.DAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Student;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/add-student-servlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try {
            Student student = new Student(name, email, course);
            DAOImpl dao = new DAOImpl();
            boolean status = dao.addStudent(student);
            if (status) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Student has been successfully added!");
                response.sendRedirect("view-student-servlet");
            }
        } catch (SQLException | ClassNotFoundException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
