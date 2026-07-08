<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String username = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return; 
    }

    if (role == null || !"admin".equalsIgnoreCase(role.trim())) {
        response.sendRedirect("dashboard.jsp"); 
        return; 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Lost: Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        header {
            background-image: url('img/main_header.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 40px 20px;
            text-align: center;
            background-color: #4b0082; 
        }
        header h1 {
            font-size: 36px;
            margin: 0;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.4);
        }
        .welcome-msg {
            font-size: 16px;
            margin-top: 10px;
            font-weight: 300;
            color: white;
        }

        nav {
            background: indigo;
            padding: 15px 25px;
            display: flex;
            justify-content: center;   
            align-items: center;
            position: relative;         
        }
        .nav-links {
            display: flex;
            justify-content: center;
            gap: 25px;
        }
        .nav-links a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: color 0.3s ease;
        }
        .nav-links a:hover {
            color: #ffd700;
        }

        .search-bar {
            position: absolute;         
            right: 25px;                
            top: 50%;
            transform: translateY(-50%);  
            display: flex;
            gap: 8px;
        }
        .search-bar input {
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
        }
        .search-bar button {
            padding: 10px 16px;
            background: #ffd700;
            color: indigo;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease;
        }
        .search-bar button:hover {
            background: #e6c200;
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 40px;
            box-sizing: border-box;
        }
        .card {
            background: #fff;
            padding: 35px;
            margin: 15px 0;
            border-radius: 12px;
            box-shadow: 0px 6px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 1400px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 26px;
        }
        .stats {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 25px;
        }
        .stat-box {
            background: #e9ecef;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            flex: 1;
            min-width: 200px;
            font-size: 18px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .stat-box:hover {
            background: #d6d8db;
            transform: scale(1.05);
        }
        .stat-box h3 {
            margin-bottom: 15px;
            color: #007bff;
            font-size: 20px;
        }
        .stat-box h4 a {
            display: inline-block;
            text-decoration: none;
            background: #007bff;
            color: #fff;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .stat-box h4 a:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin: Campus Lost & Found Dashboard</h1>
        <div class="welcome-msg">Welcome, <%=username%></div>
    </header>
    
     <nav>
        <div class="nav-links">
            <a href="DashboardServlet">Dashboard</a>
            <a href="ProfileServlet">Profile</a>
            <a href="LogoutServlet">Logout</a>
        </div>
         
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search items...">
            <button onclick="searchItems()">Search</button>
        </div>
    </nav>
    
    <div class="container">
        <div class="card">
            <h2>Overview</h2>
            <div class="stats">
                <div class="stat-box">
                    <h3>Return Rate</h3>
                    <p>${not empty returnRate ? returnRate : 0}% Success</p>
                </div>
                <div class="stat-box">
                    <h3>Most Lost Category</h3>
                    <p>Electronics</p>
                </div>
                <div class="stat-box">
                    <h3>Total Reports</h3>
                    <p>${not empty totalReports ? totalReports : 0} Items</p>
                </div>
            </div>
        </div>

        <div class="card">
            <h2>Quick Actions</h2>
            <div class="stats">
                <div class="stat-box">
                    <h3>Verify Report</h3>
                    <h4><a href="ViewVerificationServlet">Claim Verification</a></h4>
                </div>
                <div class="stat-box">
                    <h3>Manage Report</h3>
                    <h4><a href="ViewReportServlet">Manage Notice</a></h4>
                </div>
                <div class="stat-box">
                    <h3>Handover Logs</h3>
                    <h4><a href="HandoverServlet">Handover Log Status</a></h4>
                </div>
            </div>
        </div>
    </div>
    
    
</body>
</html>