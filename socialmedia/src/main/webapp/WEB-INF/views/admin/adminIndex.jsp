<%@page import="com.proje.socialmedia.app.utils.PostType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
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

    <link rel="stylesheet" href="../css/owl.carousel.min.css">

    <link rel="stylesheet" href="../css/owl.theme.default.min.css">



    <link rel="stylesheet" href="../css/adminIndex.css" />

    <title> ADMİN DASHBOARD </title>
</head>

<body>

    <!-- ADMİN HEADER -->
    <header>
        <div class="container-fluid">

            <nav class="navbar navbar-expand-md ">

                <button class="navbar-toggler ml-auto bg-secondary" type="button" data-toggle="collapse"
                    data-target="#header" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="header">

                    <input type="search" class="mx-auto mt-3 mb-3" placeholder="Search post,user" />

                    <div class="dropdown mr-5 mt-3 mb-3">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell"></i>
                            <span id="count">1</span>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>

                    <div class="dropdown mr-5 mt-3 mb-3">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Log out</a>

                        </div>
                    </div>

                </div>
            </nav>



        </div>
    </header>


    <!-- MAIN CONTENT -->

    <main>

        <div class="container-fluid">

            <div class="row">

                <div class="col-sm-4" align="center" id="sidebar">

                    <!-- ADMİN SİDEBAR -->

                    <img src="../../../../resources/static/images/adminimages/admin.jpg" title="admin" alt="admin"
                        class=" rounded-circle" />

                    <h5> NAME SURNAME </h5>

                    <a class="mx-auto" href="/admin/index"> DASHBOARD <i class="fas fa-tools"></i> </a>


                    <div id="accordion-menu">
                        <!-- ACCORDİON MENUS -->

                        <div id="accordion">
                            <button type="button" class="d-block" data-toggle="collapse" data-target="#accounts"
                                aria-expanded="true" aria-controls="collapseOne">
                                Accounts <i class="fas fa-user-circle"></i>
                            </button>

                            <div id="accounts" class="collapse show" aria-labelledby="headingOne"
                                data-parent="#accordion" align="center">

                                <ul>
                                    <li>
                                        <a href="/admin/allAccounts"> All Accounts </a>
                                    </li>

                                    <li>
                                        <a href="/admin/deleteAccount"> Delete Account </a>
                                    </li>

                                </ul>


                            </div>

                            <button type="button" class="d-block" data-toggle="collapse" data-target="#posts"
                                aria-expanded="true" aria-controls="collapseOne">
                                Posts <i class="fas fa-photo-video"></i>
                            </button>

                            <div id="posts" class="collapse " aria-labelledby="headingOne" data-parent="#accordion"
                                align="center">

                                <ul>
                                    <li>
                                        <a href="/admin/allPosts"> All Posts </a>
                                    </li>

                                    <li>
                                        <a href="/admin/deletePost"> Delete Post </a>
                                    </li>

                                </ul>


                            </div>


                            <button type="button" class="d-block" data-toggle="collapse" data-target="#profile"
                                aria-expanded="true" aria-controls="collapseOne">
                                Profile <i class="fas fa-id-badge"></i>
                            </button>

                            <div id="profile" class="collapse " aria-labelledby="headingOne" data-parent="#accordion"
                                align="center">

                                <ul>
                                    <li>
                                        <a href="/admin/allPosts"> Edit </a>
                                    </li>



                                </ul>


                            </div>


                            <button type="button" class="d-block" data-toggle="collapse" data-target="#citeSettings"
                                aria-expanded="true" aria-controls="collapseOne">
                                Cite Settings <i class="fas fa-cogs"></i>
                            </button>

                            <div id="citeSettings" class="collapse " aria-labelledby="headingOne"
                                data-parent="#accordion" align="center">

                                <ul>
                                    <li>
                                        <a href="/admin/header"> Header Settings </a>
                                    </li>

                                    <li>
                                        <a href="/admin/footer"> Footer Settings </a>
                                    </li>


                                </ul>


                            </div>


                        </div>

                    </div>
                </div>


                <div class="col-sm-8" align="center">
                    <!-- SİDEBAR CONTENT -->


                    <div id="last-accounts" align="center">

                        <h5> LAST ACCOUNTS </h5>
                        <div class="table-responsive">
                            <table class="table table-hover table-dark text-center">
                                <thead>
                                    <tr>

                                        <th scope="col">Image</th>
                                        <th scope="col">Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>sddd</td>
                                        <td>@mdo</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>


                    <div id="last-complaint" align="center">

                        <h5> LAST COMPLAİNTS </h5>
                        <div class="table-responsive">
                            <table class="table table-hover table-dark text-center">
                                <thead>
                                    <tr>

                                        <th scope="col">Image</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">COMPLAİNT Header</th>
                                        <th scope="col"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>@mdo</td>
                                        <td> <button type="button"> <i class="fas fa-search"></i></button> </td>

                                    </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>


                    <div id="suggestions">

                        <div class="owl-carousel owl-theme">
                            <div class="item">

                                <div class="story-item">

                                    <div class="card" style="width: 9rem;">
                                        <img class="card-img-top rounded-circle"
                                            src="../images/storyimages/story1.jpg" alt="Story 1"
                                            title="Story 1">
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
                                            src="../../../resources/static/images/storyimages/story2.jpg" alt="Story 1"
                                            title="Story 1">
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
                                            src="../../../../resources/static/images/userimages/jbezos.jpg"
                                            alt="Story 1" title="Story 1">
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
                                            src="../../../../resources/static/images/userimages/jbezos.jpg"
                                            alt="Story 1" title="Story 1">
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
                                            src="../../../../resources/static/images/userimages/jbezos.jpg"
                                            alt="Story 1" title="Story 1">
                                        <div class="card-body">
                                            <span> Suggestion Header </span>

                                            <button type="button" class="btn btn-success"> View</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="story-item">

                                    <div class="card" style="width: 9rem;">
                                        <img class="card-img-top rounded-circle"
                                            src="../../../../resources/static/images/userimages/jbezos.jpg"
                                            alt="Story 1" title="Story 1">
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
                                            src="../../../../resources/static/images/userimages/jbezos.jpg"
                                            alt="Story 1" title="Story 1">
                                        <div class="card-body">
                                            <span> USERNAME </span>


                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>



                </div>


            </div>


        </div>

        </div>

        </div>



    </main>

    <!-- ADMİN FOOTER -->

    <footer class="text-center">

        <span> &copy; Medyha Inc. </span>

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

    <script src="../js/owl.carousel.min.js"> </script>

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