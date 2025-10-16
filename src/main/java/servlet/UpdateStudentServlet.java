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

@WebServlet("/update-student-servlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course  = request.getParameter("course");

        try{
            DAOImpl dao = new DAOImpl();
            if(dao.updateStudent(new Student(id, name, email, course))){
            HttpSession session = request.getSession();
            session.setAttribute("message", "Student updated successfully");
            response.sendRedirect("view-student-servlet");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
