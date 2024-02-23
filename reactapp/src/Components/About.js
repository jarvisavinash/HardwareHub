import React from "react";
import './About.css';

function About() {
    return (
        <div><br />

            <div class="profileclass container text-center">
                <img src="../images/About/about1.jpeg" class="card-img-top" alt="..." />
                <h3 class="profile">Profile</h3>
                <p class="info">In the world of architectural hardware solutions, Mahesh is a name that everyone associates with security, trust, and elegance. As one of the leading global manufacturers of door-ware, locking mechanism and glass fixtures and fittings, the journey towards earning worldwide recognition is one that has taken constant dedication to innovation, adhering to quality, and a passion for excellence.</p>
            </div>

            <br />

            <div class="container text-center">
                <p style={{ "text-align": "justify", fontSize: "18px" }}><b>Today, Mahesh Hardware is a consumer oriented company and a market leader. We have a strong presence in India with over 12000 touch points across the country. We operate a 200,000 sq.ft. state-of-the-art manufacturing plant in Gurugram and employ over 1250 people. Our global reach extends to South-East Asia, the Middle-East, and Africa and our offerings are constantly enriched through global and our own research & innovation center.</b></p>
            </div>

            <br />

            <div class="container text-center">
                <img src="../images/About/about2.png" style={{ width: "1100px", height: "400px" }} />
            </div>
            <br />

            <div class="container text-center">
                <p style={{ "text-align": "justify", fontSize: "18px" }}><b>We believe that our key value proposition is our understanding & commitment to adhere to the highest technological standards and that our popularity is a testament to our strong manufacturing capabilities, customer-centricity, and best-in-class sustainable business practices. We are led by a young, enthusiastic and forward looking second generation management, and continue our upward trajectory with a shared vision of delivering both excellence and trust.</b></p>
            </div>

            <br/>

            <div class="container">
                <div class="row">
                    <div class="col">
                        <img src="../images/About/about3.jpeg" />
                    </div>
                    <div class="col">
                        <img src="../images/About/about4.jpeg" />
                    </div>
                </div>
            </div>




            <br />

        </div>
    );
}

export default About;