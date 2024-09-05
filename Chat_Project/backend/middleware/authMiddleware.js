const AsyncHandler = require("express-async-handler");
const jwt = require("jsonwebtoken");
const User = require("../models/userModel");

const protect = AsyncHandler(async (req, resp, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    try {
      token = req.headers.authorization.split(" ")[1];
      const decode = jwt.verify(token, process.env.JWT_SECRET);
      console.log("decode", decode);
      req.user = await User.findById(decode.id).select("-password");
      next();
    } catch (error) {
      resp.status(401);
      throw new Error("not authorized, token failed");
    }
  }
  if (!token) {
    resp.status(401);
    throw new Error("not authorized, no token ");
  }
});

module.exports = { protect };
