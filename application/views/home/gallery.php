<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="<?= base_url("assets/images/banner/gallery.jpg") ?>" alt=""></div>
    <div class="page-title">
        <div class="container">
            <h1>Gallery</h1>
        </div>
    </div>
</section>
<section class="breadcrumb ">
    <div class="container">
        <ul>
            <li><a href="<?= base_url() ?>">Home</a></li>
            <li><a href="<?= base_url("about") ?>">About Us</a></li>
            <li><a>Gallery</a></li>
        </ul>
    </div>
</section>
<div class="gallery-view">
    <div class="container">
        <div class="gallery-menu">
            <ul class="gallery-filter">
                <li class="active" data-filter="all">All</li>
                <li data-filter="1">Event</li>
                <li data-filter="2">Student</li>
                <li data-filter="3">Blog</li>
                <li data-filter="4">Course</li>
                <li data-filter="5">New Student</li>
            </ul>
        </div>
        <div class="gallery-grid">
            <div class="row">
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="1, 3">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img1.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img1.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="4, 3">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img2.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img2.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="2, 4">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img3.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img3.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="1, 5">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img4.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img4.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="3, 2, 1">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img5.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img5.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="5, 2">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img6.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img6.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="5, 4">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img7.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img7.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="3, 2">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img8.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img8.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="5, 1">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img9.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img9.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="4, 2">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img10.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img10.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="4, 5">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img11.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img11.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3 col-xs-6 filtr-item" data-category="3, 1">
                    <div class="img">
                        <img src="<?= base_url("assets/images/gallery-img/img12.jpg") ?>" alt="">
                        <div class="hover-thumb">
                            <a href="images/gallery-img/img12.jpg" class="thumb-zoom fancybox" data-fancybox-group="group"><i class="fa fa-search"></i></a>
                            <a href="#"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<?php $this->load->view("home/inc/footer") ?>