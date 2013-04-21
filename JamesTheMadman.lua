require 'JamesFunc'
socket = require 'socket'


mainLoop = 0

bot = {}
bot.server = "irc.afternet.org"
bot.port = 6667
bot.nick = "JamesTheMadman"
bot.username = "James"
bot.chan = "#ludumdareD&D" -- D&D -- polyhedrondesign
bot.admin = "classicalduck"
bot.asleep = false
bot.manual = false
bool = false

irc = {}
irc.msg = "" -- most recent msg that's been recieved
irc.msgLower = ""
irc.respond = 0

client, err = socket.tcp() -- creates a socket

if not client then --If client was not created then
	error(err) --return the error message
end

client:settimeout(60) --Set the timeout to 60 seconds

print("connecting...")
client:connect(bot.server, bot.port)
print("connected")
handleInput()
handleInput()
handleInput()
client:send("NICK " .. bot.nick .. "\r\n") -- \r\n
print("NICK " .. bot.nick .. "\r\n")
handleInput()
client:send("USER " .. "x x x x x" .. "\r\n") -- bot.username .. 
print("USER " .. "x x x x x" .. "\r\n") -- bot.username .. 
handleInput()
client:send("JOIN " .. bot.chan .. "\r\n")
print("JOIN " .. bot.chan .. "\r\n")
sleep(5)

while true do
   --print("In main loop")
   --BufferControl()
   if bot.manual == true then
      print("type input: ")
      input = io.read()
      if input ~= "james:auto" then
         sendMsg(input)
      elseif input == "james:auto" then
         bot.manual = false
      end
   else
      handleInput()
      if bool == false then
         print("Sending message")
         sendMsg("Hey guys!")
         bool = true
      end
   end
end



-- function BufferControl()
--    irc.msg = client:receive()
--    buffer = buffer .. irc.msg
--    if string.find(buffer, "\n\r") or string.find(buffer, "\r\n") then
--       print(buffer)
--       MSGstring = buffer
--       buffer = ""
--    else
--       print(buffer)
--    end
-- end
