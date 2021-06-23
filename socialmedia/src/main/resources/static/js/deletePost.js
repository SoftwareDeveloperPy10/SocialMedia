$(function () {

    $(".btn-delete").click(function (e) {

        let dataid = e.target.getAttribute("data-id");

        if (dataid != null) {

            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: "/admin/deletePost",
                data: { dataid },
                dataType: 'json',
                success: function (data) {
                    console.log("Response : " + data)

                }

            });



            location.reload();

        }

    });

});