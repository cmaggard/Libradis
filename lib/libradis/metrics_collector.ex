defmodule Libradis.MetricsCollector do
  def metric_redis_calls do
    metric_functions |> exec |> Enum.unzip
  end

  def met_funs do
    metric_functions
  end

  # Private

  defp metric_functions do
    modules |> Enum.flat_map(&zip_mod_and_funs/1)
  end

  defp exec(mod_funs) do
    mod_funs |> Enum.map(fn {mod, fun} -> apply(mod, fun, []) end)
  end

  defp zip_mod_and_funs(mod) do
    Stream.repeatedly(fn -> mod end)
    |> Enum.zip(funs(mod))
  end

  defp funs(mod) do
    mod.__info__(:functions)
    |> Enum.map(fn {fun, _} -> fun end)
  end

  defp modules, do: Application.get_env(:libradis, :metrics, [])
end
