defmodule HelloElixir do
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "Miky";
    status = Enum.random([:gold, :silver, :bronze, :"not a member"])
    case status do
      :gold -> IO.puts("Welcome to the fancy lounge, #{name}")
      :"not a member" -> IO.puts("Get subscribed")
      _ -> IO.puts("Get out bruh")
    end
  end
end
