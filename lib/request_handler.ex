defmodule RequestHandler do
  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(request, state) do
    {:ok, reply} = :cowboy_req.reply(
      200,
      [{"content-type", "text/html"}],
      inspect(request),
      request
    )

    {:ok, reply, state}
  end

  def terminate(_reason, _request, _state) do
    :ok
  end
end
