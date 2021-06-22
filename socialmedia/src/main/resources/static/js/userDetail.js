$(function () {

    $("#subscribe").click(function (e) {
        let scribe = Number(e.target.getAttribute("scribe"));

        let account = Number(e.target.getAttribute("account"));

        console.log("Scribe id ", scribe);

        console.log("Account id ", account);


        if (scribe != null && scribe > 0 && account != null && account > 0) {
            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: "/user/doSubscribe",
                data: { scribe, account },
                dataType: 'json',
                success: function (data) {
                    console.log("Response : " + data)

                }

            });
            location.reload();
        }

    });

});