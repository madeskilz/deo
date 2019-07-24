<?php $this->load->view("home/inc/header") ?>
<section class="banner inner-page">
    <div class="banner-img"><img src="<?= base_url("assets/images/banner/quiz.jpg") ?>" alt=""></div>
    <div class="page-title">
        <div class="container">
            <h1>Application Form</h1>
        </div>
    </div>
</section>
<section class="breadcrumb">
    <div class="container">
        <ul>
            <li><a href="<?= base_url() ?>">Home</a></li>
            <li><a>Application Form</a></li>
        </ul>
    </div>
</section>
<section class="login-view">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-title">
                    <p>Fill this form to continue with application</p><br />
                    <small style="color:#f34;">Note: All fields are required</small>
                </div>
                <form method="post">
                    <div class="row">
                        <h4 class="col-md-4" style="font-weight:600;">Academic Information</h4>
                        <div class="col-md-4 pull-right text-center">
                            <img src="<?= base_url("assets/images/user-blank.png") ?>" id="passport" style="width:150px;" name="image" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 row">
                            <div class="input-box col-md-4">
                                <label>Programme</label>
                                <select class="form-control" required id="program">
                                    <option value="">Select</option>
                                    <?php foreach ($programs as $program) : ?>
                                        <option value="<?= $program->id ?>"><?= $program->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="input-box col-md-4">
                                <label>School</label>
                                <select class="form-control" name="school" id="school" required>
                                    <option value="">Select</option>
                                    <?php foreach ($schools as $school) : ?>
                                        <option value="<?= $school->id ?>"><?= $school->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="input-box col-md-4">
                                <label>Department</label>
                                <select class="form-control" name="department" id="department" required>
                                    <option value="">Select</option>
                                </select>
                                <small style="color:#f34;" id="dept_err">Select Program & School First</small>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Passport</label>
                            <input type="file" placeholder="Upload File" accept="image/*" onchange="loadname(this,'passport')" id="image" required>
                            <small style="color:#f34;" id="image_err"></small>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="col-md-12" style="font-weight:600;">Personal Information</h4>
                        <div class="input-box col-md-6">
                            <label>Title</label>
                            <select class="form-control" name="title" required>
                                <option value="">Select</option>
                                <option value="Mr.">Mr.</option>
                                <option value="Mrs.">Mrs.</option>
                                <option value="Ms.">Ms.</option>
                            </select>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Surname</label>
                            <input type="text" placeholder="Surname" name="lastname" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>First Name</label>
                            <input type="text" placeholder="First Name" name="firstname" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Middle Name</label>
                            <input type="text" placeholder="Middle Name" name="middlename" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Phone Number</label>
                            <input type="text" placeholder="Phone Number" name="phone" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-box col-md-4">
                            <label>Date of Birth</label>
                            <input type="date" placeholder="Date of Birth" name="dateofbirth" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Gender</label>
                            <select class="form-control" name="gender" required>
                                <option value="">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="input-box col-md-4">
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
                        <div class="input-box col-md-4">
                            <label>Country of Birth</label>
                            <select class="form-control" name="country" required>
                                <option value="">Select</option>
                                <option value="Nigeria">Nigeria</option>
                            </select>
                        </div>
                        <div class="input-box col-md-4">
                            <label>State of Origin</label>
                            <select class="form-control" name="state" required>
                                <option value="">Select</option>
                                <option value="Ogun">Ogun</option>
                            </select>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Local Government</label>
                            <select class="form-control" name="lga" required>
                                <option value="">Select</option>
                                <option value="Abeokuta">Abeokuta</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="col-md-12" style="font-weight:600;">Alternative Contact</h4>
                        <div class="input-box col-md-4">
                            <label>Relationship</label>
                            <select class="form-control" name="alt_contact_rel" required>
                                <option value="">Select</option>
                                <option value="Parent">Parent</option>
                                <option value="Guardian">Guardian</option>
                                <option value="Next of kin">Next of kin</option>
                            </select>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Full Name</label>
                            <input type="text" placeholder="Full Name" name="alt_contact_name" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Phone Number</label>
                            <input type="text" placeholder="Phone Number" name="alt_contact_phone" required>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="col-md-12" style="font-weight:600;">Account Information</h4>
                        <div class="input-box col-md-4">
                            <label>Email</label>
                            <input type="email" placeholder="Email" name="email" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Password</label>
                            <input type="password" placeholder="Password" name="password" required>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Confirm Password</label>
                            <input type="password" placeholder="Confirm Password" required>
                        </div>
                    </div>
                    <div class="submit-slide">
                        <input type="submit" value="Submit Application" class="btn">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<?php $this->load->view("home/inc/footer") ?>