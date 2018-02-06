
const mongoose = require('mongoose');
let Schema = mongoose.Schema;
 
let User = new Schema({
    username: String,
    password: {type: String, required: true},
    email : {type:String, required:true, unique:true},
    mobile: {type: Number, unique: true}
});

let userdetails = mongoose.model('user', User);

module.exports = userdetails;
