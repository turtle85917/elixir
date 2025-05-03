defmodule HelloElixir do
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    IO.puts(:hello)
    IO.puts("hello")
    IO.puts(:"hello world")
  end
end
