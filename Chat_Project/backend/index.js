const express = require("express");
const dotenv = require("dotenv");
const { chats } = require("./data/data");
const connectDB = require("./config/db");
const userRoutes = require("./routes/userRoutes");
const chatRoutes = require("./routes/chatRouter");
const messageRoutes = require("./routes/messageRoutes");
const path = require("path");

const app = express();
dotenv.config();
connectDB();
var port = process.env.PORT || 8000;

app.use(express.json()); //to accept json data
app.use("/api/user", userRoutes);
app.use("/api/chats", chatRoutes);
app.use("/api/message", messageRoutes);

app.get("/", (req, resp) => {
  resp.send("backend");
});
app.get("/api/chat/:id", (req, resp) => {
  const single_chat = chats.find((c) => c._id === req.params.id);
  resp.send(single_chat);
});
app.get("/api/chat", (req, resp) => {
  resp.send(chats);
});

// app.use(notFount);
// app.use(errorHandler);

app.listen(port, console.log("server started on 8000"));

const PORT = 9000;

const server = app.listen(
  PORT,
  console.log(`Server running on PORT ${PORT}...`)
);

const io = require("socket.io")(server, {
  pingTimeout: 60000,
  cors: {
    origin: "http://localhost:3000",
    // credentials: true,
  },
});
// ----------deployment------------
const __dirname1 = path.resolve();

if (process.env.NODE_ENV === "production") {
  app.use(express.static(path.join(__dirname1, "/frontend/build")));

  app.get("*", (req, res) =>
    res.sendFile(path.resolve(__dirname1, "frontend", "build", "index.html"))
  );
} else {
  app.get("/", (req, res) => {
    res.send("API is running..");
  });
}
// ---------------------------------
io.on("connection", (socket) => {
  console.log("Connected to socket.io");
  socket.on("setup", (userData) => {
    socket.join(userData._id);
    socket.emit("connected");
  });

  socket.on("join chat", (room) => {
    socket.join(room);
    console.log("User Joined Room: " + room);
  });
  socket.on("typing", (room) => socket.in(room).emit("typing"));
  socket.on("stop typing", (room) => socket.in(room).emit("stop typing"));

  socket.on("new message", (newMessageRecieved) => {
    var chat = newMessageRecieved.chat;

    if (!chat.users) return console.log("chat.users not defined");

    chat.users.forEach((user) => {
      if (user._id == newMessageRecieved.sender._id) return;

      socket.in(user._id).emit("message recieved", newMessageRecieved);
    });
  });

  socket.off("setup", () => {
    console.log("USER DISCONNECTED");
    socket.leave(userData._id);
  });
});
