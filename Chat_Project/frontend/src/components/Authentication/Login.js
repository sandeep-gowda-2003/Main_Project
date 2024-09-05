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

const Login = () => {
  const toast = useToast();
  // using vstack from chakra ui
  const [show, setShow] = useState(false);
  const [password, setPassword] = useState([]);
  const [email, setEmail] = useState([]);
  const [loading, setLoading] = useState(false);
  const history = useHistory();

  const handleClick = () => setShow(!show);

  const submitHandler = async () => {
    setLoading(true);
    if (!email || !password) {
      toast({
        title: "Please fill credentials",
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
        "/api/user/login",
        { email: email, password: password },
        config
      );
      toast({
        title: "Logged in Successfully",
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
    <VStack>
      <FormControl id="email" isRequired>
        <FormLabel>Email:</FormLabel>
        <Input
          type="email"
          placeholder="Enter your email"
          onChange={(c) => setEmail(c.target.value)}
          value={email}
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
            value={password}
          />
          <InputRightElement width="4.5rem">
            <Button h="1.75rem" size="sm" onClick={handleClick}>
              {show ? "Hide" : "Show"}
            </Button>
          </InputRightElement>
        </InputGroup>
      </FormControl>
      <Button
        colorScheme="teal"
        variant="outline"
        width={"100%"}
        onClick={submitHandler}
        isLoading={loading}
      >
        Login
      </Button>

      <Button
        colorScheme="red"
        variant="outline"
        width={"100%"}
        onClick={() => {
          setEmail("guest@gmail.com");
          setPassword("123456");
        }}
      >
        Guest User Credentials
      </Button>
    </VStack>
  );
};

export default Login;
