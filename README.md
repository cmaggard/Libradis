# Libradis

An Elixir application that fetches information from a Redis database and posts it to Librato

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `libradis` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:libradis, "~> 0.1.0"}]
    end
    ```

  2. Ensure `libradis` is started before your application:

    ```elixir
    def application do
      [applications: [:libradis]]
    end
    ```

