defmodule PhoenixGon.Pipeline do
  import Plug.Conn

  @moduledoc """
  Plug for initializing gon with settings.
  """


  @doc """
  Initializer methods. Returns map wiith configuration settings.
  """
  @spec init(Keyword.t) :: Map.t
  def init(defaults) do
  %{
    env: Keyword.get(defaults, :env, Mix.env),
    assets: Keyword.get(defaults, :assets, %{}),
    namespace: Keyword.get(defaults, :namespace, nil),
  }
  end


  @doc """
  Call method adds to conn %PhoenixGon.Store object with data.
  """
  @spec call(Plug.Conn.t, Map.t) :: Plug.Conn.t
  def call(conn, defaults), do: put_private(conn, :phoenix_gon, variables_with(defaults))


  @doc false
  @spec variables_with(Map.t) :: PhoenixGon.Storage.t
  defp variables_with(defaults), do: Map.merge(%PhoenixGon.Storage{}, defaults)
end
