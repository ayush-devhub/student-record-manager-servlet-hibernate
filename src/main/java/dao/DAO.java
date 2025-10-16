package dao;

import model.Student;

import java.sql.SQLException;
import java.util.List;

public interface DAO {
    public boolean addStudent(Student student) throws SQLException, ClassNotFoundException;
    public boolean updateStudent(Student student) throws SQLException, ClassNotFoundException;
    public boolean deleteStudent(int id) throws SQLException, ClassNotFoundException;
    public List<Student> getAllStudents() throws SQLException, ClassNotFoundException;
}
