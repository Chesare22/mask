defmodule Mask.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ issues in a github project
  """
  def main(argv) do
    argv
    |> parse_args()
    |> process()
    |> Bytes4.to_string()
    |> IO.puts()

    System.stop(0)
  end

  @doc """
  `argv` can be -h or --help, which returns :help.
  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format.
  Return a tuple of `{ user, project, count }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    parse =
      OptionParser.parse(argv,
        switches: [wildcard: :boolean],
        aliases: [w: :wildcard]
      )

    case parse do
      {[wildcard: true], [number], _} ->
        {Integer.parse(number) |> Kernel.elem(0), :wildcard}

      {_, [number], _} ->
        Integer.parse(number) |> Kernel.elem(0)
    end
  end

  def process({number, :wildcard}),
    do: Mask.wildcard(number)

  def process(number),
    do: Mask.of(number)
end
