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
                        <h4>Integrity</h4>
                        <p>We are committed to the meaningful integration of liberal learning and professional preparation and to learning as a life-long pursuit.</p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-pencil"></i>
                        <h4>Stewardship</h4>
                        <p>We are committed stewards of the human, fiscal, and physical resources entrusted to us.</p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-book"></i>
                        <h4>Professional Lecturers</h4>
                        <p>It is a long established fact that a reader will be distracted by the readable content of a page </p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="box">
                        <i class="fa fa-graduation-cap"></i>
                        <h4>Excellence</h4>
                        <p>We value intellectual freedom, curiosity, and engagement; critical and creative inquiry; to give rise to the best standards</p>
                    </div>
                </div>

            </div>
        </div>
    </section>
</section>
<?php $this->load->view("home/inc/footer") ?>