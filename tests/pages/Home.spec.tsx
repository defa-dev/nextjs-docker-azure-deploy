import { render, screen, fireEvent, waitFor } from "@testing-library/react";
import createMockRouter from "../test-utils/createMockRouter";
import { RouterContext } from "next/dist/shared/lib/router-context";

import Home from "../../pages";

jest.mock("next/router");

describe("Home page", () => {
  it("renders correctly", () => {
    render(<Home />);

    expect(
      screen.getByText("Exemplo de landing page NTTLab")
    ).toBeInTheDocument();
  });

  let router = createMockRouter({});

  it("redirects to form", async () => {
    render(
      <RouterContext.Provider value={router}>
        <Home />
      </RouterContext.Provider>
    );

    const swileFormButton = screen.getByText("Swile Form");

    waitFor(() => {
      fireEvent.click(swileFormButton);
      expect(router.push).toHaveBeenCalledWith("/swileForm");
    });
  });
});
