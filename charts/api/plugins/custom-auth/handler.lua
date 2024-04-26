local access = require "kong.plugins.custom-auth.access"

local AuthHandler = {
    VERSION = "1.0.0",
    PRIORITY = 1000,
}

AuthHandler.access = access

return AuthHandler
