<?php

    session_start();

    include("../classes/classes_connect.php");
    include("../classes/classes_login.php");

    $email = "";
    $password = "";

    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
            
        $login = new Login();
            
        $result = $login->evaluate($_POST);
            
        if($result != "")
        {
            echo "<div style='text-align:center;font-size:12px;color:white;background-color:grey;'>";
            echo "<br>The following errors occured:<br><br>";
            echo $result;
            echo "</div>";
        }else
        {

            header("Location: profile.php");
            die;
        }
            
        $email = $_POST['email'];
        $password = $_POST['password'];
    }   

?>

<!DOCTYPE html>
<html>
    <head>
        <meta name="vieport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styles/login.css" />

        <title>Self-Express | Log In</title>
    </head>
    <body style="background-color: #1C2125;">
        <!--Home Section-->
        <section id="home">
                <div id="login_home" style="">
                    <form method="post">
                        <h2 style="color:black; font-size:30px">Login to</h2>
                        <h2 style="color:red; font-size:40px;"><strong>SELF-EXPRESS</strong></h2><br><br>
                        
                        <input name="email" value="<?php echo $email ?>" type="text" id="text" placeholder="Email"><br><br>
                        <input name="password" value="<?php echo $password ?>" type="password" id="text" placeholder="Password"><br><br>
                        <input type="submit" id="button" value="Log In"><br><br>
                        <p id="signup_href"><a href="signup.php">Dont have an account yet? Sign up now</a></p>
                    <form>
                </div>
        </section>

    </body>

</html>
