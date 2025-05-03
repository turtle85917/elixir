defmodule HelloElixir do
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    memberships = {:bronze, :silver};
    memberships = Tuple.append(memberships, :gold);
    IO.inspect(memberships);

    prices = {5, 10, 15};
    avg = Tuple.sum(prices) / tuple_size(prices);
    IO.puts(avg);

    users = [
      {"Caleb", :gold},
      {"Kayla", :gold},
      {"Carrie", :silver},
      {"John", :bronze}
    ]
    Enum.each(users, fn{name, membership} ->
      IO.puts("#{name} has a #{membership} membership")
    end)
  end
end
