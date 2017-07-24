<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0;" />
        <link href="resources/css/reset.css" type="text/css" rel="stylesheet" />
        <link href="resources/css/home.css" type="text/css" rel="stylesheet" />
        <link href="resources/css/input.css" type="text/css" rel="stylesheet" />
        <title>
        	e-Baithak - Login | Register
        </title>
    </head>
    <body>
        <header>
			<div id="wrapper" style="overflow:hidden;">
				<img src="resources/img/logo.png" class="logo"/>
				
				<form action="login" method="post" model="user">
				<div class="login">
					<input type="text" placeholder="Username" name="username" value=""  />
					<input type="password" placeholder="Password" name="password" value="" />
					<input type="submit" value="Login" />
				</div>
				</form>				
			</div>			
						
			<p style="color:red"> ${error} </p>
			<p style="color:white"> ${messge} </p>
			
			<div id="wrapper" class="big" style="max-width:600px;">
				<span class="title">Welcome to e-Baithak</span>
				<div class="paragraph">Real-Time Group Text and Video Communication</div>
			</div>
        </header>
        <form action="register" method="post" model="user" enctype="multipart/form-data">
        <div class="form" style="max-width:400px;">
				<span class="title">sign up</span>
                <div class="group">      
                  <input type="text" name="name" value="" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label>Full Name</label>
                </div>
				
                <div class="group">      
                  <input type="text" name="username" value="" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label>Username</label>
                </div>
				
                <div class="group">      
                  <input type="password" name="password" value="" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label>New Password</label>
                </div>
                
                <div class="group">                   
                  <small>Select Profile Image</small>   
                  <input type="file" name="image" accept="image/*" value="" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                </div>
				<input type="submit" value="Sign Up" />
		</div>
		</form>
		<footer>
		
		</footer>
    </body>
</html>