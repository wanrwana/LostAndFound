<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = (String) session.getAttribute("user");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String itemId = request.getParameter("itemId");
    String itemName = request.getParameter("itemName");
%>


<!DOCTYPE html>
<html>
<head>

<title>Claim Item</title>

<style>

body{
    font-family:'Segoe UI',Arial;
    background:#f4f6f9;
}

.container{
    width:450px;
    background:white;
    padding:30px;
    margin:60px auto;
    border-radius:12px;
    box-shadow:0 6px 15px rgba(0,0,0,.1);
}

h2{
    text-align:center;
    color:indigo;
}

label{
    font-weight:bold;
    display:block;
    margin-top:15px;
}

input,textarea{
    width:100%;
    padding:10px;
    margin-top:5px;
    border-radius:8px;
    border:1px solid #ccc;
}


button{

    width:100%;
    margin-top:20px;
    padding:12px;
    background:indigo;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;

}

</style>

</head>


<body>


<div class="container">

<h2>Claim Item</h2>


<form action="ClaimServlet"
      method="post"
      enctype="multipart/form-data">


<input type="hidden"
       name="itemId"
       value="<%=itemId%>">


<input type="hidden"
       name="itemName"
       value="<%=itemName%>">


<input type="hidden"
       name="username"
       value="<%=username%>">


<label>Item Name</label>

<input type="text"
       value="<%=itemName%>"
       readonly>



<label>Claim Date</label>

<input type="date"
       name="claimDate"
       required>



<label>Upload Proof</label>

<input type="file"
       name="proofImage"
       accept="image/*">



<label>Proof Description</label>

<textarea name="proofDescription"
          rows="5"
          required></textarea>



<button type="submit">
Submit Claim
</button>


</form>


</div>


</body>
</html>