import axios from "axios";
import React, { useEffect, useState } from "react";
import Itemcard from "./Itemcard";

const Home = () => {

    const [products, setProducts] = useState([]);

    useEffect(function () {
        axios
            .get("/app/product", {
                headers: {
                    "Content-Type": "application/json"
                },
                baseURL: "http://localhost:8045"

            })
            .then((response) => setProducts(response.data))
            .then((error) => console.log(error));
    }, []);



    return(
        <div>

            <h1 className="text-center mt-3">All Items</h1>
            <section className="py-4 container">
                <div className="row justify-content-center">

                    {
                        products
                            .map((item, index) => {
                                return(

                        <Itemcard   
                        id = {item.id}
                        productName = {item.productName}
                        price = {item.price}
                        imagePath = {item.imagePath}
                        item = {item}
                        key = {index}
                        />

                    )})}

                </div>
            </section>


        </div>
            
    );
}

export default Home;

