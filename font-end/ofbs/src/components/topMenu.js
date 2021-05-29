import React, { useState } from "react";
import {
    Collapse,
    Navbar,
    NavbarToggler,
    NavbarBrand,
    Nav,
    NavItem
} from "reactstrap";

import { BrowserRouter as Route, Link } from "react-router-dom";

const TopMenu = () => {
    const [isOpen, setIsOpen] = useState(false);

    const toggle = () => setIsOpen(!isOpen);

    return (
        <div>
            <Navbar className="top-menu" color="success" dark expand="md">
                <NavbarBrand href="/">OFBS</NavbarBrand>
                <NavbarToggler onClick={toggle} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav className="mr-auto nav" navbar>
                        <NavItem>
                            <Link className="link" to="/">Trang chủ</Link>
                        </NavItem>
                        <div className="authen">
                            <NavItem>
                                <Link className="link" to="/login/">Đăng nhập</Link>
                            </NavItem>
                            <NavItem>
                                <Link className="link" to="/register/">Đăng ký</Link>
                            </NavItem>
                        </div>
                    </Nav>
                </Collapse>
            </Navbar>
        </div>
    );
};

export default TopMenu;
