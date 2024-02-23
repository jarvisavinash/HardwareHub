import axios from "axios";
import React from "react";

class LoginSignin extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            firstName: '',
            lastName: '',
            emailId: '',
            mobileNumber: '',
            password: ''
        }
    }

    Handler = (e) => {
        this.setState({ [e.target.name]: e.target.value })
    }

    SubmitHandler = e => {
        e.preventDefault()
        // console.log(this.state) ;
        console.log(this.state);
        //  var abc =this.state;
        console.log(this.state);

        axios
            .post("http://localhost:8045/app/customer/save", this.state)
            .then(res => {
                console.log(res);
            }
        );
    }


    render() {

        const { firstName, lastName, emailId, mobileNumber, password } = this.state

        return (
            <div>


                <ul class="nav nav-pills nav-justified mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="tab-login" data-bs-toggle="pill" data-bs-target="#pills-login" type="button" role="tab" aria-controls="pills-login" aria-selected="true">Login</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="tab-register" data-bs-toggle="pill" data-bs-target="#pills-register" type="button" role="tab" aria-controls="pills-register" aria-selected="false">Register</button>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                        <br /><br />
                        <form >

                            <div class="form-outline mb-4">
                                <input placeholder="Email" type="email" id="loginName" class="form-control" />
                                <label class="form-label" for="loginName"></label>
                            </div>


                            <div class="form-outline mb-4">
                                <input placeholder="Password" type="password" id="loginPassword" class="form-control" />
                                <label class="form-label" for="loginPassword"></label>
                            </div>


                            <div class="row mb-4">
                                <div class="col-md-6 d-flex justify-content-center">

                                    <div class="form-check mb-3 mb-md-0">
                                        <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                                        <label class="form-check-label" for="loginCheck"> Remember me </label>
                                    </div>
                                </div>

                                <div class="col-md-6 d-flex justify-content-center">

                                    <a href="#!">Forgot password?</a>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

                        </form>
                    </div>


                    <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                        <br /><br />
                        <form onSubmit={this.SubmitHandler} >

                            <div class="form-outline mb-4">
                                <input onChange={this.Handler} value={firstName} name="firstName" placeholder="First Name" type="text" class="form-control" required />
                            </div>

                            <div class="form-outline mb-4">
                                <input onChange={this.Handler} value={lastName} name="lastName" placeholder="Last Name" type="text" class="form-control" required />
                            </div>

                            <div class="form-outline mb-4">
                                <input onChange={this.Handler} value={emailId} name="emailId" placeholder="Email ID" type="email" class="form-control" required />
                            </div>

                            <div class="form-outline mb-4">
                                <input onChange={this.Handler} value={mobileNumber} name="mobileNumber" placeholder="Mobile No." type="text" class="form-control" required />
                            </div>


                            <div class="form-outline mb-4">
                                <input onChange={this.Handler} value={password} name="password" placeholder="Password" type="password" class="form-control" required />
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-3">Sign in</button>

                        </form>
                    </div>

                </div>


            </div>
        );
    }
}

export default LoginSignin;