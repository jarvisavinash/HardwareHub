import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import { CartProvider } from "react-use-cart";
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import Header from './Components/Header';
import Footer from './Components/Footer';
import Homebody from './Components/Homebody';
import AllProducts from './Components/AllProducts';
import Carts from './Components/Carts';
import Invoice from './Components/Invoice';
import Payment from './Components/Payment';
import Login from "./Components/Login";
import Register from "./Components/Register";
import ContactUs from "./Components/ContactUs";
import About from "./Components/About";


function App() {
  return (
    <div className="text-center">

      <BrowserRouter>

        <div>
          <CartProvider>
            <br /><br />
            <Header />

            <Routes>
              <Route path="/" element={< Homebody />} />
              <Route path="/homebody" element={< Homebody />} />
              <Route path="/allproducts" element={< AllProducts />} />
              <Route path="/cart" element={< Carts />} />
              <Route path="/invoice" element={< Invoice />} />
              <Route path="/payment" element={< Payment />} />
              <Route path="/login" element={< Login />} />
              <Route path="/register" element={< Register />} />
              <Route path="/contactus" element={< ContactUs />} />
              <Route path="/about" element={< About />} />

            </Routes>




            < Footer />
          </CartProvider>
        </div>
        <div>
          <ToastContainer
            position="top-right"
            autoClose={1000}
            hideProgressBar={false}
            newestOnTop={false}
            closeOnClick
            rtl={false}
            pauseOnFocusLoss
            draggable
            pauseOnHover
          />
        </div>

      </BrowserRouter>
      <br /><br /><br />
    </div>
  );
}

export default App;

