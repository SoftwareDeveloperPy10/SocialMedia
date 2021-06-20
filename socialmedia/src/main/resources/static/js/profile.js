$(function () {

    $("#content-edit").hide();

    $("#edit-content-photo").hide();

    $("#edit-content-password").hide();

    $("#content-posts").hide();

    $("#content-post-delete").hide();


    $("#content-post-update").hide();

    $("#username").click(function () {

        $("#edit-content-password").hide();

        $("#edit-content-photo").hide();

        $("#edit-content-username").show();

    });

    $("#password").click(function () {

        $("#edit-content-password").show();

        $("#edit-content-photo").hide();

        $("#edit-content-username").hide();

    });

    $("#photo").click(function () {

        $("#edit-content-password").hide();

        $("#edit-content-photo").show();



        $("#edit-content-username").hide();

    });


    $("#edit").click(function () {

        $("#content-edit").show();
        $("#content-posts").hide();
        $("#content-post-delete").hide();

        $("#content-post-update").hide();
    });


    $("#deleteac").click(function () {


        Swal.fire({
            title: "Are you sure about that delete your account?",
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('Deleted!', '', 'success');
            }
        });


    });



    $("#addpost").click(function () {

        $("#content-edit").hide();

        $("#content-posts").show();


        $("#content-post-update").hide();

        $("#content-post-delete").hide();
    });

    $("#updatepost").click(function () {
        $("#content-edit").hide();

        $("#content-post-delete").hide();
        $("#content-posts").hide();

        $("#content-post-update").show();
    });


    $(".btn-del").click(function (e) {

        let dataid = Number(e.target.getAttribute("data-id"));



        Swal.fire({
            title: "Are you sure about that delete this post?",
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {


                $.ajax({

                    type: "POST",
                    contentType: "application/json",
                    url: "/post/postDelete",
                    data: { dataid: dataid },
                    dataType: 'json',
                    success: function (data) {
                        console.log("Response : " + data)

                    }

                });

                Swal.fire('Deleted!', '', 'success');
                location.reload();

            }
        });


    });

    $("#deletepost").click(function () {
        $("#content-edit").hide();

        $("#content-post-delete").show();
        $("#content-posts").hide();

        $("#content-post-update").hide();
    });






});







