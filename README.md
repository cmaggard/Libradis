# >> Work in Progress <<

# Libradis

An Elixir application that fetches information from a Redis database and posts it to Librato

## Installation


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


3. Create one or more modules using the helper functions in `lib/libradis/metrics.ex`:


  ```elixir
  defmodule MyInstance.MyMetrics do
    import Libradis.Metrics

    def sample_scard do
      scard "sample.set.cardinality", "countable:set"
    end
  end
  ```

4. Add a configuration stanza to `config/config.exs` listing the modules containing metric function calls:


  ```elixir
  config :libradis, metrics: [ MyInstance.MyMetrics ]
  ```


5. Export needed configuration values (`REDIS_URL`), and...

6. Start it up!


# Future Goals

* Autodiscovery of metric modules, like Mix.Tasks does. I wish the discovery bits from that were extracted, because that's what I'd have to rewrite.
* Extracting data source and destination handling code into their own modules
