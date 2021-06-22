<%@page import="com.proje.socialmedia.app.utils.PostType"%>
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

    <link rel="stylesheet" href="../css/userProfile.css" />


    <title> 
    	<c:if test="${userDetail != null }">
    		${userDetail.getUsername().toUpperCase() }
    	</c:if>
    PROFİLE </title>
</head>

<body>


    <!-- HEADER -->

    <!-- MAİN CONTENT -->
    <div class="container-fluid">
        <!-- MAİN CONTENT HEADER -->
        <div class="row" style="background-color: white;">
            <div class="col-md-6">


                <div class="row profile-header">

                    <!-- PİCTURE , TEXT AND BUTTON -->
                    <div class="col-6 ">
                        <img src="../images/userimages/${userDetail.getUser_photo() }" title="${userDetail.getUsername() }"
                            alt="${userDetail.getUsername() }" />
                    </div>

                    <div class="col-6 text-center" align="center">
                        <h5> ${userDetail.getUsername() } </h5>
                        <%
                        	if(request.getSession().getAttribute("kullaniciid") != null) {
                        %>
                        
                        <c:if test="${!result }">
			    <button type="button" scribe="<%= request.getSession().getAttribute("kullaniciid").toString() %>"
			    account="<%= request.getParameter("id").toString() %>"
			     id="subscribe"> Subscribe <i
			                                class="fas fa-american-sign-language-interpreting fa-1x ml-1"></i> </button>
 						</c:if>
 						
 						<c:if test="${result }">
 
					 		<button type="button" class="btn btn-secondary"> Leave </button>
					 	</c:if>
			                    <% }else { %>
			                    
 						<span class="text-danger" style="text-decoration: underline;font-weight: bolder;"> You have to login to be subscribe </span>
 	
 					<% } %>
                    </div>

                </div>
            </div>




            <div class="col-md-6 account-detail">
                <!-- ACCOUNT DETAİLS -->
                <div class="d-flex justify-content-around align-items-center">
                    <span> <i class="fas fa-images fa-3x d-block"></i> ${userDetail.getPostList().size() } </span>
                    <span> <i class="fas fa-user-plus fa-3x d-block"></i> ${userDetail.getSubscribeList().size() } </span>
                    <span> <i class="fas fa-address-book fa-3x d-block "></i> ${subAccount } </span>
                </div>

            </div>


        </div>


        <!-- İF THERE İS NO CONTENT WE WİLL SHOW THİS SECTİON -->
        <section class="container-fluid" align="center">

            <p id="message"> You cannot see username's posts.Because you have to follow THİS user </p>

        </section>


        <section id="change-view" class="d-flex justify-content-end align-self-end">

            <button type="button"> <i class="fas fa-th-large"></i> </button>
            <button type="button"> <i class="fas fa-arrows-alt"></i> </button>



        </section>


        <section id="user-posts">

            <div class="container-fluid">

                <div class="row">
		
				<c:if test="${userDetail.getPostList().isEmpty() }">
					<div class="alert alert-info">
						<strong> There is no post. </strong>
					</div>
				</c:if>
		
				<c:forEach items="${ userDetail.getPostList()}" var="post">
				
				
	
                    <div class="col-sm-6 col-md-4 mt-3 mx-auto">

                        <!-- CARD İS HERE -->
                        <div class="card mt-3 mx-auto" style="width: 18rem;">
                            <img class="card-img-top" src="../images/postimages/${post.getPost_url() }"
                                alt="Coding post" title="Coding post">
                            <div class="card-body">

                                <div class="d-flex justify-content-between">

                                    <button type="button" id="like"> <i class="far fa-thumbs-up fa-1x ml-1"></i>
                                    </button>

                                    <button type="button" id="comment"> <i class="fas fa-comments fa-1x ml-1"></i>
                                    </button>

                                    <span> ${post.getPostdate().getDate() }/${post.getPostdate().getMonth()}/${ post.getPostdate().getYear()+1900} <i class="far fa-calendar-alt ml-1 fa-1x"></i> </span>

                                </div>

                            </div>
                        </div>

                    </div>
                    
                    </c:forEach>

                 
               

                </div>

            </div>

        </section>

        <section id="pagination">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </section>

    </div>

    <!-- FOOTER -->


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
        
      <script type="text/javascript" src="../js/userDetail.js"></script>
        
        
</body>

</html>