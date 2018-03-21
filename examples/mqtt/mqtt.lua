-- init mqtt client without logins, keepalive timer 120s
m = mqtt.Client("adam", 120)

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline" 
-- to topic "/lwt" if client don't send keepalive packet
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(client) print ("connected") end)
m:on("offline", function(client) print ("offline") end)

-- on publish message receive event
m:on("message", function(client, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
     print(data)
     gpio.write(2, gpio.HIGH)
     dofile("play_file.lua")
     -- tmr.delay(1000000)
     --gpio.write(2, gpio.LOW)
  end
end)

-- for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect("10.0.0.150", 1883, 0, function(client)
  print("connected")
  -- Calling subscribe/publish only makes sense once the connection
  -- was successfully established. You can do that either here in the
  -- 'connect' callback or you need to otherwise make sure the
  -- connection was established (e.g. tracking connection status or in
  -- m:on("connect", function)).

  -- subscribe topic with qos = 0
  client:subscribe("/doorbell", 0, function(client) print("subscribe success") end)
  -- publish a message with data = hello, QoS = 0, retain = 0
  client:publish("/doorbell", "hello", 0, 0, function(client) print("sent") end)
end,
function(client, reason)
  print("failed reason: " .. reason)
end)

--m:close();
-- you can call m:connect again
