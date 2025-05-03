defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule HelloElixir do
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    memberships = %{
      gold: %Membership{type: :gold, price: 25},
      silver: %Membership{type: :silver, price: 20},
      bronze: %Membership{type: :bronze, price: 15},
      none: %Membership{type: :none, price: 0}
    };

    users = [
      %User{name: "Caleb", membership: memberships.gold},
      %User{name: "Kayla", membership: memberships.gold},
      %User{name: "Carrie", membership: memberships.silver},
      %User{name: "John", membership: memberships.bronze}
    ]
    Enum.each(users, fn %{name: name, membership: %{type: type, price: price}} ->
      IO.puts("#{name} has a #{type} membership paying #{price}.");
    end)
  end
end
