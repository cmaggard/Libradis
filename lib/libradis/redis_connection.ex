defmodule Libradis.RedisConnection do
  @name :redis

  def start_link do
    Agent.start_link(fn -> start_connection end, name: @name)
  end

  def execute(pipeline \\ []) do
    get_conn |> Exredis.query_pipe(pipeline)
  end

  # Private

  defp get_conn, do: Agent.get(@name, &(&1))

  defp start_connection do
    redis_url |> Exredis.start_using_connection_string
  end

  defp redis_url, do: Application.get_env(:libradis, :redis_url)
end
