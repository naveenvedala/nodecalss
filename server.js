// const http = require('http');

// let pages = [{'route':'/', 'message':'welcome'},{'route':'/about', 'message':'About us Page'},
//             {'route':'/contact', 'message':'Contact us Page'}];

// http.createServer((request, response)=>{
//     //console.log(request)

//     let data = decodeURI(request.url);
// console.log(data)
//     pages.forEach((e)=>{
//         if(e.route == data){
//             response.writeHead(200, {'Content-Type':'text/plain'});
//             response.end(e.message); 
//         }else{

//         }
//     })

    
// }).listen(8081);

// const http = require('http');
// const path = require('path');

// let pages = [
//     {route:"", content:"Welcome"},
//     {route:"aboutus", content:"About Us Page"},
//     {route:"contactus", content:"Contactus page"}
// ];

// http.createServer(function(request, response){


//     let lookup = path.basename(decodeURI(request.url));

//     console.log(lookup);
//    for(i=0;i<pages.length;i++){
//        if(pages[i].route == lookup){
//         response.writeHead(200, {'Content-Type':'text/html'});
//         response.end(`<h1>${pages[i].content}</h1>`);
//        }
//    }
//    response.writeHead(404, {'Content-Type':'text/html'});
//    response.end("<h1>Page Found</h1>");
    
// }).listen(8080);

const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const ejs = require('ejs');

app.use((req, res, next)=>{
    console.log("Im Middleware function");
    next();
})
app.set('view engine', 'ejs');
app.use('/my',express.static('images'));
app.use('/personal',express.static('public'));


let validate = (req, res, next)=>{
    if(req.query.name == 'Naveen'){
        next()
    }else{
        res.send("Unauthorised User")
    }
}

//app.use(validate);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

app.get('/home', (req, res)=>{
    res.render('index',{data:{heading:req.query.name}});
})

app.get('/welcome', validate, (req, res)=>{
    let name = req.query.name;
    res.send(`Welcome  " ${name}  " to Dashboard`);
})

app.get('/travelling/:from/:to', (req, res)=>{
    res.send(`Travelling from : ${req.params.from} to ${req.params.to}`)
})

app.post('/formdata', (req, res)=>{
    console.log(req.body)
    res.send(req.body);
})

app.listen(8080, ()=>{
    console.log('Server Started on Port 8080');
});






