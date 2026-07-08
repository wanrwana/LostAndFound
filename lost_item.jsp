<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Lost: Admin Handover Log</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        header {
            background: indigo;
            color: white;
            padding: 25px;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 28px;
        }
        .container {
            max-width: 1200px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 6px 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: indigo;
            text-align: center;
            margin-bottom: 25px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background: indigo;
            color: white;
        }
        tr:nth-child(even) {
            background: #f9f9f9;
        }
        .action-btn {
            padding: 6px 12px;
            margin: 2px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
        }
        .returned-btn {
            background: #28a745;
            color: white;
        }
        .claimed-btn {
            background: #007bff;
            color: white;
        }
        .process-btn {
            background: #ffc107;
            color: black;
        }
        .delete-btn {
            background: #dc3545;
            color: white;
        }
        .status {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <h1>Handover Log</h1>
    </header>

    <div class="container">
        <h2>Item Handover Records</h2>
        <table id="handoverTable">
            <thead>
                <tr>
                    <th>Log ID</th>
                    <th>Item</th>
                    <th>Student</th>
                    <th>Location</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#101</td>
                    <td>Wallet</td>
                    <td>Alyaa</td>
                    <td>Security Office</td>
                    <td>2026-06-01</td>
                    <td class="status">Ready for Collection</td>
                    <td>
                        <button class="action-btn returned-btn">Pending</button>
                    </td>
                </tr>
                <tr>
                    <td>#102</td>
                    <td>Laptop</td>
                    <td>Adam</td>
                    <td>Library</td>
                    <td>2026-06-01</td>
                    <td class="status">Processing</td>
                    <td>
                        <button class="action-btn returned-btn">Pending</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
