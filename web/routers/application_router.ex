defmodule ApplicationRouter do
    use Dynamo.Router

    prepare do
        conn = conn.fetch([:cookies, :params, :session])
        conn.assign(:layout, "layout")
    end

    get "/" do
        render(conn, "index.html")
    end

    get "/about.html" do
        render(conn, "about.html")
    end

    forward "/hello", to: HelloRouter
    forward "/guestbook", to: GuestbookRouter
end
