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

import java.io.IOException;

@WebServlet("/delete-student-servlet")
public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        int id = Integer.parseInt(request.getParameter("id"));

        try (Session session = sessionFactory.openSession()) {

            Transaction tx = session.beginTransaction();            // Get the student object to delete
            Student studentToDelete = session.get(Student.class, id);

            if (studentToDelete != null) {
                session.remove(studentToDelete);
            }

            tx.commit();
            sessionFactory.close();
        }
    }
}
