import { Box, Button, Flex, Image, Text, VStack } from "@chakra-ui/react";
import Head from "next/head";
import Link from "next/link";

export default function Home() {
  return (
    <Flex alignItems="center" justifyContent="center">
      <VStack paddingTop={10}>
        <Box boxSize="sm">
          <Image
            borderRadius="full"
            src="https://telecoms.com/wp-content/blogs.dir/1/files/2019/07/NTT-ltd-logo.jpg"
            alt="NttLogo"
          />
        </Box>
        <Link href="/swileForm">
          <Button as="a" colorScheme="blue">
            Swile Form
          </Button>
        </Link>
        <Text>Exemplo de landing page NTTLab</Text>
      </VStack>
    </Flex>
  );
}
