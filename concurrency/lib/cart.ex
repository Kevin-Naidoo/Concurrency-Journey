defmodule Cart do
  use GenServer

  # Callbacks
def init(list) do
  {:ok, list}
end

  def handle_cast({:add_to_cart, item}, list) do
    {:noreply, list ++ [item]}
  end

  def handle_cast({:remove_from_cart,item},list ) do
    list = Enum.reject(list, fn(i) -> i == item end)
    {:noreply, list}
  end

  def handle_call(:get_cart, _from, list) do

    display_list = list
    |> Enum.frequencies()
    |> Map.to_list()
    {:reply, display_list, list}
  end



  # Client API

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def add_to_cart(pid, item) do
    GenServer.cast(pid,{:add_to_cart, item})
  end

  def remove_from_cart(pid, item) do
    GenServer.cast(pid,{:remove_from_cart, item})
  end

  def get_cart(pid) do
    GenServer.call(pid, :get_cart)
  end
end
