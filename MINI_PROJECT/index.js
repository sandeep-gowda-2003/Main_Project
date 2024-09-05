var express = require('express');
const axios = require('axios');
var session = require('express-session');
var ejs = require('ejs');
var con = require('./database')
var mysql = require('mysql');
var bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const uniqid = require('uniqid');
const SHA256 = require('sha256');
const x = require('uniqid');

var app = express();

app.use(session({
    secret: 'This is secret',
    saveUninitialized: false,
    resave: false,
    cookie: {
        sameSite: "strict",
        maxAge: 1000 * 60 * 60
    }

}))
app.use(cookieParser())

app.set('view engine', 'ejs')

app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static('public/static'))


var alert_m = ''
var login_err = ''



//function for authentication
function isAuthenticated(req) {
    if (req.session.user) {
        return true
    }
    else {
        return false
    }
}



//THIS IS ROOT PAGE
app.get('/', (req, resp) => {

    // IF YOU DONT USE THE EXPORT MODULE FUNCTION THEN USE LIKE THIS

    //CREATING CONNECTION
    // const con = mysql.createConnection({
    //     host: "127.0.0.1",
    //     user: "root",
    //     password: "",
    //     database: "Sample1",
    //     port: 3307
    // })

    //SENDING DATA TO DATABASE
    // con.connect((err) => {
    //     if (err) {
    //         console.log("connection failed")
    //         resp.redirect('/register')
    //     }
    //     else {}
    // });          



    //QUERYING THE DATABASE
    con.query('SELECT * FROM products WHERE (collection="home_best_trending" OR collection="best_deals_2" OR collection="best_deals")', function (err, result) {
        if (isAuthenticated(req)) {
            if (err) {
                console.log('Failed to query:', err)
            }
            else {
                // console.log(result)
                resp.render('home_pages/user', { result });
            }
        }
        else {
            resp.render('home_pages/home', { result });
        }
    })
})

//THIS IS USER LOGGED IN HOME PAGE
app.get('/user', (req, resp) => {
    // console.log(req.session.user.id)
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products', (err, result) => {
            resp.render('home_pages/user.ejs', { result })
        })
    }
    else {
        resp.status(401).redirect('/login')
    }
})



//LOGIN PAGE RENDERING
app.get('/login', (req, resp) => {
    resp.render('sign_in_pages/login.ejs', { login_err })
})



//SIGNUP PAGE RENDERING
app.get('/register', (req, resp) => {
    resp.render('sign_in_pages/register.ejs', { alert_m })
})





//SEARCHING IN SEARCH BAR
app.post('/search_bar', (req, resp) => {
    let search_bar = req.body.SearchBar;
    console.log(search_bar)
    if (search_bar.toLowerCase() == "television") {
        search_bar = 'tv'
    }
    else if (search_bar.toLowerCase() == "waching machine") {
        search_bar = 'wm'
    }
    else if (search_bar.toLowerCase() == "air conditioner") {
        search_bar = 'ac'
    }
    else if (search_bar.toLowerCase() == "women dress") {
        search_bar = 'women'
    }
    else if (search_bar.toLowerCase() == "men dress") {
        search_bar = 'men'
    }
    else if (search_bar.toLowerCase() == "kids dress") {
        search_bar = 'kids'
    }
    con.query(`SELECT category FROM products WHERE sub_category='${search_bar}'`, (err, resu) => {
        if (err) {
            resp.status(404)
        }
        else if (resu.length > 0) {
            console.log("It is a sub_category item")
            con.query(`SELECT * FROM products WHERE category='${resu[0].category}'`, (err, response) => {
                if (err) {
                    resp.status(404).send('PAGE NOT FOUND')
                }
                else if (response.length > 0) {
                    // console.log(response)
                    resp.render('products_pages/common_products.ejs', { result: response })
                }
                else {
                    resp.status(404).send('PAGE NOT FOUND')

                }
            })
        }
        else {
            console.log("It is not a sub_category item")
            con.query(`SELECT * FROM products WHERE category='${search_bar}'`, (err, response) => {
                if (err) {
                    resp.status(404)
                }
                else if (response.length == 0) {
                    resp.status(404).send("PAGE NOT FOUND")
                }
                else {
                    // console.log(response)
                    resp.render('products_pages/common_products.ejs', { result: response })
                }
            })
        }
    })
})


app.get('/profile', (req, resp) => {
    con.query(`SELECT * FROM Users WHERE id='${req.session.user.id}'`, (err, result) => {
        if (err) {
            console.log(err)
        }
        else {
            resp.render('additional_pages/my_profile.ejs', { user: result[0] })
        }
    })
})


app.get('/verify_page', (req, resp) => {
    resp.render('additional_pages/verify.ejs')
})

// verify user
app.post('/verify', (req, res) => {
    const { name, password } = req.body;
    const query = `SELECT id, name, password FROM Users WHERE name = '${name}' AND password = '${password}'`;

    con.query(query, (err, result) => {
        if (err) {
            console.log('Error in database query:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (result.length > 0) {
                // User found, redirect to next page
                res.redirect('/upload_products')
            } else {
                // User not found or incorrect credentials
                res.status(401).send('Invalid credentials');
            }
        }
    });
});
app.get('/verifypage', (req, res) => {
    res.render("additional_pages/verify.ejs")
})


app.get('/Appliances', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Appliances"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/Electronics', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Electronics"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})


app.get('/ac', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="ac"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/fridge', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="fridge"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/tv', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="tv"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/wm', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="wm"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/mobile', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Mobile"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/support', (req, resp) => {
    if (isAuthenticated(req)) {
        if (err) {
            console.log(err)
        }
        else {
            resp.render('additional_pages/support.ejs', { result: result })
        }
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/kids', (req, resp) => {
    if (isAuthenticated(req)) {
        // console.log("Kids")
        con.query('SELECT * FROM products WHERE category="Kids"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/beauty', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Beauty"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }

})
app.get('/men_fashion', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Men"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.post('/men_fashion', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Men"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})

app.get('/women_fashion', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE category="Women"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/headphone', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="headphones"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/camera', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="camera"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/laptops', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="laptops"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/printer', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="printer"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/speaker', (req, resp) => {
    if (isAuthenticated(req)) {
        con.query('SELECT * FROM products WHERE sub_category="speaker"', (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                // console.log(result)
                resp.render('products_pages/common_products.ejs', { result: result })
            }
        })
    }
    else {
        resp.redirect('/login')
    }
})
app.get('/grocery', (req, resp) => {
    if (isAuthenticated(req)) {
        resp.render('products_pages/common_products.ejs')
    }
})
// app.get('/aboutus', (req, resp) => {
//     resp.render('products_pages/furniture.ejs')
// })

app.post('/single_product', (req, resp) => {
    var id = req.body.item_id
    if (isAuthenticated(req)) {
        con.query(`SELECT * FROM products WHERE product_id='${id}'`, (err, result) => {
            if (err) {
                console.log(err)
            }
            else {
                resp.render('products_pages/one_product.ejs', { result: result[0] })
            }
        })
    }
    else {
        resp.render('/login')
    }
})


app.post('/review', (req, resp) => {
    let details = [[req.session.user.id, req.session.user.name, req.body.feedback]]
    con.query(`INSERT INTO Review(user_id,user_name,feedback) VALUES ?`, [details], (err, result) => {
        if (err) {
            console.log(err)
        }
        else {
            resp.redirect('/user')
        }
    })
})

app.post('/subscribe', (req, resp) => {
    let details = [[req.body.email]]
    con.query(`INSERT INTO subscribe(email) VALUES ?`, [details], (err, result) => {
        if (err) {
            console.log(err)
        }
        if (isAuthenticated(req)) {
            resp.redirect('/user')
        }
        else {
            resp.redirect('/')
        }
    })
})







app.get('/cart', async (req, resp) => {
    let prod = []
    if (isAuthenticated(req)) {
        function order_details(k) {
            return new Promise((resolve, reject) => {
                con.query(`SELECT * FROM cart WHERE user_id='${k}'`, (err, respo) => {
                    respo.forEach((element) => {
                        prod.push(element.order_id)
                        // console.log(prod)
                    })
                    if (prod.length == 0) {
                        console.log('rejects')
                        return resolve(prod)
                    }
                    else {
                        return resolve(prod)
                    }
                })
            })
        }
        function product_details(k) {
            return new Promise((resolve, reject) => {
                con.query(`SELECT * FROM products WHERE product_id IN (?)`, [k], (err, respo) => {
                    if (respo == undefined) {
                        console.log("not resolved")
                        return reject(respo)
                    }
                    else {
                        console.log("resolved")
                        return resolve(respo)
                    }
                })
            })
        }

        async function main_() {
            try {
                var sum = 0
                var product = await order_details(req.session.user.id)
                if (product != 0) {
                    var resu = await product_details(product)
                    if (resu.length != 0) {
                        resu.forEach((element) => {
                            // if(sale_price)
                            sum += element.sale_price
                        })
                        resp.render('products_pages/addtocart.ejs', { result: resu, sum: sum })
                    }
                    else {
                        resp.send("HII")
                    }
                } else {
                    resp.render('products_pages/addtocart.ejs', { result: [], sum: 0 })

                }
            }
            catch (err) {
                console.log(err)
            }
        }
        console.log(1)
        main_()
    }
    else {
        resp.redirect('/login')
    }
})




//CREATING USER ACCOUNT
app.post('/signup_submit', (req, resp) => {
    if (req.body.confirmPassword != req.body.password) {
        console.log("PASSWORD NOT MATCHED")
        resp.render('sign_in_pages/register.ejs', { alert_m: "password not matched" })
    }
    else {
        var name = req.body.fullname
        var password = req.body.password
        var email = req.body.email
        var ph = req.body.phoneNumber
        var addr = req.body.address
        console.log(req.body);
        var query = "INSERT INTO Users(name,email,password,mobile_no,address) VALUES ?";
        var values = [
            [name, email, password, ph, addr]
        ];
        con.query(query, [values], (err, result) => {
            if (err) {
                console.log("data not sent", err);
                resp.render('sign_in_pages/register.ejs', { alert_m: "E-mail has already been registered" })

            }
            else {
                console.log("data sent")
                resp.render('sign_in_pages/login.ejs', { login_err })
            }
        })
    }
})



//CHECK FOR USER ACCOUNT
app.post('/login_check', (req, resp) => {
    var email_user = req.body.email
    var password_user = req.body.password

    con.query(`SELECT * from Users where email='${email_user}'`, (err, result) => {
        login_err = ''
        if (err) {
            console.log("error while querying", err)
        }
        else {
            let cart_temp = []
            let hr = new Date().getHours()
            let min = new Date().getMinutes()
            let sec = new Date().getSeconds()
            let time_stamp = `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDate()} ${hr}:${min}:${sec}`
            if (result.length > 0) {
                if (result[0]['password'] == password_user) {
                    req.session.user = result[0]

                    console.log(req.session.user)
                    console.log("SUCCESSFULLY LOGGED IN", req.session.user.name)

                    con.query(`SELECT * from cart where user_id='${req.session.user.id}'`, (err, result) => {
                        if (err) {
                            console.log("did not get cart details of user", err)
                            resp.redirect('/user')
                        }
                        else {
                            let details = [[req.session.user.id, req.session.user.name, 'LOGIN', time_stamp]]
                            con.query(`INSERT INTO LOGIN(user_id,user_name,status,time_out) VALUES ?`, [details], (err, result) => {
                                if (err) {
                                    console.log(err)
                                }

                            })
                            result.forEach((element) => {
                                cart_temp.push(element.order_id)
                            })
                            console.log("fetched  cart details of user successfully", cart_temp)
                            req.session.cart = cart_temp;
                            req.session.save((err => {
                                if (err) req.send(404);
                            }))
                            resp.redirect('/user')
                        }
                    })
                }
                else {
                    console.log("WRONG PASSWORD")
                    resp.render('sign_in_pages/login.ejs', { login_err: "WRONG PASSWORD" })
                }
            }
            else {
                console.log("WRONG Email")
                resp.render('sign_in_pages/login.ejs', { login_err: "WRONG Email" })
            }
        }
    })

})



app.get('/logout', (req, resp) => {
    if (req.session.user) {
        // req.session.user = null;
        // req.session.save((err) => {
        //     if (err) resp.send(404)
        // })
        // req.session.regenerate((err) => {
        //     if (err){
        //         resp.status(404)
        //     }
        //     else {
        //         console.log('logout successful')
        //         resp.redirect('/')
        //     }
        // })
        let name = req.session.user.name
        let id = req.session.user.id
        console.log(req.session.user.name)
        req.session.destroy(function (err) {
            if (err) {
                console.log("cannot log out")
                resp.redirect('/')
            }
            else {
                console.log('logout successful Destruction')
                let hr = new Date().getHours()
                let min = new Date().getMinutes()
                let sec = new Date().getSeconds()
                let time_stamp = `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDate()} ${hr}:${min}:${sec}`
                let details = [[id, name, 'LOGOUT', time_stamp]]
                con.query(`INSERT INTO LOGOUT(user_id,user_name,status,time_out) VALUES ?`, [details], (err, result) => {
                    if (err) {
                        console.log(err)
                    }

                })
                resp.redirect('/')
            }
        });
    }
    else {
        resp.send("user already logged out")
    }

})



//seller register
app.get('/seller_register', (req, resp) => {
    if (isAuthenticated(req)) {
        resp.render('additional_pages/seller_register.ejs', { alert_m })
    }
    else {
        resp.redirect('/login')
    }
})



//seller signin
app.post('/seller_signin_check', (req, resp) => {
    var email_user = req.body.email
    var password_user = req.body.password

    con.query(`SELECT * from sellers where email='${email_user}'`, (err, result) => {
        login_err = ''
        if (err) {
            console.log("error while querying", err)
        }
        else {
            if (result.length > 0) {
                if (result[0]['password'] == password_user) {
                    req.session.seller = result[0]

                    console.log(req.session.seller)

                    console.log("SUCCESSFULLY LOGGED IN", req.session.seller.name)
                    resp.render('products_pages/upload_products.ejs')
                }
                else {
                    console.log("WRONG PASSWORD")
                    resp.render('sign_in_pages/login.ejs', { login_err: "WRONG PASSWORD" })
                }
            }
            else {
                console.log("WRONG Email")
                resp.render('sign_in_pages/login.ejs', { login_err: "WRONG Email" })
            }
        }
    })
})


app.get('/seller_signin', (req, resp) => {
    if (isAuthenticated(req)) {
        resp.render('additional_pages/seller_login.ejs', { login_err })
    }
    else {
        resp.redirect('/login')
    }
})



//SELLER SIGNUP


//CREATING USER ACCOUNT
app.post('/seller_signup', (req, resp) => {
    console.log(req.body)
    if (req.body.confirmPassword != req.body.password) {
        console.log("PASSWORD NOT MATCHED")
        resp.render('sign_in_pages/register.ejs', { alert_m: "password not matched" })
    }
    if (req.body.acc != req.body.confirmacc) {
        console.log("ACCOUNT NUMBER NOT MATCHED")
        resp.render('sign_in_pages/register.ejs', { alert_m: "account number not matched" })
    }
    else {
        console.log(req.session.user)
        var name = req.body.fullname
        var password = req.body.password
        var email = req.session.user.email
        var ph = req.body.phoneNumber
        var addr = req.body.address
        var account = req.body.acc
        var aadhar = req.body.addhar
        var pan = req.body.pan

        console.log(req.body);
        var query = "INSERT INTO sellers(name,email,password,mobile_no,address,account_no,pan_no,aadhar_no) VALUES ?";
        var values = [
            [name, email, password, ph, addr, account, pan, aadhar]
        ];
        con.query(query, [values], (err, result) => {
            if (err) {
                console.log("data not sent", err);
                resp.render('sign_in_pages/register.ejs', { alert_m: "PLEASE TRY AFTER SOME TIME" })

            }
            else {
                console.log("data sent")
                resp.render('additional_pages/seller_login.ejs', { login_err })
            }
        })
    }
})










// ADDING ITEMS TO CART USING REQUEST OR GET METHOD


// ADDING ITEMS TO CART USING POST METHOD

app.post('/add_to_cart', (req, resp) => {
    if(isAuthenticated(req)){
    console.log("In", req.session.user.id, 'item', req.body.item_id)
    function Productalreadyadded(cart, item_id) {
        var c = 0;
        cart.forEach(element => {
            if (element == item_id) {
                c = 1;
            }
        });
        if (c != 0) {
            return true
        }
        else {
            return false
        }
    }
    let products = [req.body.item_id]
    if (req.session.user) {
        // console.log("inside")
        if (req.session.cart.length > 0) {
            cart = req.session.cart
            if (Productalreadyadded(cart, req.body.item_id)) {
                console.log("PRODUCT ALREADY ADDED TO CART")
                resp.redirect('/user')
            }
            else {
                req.session.cart.push(products)
                query = "INSERT INTO cart(user_id,order_id,quantity) VALUES?";
                values = [
                    [req.session.user.id, req.body.item_id, 1]
                ]
                con.query(query, [values], (err, result) => {
                    if (err) {
                        console.log("NOT ADDED TO CART", err)
                    }
                    else {
                        // con.query("SELECT Users.name FROM cart INNER JOIN Users ON cart.user_id=Users.id",(err,result)=>{
                        //     if(err)
                        //     {
                        //         console.log("NOT RECEIVED DATA:",err)
                        //     }
                        //     else{
                        //     console.log(result)
                        //     }
                        // });
                        console.log("ADDED TO EXISTING CART SUCCESSFULLY BY POST")
                        resp.redirect('/user')
                    }
                })
            }
        }
        else {
            req.session.cart = [products]
            query = "INSERT INTO cart(user_id,order_id,quantity) VALUES?";
            values = [
                [req.session.user.id, req.body.item_id, 1]
            ]
            con.query(query, [values], (err, result) => {
                if (err) {
                    console.log("NOT ADDED TO CART2", err)
                    resp.redirect('/user')

                }
                else {
                    console.log("ADDED TO NEW CART SUCCESSFULLY BY POST", result)
                    resp.redirect('/user')
                }
            })
        }
    }
    else {
        resp.redirect('/login')
    }
}
else{
resp.redirect('/login')
}
})





//remove any product from cart
app.post('/remove_product', ((req, resp) => {
    order_id = req.body.product_id
    con.query(`DELETE FROM cart WHERE user_id='${req.session.user.id}' AND order_id='${order_id}'`, (err, result) => {
        if (err) {
            console.log(err)
        }
        else {
            console.log('ITEM DELETED SUCCESSFULLY', order_id)
            resp.redirect('/cart')
        }
    })
}))













// SELL OR UPLOADING PRODUCTS
app.post('/upload_products', (req, resp) => {
    if (isAuthenticated(req)) {
        let hr = new Date().getHours()
        let min = new Date().getMinutes()
        let sec = new Date().getSeconds()
        let time_stamp = `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDate()} ${hr}:${min}:${sec}`
        if (req.session.seller) {
            console.log(req.body)
            query = "INSERT INTO products(name,description,price,sale_price,quantity,image,rating,category,sub_category,collection) VALUES?";
            values = [
                [req.body.name, req.body.description, req.body.price, req.body.sale_price, req.body.quantity, req.body.image, req.body.rate, req.body.category, req.body.sub_category, req.body.collection]
            ]
            con.query(query, [values], (err, result) => {
                if (err) {
                    console.log("Products failed add into inventory", err)
                    resp.redirect('/upload_products')
                }
                else {
                    values = [[req.session.seller.seller_id, req.session.seller.name, req.body.name, req.body.price,req.body.sale_price, time_stamp]]
                    query = "INSERT INTO seller_log(seller_id,seller_name,item_name,item_price,sale_price,time_stamp) VALUES ?"
                    con.query(query, [values], (err, result) => {
                        if (err) {
                            console.log('SELLER LOG NOT UPDATED',err)
                        }
                        else {
                            console.log("SUCCEFULLY UPDATED SELLER LOG")
                        }
                    })
                    console.log("Products Successfully added to inventory")
                    resp.redirect('/user')
                }
            })
        }
    }
})


//Testing purposes for payment integration
const phone_pe_host_url = "https://api-preprod.phonepe.com/apis/pg-sandbox"
const merchant_id = "PGTESTPAYUAT"
const salt_key_index = 1
const salt_key = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399"
let session_tempo

// test payment detail
// “card_number”: “4208585190116667”,
// “card_type”: “CREDIT_CARD”,
// “card_issuer”: “VISA”,
// “expiry_month”: 06,
// “expiry_year”: 2027,
// “cvv”: “508”

// Note: The OTP to be used on the Bank Page: 123456


app.post('/pay', (req, resp) => {

    if (isAuthenticated(req)) {
        session_tempo = req.session
        req.session.order_price = req.body.price
        req.session.order_id = req.body.id
        console.log(req.session.user.id)
        let price = req.session.order_price * 100
        const end_point = "/pg/v1/pay"
        const merchantTransactionId = uniqid()
        var userid = '123';
        const payload = {
            merchantId: merchant_id,
            merchantTransactionId: merchantTransactionId,
            merchantUserId: userid,
            amount: price,  //in paise
            redirectUrl: `http://localhost:8000/redirect-url/${merchantTransactionId}`,
            redirectMode: "REDIRECT",
            mobileNumber: "9999999999",
            paymentInstrument: {
                "type": "PAY_PAGE"
            }
        }

        // SHA256(base64 encoded payload + “/pg/v1/pay” + salt key) + ### + salt index
        const buffer_obj = Buffer.from(JSON.stringify(payload), 'utf-8')
        const buffer_encoded_payload = buffer_obj.toString("base64")
        const x_verify = SHA256(buffer_encoded_payload + end_point + salt_key) + "###" + salt_key_index
        const options = {
            method: 'post',
            url: `${phone_pe_host_url}${end_point}`,
            headers: {
                accept: 'application/json',
                'Content-Type': 'application/json',
                'X-VERIFY': x_verify
            },
            data: {
                'request': buffer_encoded_payload
            }
        };
        axios
            .request(options)
            .then(function (response) {
                console.log(response.data); x
                const url = response.data.data.instrumentResponse.redirectInfo.url
                resp.redirect(url)
            })
            .catch(function (error) {
                console.error(error);
                console.log("u")
                // console.log("this is merchant id",merchantTransactionId)
            });
    }
    else {
        resp.redirect('/login')
    }
})

app.get('/redirect-url/:merchantTransactionId', (req, resp) => {
    console.log(req.session.user)
    const { merchantTransactionId } = req.params
    console.log(merchantTransactionId)
    const x_verify = SHA256(`/pg/v1/status/${merchant_id}/${merchantTransactionId}` + salt_key) + "###" + salt_key_index
    if (merchantTransactionId) {
        const options = {
            method: 'get',
            url: `${phone_pe_host_url}/pg/v1/status/${merchant_id}/${merchantTransactionId}`,
            headers: {
                accept: 'application/json',
                'Content-Type': 'application/json',
                'X-VERIFY': x_verify,
                'X-MERCHANT-ID': merchantTransactionId
            },

        };
        axios
            .request(options)
            .then(function (response) {
                console.log(response.data);
                if (response.data.code === "PAYMENT_SUCCESS") {
                    req.session = session_tempo
                    const values = [[req.session.user.id, req.session.user.name, req.session.order_id, 'BANGALORE', req.session.order_price]]
                    con.query(`INSERT INTO orders(user_id,user_name,order_id,address,price) VALUES ?`, [values], (err, result) => {
                        if (err) {
                            console.log(err)
                        }
                        else {
                            session_tempo = undefined
                            resp.render('additional_pages/payment_successfull.ejs')
                        }
                    })
                }
                else {
                    resp.send('PAYMENT FAILED')
                }
            })
            .catch(function (error) {
                console.error(error);
            });
        // resp.send(merchantTransactionId)
    }
    else {
        resp.send('error')
    }
})

app.get('/return_to_home', (req, resp) => {
    resp.redirect('/')
})


let list_items
app.post('/checkout', (req, resp) => {

    if (isAuthenticated(req)) {

        list_items = req.body.item
        session_tempo = req.session
        req.session.order_price = req.body.price
        req.session.order_id = req.body.id
        console.log(req.session.user.id)
        let price = req.body.sum * 100
        const end_point = "/pg/v1/pay"
        const merchantTransactionId = uniqid()
        var userid = '123';
        const payload = {
            merchantId: merchant_id,
            merchantTransactionId: merchantTransactionId,
            merchantUserId: userid,
            amount: price,  //in paise
            redirectUrl: `http://localhost:8000/cart-redirect-url/${merchantTransactionId}`,
            redirectMode: "REDIRECT",
            mobileNumber: "9999999999",
            paymentInstrument: {
                "type": "PAY_PAGE"
            }
        }

        // SHA256(base64 encoded payload + “/pg/v1/pay” + salt key) + ### + salt index
        const buffer_obj = Buffer.from(JSON.stringify(payload), 'utf-8')
        const buffer_encoded_payload = buffer_obj.toString("base64")
        const x_verify = SHA256(buffer_encoded_payload + end_point + salt_key) + "###" + salt_key_index
        const options = {
            method: 'post',
            url: `${phone_pe_host_url}${end_point}`,
            headers: {
                accept: 'application/json',
                'Content-Type': 'application/json',
                'X-VERIFY': x_verify
            },
            data: {
                'request': buffer_encoded_payload
            }
        };
        axios
            .request(options)
            .then(function (response) {
                console.log(response.data); x
                const url = response.data.data.instrumentResponse.redirectInfo.url
                resp.redirect(url)
            })
            .catch(function (error) {
                console.error(error);
                console.log("u")
                console.log(list_items[1])
                // console.log("this is merchant id",merchantTransactionId)
            });
    }
    else {
        resp.redirect('/login')
    }
})


app.get('/cart-redirect-url/:merchantTransactionId', (req, resp) => {
    console.log(req.session.user)
    const { merchantTransactionId } = req.params
    console.log(merchantTransactionId)
    const x_verify = SHA256(`/pg/v1/status/${merchant_id}/${merchantTransactionId}` + salt_key) + "###" + salt_key_index
    if (merchantTransactionId) {
        const options = {
            method: 'get',
            url: `${phone_pe_host_url}/pg/v1/status/${merchant_id}/${merchantTransactionId}`,
            headers: {
                accept: 'application/json',
                'Content-Type': 'application/json',
                'X-VERIFY': x_verify,
                'X-MERCHANT-ID': merchantTransactionId
            },

        };
        axios
            .request(options)
            .then(function (response) {
                console.log(response.data);
                if (response.data.code === "PAYMENT_SUCCESS") {
                    let error = 0
                    req.session = session_tempo
                    list_items.forEach(function (item_det) {

                        const values = [[req.session.user.id, req.session.user.name, item_det.product_id, 'BANGALORE', item_det.sale_price]]
                        con.query(`INSERT INTO orders(user_id,user_name,order_id,address,price) VALUES ?`, [values], (err, result) => {
                            if (err) {
                                console.log(err)
                            }
                            else {
                                error = 1
                            }
                        })
                    })
                    if (error == 1) {
                        session_tempo = undefined
                        resp.render('additional_pages/payment_successfull.ejs')
                    }
                    else {
                        resp.send('PAYMENT FAILED')
                    }
                }
            })
            .catch(function (error) {
                console.error(error);
            });
        // resp.send(merchantTransactionId)
    }
    else {
        resp.send('error')
    }
})

app.get('/return_to_home', (req, resp) => {
    resp.redirect('/')
})









//ACCOUNT SETTINGS
app.get('/account',(req,resp)=>{
    if(isAuthenticated(req)){
        resp.render('additional_pages/account.ejs',{login_err})
    }
})
app.post('/account_verification',(req,resp)=>{
    if(isAuthenticated(req)){
        if(req.body.password===req.session.user.password){
            login_err=''
            resp.render('additional_pages/account_change.ejs',{login_err})
        }
        else{
            login_err='PASSWORD INCORRECT'
            resp.render('additional_pages/account.ejs',{login_err})
        }
    }
    else{
        resp.redirect('/login')
    }
})

app.post('/account_change_setting',(req,resp)=>{
    if(isAuthenticated(req)){
        query=`UPDATE Users SET name='${req.body.name}',address='${req.body.address}',password='${req.body.password}' WHERE id='${req.session.user.id}'`
        con.query(query,(err,result)=>{
            if(err){
                console.log("not updated account details",err)
            }
            else{
                req.session.user.password=req.body.password
                console.log("updated account successfully")
                resp.redirect('/user')
            }
        })
    }
    else{
        resp.redirect('/login')
    }
})


app.listen(port = 7000, host = '0.0.0.0')