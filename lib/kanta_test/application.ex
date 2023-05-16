defmodule KantaTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      KantaTestWeb.Telemetry,
      # Start the Ecto repository
      KantaTest.Repo,
      {Phoenix.PubSub, name: KantaTest.PubSub},
      {Finch, name: KantaTest.Finch},
      KantaTestWeb.Endpoint,
      {Kanta, Application.fetch_env!(:kanta_test, Kanta)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KantaTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KantaTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
