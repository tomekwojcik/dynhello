defmodule HelloRouter do
    use Dynamo.Router

    get "/" do
        name = get_session(conn, :name) || ""

        conn = conn.assign(:name, name)
        conn = conn.assign(:no_name, Dict.has_key?(conn.params(), :no_name))
        render(conn, "hello/get.html")
    end

    post "/" do
        name = Dict.get(conn.params(), :name)
        if name == nil or name == "" do
            redirect!(conn, to: "/hello?no_name=1")
        end

        conn = put_session(conn, :name, name)

        conn = conn.assign(:name, name)
        render(conn, "hello/post.html")
    end
end
