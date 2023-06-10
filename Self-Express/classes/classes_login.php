<?php

class Login
{

	private $error = "";
 
	public function evaluate($data)
	{

		$email = addslashes($data['email']);
		$password = addslashes($data['password']);

		$query = "select * from users where email = '$email' limit 1 ";

		$DB = new Database();
		$result = $DB->read($query);

		if($result)
		{

			$row = $result[0];

			if($this->hash_text($password) == $row['password'])
			{

				//create session data
				$_SESSION['selfexpress_userid'] = $row['userid'];

			}else
			{
				$this->error .= "<script> alert ('Wrong Password entered'); window.location='login.php' </script>";
			}
		}else
		{

			$this->error .= "<script> alert ('Wrong Email entered'); window.location='login.php' </script>";
		}

		return $this->error;
		
	}

	private function hash_text($text){

		$text = hash("sha1", $text);
		return $text;
	}

	public function check_login($id,$redirect = true)
	{
		if(is_numeric($id))
		{

			$query = "select * from users where userid = '$id' limit 1 ";

			$DB = new Database();
			$result = $DB->read($query);

			if($result)
			{

				$user_data = $result[0];
				return $user_data;
			}else
			{
				if($redirect){
					header("Location: login.php");
					die;
				}else{

					$_SESSION['selfexpress_userid'] = 0;
				}
			}
 
			 
		}else
		{
			if($redirect){
				header("Location: login.php");
				die;
			}else{
				$_SESSION['selfexpress_userid'] = 0;
			}
		}

	}
 
}

?>