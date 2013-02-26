defmodule GuestbookRouter do
    use Dynamo.Router
    require :httpd_util

    get "/" do
        offset = binary_to_integer(Dict.get(conn.params, :offset, "0"))

        entries_count = Dynhello.Models.Entry.count({})

        mongo_query = {:query, {}, :orderby, {:_id, -1}}
        entries = Dynhello.Models.Entry.find_all(mongo_query, batch_size: 10, skip: offset)

        name = get_session(conn, :name) || ""

        conn = conn.assign(:name, name)
        conn = conn.assign(:entries, entries)
        conn = conn.assign(:entries_count, entries_count)
        conn = conn.assign(:offset, offset)
        render conn, "guestbook/get_index.html"
    end

    post "/new" do
        fields = [:author, :entry]
        params = conn.params()
        errors = Enum.map fields, fn field ->
            if Dict.get(params, field, "") == "" do
                field
            else
                nil
            end
        end
        errors = Enum.filter errors, fn x -> x != nil end

        if Enum.empty?(errors) == false do
            conn = conn.assign(:errors, errors)
            render(conn, "guestbook/post_new.html")
        else
            now = :httpd_util.rfc1123_date(:erlang.universaltime())
            entry = Dynhello.Models.Entry.new(
                author: Dict.get(params, :author),
                entry: Dict.get(params, :entry),
                created_at: to_binary(now)
            )
            entry.save()

            conn = put_session(conn, :name, Dict.get(params, :author))
            redirect!(conn, to: "/guestbook/")
        end
    end
end
