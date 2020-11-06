defmodule DecoratorTest do
  use ExUnit.Case
  doctest Decorator

  alias Decorator.MyModule
  alias Decorator.MyDecorator

  test "decorate 'i_am_public_helper" do
    assert MyModule.i_am_public_helper(2, 3) == 5
    assert MyDecorator.i_am_public_helper(2, 3) == 6
    assert MyModule.i_am_public_helper_2(2, 3) == MyDecorator.i_am_public_helper_2(2, 3)
  end

  test "decorating just what I want override" do
    functions = MyDecorator.__info__(:functions)
    assert 2 == Enum.count(functions)
  end
end
