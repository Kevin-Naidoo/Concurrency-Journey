defmodule AnagramsTest do
  use ExUnit.Case
  doctest Anagrams

  test "greets the world" do
    assert Anagrams.hello() == :world
  end
end
