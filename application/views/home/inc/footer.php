</div>
<!--End content wrapper-->
<!--Begin footer wrapper-->
<div class="footer-wrapper type2">
    <footer class="foooter-container">
        <div class="container">
            <div class="footer-middle">
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12 animated footer-col">
                        <div class="contact-footer">
                            <div class="logo-footer">
                                <a href="homepage-1.html"><img src="images/logo-footer.png" alt=""></a>
                            </div>
                            <div class="contact-desc">
                                <p class="text-light">Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare.</p>
                            </div>
                            <div class="contact-phone-email">
                                <span class="contact-phone"><a href="#">+10872229</a> | <a href="#">+10872228 </a> </span>
                                <span class="contact-email"><a href="#">Student@sayidan.edu</a></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-12  col-xs-12 animated footer-col">
                        <div class="links-footer">
                            <div class="row">
                                <div class="col-sm-4 col-xs-12">
                                    <h6 class="heading-bold">DASHBOARD</h6>
                                    <ul class="list-unstyled no-margin">
                                        <li><a href="register-page.html">REGISTER</a></li>
                                        <li><a href="career-opportunity.html">CAREER</a></li>
                                        <li><a href="Student-story.html">STORY</a></li>
                                        <li><a href="Student-directory.html">DIRECTORY</a></li>
                                    </ul>
                                </div>

                                <div class="col-sm-4 col-xs-12">
                                    <h6 class="heading-bold">ABOUT US</h6>
                                    <ul class="list-unstyled no-margin">
                                        <li><a href="event-single.html">EVENTS</a></li>
                                        <li><a href="galery.html">GALLERY</a></li>
                                        <li><a href="homepage-1.html">HOMEPAGE V1</a></li>
                                        <li><a href="homepage-2.html">HOMEPAGE V2</a></li>
                                    </ul>
                                </div>

                                <div class="col-sm-4 col-xs-12">
                                    <h6 class="heading-bold">SUPPORT</h6>
                                    <ul class="list-unstyled no-margin">
                                        <li><a href="job-detail.html">FAQ</a></li>
                                        <li><a href="about-us.html#contacts">CONTACT US</a></li>
                                        <li><a href="blog.html">ORGANIZER</a></li>
                                        <li><a href="blog-single-fullwith.html">SOCIAL</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12 animated footer-col">
                        <div class="links-social">
                            <div class="login-dashboard">
                                <a href="login-page.html" class="bg-color-theme text-center text-regular">Login Dashboard</a>
                            </div>
                            <ul class="list-inline text-center">
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom text-center">
                <p class="copyright text-light">&copy; <?= date("Y")?> Student Association of the Deo Gratias Polytechnic</p>
            </div>
        </div>
    </footer>
</div>
<!--End footer wrapper-->
</div>

<script src="<?=base_url("/assets/js/libs/jquery-2.2.4.min.js")?>"></script>
<script src="<?=base_url("/assets/js/libs/bootstrap.min.js")?>"></script>
<script src="<?=base_url("/assets/js/libs/owl.carousel.min.js")?>"></script>
<script src="<?=base_url("/assets/js/libs/jquery.meanmenu.js")?>"></script>
<script src="<?=base_url("/assets/js/libs/jquery.syotimer.js")?>"></script>
<script src="<?=base_url("/assets/js/libs/parallax.min.js")?>"></script>
<script src="<?=base_url("/assets/js/libs/jquery.waypoints.min.js")?>"></script>
<script src="<?=base_url("/assets/js/custom/main.js")?>"></script>
<script>
    jQuery(document).ready(function() {
        $('#time').syotimer({
            year: 2019,
            month: 12,
            day: 7,
            hour: 7,
            minute: 7,
        });
    });
</script>
</body>
</html>