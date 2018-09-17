defmodule EnadeAPIWeb.CourseView do
  use EnadeAPIWeb, :view
  alias EnadeAPIWeb.CourseView
  alias EnadeAPI.Enade

  def render("index.json", %{courses: courses}) do
    %{data: render_many(courses, CourseView, "course.json")}
  end

  def render("show.json", %{course: course}) do
    %{data: render_one(course, CourseView, "course.json")}
  end
  
  def render("show_list.json", %{courses: courses}) do
    %{data: render_many(courses, CourseView, "course.json")}
  end

  def render("course.json", %{course: course}) do
    %{id: course.id,
      name: course.name,
      score: course.score,
      student_mean: course.student_mean,
      institution_id: course.institution_id
    }
  end
end
