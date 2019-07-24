<script>
    function loadname(img, previewName) {
            $("#image_err").text("");
        var isIE = (navigator.appName == "Microsoft Internet Explorer");
        var path = img.value;
        var ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();

        if (ext == "gif" || ext == "jpeg" || ext == "jpg" || ext == "png" || ext == "webp") {
            if (isIE) {
                $('#' + previewName).attr('src', path);
            } else {
                if (img.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#' + previewName).attr('src', e.target.result);
                    }
                    reader.readAsDataURL(img.files[0]);
                }
            }

        } else {
            $("#image_err").text("Error Wrong Image Type");
            document.getElementById("image").value = "";
        }
    }
    $("#school,#program").on("change", () => {
            $("#dept_err").show();
        let curVal = $("#school").val();
        let pVal = $("#program").val();
        if (pVal == "" || curVal == "") {
            $('#department').find('option').remove();
            var o = new Option("Select", "");
            $(o).html("Select");
            $("#department").append(o);
            return false;
        }
        $.ajax({
            url: "<?= base_url() ?>" + 'ajax/get_dept',
            method: 'POST',
            data: {
                'sid': curVal,
                'pid': pVal
            },
            success: response => {
                $('#department').find('option').remove();
                var o = new Option("Select", "");
                $(o).html("Select");
                $("#department").append(o);
                response.forEach(dept => {
                    var o = new Option(dept.name, dept.id);
                    $(o).html(dept.name);
                    $("#department").append(o);
                })
                $("#dept_err").hide();
            },
            error: (e) => {
                alert(e)
            }
        })
    })
</script>