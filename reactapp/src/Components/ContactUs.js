import React from "react";
import './ContactUs.css';

function ContactUs() {
    return (
        <div>


            <body>
                <section class="banner-bottom py-5">
                    <div class="container py-md-5">
                        <h3 class="title-wthree mb-lg-5 mb-4 text-center">Contact Us </h3>
                        <div class="row contact_information">
                            <div class="col-md-6">
                                <div class="contact_right p-lg-5 p-4">
                                    <form action="#" method="post">
                                        <div class="field-group">

                                            <div class="content-input-field">
                                                <input name="text1" id="text1" type="email" value="" placeholder="User Email" required=""/>
                                            </div>
                                        </div>
                                        <div class="field-group">

                                            <div class="content-input-field">
                                                <input name="text1" id="text3" type="text" value="" placeholder="User Phone" required=""/>
                                            </div>
                                        </div>
                                        <div class="field-group">
                                            <div class="content-input-field">
                                                <textarea placeholder="Your Message Here..." required=""></textarea>
                                            </div>
                                        </div>
                                        <div class="content-input-field">
                                            <button type="submit" class="btn">Submit</button>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="col-md-6 contact_left p-4">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3793.8432408307735!2d75.18926851744385!3d18.032477200000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc46f0aee5d7151%3A0x8001c03555e4bde5!2sMahesh%20Hardware!5e0!3m2!1sen!2sin!4v1650610246782!5m2!1sen!2sin"></iframe>
                            </div>

                            <div class="col-lg-4 col-md-6 mt-lg-4 contact-inn-w3pvt">
                                <div class="mt-5 information-wthree">
                                    <h4 class="text-uppercase mb-4"><span class="fa fa-comments"></span> Communication</h4>
                                    <p class="cont-wthree-para mb-3 text-capitalize">for general queries, including property Sales and constructions, please email us at <a href="mailto:info@example.com">mahesh.shop@gmail.com</a></p>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 mt-lg-4 contact-inn-w3pvt">
                                <div class="mt-5 information-wthree">
                                    <h4 class="text-uppercase mb-4"><span class="fa fa-life-ring"></span> Technical Support</h4>
                                    <p class="cont-wthree-para mb-3 text-capitalize">we are ready to help! if you have any queries or issues, contact us for support <label>+91 7987654321</label>.</p>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 mt-lg-4 contact-inn-w3pvt">
                                <div class="mt-5 information-wthree">
                                    <h4 class="text-uppercase mb-4"><span class="fa fa-map"></span> Others</h4>
                                    <p class="cont-wthree-para mb-3 text-capitalize">we are ready to help! if you have any queries or issues, contact us for support <label>+91 7875746700</label>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>



            </body>

        </div>
    );
}

export default ContactUs;