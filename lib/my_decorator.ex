defmodule Decorator.MyDecorator do
  use Decorator,
    extends: Decorator.MyModule,
    override: [:i_am_public_helper]

  def i_am_public_helper(a, b), do: @parent.i_am_public_helper(a, b) + 1
end
