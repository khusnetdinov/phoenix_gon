defmodule PhoenixGon.View do
  import PhoenixGon.Utils
  import Phoenix.HTML
  import Phoenix.HTML.Tag

  @moduledoc """
  Adds templates helpers for rendering and adding javascript code to browser.
  """

  @doc """
  Returns javascript code what adds phoenix variables to javascript and browser.
  """
  @spec render_gon_script(Plug.Conn.t()) :: Plug.Conn.t()
  def render_gon_script(conn) do
    content_tag(:script, type: "text/javascript") do
      raw(script(conn))
    end
  end

  @spec escape_assets(Plug.Conn) :: String.t()
  def escape_assets(conn) do
    escape_javascript(Poison.encode!(assets(conn)))
  end

  @doc false
  @spec script(Plug.Conn) :: List.t()
  defp script(conn) do
    """
    var #{namespace(conn)} = (function(window) {
      var phoenixEnv = '#{settings(conn)[:env]}';
      var phoenixAssets = JSON.parse("#{escape_assets(conn)}");

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
        isCustomEnv: function(customEnv) {
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
end
