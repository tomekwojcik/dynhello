Dynamo.under_test(Dynhello.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Dynhello.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup_all do
    Dynamo.Loader.enable
    :ok
  end
end
