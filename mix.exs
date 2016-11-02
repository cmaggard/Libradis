defmodule Libradis.Mixfile do
  use Mix.Project

  def project do
    [app: :libradis,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Libradis, []}]
  end

  defp deps do
    [
      {:exjsx, "~> 3.2"},
      {:httpoison, "~> 0.9.2"}
    ]
  end
end