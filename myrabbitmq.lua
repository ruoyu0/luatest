#!/usr/bin/env lua

local rabbitmq_c = require "rabbitmqstomp"

local _M = { _VERSION = "0.1" }
local mt = { __index = _M }


function _M:send(msg, headers)
    local mq, err = rabbitmq_c:new(self.opts)
    if not mq or err then return nil, err end
    
    mq:set_timeout(self.timeout)
    
    local ok, err = mq:connect(self.addr.host, self.addr.port)
    if not ok or err then return nil, err end

    local result, err = mq:send(msg, headers)
    if not ok or err then return nil, err end

    local ok, err = mq:set_keepalive(60000, 1000)
    if not ok or err then return nil, err end

    return result, err
end


function _M:new(opts, addr, timeout)
    opts = opts or {username = "guest", password = "guest", vhost = "/", trailing_lf = false}
    addr = addr or {host = "127.0.0.1", port = 61613}
    timeout = timeout or 10000
    return setmetatable({ opts = opts, addr = addr, timeout = timeout }, mt)


return _M
