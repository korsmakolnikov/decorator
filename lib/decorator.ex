defmodule Decorator do
  @moduledoc """
  Decorator extends the behavior of public helpers of a module
  both embedding the original function that acting like a 
  middleware

  examples

  defmodule MyModule do
    def my_func(), do: IO.puts("eureka!")
  end

  ...

  defmodule MyModuleDecorator do
    use Decorator,
      extends: MyModule,
      override: [:my_func]
  end

  ... 

  > MyModuleDecorator.my_func()
  "eureka!"
  :ok
  """

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      @opts opts
      @override opts[:override]
      @parent opts[:extends]
      @functions @parent.__info__(:functions)

      @functions
      |> Enum.filter(fn {f, _} -> f not in @override end)
      |> Enum.map(fn {f, arity} ->
        def unquote(f)(unquote_splicing(Macro.generate_arguments(arity, @parent))),
          do: @parent.unquote(f)(unquote_splicing(Macro.generate_arguments(arity, @parent)))
      end)
    end
  end
end
