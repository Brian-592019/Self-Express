<?php

    include("../classes/classes_connect.php");
    include("../classes/classes_signup.php");

    $first_name = "";
    $last_name = "";
    $gender = "";
    $email = "";
    
    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $signup = new Signup();
        $result = $signup->evaluate($_POST);
        
        if($result != "") 
        {
            echo "<div style='text-align:center;font-size:12px;color:white;background-color:grey;'>";
            echo "<br>The following errors occured:<br>";
            echo $result;;
            echo "</div>";
        }else
        {
            header("Location: login.php");
            die;
        }

        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $gender = $_POST['gender'];
        $email = $_POST['email'];
    }


?>


<!DOCTYPE html>
<html>
    <head>
        <meta name="vieport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styles/signup.css" />

        <title>Self-Express | Sign Up</title>
    </head>
    <body style="background-color: #1C2125;">


        <!--Home Section-->
        <section id="home">

            <div class="home container">
                <div id="signup_home">
                <h2 style="color:black; font-size:30px">Sign Up to</h2>
                        <h2 style="color:red; font-size:40px;"><strong>SELF-EXPRESS</strong></h2><br><br>

                    <form method="post" action="">

                        <input value="<?php echo $first_name ?>" name="first_name" type="text" id="text" placeholder="First name"><br><br>
                        <input value="<?php echo $last_name ?>"name="last_name" type="text" id="text" placeholder="Last name"><br><br>
                        <select name="gender" style="color:#999" id="text">
                              <option value="" disabled selected hidden>Select Gender:</option>
                              <option value="Male">Male</option>
                              <option value="Female">Female</option>
                        </select><br> <br>
                        <input name="email" type="text" id="text" placeholder="Email"><br><br>

                        <input name="password"type="password" id="text" placeholder="Password"><br><br>
                        <input name="password2"type="password" id="text" placeholder="Confirm Password"><br><br>
                        <input type="submit" id="button" value="Sign Up"><br><br>
                        <a style="login_fref" href="login.php">Already have an account? Log in now.</a>

                    </form>
                    
                </div>
            </div>

        </section>
    </body>
</html>