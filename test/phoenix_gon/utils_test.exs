defmodule PhoenixGon.UtilsTest do
  use ExUnit.Case, async: false
  use RouterHelper

  import PhoenixGon.Utils

  alias Plug.Conn

  describe "#variables" do
    test 'conn' do
      conn =
        %Conn{}
        |> with_gon

      actual = variables(conn)
      expectation = %PhoenixGon.Storage{}

      assert actual == expectation
    end
  end

  describe "#assets" do
    test 'conn' do
      conn =
        %Conn{}
        |> with_gon

      actual = assets(conn)
      expectation = %{}

      assert actual == expectation
    end
  end

  describe "settings" do
    test 'conn' do
      conn =
        %Conn{}
        |> with_gon

      actual = settings(conn)
      expectation = [camel_case: false, compatibility: :native, namespace: nil]

      assert actual == expectation
    end
  end

  describe "#namescpase" do
    test 'conn' do
      conn =
        %Conn{}
        |> with_gon(namespace: TestCase)

      actual = namespace(conn)
      expectation = "TestCase"

      assert actual == expectation
    end
  end
end
