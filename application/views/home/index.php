<?php $this->load->view("home/inc/header") ?>
<section class="banner style2">
    <div class="left-slider">
        <div class="item">
            <img src="<?= base_url("assets/slider/one.jpeg") ?>" alt="">
            <div class="slide-info">
                <!-- <h2>Education Needs Complete Solution</h2> -->
                <!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p> -->
            </div>
        </div>
        <div class="item">
            <img src="<?= base_url("assets/slider/two.jpeg") ?>" alt="">
            <div class="slide-info">
                <!-- <h2>Education Needs Complete Solution</h2> -->
                <!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p> -->
            </div>
        </div>
        <div class="item">
            <img src="<?= base_url("assets/slider/tre.jpeg") ?>" alt="">
            <div class="slide-info">
                <!-- <h2>Education Needs Complete Solution</h2> -->
                <!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p> -->
            </div>
        </div>
    </div>
    <div class="info-form">
        <h2>Enquiries</h2>
        <div class="row">
            <div class="col-sm-12">
                <div class="select-box">
                    <select class="degree-select">
                        <option value="">Select Programme</option>
                        <option>OND</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="select-box">
                    <select class="specialization-select">
                        <option>Specialization</option>
                        <option>Paralegal Studies</option>
                        <option>Computer Science</option>
                        <option>Office Technology & Management</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="input-box">
                    <input type="text" placeholder="First Name">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="input-box">
                    <input type="text" placeholder="Last Name">
                </div>
            </div>
            <div class="col-sm-12">
                <div class="input-box">
                    <input type="text" placeholder="Email">
                </div>
            </div>
            <div class="col-sm-12">
                <div class="input-box">
                    <input type="text" placeholder="Phone Number">
                </div>
            </div>
            <div class="col-sm-12">
                <div class="submit-box">
                    <input type="submit" value="Request Information">
                </div>
            </div>
        </div>
    </div>
</section>
<section class="safe-environment">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-4">
                <div class="section-title2">
                    <h2>Providing safe and serene educational environment</h2>
                    <span>...bringing style to Polytechnic education.</span>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 text-justify">
                <p> <b>DEO GRATIAS POLYTECHNIC, AGBOR</b> is a private polytechnic, approved by the Delta State 
                Ministry of Higher Education to operate and run all programmes as may be accredited by the 
                National Board for Technical Education (NBTE).</p>
            </div>
            <div class="col-md-4 col-sm-6 text-justify">
                <p>The temporary site is strategically located at Deo Gratias Group of Schools Premises, 
                    Obi Ikechukwu Road, Agbor Obi Junction, Agbor while the permanent site on a 10 hectare land at Alisor, Agbor.</p>
                <p> There is also a massive structure situated at Plot 124 GRA, Phase 3, Core Area, Along Ambassador Godson Echegile Street, Asaba, which will eventually be the Asaba Campus. </p>
            </div>
        </div>
    </div>
</section>
<section class="our-advantages">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="advantages-box">
                    <div class="img"><img src="<?= base_url("assets/images/learn-icon.png") ?>" alt=""></div>
                    <h3>Integrity</h3>
                    <p>We are committed to the meaningful integration of liberal learning and professional preparation and to learning as a life-long pursuit. </p>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="advantages-box">
                    <div class="img"><img src="<?= base_url("assets/images/save-timeIcon.png") ?>" alt=""></div>
                    <h3>Growth</h3>
                    <p>Thinking differently and learning from failure is a crucial part of growth, which is often lost in the bland values of other attributes. </p>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="advantages-box">
                    <div class="img"><img src="<?= base_url("assets/images/online-learningIcon.png") ?>" alt=""></div>
                    <h3>Excellence</h3>
                    <p>We value intellectual freedom, curiosity, and engagement; critical and creative inquiry; to give rise to the best standard. </p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="our-studies">
    <div class="container">
        <div class="section-title2">
            <h2>Our Schools</h2>
        </div>
        <div class="row">
            <?php $schools = $this->db->get('schools')->result(); ?>
            <?php foreach ($schools as $sch) : ?>
                <?php $this->db->where("school_id", $sch->id);
                $departments = $this->db->get('departments')->result(); ?>
                <div class="col-sm-6 col-md-4">
                    <div class="studies-box color<?= rand(1, 12) ?>">
                        <div class="name" style="font-size:15px;"><a href="#"><?= $sch->name ?></a></div>
                        <?php foreach ($departments as $dept) : ?>
                            <p><?= $dept->name ?></p>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
<section class="sign-upBox" style="background-image:url(<?= base_url("assets/images/parallax/sign-upBg.jpg") ?>);">
    <img src="<?= base_url("assets/images/parallax/sign-upBg.jpg") ?>" alt="">
    <div class="sign-upText">
        <h3><span>Admission in progress</span>Register Now!</h3>
        <p>This is to inform the general public, particularly interested candidates that the 2019/2020 admission into Deo Gratias Polytechnic, Agbor, Delta State, has commenced. </p>
        <div class="sign-btn">
            <a href="<?=base_url("application-procedure")?>">Register</a>
        </div>
    </div>
</section>
<!-- <section class="news-section">
    <div class="container">
        <div class="section-title2">
            <h2>Latest News and Events </h2>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="news-box img" style="background-image:url('<?= base_url("assets/images/news/news-img1.jpg") ?>');">
                    <div class="category">News</div>
                    <div class="name"><a href="#">Post with Image Here</a></div>
                    <div class="date">24 Jan, 2017</div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="news-box">
                    <div class="category">Event</div>
                    <div class="name"><a href="#">Post with Image Here</a></div>
                    <div class="date">24 Jan, 2017</div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="news-box">
                    <div class="category">Event</div>
                    <div class="name"><a href="#">Post with Image Here</a></div>
                    <div class="date">24 Jan, 2017</div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="news-box">
                    <div class="category">Event</div>
                    <div class="name"><a href="#">Post with Image Here</a></div>
                    <div class="date">24 Jan, 2017</div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="news-box">
                    <div class="category">Event</div>
                    <div class="name"><a href="#">Post with Image Here</a></div>
                    <div class="date">24 Jan, 2017</div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="news-box img" style="background-image:url('<?= base_url("assets/images/news/news-img2.jpg") ?>');">
                    <div class="category">News</div>
                    <div class="name"><a href="#">Post with Image Here</a></div>
                    <div class="date">24 Jan, 2017</div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
        </div>
    </div>
</section> -->
<section class="newsletter-block" style="background-image:url(<?= base_url("assets/images/parallax/newsletter-bg.jpg") ?>);">
    <div class="container">
        <label>SUBCRIBE WEEKLY NEWSLETTER</label>
        <div class="input-box">
            <input type="email" placeholder="Email">
            <input type="submit" value="Subscribe">
        </div>
    </div>
</section>
<?php $this->load->view("home/inc/footer") ?>