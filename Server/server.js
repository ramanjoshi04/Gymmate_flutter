const express=require("express");
require("dotenv").config();
const { default: mongoose } = require("mongoose");
const mongo=require("mongoose");
const authRouter=require("./Routers/Auth");
 


const PORT=3000;
const app=express();

mongoose.connect("mongodb+srv://thakurpranjal012:012@cluster0.dlj3oxh.mongodb.net/test").then(()=>{
    console.log("Connection to database is sucessful");
}).catch((e)=>{
    console.log(e);
});

app.use(express.json());
app.use(authRouter);
app.listen(PORT,"0.0.0.0",()=>{
    console.log("wecolme to server ${PORT}");
    console.log(process.env.Link);
    
});