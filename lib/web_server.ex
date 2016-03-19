defmodule WebServer do
  defp dispatch do
    all_hosts = :_
    root_route = {"/", RequestHandler, []}
    foo_route = {"/foo", RequestHandler, []}

    :cowboy_router.compile([
      {all_hosts, [root_route, foo_route]}
    ])
  end
end
