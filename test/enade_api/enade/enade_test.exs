defmodule EnadeAPI.EnadeTest do
  use EnadeAPI.DataCase

  alias EnadeAPI.Enade

  describe "institutions" do
    alias EnadeAPI.Enade.Institution

    @valid_attrs %{global_score: 120.5, name: "some name"}
    @update_attrs %{global_score: 456.7, name: "some updated name"}
    @invalid_attrs %{global_score: nil, name: nil}

    def institution_fixture(attrs \\ %{}) do
      {:ok, institution} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Enade.create_institution()

      institution
    end

    test "list_institutions/0 returns all institutions" do
      institution = institution_fixture()
      assert Enade.list_institutions() == [institution]
    end

    test "get_institution!/1 returns the institution with given id" do
      institution = institution_fixture()
      assert Enade.get_institution!(institution.id) == institution
    end

    test "create_institution/1 with valid data creates a institution" do
      assert {:ok, %Institution{} = institution} = Enade.create_institution(@valid_attrs)
      assert institution.global_score == 120.5
      assert institution.name == "some name"
    end

    test "create_institution/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enade.create_institution(@invalid_attrs)
    end

    test "update_institution/2 with valid data updates the institution" do
      institution = institution_fixture()
      assert {:ok, institution} = Enade.update_institution(institution, @update_attrs)
      assert %Institution{} = institution
      assert institution.global_score == 456.7
      assert institution.name == "some updated name"
    end

    test "update_institution/2 with invalid data returns error changeset" do
      institution = institution_fixture()
      assert {:error, %Ecto.Changeset{}} = Enade.update_institution(institution, @invalid_attrs)
      assert institution == Enade.get_institution!(institution.id)
    end

    test "delete_institution/1 deletes the institution" do
      institution = institution_fixture()
      assert {:ok, %Institution{}} = Enade.delete_institution(institution)
      assert_raise Ecto.NoResultsError, fn -> Enade.get_institution!(institution.id) end
    end

    test "change_institution/1 returns a institution changeset" do
      institution = institution_fixture()
      assert %Ecto.Changeset{} = Enade.change_institution(institution)
    end
  end

  describe "courses" do
    alias EnadeAPI.Enade.Course

    @valid_attrs %{name: "some name", score: 120.5, student_mean: 120.5}
    @update_attrs %{name: "some updated name", score: 456.7, student_mean: 456.7}
    @invalid_attrs %{name: nil, score: nil, student_mean: nil}

    def course_fixture(attrs \\ %{}) do
      {:ok, course} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Enade.create_course()

      course
    end

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Enade.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Enade.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      assert {:ok, %Course{} = course} = Enade.create_course(@valid_attrs)
      assert course.name == "some name"
      assert course.score == 120.5
      assert course.student_mean == 120.5
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enade.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      assert {:ok, course} = Enade.update_course(course, @update_attrs)
      assert %Course{} = course
      assert course.name == "some updated name"
      assert course.score == 456.7
      assert course.student_mean == 456.7
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Enade.update_course(course, @invalid_attrs)
      assert course == Enade.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Enade.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Enade.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Enade.change_course(course)
    end
  end
end
