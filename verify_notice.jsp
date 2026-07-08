<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Lost: My Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f4f6f9, #e6e9f0);
            margin: 0;
            padding: 0;
        }
        header {
            background: indigo;
            color: white;
            text-align: center;
            padding: 25px 0;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        header h1 { margin: 0; font-size: 32px; letter-spacing: 1px; }
        nav {
            background: #4b0082;
            padding: 12px;
            text-align: center;
        }
        nav a {
            color: white;
            margin: 0 20px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease;
        }
        nav a:hover { color: #ffd700; }
        .profile-container {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
            animation: fadeIn 1s ease-in-out;
        }
        h2 {
            text-align: center;
            color: indigo;
            margin-bottom: 30px;
            font-size: 26px;
        }
        .profile-info {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 20px;
            align-items: center;
        }
        .label { font-weight: bold; color: #555; font-size: 15px; }
        .value { text-align: left; color: #333; font-size: 15px; }
        .role-badge {
            background: #007bff;
            color: white;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <header><h1>User Profile</h1></header>
    <nav>
        <a href="DashboardServlet">Dashboard</a>
        <a href="ProfileServlet">Profile</a>
        <a href="LogoutServlet">Logout</a>
    </nav>

    <div class="profile-container">
        <h2>My Profile</h2>
        <div class="profile-info">
            <div class="label">Username</div>
            <div class="value">${profileUser.username}</div>

            <div class="label">Full Name</div>
            <div class="value">${profileUser.fullname}</div>

            <div class="label">Email</div>
            <div class="value">${profileUser.email}</div>

            <div class="label">Phone</div>
            <div class="value">${profileUser.phone}</div>

            <div class="label">Role</div>
            <div class="value"><span class="role-badge">${profileUser.role}</span></div>
        </div>
    </div>
</body>
</html>
