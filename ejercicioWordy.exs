defmodule Wordy do
  def evaluate("") do
    "list is int"
  end

  def evaluate(string) do
    list = String.split(string, ["What", "is", "by", "?", " "], trim: true)
    operations(list)
  end

  def operations([_x, y]) do
    "Unsupported operation " <> y
  end

  def operations([x, "plus", y | tail]) do
    result = String.to_integer(x) + String.to_integer(y)
    operations([Integer.to_string(result)] ++ tail)
  end

  def operations([x, "minus", y | tail]) do
    result = String.to_integer(x) - String.to_integer(y)
    operations([Integer.to_string(result)] ++ tail)
  end

  def operations([x, "multiplied", y | tail]) do
    result = String.to_integer(x) * String.to_integer(y)
    operations([Integer.to_string(result)] ++ tail)
  end

  def operations([x, "divided", y | tail]) do
    result = String.to_integer(x) / String.to_integer(y)
    operations([Integer.to_string(result)] ++ tail)
  end

  def operations([head]) do
    String.to_integer(head)
  end
end

# IO.inspect(Wordy.evaluate("What is 5?"))
# IO.inspect(Wordy.evaluate("What is 5 plus 13?"))
# IO.inspect(Wordy.evaluate("What is 8 minus 2?"))
# IO.inspect(Wordy.evaluate("What is 3 multiplied by 4?"))
# IO.inspect(Wordy.evaluate("What is 12 divided by 4?"))
# IO.inspect(Wordy.evaluate("What is 52 cubeb?"))
# IO.inspect(Wordy.evaluate("What is 5 plus 13 plus 6?"))
# IO.inspect(Wordy.evaluate("What is 3 plus 2 multiplied by 3?"))
