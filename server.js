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

app.get('/', (req, res)=>{
    res.send('<h1>Welcome to Express</h1>');
})

app.get('/aboutus', (req, res)=>{
    res.send("<h1>About Us page</h1>")
})

app.get('/contactus', (req, res)=>{
    res.send('<h1>Contact Us Page</h1>')
})

app.listen(8080, ()=>{
    console.log('Server Started on Port 8080');
});






