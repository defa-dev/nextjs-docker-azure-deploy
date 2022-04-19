import  { extendTheme } from '@chakra-ui/react'

export const theme = extendTheme({
    fonts: {
        heading: 'Roboto',
        body: 'Roboto'
      },
      styles: {
        global: {
          body: {
            bg: "blackAlpha.500",
            color: "whiteAlpha.700",
          },
        },
      },
})