local typedefs = require "kong.db.schema.typedefs"

return {
    name = "custom-auth",
    fields = {
        { protocols = typedefs.protocols_http },
        { consumer = typedefs.no_consumer },
        { config = {
            type = "record",
            fields = {
                { auth = {
                    type = "record",
                    fields = {
                        { endpoint = typedefs.url({ required = true }) },
                        { method = { type = "string", required = true, default = "POST" } },
                        { ssl_verify = { type = "boolean", required = false, default = false } },
                        { header = typedefs.header_name { required = true, default = "Authorization" } },
                    },
                } },
                { public_paths = { type = "array", elements = { type = "string" } } },
            },
        } },
    },
}
