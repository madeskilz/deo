</div>

<!-- Javascript -->
<script src="<?= base_url("inassets/bundles/libscripts.bundle.js") ?>"></script>
<script src="<?= base_url("inassets/bundles/vendorscripts.bundle.js") ?>"></script>

<script src="<?= base_url("inassets/vendor/toastr/toastr.js") ?>"></script>
<script src="<?= base_url("inassets/bundles/chartist.bundle.js") ?>"></script>
<script src="<?= base_url("inassets/bundles/knob.bundle.js") ?>"></script> <!-- Jquery Knob-->

<script src="<?= base_url("inassets/bundles/mainscripts.bundle.js") ?>"></script>
<!-- <script src="<?= base_url("inassets/js/index.js") ?>"></script> -->
<script>
    $("#sittings").on("change", () => {
        let sit = $("#sittings").val();
        if (sit == 1) {
            $("#sit2").hide();
            $(".sit_name").hide();
            $("#sit1").removeClass("col-md-6");
            $("#sit1").addClass("col-md-12");
        } else {
            $("#sit2").show();
            $(".sit_name").show();
            $("#sit1").removeClass("col-md-12");
            $("#sit1").addClass("col-md-6");
        }
    });
</script>
</body>

</html>