<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Lost: Register</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .register-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0px 6px 15px rgba(0,0,0,0.1);
            width: 400px;
            margin: 60px auto;  
            text-align: center;
        }
        h2 {
            margin-top: 0;        
            margin-bottom: 20px;
            color: indigo;
        }
        label {
            display: block;
            text-align: left;
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }
        button {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            background: indigo;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #4b0082;
        }
        .login-link {
            margin-top: 15px;
            font-size: 14px;
        }
        .login-link a {
            color: indigo;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create Account</h2>
        <form action="RegisterServlet" method="post">
            <label for="username">Username :</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
            
            <label for="fullname">Full Name :</label>
            <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>

            <label for="email">Email Address :</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="phoneNumber">Phone Number :</label>
       <input type="tel"
       id="phoneNumber"
       name="phoneNumber"
       placeholder="e.g. 012-3456789"
       required>
       
            <label for="role">User Type :</label>
            <select id="role" name="role" required>
                <option value="">-- Select Type --</option>
                <option value="student">Student</option>
                <option value="admin">Admin</option>
            </select>

            <label for="password">Password :</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <label for="confirmPassword">Confirm Password :</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required>

            <button type="submit">Register</button>
        </form>
        <div class="login-link">
            Already have an account? <a href="index.html">Login here</a>
        </div>
    </div>
</body>
</html>
