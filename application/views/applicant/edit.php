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
                        <li class="breadcrumb-item active">Edit Details</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <form method="post">
                <div class="row clearfix body">
                    <div class="col-md-12">
                        <?php $this->load->view("err-inc/msg") ?>
                    </div>
                    <div class="col-md-12">
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php $this->load->view("applicant/inc/footer") ?>