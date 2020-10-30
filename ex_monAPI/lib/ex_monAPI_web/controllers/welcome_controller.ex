defmodule ExMonAPIWeb.WelcomeController do
  use ExMonAPIWeb, :controller
  alias Jason

  def index(conn, _params) do
    text(conn, "aaa")
  end
end
