<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="<?= base_url("assets/images/banner/aboutUs-banner.jpg") ?>" alt=""></div>
    <div class="page-title">
        <div class="container">
            <h1>Core Values</h1>
        </div>
    </div>
</section>
<section class="breadcrumb">
    <div class="container">
        <ul>
            <li><a href="<?= base_url() ?>">Home</a></li>
            <li><a href="<?= base_url("about") ?>">About Us</a></li>
            <li><a>Core Values</a></li>
        </ul>
    </div>
</section>
<section class="about-page">
    <section class="about-students">
        <div class="container">
            <div class="section-title">
                <h2>Our Core Values</h2>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-trophy"></i>
                        <h4>Honesty</h4>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-pencil"></i>
                        <h4>Hardwork</h4>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-book"></i>
                        <h4>Dilligence</h4>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-graduation-cap"></i>
                        <h4>Excellence</h4>
                    </div>
                </div>

            </div>
        </div>
    </section>
</section>
<?php $this->load->view("home/inc/footer") ?>