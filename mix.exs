defmodule Dynhello.Mixfile do
  use Mix.Project

  def project do
    [ app: :dynhello,
      version: "0.0.1",
      dynamos: [Dynhello.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/dynhello/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Dynhello, [] } ]
  end

  defp deps do
    [
      { :ranch, %r(.*), github: "extend/ranch" },
      { :cowboy, %r(.*), github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :mongoex, %r(.*), github: "tomekwojcik/mongoex" }
    ]
  end
end
