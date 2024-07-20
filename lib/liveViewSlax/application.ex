defmodule LiveViewSlax.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveViewSlaxWeb.Telemetry,
      LiveViewSlax.Repo,
      {DNSCluster, query: Application.get_env(:liveViewSlax, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveViewSlax.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveViewSlax.Finch},
      # Start a worker by calling: LiveViewSlax.Worker.start_link(arg)
      # {LiveViewSlax.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveViewSlaxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewSlax.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveViewSlaxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
