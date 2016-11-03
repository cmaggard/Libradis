defmodule Libradis.LibratoPoster do
  use HTTPoison.Base

  def post_to_librato!(data) do
    post!(endpoint, coerce_data(data), headers, opts)
  end

  def coerce_data(data) do
    gauges = Enum.map(data, fn {name, value} -> %{"name" => name, "value" => value} end)

    %{gauges: gauges}
    |> JSX.encode!
  end

  # Private

  defp headers do
    %{"Content-Type" => "application/json"}
  end

  defp opts do
    [hackney: hackney_opts]
  end

  def hackney_opts do
    [basic_auth: {Application.get_env(:libradis, :librato_user),
                  Application.get_env(:libradis, :librato_token)}]
  end

  defp endpoint do
    "https://metrics-api.librato.com/v1/metrics"
  end
end
