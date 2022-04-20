import  { extendTheme } from '@chakra-ui/react'

export const theme = extendTheme({
    fonts: {
        heading: 'Roboto',
        body: 'Roboto'
      },
      styles: {
        global: {
          body: {
            bg: "whitealpha.500",
            color: "blackAlpha.700",
          },
        },
      },
})