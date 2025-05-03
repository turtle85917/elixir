defmodule HelloElixir do
  require Integer
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def sumAndAverage(numbers) do
    sum = Enum.sum(numbers);
    average = sum / Enum.count(numbers);
    {sum, average};
  end

  def printNumbers(numbers) do
    numbers
    |> Enum.join(" ")
    |> IO.puts();
  end

  def getNumbersFromUser do
    # IO.puts("Enter numbers separated by spaces: ");
    IO.gets("Enter numbers separated by spaces: ")
    |> String.trim()
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1);
  end

  def main do
    numbers = getNumbersFromUser(); #["1", "2", "3", "4", "5"];
    numbers |> printNumbers();
    {sum, average} = sumAndAverage(numbers);
    IO.puts("Sum: #{sum}, average: #{average}");
  end
end
