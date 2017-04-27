defmodule PhoenixGon.ControllerTest do
  use ExUnit.Case, async: false

  import PhoenixGon.TestHelpers
  import PhoenixGon.Controller

  alias Plug.Conn
  alias PhoenixGon.Pipeline

  describe "#put_gon" do
    test 'conn' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))
      conn = put_gon(conn, :test, :test)

      actual = conn.private[:phoenix_gon].assets[:test]
      expectation = :test

      assert actual == expectation
    end
  end

  describe "update_gon" do
    test 'conn' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))
      conn = put_gon(conn, :test, :not_test)
      conn = update_gon(conn, :test, :test)

      actual = conn.private[:phoenix_gon].assets[:test]
      expectation = :test

      assert actual == expectation
    end
  end

  describe "drop_gon" do
    test '' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))
      conn = put_gon(conn, :test, :test)
      conn = drop_gon(conn, :test)

      actual = conn.private[:phoenix_gon].assets[:test]
      expectation = :nil

      assert actual == expectation
    end
  end

  describe "get_gon" do
    test '' do
      conn = Pipeline.call(%Conn{}, Pipeline.init([]))
      conn = put_gon(conn, :test, :test)

      actual = conn.private[:phoenix_gon].assets[:test]
      expectation = get_gon(conn, :test)

      assert actual == expectation
    end
  end
end
