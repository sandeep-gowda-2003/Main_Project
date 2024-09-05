import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import { ChakraProvider } from "@chakra-ui/react";
import { BrowserRouter } from "react-router-dom";
import ChatProvider from "./Context/ChatProvider";

// npx create-react-app frontend this is requirred to create a new react js app
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <ChatProvider>
    {/* npm i react-router-dom@5 this should be installed to use router*/}
    <BrowserRouter>
      <ChakraProvider>
        <App />
      </ChakraProvider>
    </BrowserRouter>
  </ChatProvider>
);
