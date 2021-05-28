import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Toast, ToastBody, ToastHeader } from 'reactstrap';

import firebase from "../config/firebase";

export default class forgetPassword extends Component {
    constructor() {
        super();

        this.state = {
            phoneNumber: "",
            password: "",
            rePassword: "",
        }

        this.onchangePhoneNumber = this.onchangePhoneNumber.bind(this);
        this.onchangePassword = this.onchangePassword.bind(this);
        this.onchangeRePassword = this.onchangeRePassword.bind(this);
        this.handleClick = this.handleClick.bind(this);
    }

    onchangePhoneNumber(e) {
        this.setState({
            phoneNumber: e.target.value
        });
    }

    onchangePassword(e) {
        this.setState({
            password: e.target.value
        });
    }

    onchangeRePassword(e) {
        this.setState({
            rePassword: e.target.value
        });
    }

    handleClick(e) {
        e.preventDefault();

        let phoneNumber = this.state.phoneNumber;
        let recapcha = new firebase.auth.RecaptchaVerifier("recaptcha");
        firebase.auth().signInWithPhoneNumber(phoneNumber, recapcha)
            .then(function (e) {
                let code = prompt("Nhập mã OTP", "");
                if (code == null) return;
                e.confirm(code)
                    .then(function (result) {
                        document.getElementById('toast-message').style.display = "block";
                        recapcha.clear();
                    })
                    .catch((error) => {
                        console.log(error);
                    });
            }).catch((error) => {
                console.log(error)
            });
    }

    render() {
        let { phoneNumber } = this.state;
        let { password } = this.state;
        let { rePassword } = this.state;

        return (
            <div className="container">
                <div className="title-foget-password">Quên mật khẩu</div>
                <div>Hãy nhập số điện thoại di động và chúng tôi sẽ gửi cho quý khách mã xác minh để đổi mật khẩu.</div>
                <Form inline className="form-forget-password" onSubmit={this.handleClick}>
                    <FormGroup>
                        <Label for="phone-number" hidden>Số điện thoại:  </Label>
                        <div className="phone-number-input">
                            <span className="prefix-phone-input">(+84)</span>
                            <Input
                                className="input-phone-number"
                                type="text"
                                name="phoneNumber"
                                id="phone-number"
                                placeholder="Số điện thoại"
                                value={phoneNumber}
                                onChange={this.onchangePhoneNumber}
                            />
                        </div>
                    </FormGroup>
                    {' '}
                    <FormGroup>
                        <Label for="new-password" hidden>Mật khẩu mới:</Label>
                        <Input
                            type="password"
                            name="newPassword"
                            id="new-password"
                            placeholder="Mật khẩu mới"
                            value={password}
                            onChange={this.onchangePassword}
                        />
                    </FormGroup>
                    {' '}
                    <FormGroup>
                        <Label for="re-new-password" hidden>Nhập lại mật khẩu mới:</Label>
                        <Input
                            type="password"
                            name="reNewPassword"
                            id="re-new-password"
                            placeholder="Nhập lại mật khẩu mới"
                            value={rePassword}
                            onChange={this.onchangeRePassword}
                        />
                    </FormGroup>
                    {' '}
                    <div id="recaptcha"></div>
                    <Input type="submit" value="Gửi mã OTP" className="btn-register btn btn-primary btn-forget-password" />
                </Form>
                <div className="p-3 bg-success my-2 rounded" id="toast-message">
                    <Toast>
                        <ToastHeader>
                            Thành công
                        </ToastHeader>
                        <ToastBody>
                            Bạn đã đổi mật khẩu thành công
                        </ToastBody>
                    </Toast>
                </div>
            </div>
        )
    }
}
