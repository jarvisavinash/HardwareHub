import React from "react";
import { toast } from "react-toastify";
import { useCart } from "react-use-cart";




const Carts = () => {

    const {
        isEmpty,
        totalUniqueItems,
        items,
        totalItems,
        cartTotal,
        updateItemQuantity,
        removeItem,
        emptyCart,
    } = useCart();

    function GoToAllProducts() {
        window.location = 'http://localhost:3000/allproducts';
    }

    function GoToPayment() {
        window.location = 'http://localhost:3000/payment'
    }

    console.log(items);

    if (isEmpty) return  <h1 className="text-center"><br />Your Cart is Empty</h1>
        
        

    const Logout = (event) => {
        localStorage.clear();
        window.location = 'http://localhost:3000/homebody';
    }

    const notify = () => {
        toast.success('Successfully Logged Out', {
            position: "top-right",
            autoClose: 1000,
            hideProgressBar: true,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
        });
    }




    return (
        <div class="container">

            <div class="btn-toolbar justify-content-between" style={{ paddingTop: "20px" }}>
                <div class="btn-group">

                </div>
                <div class="input-group" style={{ paddingRight: "20px" }} >
                    <button class="btn btn-primary" onClick={() => { Logout(); notify(); }} ><i class="icon-download"></i> Logout </button>
                </div>
            </div>

            <section className="py-4 container">

                <div class="container text-center">
                    <div class="row">
                        <div class="col">
                            <h5>Cart ({totalUniqueItems}) Total Items: ({totalItems})</h5>
                        </div>
                        <div class="col">

                        </div>
                    </div>
                </div>

                <br /><br />

                <div class="container">
                    <div class="row">
                        <div class="col-sm-8">

                            <div className="row justify-content-center">
                                <div className="col-12">
                                    <table className="table table-light table-hover m-0">
                                        <tbody>
                                            <tr>

                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Add, Remove, Delete</th>

                                            </tr>
                                            <tr>
                                                <th><hr /></th>
                                                <th><hr /></th>
                                                <th><hr /></th>
                                                <th><hr /></th>
                                                <th><hr /></th>
                                            </tr>
                                            {
                                                items.map((item, index) => {
                                                    return (
                                                        <tr key={index} >
                                                            <td>
                                                                <img src={item.imagePath} style={{ height: '6rem' }} />
                                                            </td>
                                                            <td style={{ "padding-top": "40px" }} ><b>{item.productName}</b></td>
                                                            <td style={{ "padding-top": "40px" }} ><b>{item.price}</b></td>
                                                            <td style={{ "padding-top": "40px" }} ><b>{item.quantity}</b></td>
                                                            <td style={{ "padding-top": "40px" }} >
                                                                <button className="btn btn-primary ms-2"
                                                                    onClick={() => updateItemQuantity(item.id, item.quantity + 1)}>
                                                                    <i class="fa-solid fa-plus"></i>
                                                                </button>
                                                                <button className="btn btn-primary ms-2"
                                                                    onClick={() => updateItemQuantity(item.id, item.quantity - 1)}>
                                                                    <i class="fa-solid fa-minus"></i>
                                                                </button>
                                                                <button className="btn btn-danger ms-2" onClick={() => removeItem(item.id)}>
                                                                    <i class="fas fa-trash fa-lg"></i></button>
                                                            </td>

                                                        </tr>
                                                    )
                                                })
                                            }
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <br />

                            <div class="container text-center">
                                <div class="row">
                                    <div class="col">
                                        <button className="btn btn-primary m-2" onClick={() => GoToAllProducts()}> Add More Items </button>
                                    </div>
                                    <div class="col">
                                        <button className="btn btn-danger m-2" onClick={() => emptyCart()}> Clear Cart </button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-sm-4">

                            <div class="card" style={{ width: "25rem" }}>
                                <div class="card-body">
                                    <h2 class="card-title">
                                        <div class="p-3 border bg-light">Summary</div></h2>
                                    <br />
                                    <div class="container">
                                        <div class="row">
                                            <div class="col" style={{ textAlign: "left" }} >
                                                <p class="cart-text">Total Items</p>
                                                <p class="cart-text">Products Price</p>
                                                <hr />
                                                <p class="cart-text"><b>Total Amount</b></p>
                                            </div>
                                            <div class="col" style={{ textAlign: "right" }} >
                                                <p class="cart-text">{totalItems}</p>
                                                <p class="cart-text">₹{cartTotal}</p>
                                                <hr />
                                                <p class="cart-text"><b>₹{cartTotal}</b></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                    </div>
                                    <button className="btn btn-primary m-2" onClick={() => GoToPayment()} > Buy Now </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>





        </div>
    );
}


export default Carts;