<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Lost: Verify Claim</title>

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
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 6px 15px rgba(0,0,0,0.1);
        }

        h2 {
            color: indigo;
            text-align: center;
            margin-bottom: 30px;
        }

        .section-title {
            color: indigo;
            margin-top: 25px;
            margin-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            border: 1px solid #ddd;
            padding: 12px;
        }

        .label {
            width: 30%;
            background: #f8f9fa;
            font-weight: bold;
        }

        textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            box-sizing: border-box;
        }

        .decision-section {
            margin-top: 20px;
        }

        .decision-section label {
            margin-right: 20px;
            font-weight: bold;
        }

        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin: 5px;
            font-size: 14px;
        }

        .approve-btn {
            background: #28a745;
            color: white;
        }

        .reject-btn {
            background: #dc3545;
            color: white;
        }

        .back-btn {
            background: #6c757d;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

    </style>
</head>

<body>

<header>
    <h1>Verify Claim Request</h1>
</header>

<div class="container">

    <h2>Claim Verification Details</h2>

    <!-- ITEM INFORMATION -->
    <div class="section-title">Item Information</div>

    <table>
        <tr>
            <td class="label">Item ID</td>
            <td>I101</td>
        </tr>

        <tr>
            <td class="label">Item Name</td>
            <td>Wallet</td>
        </tr>

        <tr>
            <td class="label">Category</td>
            <td>Personal Belongings</td>
        </tr>

        <tr>
            <td class="label">Location Found</td>
            <td>Cafeteria</td>
        </tr>

        <tr>
            <td class="label">Date Found</td>
            <td>01/06/2026</td>
        </tr>

        <tr>
            <td class="label">Finder Description</td>
            <td>Brown leather wallet with student ID.</td>
        </tr>
    </table>

    <!-- CLAIMANT INFORMATION -->
    <div class="section-title">Claimant Information</div>

    <table>
        <tr>
            <td class="label">Student Name</td>
            <td>Adam</td>
        </tr>

        <tr>
            <td class="label">Student ID</td>
            <td>2024123456</td>
        </tr>

        <tr>
            <td class="label">Phone Number</td>
            <td>012-3456789</td>
        </tr>

        <tr>
            <td class="label">Email</td>
            <td>adam@student.edu.my</td>
        </tr>
    </table>

    <!-- VERIFICATION ANSWERS -->
    <div class="section-title">Verification Answers</div>

    <table>
        <tr>
            <td class="label">Item Colour</td>
            <td>Brown</td>
        </tr>

        <tr>
            <td class="label">Brand</td>
            <td>Bonia</td>
        </tr>

        <tr>
            <td class="label">Description</td>
            <td>Brown leather wallet with student ID.</td>
        </tr>
    </table>

    <!-- ADMIN DECISION -->
    <div class="section-title">Verification Decision</div>

    <div class="decision-section">

        <label>
            <input type="radio" name="decision">
            Approve
        </label>

        <label>
            <input type="radio" name="decision">
            Reject
        </label>

    </div>

    <br>

    <label><strong>Admin Remarks</strong></label>

    <textarea placeholder="Enter remarks here..."></textarea>

    <!-- BUTTONS -->
    <div class="button-group">

        <button class="btn approve-btn">
            Submit Decision
        </button>

        <button class="btn back-btn"
                onclick="location.href='verify_notice.html'">
            Back
        </button>

    </div>

</body>
</html>