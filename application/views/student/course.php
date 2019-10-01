<?php $this->load->view("student/inc/header") ?>
<style>
    .ac{
        list-style: none;
        padding:0;
    }
    .ac-item{
        
    }
</style>
<div id="main-content">
    <div class="container">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-12">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="icon-home"></i></a></li>
                        <li class="breadcrumb-item active">My Courses <?= getStudentLevel($level->current_level) ?></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="row clearfix body">
                <span class="col-md-12">
                    <small style="color:#f34;">
                        Before registering courses online, Confirm with your course adviser in the departmental
                        office on which courses you are to register for your current level
                    </small>
                </span>
                <div class="col-md-3">
                    <ul class="ac">
                        <li><a href="<?=base_url("student/course/register")?>" class="ac-item">Register Courses</a></li>
                        <li><a href="<?=base_url("student/course/update")?>" class="ac-item">Update Course List</a></li>
                        <li><a href="<?=base_url("student/course/print")?>" class="ac-item">Print Exam Clearance</a></li>
</ul>
                </div>
                <div class="col-md-9"></div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("student/inc/footer") ?>