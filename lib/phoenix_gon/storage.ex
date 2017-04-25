defmodule PhoenixGon.Storage do
  @moduledoc """
  Main struct that is keep as storage in conn for gon variabeles.
  """


  @doc false
  defstruct env: nil, assets: %{}, compability: :native, namespace: nil
end
