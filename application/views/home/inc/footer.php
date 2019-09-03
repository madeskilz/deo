<footer id="footer" class="style2">
    <div class="footer-top">
        <div class="container">
            <div class="">
                <div class="col-sm-6 col-md-4 row">
                    <div class="footer-logo col-sm-4"><a href="#"><img src="<?= base_url("assets/logo/pp.jpg") ?>" style="width:100px;" alt=""></a></div>
                    <div class="footer-text col-sm-8">
                        <p>Deo Gratias Polytechnic is founded on the principles of the fear of and trust in God, the dream was envisioned several years ago but consumated in 2019 with the approval granted by the Delta State Ministry of Higher Education.</p>
                    </div>
                    <div class="footer-text col-md-12">
                        <div class="read-more">
                            <a href="<?= base_url("about") ?>">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <h5>Shortcuts</h5>
                    <ul class="footer-link">
                        <li><a href="<?= base_url("about") ?>">About Us</a></li>
                        <li><a href="<?= base_url("admission-requirements") ?>">Admission Requirements</a></li>
                        <li><a href="<?= base_url("campus-life") ?>">Campus Life</a></li>
                        <li><a href="<?= base_url("contact") ?>">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-md-4">
                    <h5>Contact Us</h5>
                    <div class="contact-view">
                        <div class="contact-slide">
                            <p><i class="fa fa-location-arrow"></i>55, Obi Ikechukwu Road, Agbor Obi<br />Junction, Agbor, Delta State, Nigeria.</p>
                        </div>
                        <div class="contact-slide">
                            <p><i class="fa fa-phone"></i>+234 901 958 4559</p>
                        </div>
                        <!-- <div class="contact-slide">
                            <p><i class="fa fa-fax"></i>(08) 8971 7450</p>
                        </div> -->
                        <div class="contact-slide">
                            <p><i class="fa fa-envelope"></i><a href="mailto:info@deogratiaspoly.edu.ng">info@deogratiaspoly.edu.ng</a></p>
                        </div>
                        <div class="contact-slide">
                            <a class="btn btn-danger btn-sm" href="http://webmail.deogratiaspoly.edu.ng"><i class="fa fa-envelope-open"></i> Webmail</a></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="copy-right">
                        <p>Copyright © <span class="year">2019</span> Deo Gratias Polytechnic All Rights Reserved</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="social-media">
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-skype"></i></a></li>
                            <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<div class="top-arrow" id="goTop">
    <div class="arrow"><i class="fa fa-angle-up"></i></div>
</div>
</div>
<script type="text/javascript" src="<?= base_url("assets/js/jquery-1.12.4.min.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/bootstrap.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/owl.carousel.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/jquery.form-validator.min.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/jquery.selectbox-0.2.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/placeholder.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/coustem.js") ?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/jquery.fancybox.pack.js")?>"></script>
<script type="text/javascript" src="<?= base_url("assets/js/jquery.filterizr.js")?>"></script>
<?php if($active === "application"):?>
<?php $this->load->view("home/inc/application_script") ?>
<?php endif;?>
<?php if($active === "login"):?>
<?php $this->load->view("home/inc/login_script") ?>
<?php endif;?>
</body>

</html>