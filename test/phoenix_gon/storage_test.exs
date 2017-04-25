defmodule PhoenixGon.StoregeTest do
  use ExUnit.Case, async: false

  import PhoenixGon.TestHelpers
  import PhoenixGon.Storage

  describe "default storage" do
    test "env" do
      storage = %PhoenixGon.Storage{}
      assert storage.env == nil
    end

    test "namespace" do
      storage = %PhoenixGon.Storage{}
      assert storage.namespace == nil
    end

    test "assets" do
      storage = %PhoenixGon.Storage{}
      assert storage.assets == %{}
    end
  end
end
