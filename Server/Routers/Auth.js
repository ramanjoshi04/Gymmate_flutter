const express=require("express");
const bcrypt=require("bcryptjs");
const User=require("../Models/User")
const authRouter=express.Router();

//signUp
authRouter.post("/api/signup",async(req,res)=>{

try {
    //if user is already exist
    const{name,email,password}=req.body;
    const existuser=await User.findOne({email});
    if(existuser){
        return res.status(400).json({msg:"User exist : please sign in"});
    }
     
    //if user is not registered then we create the hashed password
    if(password==""){
        return res.status(400).json({msg:'password cannot be empty'})
    }
    const hashedPassword=await bcrypt.hash(password,10); 

    //here we create the new user
    let user=new User({
        name,
        email,
        password:hashedPassword,

    });

    user=await user.save();
    res.json(user);
    
} catch (e) {
    res.status(500).json({error:e.message});
}

})

//login
authRouter.post("/api/login",async (req,res)=>{
    try {

         const{email,password}=req.body;
         const user=await User.findOne({email});

          if(password==""){
               return res.status(400).json({msg:"Password cannot be empty"});
         }


         if(!user){
               return res.status(400).json({msg:"user doesn't exist..."});
         }

    check=await bcrypt.compare(password,user.password);

    if(!check){
         return res.status(400).json({msg:"password incorrect"});
    }
    res.status(200).json({msg:'success',verified:email});
        
    } catch (e) {
        return res.status(400).json({msg:'password is wrong'});
    }
   
    
})
module.exports=authRouter;