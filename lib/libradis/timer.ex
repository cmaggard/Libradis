defmodule Libradis.Timer do
  use GenServer

  @name :timer
  @mfa {Libradis.Orchestrator, :execute, []}

  # Client

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: @name)
  end

  def stop do
    GenServer.stop(@name)
  end


  # Callbacks

  def init(_arg) do
    start_timer(@mfa)
  end

  def terminate(_reason, tref) do
    :timer.cancel(tref)
  end


  # Private

  @spec start_timer({atom, atom, list()}) :: {:ok, :timer.tref} | {:error, any}
  defp start_timer({mod, fun, args}) do
    :timer.apply_interval(timer_interval, mod, fun, args)
  end

  @spec timer_interval() :: integer
  defp timer_interval do
    Application.get_env(:libradis, :interval, 300) * 1000
  end
end
