import axios from "axios";
import React from "react";
import { Link } from "react-router-dom";

class Register extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            firstName: '',
            lastName: '',
            emailId: '',
            mobileNumber: '',
            password: '',
            completeAddress: '',
        }


    }

    Handler = (e) => {
        this.setState({ [e.target.name]: e.target.value })
    }

    SubmitHandler = e => {
        e.preventDefault()
        // console.log(this.state) ;
        console.log(this.state);
        

        axios
            .post("http://localhost:8045/app/customer/save", this.state)
            .then(res => {
                console.log(res);
                window.location = 'http://localhost:3000/login';
            }
        );
    }



    render() {

        const { firstName, lastName, emailId, mobileNumber, password, completeAddress } = this.state

        return (
            <div><br/><br/>
             
                <section class="container text-center">
     
                    <div class="px-4 py-5 px-md-5 text-center text-lg-start" style={{"background-color": "hsl(0, 0%, 96%)"}}>
                        <div class="container">
                            <div class="row gx-lg-5 align-items-center">
                                <div class="col-lg-6 mb-5 mb-lg-0">
                                    <h1 class="my-5 display-3 fw-bold ls-tight">
                                        The best hardware <br />
                                        <span class="text-primary">for your home</span>
                                    </h1>
                                    <p style={{"color": "hsl(217, 10%, 50.8%)", "text-align": "justify" }}>
                                    We believe that our key value proposition is our understanding & commitment to adhere to the highest technological standards 
                                    and that our popularity is a testament to our strong manufacturing capabilities, customer-centricity, and best-in-class 
                                    sustainable business practices. We are led by a young, enthusiastic and forward looking second generation management, 
                                    and continue our upward trajectory with a shared vision of delivering both excellence and trust.
                                    </p>
                                </div>

                                <div class="col-lg-6 mb-5 mb-lg-0">
                                    <div class="card">
                                        <div class="card-body py-5 px-md-5">

                                            <form onSubmit={this.SubmitHandler} >
                                            
                                                <div class="row">
                                                    <div class="col-md-6 mb-4">
                                                        <div class="form-outline">
                                                            <input onChange={this.Handler} value={firstName} name="firstName" placeholder="First Name" type="text" id="form3Example1" class="form-control" required />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-4">
                                                        <div class="form-outline">
                                                            <input onChange={this.Handler} value={lastName} name="lastName" placeholder="Last Name" type="text" id="form3Example2" class="form-control" required />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input onChange={this.Handler} value={emailId} name="emailId" placeholder="Email ID" type="email" id="form3Example3" class="form-control" required />
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input onChange={this.Handler} value={mobileNumber} name="mobileNumber" placeholder="Mobile No." type="text" id="form3Example3" class="form-control" required />
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <input onChange={this.Handler} value={password} name="password" placeholder="Password" type="password" id="form3Example4" class="form-control" required />
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input onChange={this.Handler} value={completeAddress} name="completeAddress" placeholder="Address" type="text" id="form3Example3" class="form-control" required />
                                                </div>

                                                <button type="submit" class="btn btn-primary btn-block mb-4"> Sign up </button>
                                             
                                                <div class="text-center">
                                                    <p><Link to="/login" style={{ color: "black", textDecoration: 'none' }} > Already have an account ?</Link></p>
                                                </div>

                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
              
                </section>
            </div >
        );
    }
}

export default Register;