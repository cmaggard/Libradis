defmodule Libradis.Mixfile do
  use Mix.Project

  def project do
    [app: :libradis,
     version: "0.1.0",
     elixir: "~> 1.3",
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison],
     env: [redis_url: System.get_env("REDIS_URL"),
           librato_user: System.get_env("LIBRATO_USER"),
           librato_token: System.get_env("LIBRATO_TOKEN")],
     mod: {Libradis, []}]
  end

  defp deps do
    [
      {:exjsx, "~> 3.2"},
      {:httpoison, "~> 0.9.2"},
      {:exredis, "~> 0.2.5"},
      {:dialyxir, "~> 0.4", only: [:dev]}
    ]
  end

  defp description do
    """
      A library application for posting results of Redis queries to Librato
    """
  end

  defp package do
    [
      name: :libradis,
      files: ~w[lib config mix* README* LICENSE* test],
      maintainers: ["Cody Maggard"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/cmaggard/libradis"}
    ]
  end
end
