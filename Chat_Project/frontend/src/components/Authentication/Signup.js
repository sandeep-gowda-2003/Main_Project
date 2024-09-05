import {
  Button,
  FormControl,
  FormLabel,
  Input,
  InputGroup,
  InputRightElement,
  VStack,
  useToast,
} from "@chakra-ui/react";
import axios from "axios";
import React, { useState } from "react";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";

const Signup = () => {
  const toast = useToast();
  const [name, setName] = useState(false);
  const [email, setEmail] = useState([]);
  const [password, setPassword] = useState([]);
  const [confirmPass, setConfirmPass] = useState([]);
  const [pic, setPic] = useState(null);
  const [show, setShow] = useState([]);
  const [loading, setLoading] = useState(false);

  const handleClick = () => setShow(!show);
  const history = useHistory();

  const postDetails = (pics) => {
    setLoading(true);
    if (pics === undefined) {
      toast({
        title: "Please select an image!",
        // description: "We've created your account for you.",
        status: "warning",
        duration: 5000,
        position: "bottom",
        isClosable: true,
      });
      return;
    }
    if (pics.type === "image/jpeg" || pics.type === "image/png") {
      const data = new FormData();
      data.append("file", pics);
      data.append("upload_preset", "chat-app");
      data.append("cloud_name", "dncfhxxn7");
      fetch("https://api.cloudinary.com/v1_1/dncfhxxn7/image/upload", {
        method: "post",
        body: data,
      })
        .then((res) => res.json())
        .then((data) => {
          console.log(data);
          setPic(data.url.toString());
          setLoading(false);
        })
        .catch((err) => {
          console.log(err);
          setLoading(false);
        });
    } else {
      toast({
        title: "Please select an image!",
        // description: "We've created your account for you.",
        status: "warning",
        duration: 5000,
        position: "bottom",
        isClosable: true,
      });
    }
  };

  const submitHandler = async () => {
    setLoading(true);
    if (!name || !email || !password || !confirmPass) {
      toast({
        title: "Please fill all the fields!",
        // description: "We've created your account for you.",
        status: "warning",
        duration: 5000,
        position: "bottom",
        isClosable: true,
      });
      return;
    }
    if (password !== confirmPass) {
      toast({
        title: "Password does not match",
        // description: "We've created your account for you.",
        status: "warning",
        duration: 5000,
        position: "bottom",
        isClosable: true,
      });
      return;
    }
    try {
      const config = {
        headers: {
          "Content-type": "application/json",
        },
      };
      const { data } = await axios.post(
        "/api/user",
        { name: name, email: email, password: password, pic: pic },
        config
      );
      toast({
        title: "Registration successfull",
        // description: "We've created your account for you.",
        status: "success",
        duration: 5000,
        position: "bottom",
        isClosable: true,
      });
      localStorage.setItem("userInfo", JSON.stringify(data));
      setLoading(false);
      history.push("/chats");
      return;
    } catch (err) {
      toast({
        title: "Error Occured!",
        description: err.message,
        status: "error",
        duration: 5000,
        position: "bottom",
        isClosable: true,
      });

      setLoading(false);

      return;
    }
  };

  return (
    <VStack spacing={10}>
      <FormControl id="firstName" isRequired>
        <FormLabel>NAME:</FormLabel>
        <Input
          type="text"
          placeholder="Enter your name"
          onChange={(e) => setName(e.target.value)}
        ></Input>
      </FormControl>

      <FormControl id="email" isRequired>
        <FormLabel>Email:</FormLabel>
        <Input
          type="text"
          placeholder="Enter your Email"
          onChange={(e) => setEmail(e.target.value)}
        ></Input>
      </FormControl>

      <FormControl id="password" isRequired>
        <FormLabel>Password:</FormLabel>
        <InputGroup size="md">
          <Input
            pr="4.5rem"
            type={show ? "text" : "password"}
            placeholder="Enter password"
            onChange={(e) => setPassword(e.target.value)}
          />
          <InputRightElement width="4.5rem">
            <Button h="1.75rem" size="sm" onClick={handleClick}>
              {show ? "Hide" : "Show"}
            </Button>
          </InputRightElement>
        </InputGroup>
      </FormControl>

      <FormControl id="confirm_pass" isRequired>
        <FormLabel>Confirm Password:</FormLabel>
        <Input
          type="password"
          placeholder="Confirm your Password"
          onChange={(e) => setConfirmPass(e.target.value)}
        ></Input>
      </FormControl>

      <FormControl id="pic" isRequired>
        <FormLabel>Upload your Picture:</FormLabel>
        <Input
          type="file"
          p={1.5}
          accept="image/*"
          onChange={(e) => postDetails(e.target.files[0])}
        ></Input>
      </FormControl>
      <Button
        colorScheme="teal"
        variant="outline"
        width={"100%"}
        onClick={submitHandler}
        isLoading={loading}
      >
        Sign Up
      </Button>
    </VStack>
  );
};

export default Signup;
