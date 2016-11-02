defmodule Libradis.Metrics do
  def scard(name, key) do
    ["SCARD", key]
  end

  def llen(name, key) do
    ["LLEN", key]
  end

  def zcard(name, key) do
    ["ZCARD", key]
  end

  def get(name, key) do
    ["GET", key]
  end
end
