<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.user.dao.ReportDAO" %>
<%@page import="com.user.model.Report" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage All Reports</title>
     <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f6f9; margin: 0; padding: 0; }
        header { background: indigo; color: white; padding: 25px; text-align: center; position: relative; }
        header h1 { margin: 0; font-size: 28px; }
        
        .back-btn {
            position: absolute;
            left: 25px;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: rgba(255,255,255,0.2);
            padding: 8px 15px;
            border-radius: 6px;
            transition: background 0.3s;
        }
        .back-btn:hover { background: rgba(255,255,255,0.4); }
        
        .container { max-width: 1200px; margin: 40px auto; background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0px 6px 15px rgba(0,0,0,0.1); }
        h2 { color: indigo; text-align: center; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        th { background: indigo; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        
        .action-btn { padding: 6px 12px; margin: 2px; border: none; border-radius: 6px; cursor: pointer; font-size: 13px; font-weight: bold; text-decoration: none; display: inline-block; }
        .view-btn { background: #007bff; color: white; }
        .archive-btn { background: #ffc107; color: black; }
        .delete-btn { background: #dc3545; color: white; }
        
        .status { font-weight: bold; }
        .status-pending { color: #ffc107; }
        .search-bar { text-align: right; margin-bottom: 15px; }
        .search-bar input { padding: 8px; border-radius: 6px; border: 1px solid #ccc; }
        .search-bar button { padding: 8px 12px; background: indigo; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: bold; }
    </style>
</head>
<body>

<header>
    <a href="admin_dashboard.html" class="back-btn">← Back to Dashboard</a>
    <h1>Manage All Reports</h1>
</header>
    
    <div class="container">
    <h2>Lost & Found Reports</h2>

    <div class="search-bar">
        <input type="text" placeholder="Search by item...">
        <button>Search</button>
    </div>

    <table>
    <thead>
        <tr>
            <th>Report ID</th>
            <th>Item Name</th>
            <th>Location</th>
            <th>Date Reported</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            ReportDAO dao = new ReportDAO();
            for(Report r : dao.getAllReports()) {
        %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getItemName() %></td>
            <td><%= r.getLocation() %></td>
            <td><%= r.getDateLost() %></td>
            <td class="status status-pending"><%= r.getStatus() %></td>
            <td>
                <a href="ViewVerificationServlet?action=view&id=<%= r.getId() %>" class="action-btn view-btn">View</a>
                <a href="ViewReportServlet?action=archive&id=<%= r.getId() %>" class="action-btn archive-btn">Archive</a>
                <form action="ViewReportServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= r.getId() %>">
                    <button type="submit" class="action-btn delete-btn" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
</div>

</body>
</html>