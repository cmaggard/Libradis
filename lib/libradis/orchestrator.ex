defmodule Libradis.Orchestrator do
  def execute do
    {names, calls} = Libradis.MetricsCollector.metric_redis_calls

    names
    |> Enum.zip(Libradis.RedisConnection.execute calls)
    |> Libradis.LibratoPoster.post_to_librato!
  end
end
