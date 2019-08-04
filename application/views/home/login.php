<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="<?=base_url("assets/images/banner/register-bannerImg.jpg")?>" alt=""></div>
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
                <div class="col-md-12 row" id="errorDiv">
                    <?php $this->load->view("err-inc/msg") ?>
                </div>
                <form method="post" id="loginForm">
                    <div class="input-box">
                        <input type="email" placeholder="Email" name="email" id="email" required>
                    </div>
                    <div class="input-box">
                        <input type="password" placeholder="Password" name="password" id="password"  required>
                    </div>
                    <div class="check-slide">
                        <label class="label_check" for="checkbox-01"><input id="checkbox-01" type="checkbox"> Remember Me</label>
                        <div class="right-link">
                            <a href="#">Lost Password? </a>
                        </div>
                    </div>
                    <div class="submit-slide">
                        <button class="btn" id="btnLogin">Login</button>
                    </div>
                </form>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
</section>
<?php $this->load->view("home/inc/footer") ?>