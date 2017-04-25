defmodule PhoenixGon.View do
  import PhoenixGon.Utils
  import Phoenix.HTML
  import Phoenix.HTML.Tag

  @moduledoc """
  """


  @doc """
  """
  @spec render_gon_script(Plug.Conn.t) :: Plug.Conn.t
  def render_gon_script(conn) do
    content_tag(:script, [type: "text/javascript"]) do
     raw(script(conn))
    end
  end


  @doc """
  """
  @spec script(Plug.Conn) :: List.t
  def script(conn) do
    """
    var #{namespace(conn)} = (function(window) {
      var phoenixEnv = '#{settings(conn)[:env]}';
      var phoenixAssets = #{Poison.encode!(assets(conn))};

      return {
        getEnv: function() {
          return phoenixEnv;
        },
        isDev: function() {
          return phoenixEnv === 'dev';
        },
        isProd: function() {
          return phoenixEnv === 'prod';
        },
        isCustomEnv(customEnv) {
          return phoenixEnv === customEnv;
        },
        assets: function() {
          return phoenixAssets;
        },
        getAsset: function(property) {
          return phoenixAssets[property];
        }
      };
    })(window);
    """
  end


  @doc false
  defmacro __using__([]) do
    quote do
      import PhoenixGon.View
    end
  end
end
