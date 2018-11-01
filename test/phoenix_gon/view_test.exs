defmodule PhoenixGon.ViewTest do
  use ExUnit.Case, async: false

  import PhoenixGon.TestHelpers
  import PhoenixGon.Controller

  alias PhoenixGon.Pipeline
  alias Plug.Conn

  describe "#render_gon_script" do
    test 'text' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))

      actual = PhoenixGon.View.render_gon_script(conn)

      assert {:safe, _} = actual
    end
  end

  describe "#escape_assets escapes javascript" do
    test 'text' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))

      conn =
        put_gon(
          conn,
          :malicious,
          "all your base</script><script>alert('are belong to us!')</script>"
        )

      actual = PhoenixGon.View.escape_assets(conn)

      expected =
        "{\\\"malicious\\\":\\\"all your base<\\/script><script>alert(\\'are belong to us!\\')<\\/script>\\\"}"

      assert expected == actual
    end
  end
end
