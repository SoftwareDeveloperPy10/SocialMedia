<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="css/signup.css" />

    <title> Sign Up </title>
</head>

<body>

    <div class="container-fluid">
    
    
    
        <div id="sign-container" class="text-center">
        
        	<% 
    		if(request.getParameter("serr") != null && request.getParameter("serr").equalsIgnoreCase("1")) {
    			
    		
    	%>
    	<div class="alert alert-warning alert-dismissible fade show mt-4" role="alert">
		
			<strong> Something went wrong!  </strong>
		
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
    	
    	
    	<% } %>

            <h5> SİGN UP </h5>

            <form:form method="POST" action="signUpPost" enctype="multipart/form-data" modelAttribute="user">

                <div class="form-group mt-3">
                    <form:input type="text" path="username" class="mx-auto mt-4 d-block" cssStyle=" text-transform: capitalize;" required="required" placeholder="username*"
                        title="Your username" />
                    <form:input path="useremail" type="email" cssClass="mx-auto mt-4 d-block" required="required"
                        placeholder="example@gmail.com*" title="gmail hesabınız" />

                    <form:password path="user_password"  required="required" class="mx-auto mt-4 d-block"
                        placeholder="Your Password*" />

                </div>

                <div class="form-group mt-3">

                    <input name="userbof" type="date" required="required" class="mx-auto d-block mt-4" />
                    <label for="photo" class="mt-4">
                        Profile Photo
                        <input type="file" name="profilephoto" class="mx-auto  d-block" placeholder="Profile Photo"
                            accept="image/png, image/gif, image/jpeg" id="photo" />
                    </label>
                </div>

                <div align="center" class="mt-4">
                    <button type="submit"> <i class="fas fa-user-plus fa-1x mr-1"></i> Sign Up </button>
                </div>

            </form:form>

        </div>

    </div>





    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>