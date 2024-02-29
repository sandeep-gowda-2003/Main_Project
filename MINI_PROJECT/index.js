var express=require('express');
var ejs=require('ejs');
var body_parser=require('body-parser');

var app=express();

app.set('view engine','ejs')
app.use(express.urlencoded());

app.use(express.static('public/static'))

app.get('/',(req,resp)=>{
    resp.render('home.ejs')
})

app.get('/login',(req,resp)=>{
    resp.render('login.ejs')
})

app.get('/register',(req,resp)=>{
    resp.render('register.ejs')
})

app.listen(8000);