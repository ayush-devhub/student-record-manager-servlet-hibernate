<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Student Records</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 2rem;
            display: flex;
            justify-content: center;
        }
        .container {
            width: 100%;
            max-width: 900px;
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 0;
            margin-bottom: 2rem;
        }
        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }
        .student-table th, .student-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .student-table thead th {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }
        .student-table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .student-table tbody tr:hover {
            background-color: #e9ecef;
        }
        .actions a {
            color: #007bff;
            text-decoration: none;
            margin-right: 15px;
            font-weight: 500;
        }
        .actions a.delete {
            color: #dc3545;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .empty-message {
            text-align: center;
            color: #777;
            padding: 2rem;
            font-size: 1.1rem;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
        }
        .success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        .action-link {
            padding: 10px 18px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        .add-link { background-color: #28a745; }
        .add-link:hover { background-color: #218838; }
    </style>
</head>
<body>

<div class="container">
    <h1>All Student Records 📋</h1>

    <c:if test="${not empty sessionScope.message}">
        <div class="alert success">
                ${sessionScope.message}
        </div>
        <%-- Remove the message from the session after displaying it --%>
        <c:remove var="message" scope="session" />
    </c:if>

    <div class="top-bar">
        <a href="add-student.jsp" class="action-link add-link">Add New Student</a>
        <a href="index.jsp">← Back to Menu</a>
    </div>

    <c:if test="${empty studentsList}">
        <div class="empty-message">No student records found.</div>
    </c:if>

    <c:if test="${not empty studentsList}">
        <table class="student-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${studentsList}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.course}</td>
                    <td class="actions">
                        <a href="edit-student-servlet?id=${student.id}">Edit</a>
                        <a href="delete-student-servlet?id=${student.id}" class="delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

</div>

</body>
</html>