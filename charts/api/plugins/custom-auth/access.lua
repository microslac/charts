local ngx = require "ngx"
local cjson = require "cjson"
local http = require "resty.http"

return function(self, conf)
    local method = kong.request.get_method()
    if method == "OPTIONS" then
        return  -- skip verify preflight requests
    end

    local path = kong.request.get_path()
    local public_paths = conf.public_paths
    for i, pub_path in ipairs(public_paths) do
        if path:match("^/?" .. pub_path) then
            return  -- skip verify public paths
        end
    end

    local client = http.new()
    local auth = conf.auth

    local res, err = client:request_uri(auth.endpoint, {
        method = auth.method,
        ssl_verify = auth.ssl_verify,
        headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = kong.request.get_header(auth.header),
        },
        body = '{}',
    })

    if not res then
        kong.log.err("Invalid Authentication Response: ", err)
        return kong.response.exit(500, { ok = false, error = "server_error" })
    end

    if res.status ~= 200 then
        return kong.response.exit(403, { ok = false, error = "access_denied" })
    end

    local json = cjson.encode(res.body)
    local auth_data = cjson.decode(json)
    kong.service.request.set_header("X-Auth-Data", ngx.encode_base64(auth_data))
end
