<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta information -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"><!-- Mobile Specific Metas -->

    <!-- Title -->
    <title><?= (isset($title)) ? $title : "Welcome Home" ?> | Deo Gratias Polytechnic, Agbor</title>

    <!-- favicon icon -->
    <link rel="shortcut icon" href="<?= base_url("assets/logo/pp.jpg") ?>">

    <!-- CSS Stylesheet -->
    <link href="<?= base_url("assets/css/bootstrap.css") ?>" rel="stylesheet"><!-- bootstrap css -->
    <link href="<?= base_url("assets/css/owl.carousel.css") ?>" rel="stylesheet"><!-- carousel Slider -->
    <link href="<?= base_url("assets/css/font-awesome.css") ?>" rel="stylesheet"><!-- font awesome -->
    <link href="<?= base_url("assets/css/loader.css") ?>" rel="stylesheet"><!--  loader css -->
    <link href="<?= base_url("assets/css/jquery.selectbox.css") ?>" rel="stylesheet">
    <link href="<?= base_url("assets/css/jquery.fancybox.css") ?>" rel="stylesheet">
    <link href="<?= base_url("assets/css/docs.css") ?>" rel="stylesheet"><!--  template structure css -->

    <link href="https://fonts.googleapis.com/css?family=Arima+Madurai:100,200,300,400,500,700,800,900%7CPT+Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style>
        .logo_d {
            display: flex;
            max-width: 400px;
        }

        @media screen and (min-width:560px) and (max-width:768px) {
            .logo_d {
                display: flex;
                max-width: 200px !important;
            }

            .navbar-header {
                width: 120px !important;
            }
        }

        @media screen and (width:1024px) {
            .logo_d {
                display: flex;
                max-width: 200px !important;
            }

            .poly_name {
                display: none !important;
            }
        }
    </style>
</head>

<body>
    <div class="wapper">
        <div id="loader-wrapper">
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
        </div>
        <div class="quck-nav style2">
            <div class="contact-no"><a href="javascript:;"><i class="fa fa-map-marker"></i>55, Obi Ikechukwu Road, Agbor, Delta State, NG</a></div>
            <div class="contact-no"><a href="tel:+2349019584559"><i class="fa fa-phone"></i>+234 901 958 4559</a></div>
            <div class="contact-no"><a href="#"><i class="fa fa-globe"></i>deogratiaspoly.edu.ng</a></div>
            <div class="quck-right">
                <div class="right-link"><a href="<?=base_url("contact")?>"><i class="fa fa-headphones"></i>Online Support</a></div>
                <div class="right-link"><a href="<?= base_url("login") ?>"><i class="fa  fa-sign-in"></i>Login</a></div>
            </div>
        </div>
        <header id="header" class="style2">
            <nav id="nav-main">
                <div class="navbar navbar-inverse">
                    <div class="navbar-header">
                        <a href="<?= base_url() ?>" class="navbar-brand logo_d">
                            <img src="<?= base_url("assets/logo/pp.jpg") ?>" style='width:50px;height:50px;' alt="">
                            <h2 style="color:#4ea1a7;margin-top:5px;margin-left:10px;font-size:24px;" class="poly_name hidden-sm hidden-xs">Deo Gratias Polytechnic<br/> <span style="color:#f34;font-size:14px;float:right;">...In God we trust</span></h2>
                        </a>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="navbar-collapse collapse" style="float:left;">
                        <ul class="nav navbar-nav" style="margin-left:100px;">
                            <li class="<?= ($active == "home") ? "active" : "" ?>">
                                <a href="<?= base_url() ?>">Home </a>
                            </li>
                            <li class="sub-menu <?= ($active == "about") ? "active" : "" ?>">
                                <a href="<?= base_url("about") ?>">About Us</a>
                                <ul>
                                    <li><a href="<?= base_url("core-values") ?>">Core Values</a></li>
                                    <li><a href="<?= base_url("prospects") ?>">Prospects</a></li>
                                    <li><a href="<?= base_url("committee") ?>">Committee</a></li>
                                    <li><a href="<?= base_url("gallery") ?>">Gallery</a></li>
                                </ul>
                            </li>
                            <li class="sub-menu <?= ($active == "admission" || $active == "application") ? "active" : "" ?>">
                                <a href="#!">Admission</a>
                                <ul>
                                    <li><a href="<?= base_url("admission-requirements") ?>">Requirements</a></li>
<!--                                    <li><a href="--><?//= base_url("admission-nd") ?><!--">National Diploma</a></li>-->
<!--                                    <li><a style="font-size:14px;" href="--><?//= base_url("admission-hnd") ?><!--">Higher National Diploma</a></li>-->
                                    <li><a href="<?= base_url("application-procedure") ?>">Application Procedure</a></li>
                                    <li><a href="<?= base_url("application-form") ?>">Application Form</a></li>
                                    <li><a href="<?= base_url("login") ?>">Login</a></li>
                                </ul>
                            </li>
                            <?php $schools = $this->db->get('schools')->result(); ?>
                            <li class="mega-menu sub-menu <?= ($active == "schools") ? "active" : "" ?>">
                                <a href="#!">Schools</a>
                                <div class="menu-view">
                                    <div class="row">
                                        <?php foreach ($schools as $school) : ?>
                                            <div class="col-sm-4">
                                                <div class="menu-title"><?= $school->name ?></div>
                                                <?php
                                                $this->db->where('school_id', $school->id);
                                                $depts = $this->db->get('departments')->result(); ?>
                                                <ul>
                                                    <?php foreach ($depts as $dept) : ?>
                                                        <li><a href="<?= base_url("prospects") ?>"><?= $dept->name ?></a></li>
                                                    <?php endforeach; ?>
                                                </ul>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </li>
<!--                            <li class="sub-menu --><?//= ($active == "application") ? "active" : "" ?><!--">-->
<!--                                <a href="#">Application</a>-->
<!--                                <ul>-->
<!--                                    <li><a href="--><?//= base_url("application-procedure") ?><!--">Application Procedure</a></li>-->
<!--                                    <li><a href="--><?//= base_url("application-form") ?><!--">Application Form</a></li>-->
<!--                                    <li><a href="--><?//= base_url("login") ?><!--">Login</a></li>-->
<!--                                </ul>-->
<!--                            </li>-->
                            <li class="sub-menu <?= ($active == "students") ? "active" : "" ?>">
                                <a href="#!">Students</a>
                                <ul>
                                    <li><a href="<?= base_url("login") ?>">Returning Student</a></li>
                                    <li><a href="<?= base_url("login") ?>">Prospective Student</a></li>
                                    <li><a href="<?= base_url("login") ?>">Alumni</a></li>
                                </ul>
                            </li>
                            <li class="sub-menu <?= ($active == "media" || $active == "campus") ? "active" : "" ?>">
                                <a href="#!">Media</a>
                                <ul>
                                    <li><a href="<?= base_url("campus-life") ?>">Campus Life</a></li>
                                    <li><a href="<?= base_url("events") ?>">News & Events</a></li>
                                    <li><a href="<?= base_url("rectors-desk") ?>">Rectors Desk</a></li>
                                </ul>
                            </li>
                            <li class="sub-menu <?= ($active == "support") ? "active" : "" ?>">
                                <a href="#!">Support</a>
                                <ul>
                                    <li><a href="<?= base_url("contact") ?>">Contact Us </a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>