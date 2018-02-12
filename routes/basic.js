const express = require('express');
const router = express.Router();
const user = require('../models/user');
const Joi = require('joi');
const nodemailer = require('nodemailer');
const path = require('path');

let transporter = nodemailer.createTransport({
         	host: 'smtp.gmail.com',
            port: 465,
            secure: true,
            requireTLS: true,
            auth: {
                user: 'elit.naveen@gmail.com',
                pass: 'kddintepfsnefnrw'
        }
    });






router.get('/home', (req, res)=>{
    res.render('index',{data:{heading:req.query.name}});
})

router.get('/welcome', (req, res)=>{
    let name = req.query.name;
    res.send(`Welcome  " ${name}  " to Dashboard`);
})

router.get('/travelling/:from/:to', (req, res)=>{
    res.send(`Travelling from : ${req.params.from} to ${req.params.to}`)
})

router.get('/registration', (req, res)=>{
	if(!req.session.user){
    	res.render('registration');
	}else{
		res.redirect('/dashboard');
	}
})

router.post('/registration', (req, res)=>{
	console.log(req.body);
	// const obj = Joi.object().keys({
	// 	Username: Joi.string().alphanum().min(3).max(30).required(),
	// 	Password: Joi.string().regex(/^[a-zA-Z0-9]{3,30}$/),
	// 	Email : Joi.string().email(),
	// 	Mobile: Joi.number(),
	// 	confirmpassword : Joi.valid(Joi.ref('Password'))
	// });
let mailOptions = {
        from: '"Fred Foo 👻" <nvedala@digitallynctech.com>', // sender address
        to:req.body.Email, // list of receivers
        subject: 'registration link ✔', // Subject line
        text: 'Hello world?', // plain text body
        attachments: [{ filename: 'image.jpg', path: '/Users/Naveen/Desktop/class3/public/image.jpg', contentType: 'image/jpg' }],
        html: `<!DOCTYPE html>
                       <html>
                       <head>
                           <title>Password Reset</title>
                       </head>
                       <body>
                       <div style="background-color:#white ;width: 60%;height: 50%;padding-top: 3%;padding-bottom: 3%;">
                       <div style="width: 50%;height: 30%; background-image: linear-gradient(135deg, #3023ae, #c86dd7);box-shadow:  3px 3px 10px #888888 ;padding: 40px;margin: auto;border-radius: 10px;">
                               <h1 style="text-align: center;font-family: 'Roboto', sans-serif;color:white">Full Stack Workshop</h1>
                               <p style="font-family: 'Roboto', sans-serif;line-height: 30px;color: white;text-align: center;">Hi ${req.body.Ucsername},</p>
                           <p style="font-family: 'Roboto', sans-serif;line-height: 25px;text-align: center;color: white">Thank You <br>Your are successfully Registered<br> for Full stack workshop
                               
                           
                           </p>
                           <div style="text-align="center">
                
                           <button style="color: blue;text-align: center;border:0px;outline: 0px; width: 150px;height: 40px;border-radius: 4px;background-color: #f2f2f2;cursor: pointer; font-family: Roboto;font-size: 15px;font-weight: bold;font-style: normal;font-stretch: normal;line-height: normal;letter-spacing: 1.2px;text-align: left;color: #3d29b1;margin-left: 132px;"><a style="text-decoration="none"" href="">Create Password</a></button>
                  
                       </div>
                       </div>
                       </div>
                       </body>
                       </html>`// html body
    };
	// console.log(Joi.validate(req.body, obj));

	let data = new user({
		username:req.body.Username,
		password:req.body.Password,
		email:req.body.Email,
		mobile: req.body.Mobile
	});

	transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            res.send(error);
        }else if(info){
        	data.save((err, inf)=>{
				if(err) res.send(err);
				if(info) res.send(inf);
			})
        }
        
        // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
        // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...
    });


	

})

router.post('/login', (req, res)=>{
	user.find({email:req.body.Email, password:req.body.Password}, (err, info)=>{
		if(err) res.send(err)
			if(info){
				console.log(info)
				req.session.user = info[0];
				console.log(req.session.user);
				res.send(`Hi ${info[0].username}, Welcome to Dashboard`)
			}else{
				res.send("User Not Found" + info)
			}
	})	
});

router.get('/dashboard', (req, res)=>{
	if(!req.session.user){
		res.redirect('/registration');
	}else{
		console.log(req.session)
		res.send(`Hi, ${req.session.user.username}, Welcome to Dashboard`);
	}
	
})


router.get('/logout', (req, res)=>{
	req.session.destroy(function(err) {
  res.send('Logged out')
	})
})
module.exports = router;
