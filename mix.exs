defmodule PhoenixGon.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_gon,
      version: "0.4.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp description do
    """
    PhoenixGon hex - your Phoenix variables in your JavaScript.
    """
  end

  defp package do
    [
      name: :phoenix_gon,
      files: ~w{lib} ++ ~w{mix.exs README.md},
      maintainers: ["Marat Khusnetdinov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/khusnetdinov/phoenix_gon"}
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:poison, "~> 3.0", optional: true},
      {:phoenix_html, "~> 2.7"},
      {:plug, "~> 1.0"},
      {:recase, "~> 0.4"}
    ]
  end
end
