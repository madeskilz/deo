<?php $this->load->view("admin/inc/header") ?>
<style>
    .sit_name {
        display: none;
    }

    div#DataTables_Table_0_wrapper>.row:first-child>.col-sm-12:last-child,
    div#DataTables_Table_0_wrapper>.row:last-child>.col-sm-12:last-child ul.pagination {
        text-align: right !important;
        float: right;
    }
</style>
<div id="main-content">
    <div class="container">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-12">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url("applicant") ?>"><i class="icon-home"></i></a></li>
                        <li class="breadcrumb-item active">Applicants Exams</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="row clearfix body">
                <div class="col-md-12">
                    <?php $this->load->view("err-inc/msg") ?>
                </div>
                <?php if (count($applicants) > 0) : ?>
                    <div class="col-md-12 table-responsive" style="margin-top:20px;">
                        <h4>Applicants</h4>
                        <table class="appTable table">
                            <thead>
                                <tr>
                                    <th>S/N</th>
                                    <th>Full Name</th>
                                    <th>Application No</th>
                                    <th>Exam Score</th>
                                    <th>Admission Status</th>
                                    <th>Action | <a href="<?=base_url("admin/application_exam/batch")?>" class="btn btn-info">Batch Update</a></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $cc = 1;
                                    foreach ($applicants as $ap) : ?>
                                    <tr>
                                        <td><?= $cc ?></td>
                                        <td><?= "$ap->lastname $ap->firstname $ap->middlename" ?></td>
                                        <td><?= $ap->admission_no ?></td>
                                        <td><?= getAppExamScore($ap->user_id) ?></td>
                                        <td>
                                            <?php if ($ap->admission_status === "processing") : ?>
                                                <span class="badge badge-warning"><?= $ap->admission_status ?></span>
                                            <?php elseif ($ap->admission_status === "approved") : ?>
                                                <span class="badge badge-success"><?= $ap->admission_status ?></span>
                                            <?php else : ?>
                                                <span class="badge badge-danger"><?= $ap->admission_status ?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <a href="#!">Update Score</a> | <a href="#!">Admission Status</a>
                                        </td>
                                    </tr>
                                <?php $cc++;
                                    endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("admin/inc/footer") ?>
<script>
    $(".appTable").DataTable();
    toastr.options.closeButton = true;
    toastr.options.positionClass = 'toast-top-right';
</script>