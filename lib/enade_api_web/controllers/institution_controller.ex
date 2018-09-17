defmodule EnadeAPIWeb.InstitutionController do
  use EnadeAPIWeb, :controller

  alias EnadeAPI.Enade
  alias EnadeAPI.Enade.Institution

  action_fallback EnadeAPIWeb.FallbackController

  def index(conn, _params) do
    institutions = Enade.list_institutions()
    render(conn, "index.json", institutions: institutions)
  end

  def create(conn, %{"institution" => institution_params}) do
    with {:ok, %Institution{} = institution} <- Enade.create_institution(institution_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", institution_path(conn, :show, institution))
      |> render("show.json", institution: institution)
    end
  end

  def show(conn, %{"id" => id}) do
    institution = Enade.get_institution!(id)
    render(conn, "show.json", institution: institution)
  end

  def update(conn, %{"id" => id, "institution" => institution_params}) do
    institution = Enade.get_institution!(id)

    with {:ok, %Institution{} = institution} <- Enade.update_institution(institution, institution_params) do
      render(conn, "show.json", institution: institution)
    end
  end

  def delete(conn, %{"id" => id}) do
    institution = Enade.get_institution!(id)
    with {:ok, %Institution{}} <- Enade.delete_institution(institution) do
      send_resp(conn, :no_content, "")
    end
  end
end
