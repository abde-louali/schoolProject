<?php
session_start();
if (!isset($_SESSION["succes"]["username"])) {
    header("location: loginT.php");
    
}

include "./header.php"; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
 
    <style>
       
        .teacher-info {
            background-color: #f0f0f0;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .teacher-info h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }
        .teacher-info p {
            font-size: 16px;
            color: #666;
        }
    </style>
</head>
<body>
   <div class="container mt-5">
       <h1> Hello, Mr. <?php echo htmlspecialchars($_SESSION["succes"]["username"]); ?></h1>
       
     
       <div class="teacher-info">
           <h2>Your Teacher Dashboard</h2>
           <p>Welcome to your personalized teacher area. Here you can see your students notes , view student progress, and more.</p>
           <p>Explore the menu above to get started.</p>
       </div>
       <div class="mt-3">
           <a href="./logout.php" class="btn btn-danger">Logout</a>
       </div>
   </div>
   
</body>
</html>
