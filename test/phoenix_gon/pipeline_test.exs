defmodule PhoenixGon.PipelineTest do
  use ExUnit.Case, async: false
  use RouterHelper

  alias PhoenixGon.Pipeline
  alias Plug.Conn

  describe "initialization" do
    test "init" do
      defaults = [namespace: :test, camel_case: true]
      expectation = %{assets: %{}, namespace: :test, camel_case: true}
      actual = Pipeline.init(defaults)

      assert actual == expectation
    end
  end

end
