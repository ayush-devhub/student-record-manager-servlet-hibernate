package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utility.HibernateUtil;

@WebServlet("/add-student-servlet")
public class AddStudentServlet extends HttpServlet {

    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            System.out.println("Creating new Student....");
            Student student = new Student(name, email, course);
            session.persist(student);
            transaction.commit();
            sessionFactory.close();
        }
    }
}
