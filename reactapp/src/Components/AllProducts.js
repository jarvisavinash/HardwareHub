import axios from "axios";
import React, { useState, useEffect } from "react";
import Itemcard from './Itemcard';


function AllProducts() {

    useEffect(function () {
        axios
            .get("/app/category", {
                headers: {
                    "Content-Type": "application/json"
                },
                baseURL: "http://localhost:8045"

            })
            .then((response) => setCategories(response.data))
            .then((error) => console.log(error));
    }, []);


    const [categories, setCategories] = useState([])


    const handleCategory = (event) => {
        const getCategoryId = event.target.value;
        console.log(getCategoryId);
        setCatId(getCategoryId);
    }

    const [catId, setCatId] = useState('')


    useEffect(function () {
        axios
            .get("/app/subcategory", {
                headers: {
                    "Content-Type": "application/json"
                },
                baseURL: "http://localhost:8045"

            })
            .then((response) => setSubCategories(response.data))
            .then((error) => console.log(error));

    }, []);

    const [subCategories, setSubCategories] = useState([])

    const handleSubCategory = (event) => {
        const getSubCatId = event.target.value;
        // console.log(getSubCatId);        
        setSubCatId(getSubCatId);
    }

    const [subCatId, setSubCatId] = useState('');


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

    const [products, setProducts] = useState([]);

    const Logout = (event) => {
        localStorage.clear();
        alert("Successfully Logout....");
        window.location = 'http://localhost:3000/homebody';
    }

    return (
        <div class="container text-center">
            <br />

            <div class="btn-toolbar justify-content-between">
                <div class="btn-group">
                </div>
                <p><b>Please Select Category And Subcategory From Dropdown</b></p>
                <div class="input-group">
                    <button class="btn btn-primary" onClick={Logout} ><i class="icon-download"></i> Logout </button>
                </div>
            </div>

            <br/>

            <div class="container overflow-hidden">
                <div class="row gx-5">
                    <div class="col">
                        <div class="p-3 border bg-light">

                            <ul>
                                <select className="form-control" onChange={(e) => handleCategory(e)} >
                                    <option value="0">--Select Category--</option>
                                    {
                                        categories.map((cat) => (
                                            <option key={cat.categoryId} value={cat.categoryId}>
                                                {cat.categoryName}
                                            </option>
                                        ))
                                    }
                                </select>
                            </ul>


                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">


                            <ul class="menu">
                                <select className="form-control" onChange={(e) => handleSubCategory(e)} >
                                    <option value="0">--Select SubCategory--</option>
                                    {
                                        subCategories
                                            .filter(sub => sub.categoryId == catId)
                                            .map((subcat) => (
                                                <option key={subcat.subCategoryId} value={subcat.subCategoryId} >
                                                    {subcat.subCategoryName}
                                                </option>
                                            ))
                                    }
                                </select>
                            </ul>


                        </div>
                    </div>
                </div>
            </div>

            <br /><br /><br />

            <div class="container text-center">

                <div>

                    <div class="row">
                        {
                            products
                                .filter(prodsub => prodsub.subCategoryId == subCatId)
                                .map((item, index) => {
                                    return (
                                        <Itemcard
                                            id={item.id}
                                            productName={item.productName}
                                            price={item.price}
                                            imagePath={item.imagePath}
                                            item={item}
                                            key={index}
                                        />
                                    )
                                })}
                    </div>

                </div>
            </div>


        </div>
    );
}

export default AllProducts;








