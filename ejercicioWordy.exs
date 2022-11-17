defmodule Wordy do
  def evaluate(""), do: "list is int"

  def evaluate(string) do
    String.split(string, ["What", "is", "by", "?", " "], trim: true)
    |> IO.inspect()
    |> operations()
  end

  defp operations([_head, tail]), do: "Unsupported operation " <> tail

  defp operations([first, "plus", second | tail]) do
    result = String.to_integer(first) + String.to_integer(second)
    operations([Integer.to_string(result)] ++ tail)
  end

  defp operations([first, "minus", second | tail]) do
    result = String.to_integer(first) - String.to_integer(second)
    operations([Integer.to_string(result)] ++ tail)
  end

  defp operations([first, "multiplied", second | tail]) do
    result = String.to_integer(first) * String.to_integer(second)
    operations([Integer.to_string(result)] ++ tail)
  end

  defp operations([first, "divided", second | tail]) do
    result = String.to_integer(first) / String.to_integer(second)
    operations([Integer.to_string(result)] ++ tail)
  end

  defp operations([head]) do
    String.to_integer(head)
  end
end
