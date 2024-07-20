defmodule LiveViewSlaxWeb.ErrorJSONTest do
  use LiveViewSlaxWeb.ConnCase, async: true

  test "renders 404" do
    assert LiveViewSlaxWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LiveViewSlaxWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
