<?php $this->load->view("prospective/inc/header") ?>
<style>
    @media screen and (min-width:768px) {
        .myImg {
            position: absolute;
            right: 0;
            top: 70px;
        }
    }
</style>
<div id="main-content">
    <div class="container">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-12">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url("prospective") ?>"><i class="icon-home"></i></a></li>
                        <li class="breadcrumb-item active">Clearance Procedure</li>
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
                    Clearance Procedure
                    All newly admitted students should take note of these procedures for successful clearance and
                    proper registration into the school.
                    The admitted candidates are to go to admissions office with the following documents.
                    Check your result and ensure that your ADMISSION STATUS is ADMITTED
                    Click on Make Payment and login from here with your Applicant ID and password and make
                    payment for your acceptance fee.
                    Proceed to the admission office with your credential/document:
                     Two (2) photocopies of the following, WAEC / NECO / NABTEB O'Level results
                     Two (2) copies of UTME Score(JAMB Print Out) – For ND Applicants
                     Two (2) copies of A’ Level/NCE/ND/HND Results – For HN DApplicants
                     Two (2) copies of Transfer documents – For Transfer Applicants
                     Two (2) copies of Payment Receipt printed online for online application
                     Two (2) copies of Acknowledgement Card printed online
                     Two (2) copies of Certificate of Local Government Origin
                     Five (5) recent passport photographs
                     Two (2) copies of Payment Receipt printed online for admission acceptance fee (Ensure you
                    are admitted before making this non-refundable payment)
                     Two (2) copies of Clearance Form printed online
                     A letter from parents or reputable person in the society attesting to candidate's behaviour
                    and who can be held responsible if the student misbehave.
                     A letter of undertaking to be of good behaviour.
                     Obtain Clearance Code from the ICT Centre (Ensure that you print and go with your
                    Clearance Form to ICT Centre)
                     Proceed to the web portal (PROSPECTIVE STUDENTS) with your Clearance Code and
                    Password to obtain your matriculation number and admission letter. Thereafter you can
                    login as a returning student.
                    Note: You are advice to go with all the original of your credential/document for citation.
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("prospective/inc/footer") ?>