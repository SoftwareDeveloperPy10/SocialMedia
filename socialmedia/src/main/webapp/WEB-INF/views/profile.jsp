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

    <link rel="stylesheet" href="css/profile.css" />

    <title> USERNAME | PROFİLE  </title>
</head>

<body>

    <!-- HEADER -->


    <!-- MAİN CONTENT   -->

    <div class="container-fluid">

        <div class="row">

            <!-- LEFT SİDEBAR -->
            <div class="col-md-3 border border-danger text-center">

                <img src="images/michel.jpg" class="img-fluid rounded img-thumbnail mt-4"
                    id="profile-img" alt="uyser profile" title="profile image" />

                <h4 class="mt-3"> USERNAME </h4>


                <!-- ACCORDİON MENU -->
                <div id="accordion">

                    <button class="btn btn-secondary" data-toggle="collapse" data-target="#info" aria-expanded="true"
                        aria-controls="collapseOne">
                        My İnfo <i class="fas fa-info-circle ml-1 fa-1x"></i>
                    </button>


                    <div id="info" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">

                        <ul class="profile-list">
                            <li class="profile-list-item text-center">
                                <button class="btn btn-link mr-4 mt-1" id="edit"> Edit <i
                                        class="fas fa-user-edit ml-1 fa-1x"></i> </button>
                            </li>

                            <li class="profile-list-item text-center">
                                <button class="btn btn-link mr-4 mt-1" id="deleteac"> Delete This Account <i
                                        class="fas fa-user-minus ml-1 fa-1x"></i> </button>
                            </li>
                        </ul>

                    </div>

                    <br />

                    <button class="btn btn-secondary mt-3 mb-3" data-toggle="collapse" data-target="#posts"
                        aria-expanded="true" aria-controls="collapseOne">
                        Posts <i class="fas fa-photo-video"></i>
                    </button>


                    <div id="posts" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">

                        <ul class="profile-list">
                            <li class="profile-list-item text-center">
                                <button class="btn btn-link mr-4 mt-1" id="addpost"> Add Post <i
                                        class="fas fa-plus-square fa-1x ml-1"></i> </button>
                            </li>

                            <li class="profile-list-item text-center">
                                <button class="btn btn-link mr-4 mt-1" id="updatepost"> Update Post <i
                                        class="fas fa-edit fa-1x ml-1"></i> </button>
                            </li>

                            <li class="profile-list-item text-center">
                                <button class="btn btn-link mr-4 mt-1" id="deletepost"> Delete Post <i
                                        class="fas fa-trash-alt fa-1x ml-1"></i> </button>
                            </li>
                        </ul>

                    </div>




                </div>

            </div>



            <!-- CONTENT -->

            <div class="col-md-9 border border-secondary" align="center">

                <div id="content-edit">

                    <div class="d-flex justify-content-around">
                        <label for="username">
                            <input type="radio" id="username" checked name="content-radio" />
                            Username
                        </label>

                        <label for="password">
                            <input type="radio" id="password" name="content-radio" />
                            Password
                        </label>

                        <label for="photo">
                            <input type="radio" id="photo" name="content-radio" />
                            Photo
                        </label>

                    </div>

                    <div id=" edit-content">

                        <div id="edit-content-username" align="center">

                            <form class="m-auto" method="POST" action="/user/changeUsername">

                                <div class="form-group">
                                    <input type="text" name="username" class="mt-4" required="required"
                                        placeholder="username..." />

                                    <br />
                                    <button type="submit" class="mt-3"> Save <i class="fas fa-save ml-1 fa-1x"></i>
                                    </button>
                                </div>

                            </form>


                        </div>

                        <div id="edit-content-password" align="center">

                            <form class="m-auto" method="POST" action="/user/passChange">

                                <div class="form-group">

                                    <input type="password" class="mt-4" name="password" required="required"
                                        placeholder="Password..." />

                                    <br />

                                    <button type="submit" class="mt-3"> Save <i class="fas fa-save ml-1 fa-1x"></i>
                                    </button>

                                </div>

                            </form>

                        </div>


                        <div id="edit-content-photo" align="center">

                            <form class="m-auto" method="POST" action="/user/changePhoto" enctype= "multipart/form-data">

                                <div class="form-group">
                                    <input type="file" name="photo" required="required" />

                                    <br />
                                    <button type="submit" class="mt-3"> Save <i class="fas fa-save ml-1 fa-1x"></i>
                                    </button>

                                </div>

                            </form>

                        </div>

                    </div>


                </div>

                <div id="content-posts" align="center">

                    <h5> ADD POST </h5>

                    <form class="mt-3" method="POST" enctype="multipart/form-data" action="/post/addPost">

                        <div class="form-group">
                            <i class="fas fa-photo-video"></i>
                            <select name="posttype" required="required" class="ml-4">
                               
                      <!--           <option value="<%= PostType.VIDEO %>"> VİDEO </option>  -->
                                <option value="<%= PostType.IMAGE %>"> IMAGE </option>


                            </select>
                        </div>

                        <div class="form-group">
                        <!--  
                            Video: <input type="file" class="d-block" required="required"
                                accept="video/mp4,video/x-m4v,video/*" id="video" />
                            <br />
                           -->
                            İmage: <input type="file" name="posturl" class="d-block" required="required"
                                accept="image/png, image/gif, image/jpeg" id="img" />

                            <br />

                            <input type="text" placeholder="Post content" required="required" name="content" />
                        </div>


                        <button type="submit" class="mb-3"> Release <i class="fas fa-bullhorn ml-1 fa-1x"></i> </button>
                    </form>


                </div>


                <div id="content-post-update" align="center">

                    <h5> Update Post </h5>

                    <input type="search" placeholder="content..." id="search" class="mx-auto rounded mt-3 mb-3" />
                    <div class="table-container">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Image Or Video</th>
                                        <th scope="col">Date</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                	<c:if test="${postList.isEmpty() }">
                                		<div class="alert alert-info">
                                			<strong> There is no any post. </strong>
                                		</div>
                                	</c:if>
                                
                                	<c:forEach items="${postList }" var="post">
                                
                                    <tr>
                                        <th scope="row">${post.getPostid() }</th>
                                        <td> <img src="images/postimages/${post.getPost_url() }"
                                                class="img-fluid rounded" /> </td>
                                        <td> ${post.getPostdate() } </td>
                                        <td> <button type="button" data-toggle="modal" data-target="#modal-${post.getPostid() }">
                                                Review <i class="fas fa-search"></i> </button> </td>

                                        <!-- MODAL -->

                                        <div class="modal fade" id="modal-${post.getPostid() }">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <div class="modal-header">

                                                        <h5 class="modal-title"> ${post.getPost_content() } </h5>
                                                        <button type="button" class="close" data-dismiss="modal">
                                                            <span> &times; </span>
                                                        </button>
                                                    </div>

                                                    <div class="modal-body">

                                                        <form action="/post/updatePost" method="post" enctype="multipart/form-data" >
                                                            <div class="form-group">

                                                                <img src="images/postimages/${post.getPost_url() }"
                                                                    class="img-fluid rounded" />

                                                                <br />
                                                                
                                                                

                                                                <input type="file" class="mt-3" name="photo"
                                                                    required="required"
                                                                    accept="image/png, image/gif, image/jpeg" />

                                                                <br />

																
																<select name="posttype" required="required" class="ml-4">
										                               
										                      <!--           <option value="<%= PostType.VIDEO %>"> VİDEO </option>  -->
										                                <option value="<%= PostType.IMAGE %>"> IMAGE </option>
										
										
										                          </select>
																									

                                                                <input type="text" class="mt-3" name="content"
                                                                    value="postcontent" required="required" />

																<input type="hidden" value="${post.getPostid() }" name="postid" />


                                                            </div>


                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal"> Close </button>
                                                        <button type="submit"> Save Changes </button>
                                                        
                                                    </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    </tr>
                                    
                                    </c:forEach>
                                
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>


                <div id="content-post-delete" align="center">
                    <h5> Delete Post </h5>

                    <input type="search" placeholder="content..." id="search" class="mx-auto rounded mt-3 mb-3" />
                    <div class="table-container">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Image Or Video</th>
                                        <th scope="col">Date</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	
                                	<c:if test="${postList.isEmpty() }">
                                		<div class="alert alert-info">
                                			<strong> There is no post. </strong>
                                		</div>
                                	</c:if>
                                	
                                	<c:forEach items="${postList }" var="post">
                                
                                    <tr>
                                        <th scope="row">${post.getPostid() }</th>
                                        <td> <img src="images/postimages/${post.getPost_url() }"
                                                class="img-fluid rounded" /> </td>
                                        <td> ${post.getPostdate() } </td>
                                        <td> <button type="button" class="btn-del btn-danger" data-id="${post.getPostid() }">
                                                Delete <i class="fas fa-trash-alt"></i> </button> </td>


                                    </tr>
                                   </c:forEach>
                                   
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

            </div>

        </div>

    </div>

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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/profile.js"> </script>
</body>

</html>