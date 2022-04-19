import {
  Button,
  Flex,
  FormControl,
  FormErrorMessage,
  FormHelperText,
  FormLabel,
  Heading,
  HStack,
  Input,
  Radio,
  RadioGroup,
  RangeSlider,
  RangeSliderFilledTrack,
  RangeSliderThumb,
  RangeSliderTrack,
  Slider,
  SliderFilledTrack,
  SliderMark,
  SliderThumb,
  SliderTrack,
  Stack,
  VStack,
} from "@chakra-ui/react";
import Link from "next/link";
import { FormEvent, useState } from "react";
import { api } from "../services/api";

export default function SwileForme() {
  const [sliderValue, setSliderValue] = useState(50);
  const [emailInput, setEmailInput] = useState("");

  interface SwileFormData {
    emailInput: string;
    sliderValue: number;
  }

  async function handleSubmit(event: FormEvent){
      event.preventDefault();
      const formResponseData: SwileFormData = {
          emailInput,
          sliderValue,
      }

      return await api.post("/bff/swileForm", formResponseData);      
  }

  return (
    <Flex w="100vw" h="100vh" align="center" justify="center">
      <Flex
        as="form"
        width="100%"
        maxWidth={360}
        bg="blackAlpha.600"
        p="8"
        borderRadius={8}
        flexDir="column"
        onSubmit={handleSubmit}
      >
        <Stack spacing="10">
          <FormControl>
            <FormLabel htmlFor="email">E-mail</FormLabel>
            <Input
              name="email"
              type="email"
              value={emailInput}
              onChange={(event) => setEmailInput(event.target.value)}
            />
          </FormControl>
          <FormControl>
            <FormLabel htmlFor="email">
              Satisfação com o período de teste
            </FormLabel>
            <Slider
              aria-label="slider-ex-6"
              onChange={(val) => setSliderValue(val)}
              step={5}
              onChangeEnd={(val) => setSliderValue(val)}
            >
              <SliderMark value={25} mt="1" ml="-2.5" fontSize="sm">
                25%
              </SliderMark>
              <SliderMark value={50} mt="1" ml="-2.5" fontSize="sm">
                50%
              </SliderMark>
              <SliderMark value={75} mt="1" ml="-2.5" fontSize="sm">
                75%
              </SliderMark>
              {/* <SliderMark
                value={sliderValue}
                textAlign="center"
                bg="blue.500"
                color="white"
                mt="-10"
                ml="-5"
                w="12"
              >
                {sliderValue}%
              </SliderMark> */}
              <SliderTrack>
                <SliderFilledTrack />
              </SliderTrack>
              <SliderThumb />
            </Slider>
          </FormControl>
          <Flex>
            <HStack>
              <Button type="submit" colorScheme="blue">
                Enviar
              </Button>
              <Link href="/">
                <Button colorScheme="blue">Voltar</Button>
              </Link>
            </HStack>
          </Flex>
        </Stack>
      </Flex>
    </Flex>
  );
}
