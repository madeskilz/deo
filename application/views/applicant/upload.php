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
                        <li class="breadcrumb-item active">Upload Documents</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="row clearfix body">
                <div class="col-md-12">
                    <?php $this->load->view("err-inc/msg") ?>
                </div>
                <div class="col-md-12">
                    <h3 style="color:#<?= ($details->uploaded_birth_cert) ? "326f37" : "f34" ?>;" class="col-md-12">
                        Uploaded Birth Certificate:
                        <span>
                            <?= ($details->uploaded_birth_cert) ? "Yes" : "No" ?>
                        </span>
                        <?php if (!$details->uploaded_birth_cert) : ?>
                            <a style="font-size:18px;" href="<?= base_url("applicant/upload_birth_cert") ?>">Upload Birth Your Certificate Now</a>
                        <?php endif; ?>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("applicant/inc/footer") ?>