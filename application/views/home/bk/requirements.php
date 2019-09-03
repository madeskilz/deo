<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="<?= base_url("assets/images/banner/quiz.jpg") ?>" alt=""></div>
    <div class="page-title">
        <div class="container">
            <h1>Admission Requirements</h1>
        </div>
    </div>
</section>
<section class="breadcrumb">
    <div class="container">
        <ul>
            <li><a href="<?= base_url() ?>">Home</a></li>
            <li><a>Admission</a></li>
            <li><a>Requirements</a></li>
        </ul>
    </div>
</section>
<section class="container" style="padding-top:10px;padding-bottom:20px;">
    <div class="row">
        <div class="col-md-7 text-justify">
            <h4 style="font-weight:600;">ELIGIBILITY FOR ADMISSION</h4>
            <p>
                Candidates who scored 110 and above in the 2019 UTME can apply whether 
                they chose Deo Gratias Polytechnic or not.
            </p>
            <p>
                Candidates MUST in addition have at least FIVE (5) credit passes in SSCE 
                (WAEC, NECO, NABTEB), GCE O/L of WAEC, NECO, NABTEB or equivalent in relevant subjects including 
                English language and Mathematics in not more than TWO (2) sittings.
            </p>
            <h4 style="font-weight:600;">AVAILABLE PROGRAMMES</h4>
            <ol>
                <li>SHOOL OF GENERAL STUDIES AND LAW <br>ND Paralegal Studies </li>
                <li>SHOOL OF APPLIED SCIENCE <br> ND Computer Science</li>
                <li>SCHOOL OF BUSINESS STUDIES <br> ND Office Technology and Management</li>
            </ol>
        </div>
        <div class="col-md-5">
            <img src="<?=base_url("assets/images/gallery-img/img4.jpg")?>" />
        </div>
    </div>
</section>
<?php $this->load->view("home/inc/footer") ?>