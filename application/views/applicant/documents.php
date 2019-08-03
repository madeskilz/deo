<?php $this->load->view("applicant/inc/header") ?>
<style>
    .sit_name {
        display: none;
    }
</style>
<div id="main-content">
    <div class="container">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-12">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="icon-home"></i></a></li>
                        <li class="breadcrumb-item active">Print Documents</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="row clearfix body">
                <div class="col-md-12">
                    <?php $this->load->view("err-inc/msg") ?>
                </div>
                <?php if ($details->paid_application_fee && $details->uploaded_result && $details->uploaded_birth_cert && $details->confirm_details) : ?>

                <?php else : ?>
                    <h1 style="color:#f34" class="col-md-12">Ensure you fufilled all requirements before proceeding</h1>
                    <h3 style="color:#<?=($details->confirm_details)?"326f37":"f34"?>;" class="col-md-12">Confirmed Details: <span><?= ($details->confirm_details) ? "Yes" : "No" ?></span></h3>
                    <h3 style="color:#<?=($details->uploaded_result)?"326f37":"f34"?>;" class="col-md-12">Uploaded O'Level Result: <span><?= ($details->uploaded_result) ? "Yes" : "No" ?></span></h3>
                    <h3 style="color:#<?=($details->uploaded_birth_cert)?"326f37":"f34"?>;" class="col-md-12">Uploaded Documents: <span><?= ($details->uploaded_birth_cert) ? "Yes" : "No" ?></span></h3>
                    <h3 style="color:#<?=($details->paid_application_fee)?"326f37":"f34"?>;" class="col-md-12">Paid Application Fee: <span><?= ($details->paid_application_fee) ? "Yes" : "No" ?></span></h3>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("applicant/inc/footer") ?>