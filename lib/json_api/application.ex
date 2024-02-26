defmodule JsonApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      JsonApiWeb.Telemetry,
      JsonApi.Repo,
      {DNSCluster, query: Application.get_env(:json_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: JsonApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: JsonApi.Finch},
      # Start a worker by calling: JsonApi.Worker.start_link(arg)
      # {JsonApi.Worker, arg},
      # Start to serve requests, typically the last entry
      JsonApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JsonApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    JsonApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
