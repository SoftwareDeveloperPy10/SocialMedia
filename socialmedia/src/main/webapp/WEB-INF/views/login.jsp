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

    <link rel="stylesheet" href="css/login.css" />

    <title> LOGİN </title>
</head>

<body>

    <div class="container-fluid">
	
		
	
        <div id="login-container" class="text-center">
	
			<%
				if(request.getParameter("serr") != null && request.getParameter("serr").equals("1")){
			%>
			
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
			  
			   <strong> Error encountered while signing up </strong>
			  
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			
			<% } else if( request.getParameter("err") != null && request.getParameter("err").equals("1")){ %>
	
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  
				   <strong> Error encountered while signing in </strong>
				  
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
		
			<% } else if( request.getParameter("succ") != null && request.getParameter("succ").equals("1")) {%>
			<div class="alert alert-success alert-dismissible fade show" role="alert">
			  
			   <strong> You have successfully sign up! </strong>
			  
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			
			<% } %>
			
		
            <h5 class="my-4"> LOGİN </h5>
	
			<%
			String pasCookie= null;
			String userCookie=null;
				if(request.getCookies() != null) {
					Cookie[] cookies = request.getCookies();
					
				for(Cookie c: cookies) {
					
					out.print(c.getName()+" ---> "+c.getValue());
					out.print("<br /> ");
					
					if(c.getName().equals("password")) {
						 pasCookie=c.getValue();
					}
					
					if(c.getName().equals("useremail")) {
						 userCookie= c.getValue();
					}
					
				}
			
				}
			%>
	
            <form:form action="giris" method="post" modelAttribute="user">

                <div class="form-group" align="center">
                
                	<% 
                		if(pasCookie != null && userCookie != null) {
                	%>
                
                    <form:input  path="useremail" type="email" cssClass="input mx-auto mt-3 d-block" required="required" placeholder="example@gmail.com"
                        id="email" 
                        value="<%=userCookie %>"
                         />

                    <form:password  path="user_password"  cssClass="input mx-auto mt-3 d-block" required="required" placeholder="Sifreniz..."
                        id="password" value="<%=pasCookie %>"
                        
                         />
                        <% }else{ %>
                        	<form:input  path="useremail" type="email" cssClass="input mx-auto mt-3 d-block" required="required" placeholder="example@gmail.com"
                        id="email" 
                       
                         />

                    <form:password  path="user_password"  cssClass="input mx-auto mt-3 d-block" required="required" placeholder="Sifreniz..."
                        id="password" />
                        
                        
                        <% } %>

                    <p class="mt-3"> RECAPTCHA </p>

                    <div class="d-flex justify-content-around">

                        <a href="/forgotPassword" class="link"> Forgot Password? </a>
                        <label for="rememberMe">Remember Me
                            <label class="switch">

                                <input type="checkbox" id="rememberMe" checked name="rememberMe" />
                                <span class="slider round"></span>
                            </label>
                        </label>
                    </div>

                    <button type="submit"> <i class="fas fa-sign-out-alt fa-1x mr-1"></i> Giriş Yap </button>


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