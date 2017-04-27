defmodule PhoenixGon.ViewTest do
  use ExUnit.Case, async: false

  import PhoenixGon.TestHelpers

  alias PhoenixGon.Pipeline
  alias Plug.Conn

  describe "#render_gon_script" do
    test 'text' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))

      actual = PhoenixGon.View.render_gon_script(conn)

      assert {:safe, _} = actual
    end
  end
end
