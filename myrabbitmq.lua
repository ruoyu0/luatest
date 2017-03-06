#!/usr/bin/env lua

local rabbitmq_c = require "rabbitmqstomp"

local _M = { _VERSION = "0.1" }
local mt = { __index = _M }


function _M:new(opts, addr, timeout)
    opts = opts or {username = "guest", password = "guest", vhost = "/", trailing_lf = false}
    addr = addr or {host = "127.0.0.1", port = 61613}
    timeout = timeout or 10000
    return setmetatable({ opts = opts, addr = addr, timeout = timeout }, mt)

print("add print to merge")
    
return _M
