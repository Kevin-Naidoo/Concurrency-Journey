defmodule Cart do
  use GenServer

  # Callbacks
  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_call(:add_to_cart, _from, state) do
    {:reply, :ok, }
  end

  def handle_call(:decrement, _from, state) do
    {:reply, :ok, state - 1}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def start_link(init_value \\ 0) do
    GenServer.start_link(__MODULE__, init_value, name: __MODULE__)
  end

  # Client API

  def add_to_cart(item) do
    GenServer.call(__MODULE__, :add_to_cart, item)
  end

  def remove_from_cart(item) do
    GenServer.call(__MODULE__, :remove_from_cart, item)
  end

  def get_cart do
    GenServer.call(__MODULE__, :get_cart)
  end
end
