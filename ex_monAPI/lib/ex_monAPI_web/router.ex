defmodule ExMonAPIWeb.Router do
  use ExMonAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExMonAPIWeb do
    pipe_through :api
    resources "/trainers", TrainersController, only: [:create, :show, :update, :delete]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ExMonAPIWeb.Telemetry
    end
  end

  scope "/", ExMonAPIWeb do
    pipe_through :api

    get "/", WelcomeController, :index

  end
end
