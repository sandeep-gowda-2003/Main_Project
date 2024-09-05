const asynchandler = require("express-async-handler");
const User = require("../models/userModel");
const generateToken = require("../config/generateToken");

const registerUser = asynchandler(async (req, resp) => {
  const { name, email, password, pic } = req.body;
  if (!name || !email || !password) {
    resp.status(400);
    throw new Error("Please Enter all fields");
  }
  const userExists = await User.findOne({ email });
  if (userExists) {
    resp.status(400);
    console.log(userExists);
    throw new Error("User already Exists");
  }
  const user = await User.create({
    name,
    email,
    password,
    pic:
      pic ||
      "https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg",
  });
  if (user) {
    resp.status(200).json({
      _id: user._id,
      email: user.email,
      name: user.name,
      pic: user.pic,
      token: generateToken(user._id),
    });
  } else {
    resp.status(400);
    throw new Error("Failed to create  the user");
  }
});

const authUser = asynchandler(async (req, resp) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email });
  if (user && (await user.matchPassword(password))) {
    resp.json({
      _id: user._id,
      name: user.name,
      email: user.email,
      pic: user.pic,
      token: generateToken(user._id),
    });
  } else {
    resp.status(404);
    throw new Error("Invalid Email or Password");
  }
});

//  /api/user?search=sandy
const allUsers = asynchandler(async (req, resp) => {
  let keyword = req.query;
  console.log(keyword);
  keyword = req.query.search
    ? {
        $or: [
          { name: { $regex: req.query.search, $options: "i" } },
          { email: { $regex: req.query.search, $options: "i" } },
        ],
      }
    : {};
  var users = await User.find(keyword).find({ _id: { $ne: req.user._id } });
  resp.send(users);
});

module.exports = { registerUser, authUser, allUsers };
