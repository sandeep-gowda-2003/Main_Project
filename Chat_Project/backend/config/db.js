const mongoose = require("mongoose");
const mongodb = require("mongodb");
const connectDB = async () => {
  try {
    const conn = await mongoose.connect(process.env.MONGO_URI);
    console.log("MONGODB CONNECTED" + conn.connection.host);
  } catch (error) {
    console.log("Error: " + error.message);
    process.exit(1);
  }
};
module.exports = connectDB;
