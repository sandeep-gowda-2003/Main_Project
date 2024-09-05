import React, { useEffect } from "react";
import {
  Box,
  Container,
  Tab,
  TabList,
  TabPanel,
  TabPanels,
  Tabs,
  Text,
} from "@chakra-ui/react";

import Login from "../components/Authentication/Login";
import Signup from "../components/Authentication/Signup";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";
const HomePage = () => {
  const history = useHistory();

  useEffect(() => {
    const userInfo = JSON.parse(localStorage.getItem("userInfo"));

    if (userInfo) history.push("/");
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [history]);

  return (
    <Container maxW={"xl"} centerContent>
      <Box
        display={"flex"}
        padding={3}
        justifyContent={"center"}
        bg={"rgba(200, 255, 250, 0.7)"}
        borderRadius={"20px"}
        width={"100%"}
      >
        <Text fontSize="4xl" fontFamily={"cursive"} color="black">
          Talk
        </Text>
      </Box>
      <Box
        // padding={5}
        marginTop={"10%"}
        display={"flex"}
        justifyContent={"center"}
        borderRadius={10}
        backgroundColor={"rgba(255, 255, 255, 0.9)"}
        width={"100%"}
      >
        {/* using tabs in chakra ui */}
        <Tabs variant="soft-rounded" width={"100%"} colorScheme="green">
          <TabList mb={"1em"}>
            <Tab width={"50%"}>Login</Tab>
            <Tab width={"50%"}>Sign Up</Tab>
          </TabList>
          <TabPanels>
            <TabPanel>
              <Login />
            </TabPanel>
            <TabPanel>
              <Signup />
            </TabPanel>
          </TabPanels>
        </Tabs>
      </Box>
    </Container>
  );
};

export default HomePage;
