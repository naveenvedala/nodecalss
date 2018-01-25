const fs = require('fs');

// let data = fs.readFileSync('/Users/naveen/Desktop/class3/test10Mb.db');
// fs.unlink('/Users/naveen/Desktop/class3/test10Mb.db');

// console.log(data);

// fs.readFile('/Users/naveen/Desktop/class3/test10Mb.db', (err, data)=>{
//     if(err){
//         console.log(err)
//     }
//     console.log(data.toString());
// })

// fs.unlink('/Users/naveen/Desktop/class3/test10Mb.db');


const events = require('events');
var eventEmitter = new events.EventEmitter(); 

let Greet = () => {
    console.log("Hello World");
};

let Hello = () =>{
    console.log("How are you")
}

let bye = () =>{
    console.log("Bye, See you later")
}

eventEmitter.on('greet', Greet);
eventEmitter.on('greet', Hello);

eventEmitter.on('bye', bye);

// eventEmitter.emit('greet');

// eventEmitter.removeListener('greet', Hello);
// eventEmitter.emit('greet');


eventEmitter.emit('bye');

eventEmitter.emit('bye');

eventEmitter.emit('bye');

eventEmitter.once('hi', Hello);

eventEmitter.emit('hi');
eventEmitter.emit('hi');
eventEmitter.emit('hi');







let comein = () =>{
    console.log("Please come")
}

eventEmitter.addListener('welcome', comein);

// eventEmitter.emit('welcome');

