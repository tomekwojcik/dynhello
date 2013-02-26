# DynHello!

DynHello is a demo application written in [Elixir](http://elixir-lang.org/)
using [Dynamo Web framework](https://github.com/elixir-lang/dynamo).

## But why?

For fun, for practice, for gentle introduction into Dynamo Web framework for
Elixir.

## Running in development

1. Install [Elixir](http://elixir-lang.org/getting_started/1.html)
and [rebar](https://github.com/basho/rebar#building),
2. Install (or otherwise get access to) MongoDB,
3. Clone the repo,
4. `$ mix deps.get`,
5. `$ cp lib/dynhello/environments/dev.exs.default lib/dynhello/environments/dev.exs`,
6. `$ $EDITOR lib/dynhello/environments/dev.exs`,
7. `$ mix server`,
8. Point your favorite browser to `http://127.0.0.1:<server_port>/`,
9. Have fun! :)

## Deployment

Really?

## What is the license?

DynHello! is licensed under MIT License. See `LICENSE` file for more info.
