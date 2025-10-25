package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
// Import Hibernate-related classes
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utility.HibernateUtil; // Assuming you have a HibernateUtil class
import utility.HibernateUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/view-student-servlet") // Recommended to use kebab-case for URL
public class ViewStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Student> studentsList = null;

        // 1. Get the SessionFactory (we assume you have a HibernateUtil class)
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

        // 2. Open a session and use try-with-resources for auto-closing
        try (Session session = sessionFactory.openSession()) {

            // 3. Write an HQL query to get all Student objects
            // Note: We query the *Entity* name, not the table name
            String hql = "FROM Student";

            // 4. Execute the query and get the list
            studentsList = session.createQuery(hql, Student.class).list();

        } catch (Exception e) {
            // Handle exceptions (e.g., log them)
            throw new ServletException("Error retrieving student list from database.", e);
        }

        // 5. Set the list as a request attribute
        request.setAttribute("studentsList", studentsList);

        // 6. Forward to the JSP page
        request.getRequestDispatcher("view-student.jsp").forward(request, response);
    }
}