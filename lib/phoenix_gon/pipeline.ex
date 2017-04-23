defmodule PhoenixGon.Pipeline do
  import Plug.Conn


  @moduledoc """
  """

  @doc """
  """
  @spec init(Keyword.t) :: Map.t
  def init(defaults) do
  %{
    env: Keyword.get(defaults, :env, Mix.env),
    assets: Keyword.get(defaults, :assets, %{}),
    namespace: Keyword.get(defaults, :namespace, nil)
  }
  end

  @doc """
  """
  @spec call(Plug.Conn.t, Map.t) :: Plug.Conn.t
  def call(conn, defaults), do: put_private(conn, :phoenix_gon, variables_with(defaults))

  @doc false
  @spec variables_with(Map.t) :: PhoenixGon.Storage.t
  defp variables_with(defaults), do: Map.merge(%PhoenixGon.Storage{}, defaults)
end
