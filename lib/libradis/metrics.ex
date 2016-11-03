defmodule Libradis.Metrics do
  @type name :: String.t
  @type command :: [String.t, ...]
  @type metric :: {name, command}

  @spec scard(String.t, String.t) :: metric
  def scard(name, key) do
    {name, ["SCARD", key]}
  end

  @spec llen(String.t, String.t) :: metric
  def llen(name, key) do
    {name, ["LLEN", key]}
  end

  @spec zcard(String.t, String.t) :: metric
  def zcard(name, key) do
    {name, ["ZCARD", key]}
  end

  @spec get(String.t, String.t) :: metric
  def get(name, key) do
    {name, ["GET", key]}
  end
end
