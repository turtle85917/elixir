defmodule HelloElixir do
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # a = 10
    # b = 5
    # IO.puts(a / b)
    # :io.format("~.20f\n", [0.1])
    # IO.puts(Float.ceil(0.1, 1))
    IO.puts(Integer.gcd(3, 5))
  end
end
