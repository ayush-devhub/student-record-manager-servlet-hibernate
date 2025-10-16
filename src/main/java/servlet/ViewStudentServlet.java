package servlet;

import dao.DAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/view-student-servlet")
public class ViewStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOImpl dao = new DAOImpl();
        try {
            List<Student> studentsList = dao.getAllStudents();
            request.setAttribute("studentsList", studentsList);
            request.getRequestDispatcher("view-student.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
