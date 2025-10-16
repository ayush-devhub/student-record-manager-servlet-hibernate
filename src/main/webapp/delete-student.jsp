<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student</title>
    <style>
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
            width: 100%;
            max-width: 450px;
            text-align: center;
        }
        h1 {
            font-size: 2rem;
            color: #333;
            margin-top: 0;
            margin-bottom: 1rem;
        }
        .warning-text {
            color: #721c24; /* Dark red for text */
            background-color: #f8d7da; /* Light red background */
            border: 1px solid #f5c6cb; /* Red border */
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 2.5rem;
            font-size: 1rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
        }
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="number"]:focus {
            outline: none;
            border-color: #dc3545;
        }
        .submit-btn {
            width: 100%;
            padding: 14px;
            background-color: #dc3545; /* Red for delete */
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 1rem;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #c82333;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Delete a Student Record 🗑️</h1>
    <p class="warning-text">
        <strong>Warning:</strong> This action is permanent and cannot be undone. Please be certain before deleting a record.
    </p>

    <form action="delete-student-servlet" method="post">
        <div class="form-group">
            <label for="id">Student ID to Delete:</label>
            <input type="number" id="id" name="id" required>
        </div>
        <button type="submit" class="submit-btn">Delete Student</button>
    </form>

    <a href="index.jsp" class="back-link">← Back to Menu</a>
</div>

</body>
</html>