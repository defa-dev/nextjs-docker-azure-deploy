import { NextApiRequest, NextApiResponse } from "next";

export default function swileForm(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === "POST") {
    console.log("query: ", req.body);
    res.status(200).send({ message: "Oi" });
  } else {
    res.setHeader("Allow", "POST");
    res.status(405).end("Method not allowed");
  }
}
