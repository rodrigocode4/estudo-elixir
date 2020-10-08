defmodule ExMonAPIWeb.TrainersController do
  use ExMonAPIWeb, :controller

  def create(conn, params) do
    params
    |> ExMonAPI.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: trainer)
  end
end
