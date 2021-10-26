defmodule Miniproject01Web.Router do
  use Miniproject01Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Miniproject01Web do
    pipe_through :api
    scope "/users" do
      get "/", UserController, :show_one
      get "/:userID", UserController, :show
      post "/", UserController, :create
      put "/:userID", UserController, :update
      delete "/:userID", UserController, :delete
    end

    scope "/workingtimes" do
      get "/", WorkingTimeController, :index
      get "/:id", WorkingTimeController, :show
      post "/:userID", WorkingTimeController, :create
      resources "/", WorkingTimeController, [:update, :delete]
    end

    scope "/clocks" do
      post "/:userID", ClockController, :create
      get "/:userID", ClockController, :show
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]
    end
  end
end
