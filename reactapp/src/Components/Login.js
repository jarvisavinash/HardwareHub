import axios, { Axios } from "axios";
import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import './Login.css';

class Login extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            password: '',
            emailId: '',
            custId: '',
            checkEmailId: '',
            test: ''
        }
    }

    Handler = (e) => {
        this.setState({ [e.target.name]: e.target.value })
    }

    SubmitHandler = e => {
        e.preventDefault()
        console.log(this.state.password);
        console.log(this.state.emailId);

        axios
            .post("http://localhost:8045/app/customer/login", this.state)
            .then(res => {

                localStorage.setItem('customerLoginDetails', JSON.stringify(res.data));
                var xyz = JSON.parse(localStorage.getItem("customerLoginDetails"));

                console.log("Check");
                console.log(typeof (xyz));

                if (xyz.length === 0) {
                    this.state.test = 0;
                } else {
                    this.state.test = 1;
                }

                console.log(this.state.test)

                this.state.password = xyz[0].password;
                this.state.checkEmailId = xyz[0].emailId;

                this.check();
            }
        );
    }

    check() {
        if (this.state.test == 1) {
            alert("Valid User");
            window.location = 'http://localhost:3000/allproducts';
        }
        else if (this.state.test == 0) {
            alert("Invalid User");
        }
    }


    render() {

        const { password, emailId } = this.state

        return (
            <div class="container text-center"><br/><br/>
        
                <section class="background-radial-gradient overflow-hidden">

                    <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                        <div class="row gx-lg-5 align-items-center mb-5">
                            <div class="col-lg-6 mb-5 mb-lg-0" style={{"z-index": "10"}}>
                                <h1 class="my-5 display-5 fw-bold ls-tight" style={{"color": "hsl(218, 81%, 95%)"}}>
                                    The best hardware <br />
                                    <span style={{"color": "hsl(218, 81%, 75%)"}}>for your home</span>
                                </h1>
                                <p class="mb-4 opacity-70" style={{"color": "hsl(218, 81%, 85%)", "text-align": "justify"}}>
                                    We believe that our key value proposition is our understanding & commitment to adhere to the highest technological standards 
                                    and that our popularity is a testament to our strong manufacturing capabilities, customer-centricity, and best-in-class 
                                    sustainable business practices. We are led by a young, enthusiastic and forward looking second generation management, 
                                    and continue our upward trajectory with a shared vision of delivering both excellence and trust.
                                </p>
                            </div>

                            <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                                <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                                <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

                                <div class="card bg-glass">
                                    <div class="card-body px-4 py-5 px-md-5">
                                        <form onSubmit={this.SubmitHandler} >
                                            
                                            <div class="form-outline mb-4">
                                                <input placeholder="Email" onChange={this.Handler} value={emailId} name="emailId" type="email" id="form3Example3" class="form-control" required />
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input placeholder="Password" onChange={this.Handler} value={password} name="password" type="password" id="form3Example4" class="form-control" required />
                                            </div>
                                            
                                            <button type="submit" class="btn btn-primary btn-block mb-4"> Sign In </button>

                                            
                                            <div class="text-center">
                                                <p><Link to="/register" style={{ color: "black", textDecoration: 'none' }}> Don't have an account ?</Link></p>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
        
            </div>
        );
    }
}

export default Login;


