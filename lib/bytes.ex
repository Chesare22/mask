defmodule Bytes do
  def subtract(<<>>, <<>>), do: <<>>

  def subtract(<<minuend, minuend_tail::bitstring>>, <<subtrahend, subtrahend_tail::bitstring>>),
    do: <<minuend - subtrahend, subtract(minuend_tail, subtrahend_tail)::bitstring>>

  @doc """
  Converts a function that works on one byte into a function that works on a bitstring of multiple bytes
  """
  def map(<<>>, _), do: <<>>
  def map(<<head, tail::bitstring>>, fun), do: <<fun.(head)::8, map(tail, fun)::bitstring>>

  @doc """
  Similar to `Bytes.map/2`, but instead of converting a bitstring of bytes into another bitstring of the same size,
  converts each byte to an element in a list.
  """
  def map_list(<<>>, _), do: []
  def map_list(<<head, tail::bitstring>>, fun), do: [fun.(<<head::8>>) | map_list(tail, fun)]

  def join(bytes, joiner \\ "")
  def join(<<>>, _), do: ""
  def join(<<head>>, _), do: "#{head}"
  def join(<<head, tail::bitstring>>, joiner), do: "#{head}#{joiner}#{join(tail, joiner)}"
end
