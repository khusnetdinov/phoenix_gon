defmodule PhoenixGon.Web do
  import Plug.Conn

  @moduledoc """
  """


  @doc """
  """
  @spec put_gon(Plug.Conn.t, Atom.t, any()) :: Plug.Conn.t
  def put_gon(conn, key, value) when is_atom(key) do
    put_gon(conn, %{key => value})
  end

  @doc false
  @spec put_gon(Plug.Conn.t, Keyword.t) :: Plug.Conn.t
  def put_gon(conn, opts) when is_list(opts) do
    put_gon(conn, Enum.into(opts, %{}))
  end

  @doc false
  @spec put_gon(Plug.Conn.t, Map.t) :: Plug.Conn.t
  def put_gon(conn, opts) when is_map(opts) do
    %PhoenixGon.Storage{assets: assets} = variables(conn)
    assets = Map.merge(assets, opts)
    put_private(conn, :phoenix_gon, %{variables(conn) | assets: assets})
  end


  @doc """
  """
  @spec update_gon(Plug.Conn.t, Atom.t, any()) :: Plug.Conn.t
  def update_gon(conn, key, value) when is_atom(key) do
    put_gon(conn, key, value)
  end

  @doc false
  @spec update_gon(Plug.Conn.t, Keyword.t) :: Plug.Conn.t
  def update_gon(conn, opts) when is_list(opts) do
    put_gon(conn, opts)
  end

  @doc false
  @spec update_gon(Plug.Conn.t, Keyword.t) :: Plug.Conn.t
  def update_gon(conn, opts) when is_map(opts) do
    put_gon(conn, opts)
  end


  @doc """
  """
  @spec drop_gon(Plug.Conn, Atom.t) :: Plug.Conn.t
  def drop_gon(conn, key) when is_atom(key) do
    drop_gon(conn, [key])
  end

  @doc false
  @spec drop_gon(Plug.Conn, List.t) :: Plug.Conn.t
  def drop_gon(conn, opts) when is_list(opts) do
    %PhoenixGon.Storage{assets: assets} = variables(conn)
    assets = Map.drop(assets, opts)
    put_private(conn, :phoenix_gon, %{variables(conn) | assets: assets})
  end


  @doc """
  """
  @spec get_gon(Plugg.Conn, Atom.t) :: any()
  def get_gon(conn, key) when is_atom(key) do
    Map.get(variables(conn).assets, key)
  end


  @doc false
  @spec variables(Plug.Conn.t) :: Plug.Conn.t
  defp variables(conn), do: conn.private[:phoenix_gon]


  @doc false
  defmacro __using__([]) do
    quote do
      import PhoenixGon.Web
    end
  end
end
