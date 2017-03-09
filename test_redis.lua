#!/usr/bin/env lua

local redis = require "redis_iresty"
local red = redis:new()

print("########## connect redis success ##########")

local ok, err = red:auth("redis.conf")
if not ok then ngx.say("failed to auth:", err) return end

print("########## auth redis success ##########")

local ok, err = red:set("dog", "an animal")
if not ok then ngx.say("failed to set dog:", err) return end

ngx.say("set result: ", ok)
