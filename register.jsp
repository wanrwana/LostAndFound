<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Security Check: Pastikan user sudah login
    String username = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null || !"student".equalsIgnoreCase(role.trim())) {
        response.sendRedirect("login.jsp");
        return; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Lost: Report Lost Item</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f6f9; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .form-container { background: #fff; padding: 40px; border-radius: 12px; box-shadow: 0px 6px 15px rgba(0,0,0,0.2); width: 500px; }
        h2 { text-align: center; color: #007bff; margin-bottom: 20px; }
        label { display: block; margin-top: 15px; font-weight: bold; color: #333; }
        input, select, textarea { width: 100%; padding: 12px; margin-top: 5px; border: 1px solid #ccc; border-radius: 8px; font-size: 14px; }
        button { width: 100%; margin-top: 20px; padding: 14px; background: #007bff; color: white; border: none; border-radius: 8px; font-size: 16px; cursor: pointer; }
        button:hover { background: #0056b3; }
        .back-link { display: block; text-align: center; margin-top: 15px; color: #666; text-decoration: none; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Report Lost Item</h2>
        <form action="LostItemServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="username" value="<%= username %>">
            
            <label>Item Name :</label>
            <input type="text" name="itemName" required>

            <label>Category :</label>
            <select name="category" required>
                <option value="">-- Select Category --</option>
                <option value="electronics">Electronics</option>
                <option value="documents">Documents</option>
                <option value="clothing">Clothing</option>
                <option value="accessories">Accessories</option>
                <option value="others">Others</option>
            </select>

            <label>Last Seen Location :</label>
            <input type="text" name="location" required>

            <label>Date Lost :</label>
            <input type="date" name="dateLost" required>

            <label>Description :</label>
            <textarea name="description" required></textarea>

            <label>Upload Reference Picture :</label>
            <input type="file" name="image" accept="image/*">
            
            <label>Contact Information :</label>
            <input type="text" name="contact" required>

            <button type="submit">Submit Report</button>
        </form>
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>
</body>
</html>