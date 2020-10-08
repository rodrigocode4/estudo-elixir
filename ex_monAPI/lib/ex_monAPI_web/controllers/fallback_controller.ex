defmodule ExMonAPIWeb.FallbackController do
  use ExMonAPIWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonAPIWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
