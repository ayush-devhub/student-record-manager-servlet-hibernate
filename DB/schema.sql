-- ============================================================
-- Database Schema for Student Records Manager
-- Author: Ayush Baghel
-- Description: Creates database, tables, and inserts sample data
-- ============================================================

-- 1️⃣ Create database (if not exists)
CREATE
DATABASE IF NOT EXISTS student_db;

-- 2️⃣ Use the newly created database
USE
student_db;

-- 3️⃣ Create students table
CREATE TABLE IF NOT EXISTS students
(
    id
    INT
    AUTO_INCREMENT
    PRIMARY
    KEY,
    name
    VARCHAR
(
    100
) NOT NULL,
    email VARCHAR
(
    100
) NOT NULL UNIQUE,
    course VARCHAR
(
    50
) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- 4️⃣ Insert some dummy records for testing
INSERT INTO students (name, email, course)
VALUES ('Ayush Baghel', 'ayush@example.com', 'MCA'),
       ('Riya Sharma', 'riya.sharma@example.com', 'BCA'),
       ('Arjun Mehta', 'arjun.mehta@example.com', 'B.Tech');

-- 5️⃣ Verify data (you can run this manually in MySQL CLI or Workbench)
-- SELECT * FROM students;