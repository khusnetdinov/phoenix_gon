defmodule PhoenixGon.Utils do
  @moduledoc """
  Usefull methods for elixir modules
  """

  @doc """
  Return if mix env dev
  """
  @spec mix_env_dev?(Plug.Conn.t()) :: Boolean.t()
  def mix_env_dev?(conn), do: variables(conn).env == :dev

  @doc """
  Return if mix env prod
  """
  @spec mix_env_prod?(Plug.Conn.t()) :: Booleant.t()
  def mix_env_prod?(conn), do: variables(conn).env == :prod

  @doc """
  Return elixir gon struct.
  """
  @spec variables(Plug.Conn.t()) :: %PhoenixGon.Storage{}
  def variables(conn), do: conn.private[:phoenix_gon]

  @doc """
  Retusn elixir assets.
  """
  @spec assets(Plug.Conn.t()) :: Map.t()
  def assets(conn), do: variables(conn).assets

  @doc """
  Returns all elixir settings.
  """
  @spec settings(Plug.Conn.t()) :: List.t()
  def settings(conn) do
    Enum.filter(Map.from_struct(variables(conn)), fn {key, _} ->
      key != :assets
    end)
  end

  @doc false
  @spec settings(Plug.Conn.t(), Atom.t()) :: any()
  def settings(conn, key), do: settings(conn)[key]

  @doc """
  Return current gon namespace.
  """
  @spec namespace(Plug.Conn.t()) :: String.t()
  def namespace(conn) do
    name = settings(conn, :namespace)

    if name == nil do
      "Gon"
    else
      String.split(to_string(name), ".") |> List.last()
    end
  end
end
