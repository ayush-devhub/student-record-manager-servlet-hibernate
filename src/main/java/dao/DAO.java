package dao;

import model.Student;

import java.sql.SQLException;
import java.util.List;

public interface DAO {
    public boolean addStudent(Student student) throws SQLException;
    public boolean updateStudent(Student student) throws SQLException;
    public boolean deleteStudent(int id) throws SQLException;
    public List<Student> getAllStudents() throws SQLException;
}
