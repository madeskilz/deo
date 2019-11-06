<?php $this->load->view("home/inc/header") ?>
    <style>
        .input-box label {
            color: #a3a3a3 !important;
            font-weight: 400 !important;
        }
        .form-container{
            box-shadow: 2px 2px 8px 2px #a6a6a6;
        }
        input:not([type="file"]){
            height: 34px !important;
        }
    </style>
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
                <li><a>Application</a></li>
                <li><a>Form</a></li>
            </ul>
        </div>
    </section>
    <section class="login-view">
        <div class="container">
            <div class="row">
                <?= form_open_multipart(base_url("application-form"), 'class="form-horizontal" ') ?>
                <div class="col-sm-12 col-md-8 form-container">
                    <div class="section-title">
                        <p>Fill this form to continue with application</p><br/>
                        <small style="color:#f34;">Note: All fields are required</small>
                    </div>
                    <div class="col-md-12" id="msgBox">
                        <?php $this->load->view("err-inc/msg") ?>
                    </div>
                    <div class="row col-md-12">
                        <h4 class="col-md-12" style="font-weight:600;">Personal Information</h4>
                        <div class="input-box col-md-6">
                            <label>Title</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <select class="form-control" name="title" required>
                                    <option value="">Select</option>
                                    <option value="Mr.">Mr.</option>
                                    <option value="Mrs.">Mrs.</option>
                                    <option value="Ms.">Ms.</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Surname</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" placeholder="Surname" name="lastname" required>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>First Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" placeholder="First Name" name="firstname" required>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Middle Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" placeholder="Middle Name" name="middlename" required>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Phone Number</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                <input type="text" placeholder="Phone Number" name="phone" required>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Date of Birth</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" placeholder="Date of Birth" name="dateofbirth" required>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Gender</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-male"></i></span>
                                <select class="form-control" name="gender" required>
                                    <option value="">Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Marital Status</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user-plus"></i></span>
                                <select class="form-control" name="marital_status" required>
                                    <option value="">Select</option>
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Divorced">Divorced</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Address</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                <textarea class="form-control" name="address" required rows="1"></textarea>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Country of Birth</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-globe"></i></span>
                                <select class="form-control" name="country" required>
                                    <option value="">Select</option>
                                    <option value="Nigeria">Nigeria</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>State of Origin</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map"></i></span>
                                <select class="form-control" name="state" id="state" required>
                                    <option value="">Select</option>
                                    <?php foreach ($states as $state) : ?>
                                        <option value="<?= $state->id ?>"><?= $state->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Local Government</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map"></i></span>
                                <select class="form-control" name="lga" id="lga" required>
                                    <option value="">Select</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <h4 class="col-md-12" style="font-weight:600;">Jamb Information</h4>
                        <div class="input-box col-md-6">
                            <label>Registration Number</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" placeholder="Registeration Number" name="jamb_reg_no" required>
                            </div>
                        </div>
                        <div class="input-box col-md-6">
                            <label>Score</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                <input type="text" placeholder="Score" name="jamb_score" required>
                            </div>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <h4 class="col-md-4" style="font-weight:600;">Academic Information</h4>
                    </div>
                    <div class="row col-md-12">
                        <div class="input-box col-md-4">
                            <label>School</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select class="form-control" name="school" id="school" required>
                                    <option value="">Select</option>
                                    <?php foreach ($schools as $school) : ?>
                                        <option value="<?= $school->id ?>"><?= $school->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Programme</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-building"></i></span>
                                <select class="form-control" required id="program" name="program">
                                    <option value="">Select</option>
                                    <?php foreach ($programs as $program) : ?>
                                        <option value="<?= $program->id ?>"><?= $program->name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Department</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-bank"></i></span>
                                <select class="form-control" name="department" id="department" required>
                                    <option value="">Select</option>
                                </select>
                            </div>
                            <small style="color:#f34;" id="dept_err">Select Program & School First</small>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <h4 class="col-md-12" style="font-weight:600;">Alternative Contact</h4>
                        <div class="input-box col-md-4">
                            <label>Relationship</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                <select class="form-control" name="alt_contact_rel" required>
                                    <option value="">Select</option>
                                    <option value="Parent">Parent</option>
                                    <option value="Guardian">Guardian</option>
                                    <option value="Next of kin">Next of kin</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Full Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user-o"></i></span>
                                <input type="text" placeholder="Full Name" name="alt_contact_name" required>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Phone Number</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>
                                <input type="text" placeholder="Phone Number" name="alt_contact_phone" required>
                            </div>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <h4 class="col-md-12" style="font-weight:600;">Account Information</h4>
                        <div class="input-box col-md-4">
                            <label>Email</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="email" placeholder="Email" name="email" required>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-paste"></i></span>
                            <input type="password" placeholder="Password" name="password" id="password" required>
                            </div>
                        </div>
                        <div class="input-box col-md-4">
                            <label>Confirm Password</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-paste"></i></span>
                            <input type="password" placeholder="Confirm Password" id="c_password" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 submit-slide">
                        <button class="btn" id="btnApply">Apply</button>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-sm-12 col-md-3 form-container" style="padding:50px 20px 50px 20px">
                    <div class="text-center">
                        <img src="<?= base_url("assets/images/user-blank.png") ?>" id="passport"
                             style="width:150px;"/>
                    </div>
                    <div class="input-box text-center">
                        <input name="image" type="file" placeholder="Upload File" accept="image/*"
                               onchange="loadname(this,'passport', 25000)" id="image" required>
                    </div>
                    <div style="color:#f34;font-size:12px;" >
                        Note:-<br/>
                        * Photo must not be more than 25kb.<br/>
                        * Accepted photo format: jpg, jpeg, png, gif<br/>
                        * It MUST NOT be more than 1 year old<br/>
                        * It must be in sharp focus and clear<br/>
                        * It must be taken against a PLAIN background<br/>
                        * It must be only you in the image
                    </div>
                </div>
                </form>
            </div>
        </div>
    </section>
<?php $this->load->view("home/inc/footer") ?>