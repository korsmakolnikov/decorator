# Decorator

This is a simple utility lib. Its purpose is to let you extend a module in another. Yes, I mean "extends" in the OOP fashion way. But this isn't mean you have to do hierarchy, because forcing hierarchy in a functional language is a bad practice, even if Elixir has its way to do it. 
Anyway, sometimes you want to decorate the behavior of a module inside another module, but passing thru a middleware module. 
Suppose you have a library with a useful mock, but it doesn't fit perfectly for your test case, maybe you want to dispatch some message when one of the mock functions is invoked. If you are using the Elixir configuration to reference the mock in the test environment you have to reference another module, implement all the functions of the mock just to mirror the original module, and override the one you are interested in. 
This lib gives you the sugar to extend the mock implementing just you need. Your module internally implements all the extended module public functions, so you can reference your decorator instead of mock in the config and use it as the mock he's extending.
Another use case is a framework that doesn't support layer separation. If you need to delegate the runtime logic from a bundle to another you can fill the framework modeles with decorator keeping the business logic in the domain bundle. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `decorator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:decorator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/decorator](https://hexdocs.pm/decorator).

