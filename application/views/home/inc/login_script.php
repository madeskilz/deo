<script>
    $("#loginForm").on("submit", (e) => {
        e.preventDefault();
        $("#btnLogin").attr("disabled", "disabled");
        $("#btnLogin").html("<i class='fa fa-spinner fa-spin'></i> Logging In");
        $email = $("#email").val();
        $password = $("#password").val();
        $.ajax({
            url: "<?= base_url() ?>" + 'ajax/login/',
            method: "POST",
            data: {
                'password': $password,
                'email': $email
            },
            success: function(response) {
                if (response.status === 'error') {
                    errorMessage = "";
                    errorMessage += '<div class="alert text-center alert-danger">';
                    errorMessage += response.message;
                    errorMessage += '</div>';
                    $("#errorDiv").html(errorMessage);
                    console.log(response.message);
                    $("#btnLogin").removeAttr("disabled");
                    $("#btnLogin").html("Log In");
                    return false;
                }else{
                    window.location.reload();
                }
            },
            error: function(response) {
                errorMessage = "";
                errorMessage += '<div class="alert text-center alert-danger">';
                errorMessage += response.responseText;
                errorMessage += '</div>';
                $("#errorDiv").html(errorMessage);
                $("#btnLogin").removeAttr("disabled");
                console.log(response.responseText);
                return false;
            }
        });
    });
</script>