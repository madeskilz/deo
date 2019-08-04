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
            <form class="form-horizontal col-md-12 row" enctype="multipart/form-data" method="post" accept-charset="utf-8">
                <div class="clearfix body">
                    <div class="col-md-12" id="msgBox">
                        <?php $this->load->view("err-inc/msg") ?>
                    </div>
                    <div class="row">
                        <div class="col-md-6 row">
                            <h4 class="col-md-12" style="font-weight:600;">Jamb Information</h4>
                            <div class="form-group col-md-12">
                                <label>Registration Number</label>
                                <input type="text" value="<?= $details->jamb_reg_no ?>" class="form-control" placeholder="Registeration Number" name="jamb_reg_no" required>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Score</label>
                                <input type="text" value="<?= $details->jamb_score ?>" class="form-control" placeholder="Score" name="jamb_score" required>
                            </div>
                        </div>
                        <div class="col-md-6 pull-right text-center">
                            <?php if ($details->image) : ?>
                                <img src="<?= base_url("sitefiles/applicants/images/$details->image") ?>" id="passport" style="width:150px;" />
                            <?php else : ?>
                                <img src="<?= base_url("sitefiles/applicants/images/user-blank.png") ?>" id="passport" style="width:150px;" />
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="col-md-4" style="font-weight:600;">Academic Information</h4>

                    </div>
                    <div class="row">
                        <div class="col-md-8 row">
                            <div class="form-group col-md-4">
                                <label>Programme</label>
                                <select class="form-control" required id="program" name="program" >
                                    <option value="">Select</option>
                                    <?php foreach ($programs as $program) : ?>
                                        <option value="<?= $program->id ?>"><?= $program->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label>School</label>
                                <select class="form-control" name="school" id="school" required>
                                    <option value="">Select</option>
                                    <?php foreach ($schools as $school) : ?>
                                        <option value="<?= $school->id ?>"><?= $school->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Department</label>
                                <select class="form-control" name="department" id="department" required>
                                    <option value="">Select</option>
                                </select>
                                <small style="color:#f34;" id="dept_err">Select Program & School First</small>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Passport</label><br />
                            <input name="image" type="file" placeholder="Upload File" accept="image/*" onchange="loadname(this,'passport', 25000)" id="image" required><br />
                            <small style="color:#f34;" id="image_err">max size: 25kb; format: .png, .jpg, .jpeg, .gif</small>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="col-md-12" style="font-weight:600;">Personal Information</h4>
                        <div class="form-group col-md-6">
                            <label>Title</label>
                            <select class="form-control" name="title" required>
                                <option value="">Select</option>
                                <option value="Mr.">Mr.</option>
                                <option value="Mrs.">Mrs.</option>
                                <option value="Ms.">Ms.</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Surname</label>
                            <input type="text" class="form-control" placeholder="Surname" name="lastname" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>First Name</label>
                            <input type="text" class="form-control" placeholder="First Name" name="firstname" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Middle Name</label>
                            <input type="text" class="form-control" placeholder="Middle Name" name="middlename" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Phone Number</label>
                            <input type="text" class="form-control" placeholder="Phone Number" name="phone" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label>Date of Birth</label>
                            <input type="date" placeholder="Date of Birth" name="dateofbirth" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Gender</label>
                            <select class="form-control" name="gender" required>
                                <option value="">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Marital Status</label>
                            <select class="form-control" name="marital_status" required>
                                <option value="">Select</option>
                                <option value="Single">Single</option>
                                <option value="Married">Married</option>
                                <option value="Widowed">Widowed</option>
                                <option value="Divorced">Divorced</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>Address</label>
                            <textarea class="form-control" name="address" required></textarea>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Country of Birth</label>
                            <select class="form-control" name="country" required>
                                <option value="">Select</option>
                                <option value="Nigeria">Nigeria</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>State of Origin</label>
                            <select class="form-control" name="state" id="state" required>
                                <option value="">Select</option>
                                <?php foreach ($states as $state) : ?>
                                    <option value="<?= $state->id ?>"><?= $state->name ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Local Government</label>
                            <select class="form-control" name="lga" id="lga" required>
                                <option value="">Select</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="col-md-12" style="font-weight:600;">Alternative Contact</h4>
                        <div class="form-group col-md-4">
                            <label>Relationship</label>
                            <select class="form-control" name="alt_contact_rel" required>
                                <option value="">Select</option>
                                <option value="Parent">Parent</option>
                                <option value="Guardian">Guardian</option>
                                <option value="Next of kin">Next of kin</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Full Name</label>
                            <input type="text" class="form-control" placeholder="Full Name" name="alt_contact_name" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Phone Number</label>
                            <input type="text" class="form-control" placeholder="Phone Number" name="alt_contact_phone" required>
                        </div>
                    </div>
                    <div class="submit-slide">
                        <button class="btn" id="btnApply">Apply</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php $this->load->view("applicant/inc/footer") ?>