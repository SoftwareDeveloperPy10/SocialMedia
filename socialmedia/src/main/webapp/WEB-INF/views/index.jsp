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

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <link rel="stylesheet" href="css/index.css" />


    <title> Social Media Platform </title>
</head>

<body>


    <!-- HEADER -->
    <div class="container-fluid" id="navbar">
        <nav class="navbar navbar-expand-md">
            <a class="navbar-brand" href="/"> Medyha </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#header">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="header">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/"> Home <i class="fas fa-home fa-1x ml-1"></i> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/posts/discover">
                            Discover <i class="fab fa-cc-discover ml-1 fa-1x"></i>
                        </a>

                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/liveStream">
                            Live Stream <i class="fas fa-satellite-dish fa-1x ml-1"></i>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/aboutUs"> About US </a>
                    </li>

                </ul>

                <div class="dropdown mr-md-5">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Profile
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/profile">My Profile <i
                                class="fas fa-user-circle ml-1 fa-1x"></i> </a>
                        <a class="dropdown-item" href="/logout"> Exit <i class="fas fa-door-open fa-1x ml-1"></i> </a>

                    </div>
                </div>
            </div>

        </nav>
    </div>


    <!-- MAİN CONTENT -->

    <section id="stories" class="mb-5">

        <!-- STORY -->

        <div class="owl-carousel owl-theme">
            <div class="item">

                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story1.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>

            </div>
            <div class="item">
                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story2.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story3.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story1.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story2.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story3.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="story-item">

                    <div class="card" style="width: 9rem;">
                        <img class="card-img-top rounded-circle"
                            src="images/storyimages/story1.jpg" alt="Story 1" title="Story 1">
                        <div class="card-body">
                            <span> USERNAME </span>


                        </div>
                    </div>
                </div>
            </div>

        </div>

    </section>


    <section id="post-contents">
	
		<c:if test="${postList.isEmpty()  }">
	
        <div class="alert alert-info text-center mt-4">
            <strong> SORRY THERE İS NO POST YET.You can try login </strong>
        </div>
		</c:if>
		
        <div class="row" align="center">

            <!-- POST CONTENTS -->
			
			
		
		<c:forEach items="${postList }" var="post">
		
		
			
		            <div class="col-md-6">
		                <div class="card text-white mb-3" style="max-width: 30rem;">
		                    <div class="card-header">
		                        <div class="d-flex justify-content-around">
		                            <img src="images/userimages/${post.getUser().getUser_photo() }" alt="${post.getUser().getUser_photo() }"/>
		
		                            <span> ${post.getUser().getUsername() } </span>
		                        </div>
		                    </div>
		                    <div class="card-body">
		
		                        <img src="images/postimages/${post.getPost_url() }" title="${post.getPost_content() }"
		                            alt="${post.getPost_content() }" />
		
		
		                        <p class="card-text">${post.getPost_content() }</p>
		
		                    </div>
		
		                    <div class="card-footer">
		
		                        <div class="d-flex justify-content-around">
		
		                            <span> <button> <i class="fas fa-thumbs-up"></i> </button> 20 </span>
		                            <span> <button> <i class="fas fa-comments"></i> </button> 20 </span>
		                            <span> 20/10/2021 <i class="fas fa-calendar-alt"></i> </span>
		
		
		                        </div>
		
		                    </div>
		                </div>
		            </div>
		</c:forEach>
		       

        </div>


    </section>


    <!--PAGİNATİON -->
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


    <!-- FOOTER -->

    <footer>

        <div class="container-fluid">

            <div class="row">

                <!-- 3 2 2 2 3 -->

                <div class="col-md-3" align="center">
                    <!-- USER SECTİON -->
                    <h5> USER </h5>
                    <ul>
                        <li>
                            <a href=""> Live Stream <i class="fas fa-satellite-dish fa-1x ml-1"></i> </a>
                        </li>

                        <li>
                            <a href="/user/premium"> Premium Account <i class="fas fa-hand-holding-usd"></i> </a>
                        </li>

                        <li>
                            <a href="/user/forgotPassword"> Forgot Password <i class="fas fa-lock-open fa-1x ml-1"></i>
                            </a>
                        </li>
                    </ul>

                </div>

                <div class="col-md-2" align="center">

                    <h5> FOLLOW US </h5>

                    <ul>
                        <li>
                            <a href="#"> Instagram <i class="fab fa-instagram-square"></i> </a>
                        </li>

                        <li>
                            <a href="#"> Facebook <i class="fab fa-facebook-square"></i> </a>
                        </li>

                        <li>
                            <a href="#"> Youtube <i class="fab fa-youtube"></i> </a>
                        </li>

                    </ul>

                </div>

                <div class="col-md-2" align="center">
                    <h5> OUR TEAM </h5>

                    <ul>
                        <li>
                            <a href="/team/suggestions"> Suggestions </a>
                        </li>

                        <li>
                            <a href="/team/complaints"> Complaints </a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-2" align="center">

                    <img src="../../../resources/static/images/logo.jpg" title="logo" alt="logo" class="d-block" />

                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Language <i class="fas fa-globe"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">English <i class="fas fa-flag-usa"></i></a>
                            <a class="dropdown-item" href="#"> Germany <i class="fas fa-language"></i> </a>

                        </div>
                    </div>

                </div>

                <div class="col-md-3" align="center">

                    <iframe class="mt-3"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6357784.638271051!2d35.17687756959042!3d38.91513047555684!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x152ddd1c404f4641%3A0xe991f30bfc98bdeb!2sAdliye!5e0!3m2!1sen!2str!4v1624350763509!5m2!1sen!2str"
                        width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

                </div>


            </div>

        </div>


    </footer>


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

    <script src="js/owl.carousel.min.js"> </script>

    <script>

        $(function () {

            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                autoplay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 5
                    }
                }
            })

        });

    </script>

</body>

</html>