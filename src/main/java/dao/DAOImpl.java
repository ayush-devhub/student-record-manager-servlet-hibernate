package dao;

import model.Student;
import utility.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOImpl implements DAO {

    private String ADD_QUERY = "INSERT INTO student(name, email, course) VALUES(?,?,?)";
    private String UPDATE_QUERY = "UPDATE student SET name=?, email=?, course=? WHERE id=?";
    private String DELETE_QUERY = "DELETE FROM student WHERE id=?";
    private String GET_ALL_QUERY = "SELECT * FROM student";


    @Override
    public boolean addStudent(Student student) throws SQLException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(ADD_QUERY);) {
            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getCourse());
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateStudent(Student student) throws SQLException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY);) {
            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getCourse());
            ps.setInt(4, student.getId());
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteStudent(int id) throws SQLException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_QUERY);) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public List<Student> getAllStudents() throws SQLException {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_QUERY);
             ResultSet rs = ps.executeQuery()
        ) {
            List<Student> students = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String course = rs.getString("course");
                Student student = new Student(id, name, email, course);
                students.add(student);
            }
            return students;
        }

    }

}
