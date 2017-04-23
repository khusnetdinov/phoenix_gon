defmodule PhoenixGon.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_gon,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev},
     {:poison, "~> 2.0"},
     {:plug, "~> 1.0"}]
  end

  defp description do
    """
    Description
    """
  end

  defp package do
    [name: :phoenix_gon,
     files: ~w{lib, config} ++
            ~w{mix.exs README.md},
     maintainers: ["Marat Khusnetdinov"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/khusnetdinov/phoenix_gon"}   ]
  end
end
