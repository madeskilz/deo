<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="<?= base_url("assets/images/banner/aboutUs-banner.jpg") ?>" alt=""></div>
    <div class="page-title">
        <div class="container">
            <h1>Prospects</h1>
        </div>
    </div>
</section>
<section class="breadcrumb">
    <div class="container">
        <ul>
            <li><a href="<?= base_url() ?>">Home</a></li>
            <li><a href="<?= base_url("about") ?>">About Us</a></li>
            <li><a>Prospects</a></li>
        </ul>
    </div>
</section>
<section class="about-page">
    <section class="about-goals">
        <div class="container">
            <div class="section-title">
                <h2>Prospects and objectives of Academy venture</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, </p>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <img src="<?= base_url("assets/images/about-img2.png") ?>" alt="">
                </div>
                <div class="col-sm-6">
                    <ul class="goals-point">
                        <li>There are many variations of passages of Lorem Ipsum available many variations of passages of Lorem Ipsum available</li>
                        <li>If you are going to use a passage of Lorem Ipsum, you</li>
                        <li>All the Lorem Ipsum generators on the Internet many variations of passages of Lorem Ipsum available</li>
                        <li>There are many variations of passages of Lorem Ipsum available</li>
                        <li>If you are going to use a passage of Lorem Ipsum, you many variations of passages of Lorem Ipsum available</li>
                        <li>All the Lorem Ipsum generators on the Internet</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</section>
<?php $this->load->view("home/inc/footer") ?>