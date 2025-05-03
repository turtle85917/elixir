defmodule HelloElixir do
  require Integer
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    grades = [25, 50, 75, 100]
    for n <- grades, do: IO.puts(n);
    new = for n <- grades, do: n + 5;
    IO.inspect(new)
    new = new ++ [125]
    IO.inspect(new)
    new = [5 | new]
    IO.inspect(new)

    even = for n <- new, Integer.is_even(n), do: n * n
    IO.inspect(even)
  end
end
