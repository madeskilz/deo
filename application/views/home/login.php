<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="images/banner/register-bannerImg.jpg" alt=""></div>
    <div class="page-title">
        <div class="container">
            <h1>Login</h1>
        </div>
    </div>
</section>
<section class="breadcrumb">
    <div class="container">
        <ul>
            <li><a href="<?= base_url() ?>">Home</a></li>
            <li><a>Login</a></li>
        </ul>
    </div>
</section>
<section class="login-view">
    <div class="container">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="section-title">
                    <p>Login</p>
                </div>
                <form method="post">
                    <div class="input-box">
                        <input type="email" placeholder="Email" name="email">
                    </div>
                    <div class="input-box">
                        <input type="password" placeholder="Password" name="password">
                    </div>
                    <div class="check-slide">
                        <label class="label_check" for="checkbox-01"><input id="checkbox-01" type="checkbox"> Remember Me</label>
                        <div class="right-link">
                            <a href="#">Lost Password? </a>
                        </div>
                    </div>
                    <div class="submit-slide">
                        <input type="submit" value="Login" class="btn">
                    </div>
                </form>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
</section>
<?php $this->load->view("home/inc/footer") ?>