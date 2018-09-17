defmodule EnadeAPIWeb.CourseController do
  use EnadeAPIWeb, :controller

  alias EnadeAPI.Enade
  alias EnadeAPI.Enade.Course

  action_fallback EnadeAPIWeb.FallbackController

  def index(conn, _params) do
    courses = Enade.list_courses()
    render(conn, "index.json", courses: courses)
  end

  def show_list(conn, %{"id" => institution_id}) do
    courses = Enade.list_courses_by_institution!(institution_id)
    render(conn, "show_list.json", courses: courses)
  end

  def create(conn, %{"course" => course_params}) do
    with {:ok, %Course{} = course} <- Enade.create_course(course_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", course_path(conn, :show, course))
      |> render("show.json", course: course)
    end
  end

  def show(conn, %{"id" => id}) do
    course = Enade.get_course!(id)
    render(conn, "show.json", course: course)
  end

  def update(conn, %{"id" => id, "course" => course_params}) do
    course = Enade.get_course!(id)

    with {:ok, %Course{} = course} <- Enade.update_course(course, course_params) do
      render(conn, "show.json", course: course)
    end
  end

  def delete(conn, %{"id" => id}) do
    course = Enade.get_course!(id)
    with {:ok, %Course{}} <- Enade.delete_course(course) do
      send_resp(conn, :no_content, "")
    end
  end
end
