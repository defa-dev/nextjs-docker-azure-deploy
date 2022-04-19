import { render, screen, fireEvent, waitFor } from "@testing-library/react";

import Home from "../../pages";

jest.mock("next/router");

describe("SwileForm page", () => {
  it("renders correctly", () => {
    render(<Home />);

    expect(
      screen.getByText("Exemplo de landing page NTTLab")
    ).toBeInTheDocument();
  });

});
