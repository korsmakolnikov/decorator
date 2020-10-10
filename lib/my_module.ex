defmodule Decorator.MyModule do
  @moduledoc """
  This module intended to be decorated by another module
  How could we extends the logic of `i_am_public_helper` 
  without change the function itself? 
  Of course embedding the `i_am_public_helper` call inside
  another function.
  But things like this:
  ```
    def new_public_helper(arg1, arg2, arg3) do
      i_am_public_helper(arg1, arg2) / arg3
    end
  ```

  don't reduce the complexity and the readability of the code.
  """

  @doc """
  Decorate this!
  """
  def i_am_public_helper(arg1, arg2) do
    arg1 + arg2
  end

  @doc """
  Decorate this!
  """
  def i_am_public_helper_2(arg1, arg2) do
    arg1 + arg2
  end
end
