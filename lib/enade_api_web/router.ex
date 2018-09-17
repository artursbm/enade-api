defmodule EnadeAPIWeb.Router do
  use EnadeAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EnadeAPIWeb do
    pipe_through :api

    scope "/institutions" do
      resources "/", InstitutionController, except: [:new, :edit]
      get "/:id/courses", CourseController, :show_list
    end

    scope "/courses" do
      resources "/", CourseController, except: [:new, :edit]
      get "/:id", CourseController, :show
    end

  end
end
