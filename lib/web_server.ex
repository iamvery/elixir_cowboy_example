defmodule WebServer do
  def start(_type, _args) do
    start_cowboy
  end

  defp start_cowboy do
    scheme = :http
    number_of_processes_in_pool = 100
    protocol_options = [port: 8080]
    cowboy_options = [env: [dispatch: dispatch]]

    {:ok, _pid} = :cowboy.start_http(
      scheme,
      number_of_processes_in_pool,
      protocol_options,
      cowboy_options
    )
  end

  defp dispatch do
    all_hosts = :_
    root_route = {"/", RequestHandler, []}
    foo_route = {"/foo", RequestHandler, []}

    :cowboy_router.compile([
      {all_hosts, [root_route, foo_route]}
    ])
  end
end
