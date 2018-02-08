const express = require('express');
const router = express.Router();
const user = require('../models/user');


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
	let data = new user({
		username:req.body.Username,
		password:req.body.Password,
		email:req.body.Email,
		mobile: req.body.Mobile
	});

	data.save((err, info)=>{
		if(err) res.send(err);
		if(info) res.send(info);
	})

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
		res.send(`Hi, ${req.session.user.username}, Welcome to Dashboard`);
	}
	
})


router.get('/logout', (req, res)=>{
	req.session.destroy(function(err) {
  res.send('Logged out')
	})
})
module.exports = router;
