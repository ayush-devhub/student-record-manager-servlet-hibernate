<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Record Manager</title>
    <style>
        /* This is embedded CSS. You don't need a separate file. */
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f2f5;
        }
        .container {
            background: #ffffff;
            padding: 2.5rem 3rem;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 450px;
        }
        h1 {
            font-size: 2rem;
            color: #333;
            margin-top: 0;
            margin-bottom: 1rem;
        }
        p {
            color: #666;
            margin-bottom: 2.5rem;
            font-size: 1.1rem;
        }
        .action-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .action-menu li {
            margin-bottom: 1rem;
        }
        .action-menu a {
            display: block;
            padding: 16px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        /* Different colors for different actions */
        .btn-view { background-color: #007bff; }
        .btn-view:hover { background-color: #0056b3; transform: translateY(-2px); }

        .btn-add { background-color: #28a745; }
        .btn-add:hover { background-color: #218838; transform: translateY(-2px); }

        .btn-update { background-color: #ffc107; color: #333; }
        .btn-update:hover { background-color: #e0a800; transform: translateY(-2px); }

        .btn-delete { background-color: #dc3545; }
        .btn-delete:hover { background-color: #c82333; transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="container">
    <h1>Student Record System 🎓</h1>
    <p>Welcome! Please select an action to continue.</p>

    <nav>
        <ul class="action-menu">
            <li><a href="view-student-servlet" class="btn-view">View All Students</a></li>
            <li><a href="add-student.jsp" class="btn-add">Add a New Student</a></li>
            <li><a href="update-student.jsp" class="btn-update">Update a Student</a></li>
            <li><a href="delete-student.jsp" class="btn-delete">Delete a Student</a></li>
        </ul>
    </nav>
</div>

</body>
</html>