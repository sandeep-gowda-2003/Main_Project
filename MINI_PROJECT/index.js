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

app.listen(8000);