require 'JamesFunc'
socket = require 'socket'


mainLoop = 0

bot = {}
bot.server = "irc.afternet.org" -- Some examples include: irc.afternet.org, chat.freenode.org
bot.port = 6667                 -- The port number of the server to connect to. It's usually 6667
bot.nick = "JamesTheMadman"     -- The bot's name in the channel
bot.username = "James"          -- The name it'll show in any WHOIS queries
bot.chan = "#polyhedrondesign"  -- The channel name. Be sure to put the #
bot.admin = "Gallefray"         -- Put your nick here
bot.asleep = false              -- Will the bot respond to commands? 
bot.manual = false              -- Allows you to send messages as the bot
bool = false                    

irc = {}
irc.msg = ""                    -- Stores most recent msg that's been recieved

client, err = socket.tcp()      -- Creates a TCP socket in the variable client and if there's an error put it in err

if not client then              -- If client was not created then
	error(err)              -- return the error message
end

client:settimeout(60)           -- Set the timeout to 60 seconds

print("connecting...")
client:connect(bot.server, bot.port)
print("connected")

handleInput()                   		  -- Handle any PINGs and such
handleInput()
handleInput()

client:send("NICK " .. bot.nick .. "\r\n")        -- Send the nickname to the server
print("NICK " .. bot.nick .. "\r\n")

handleInput()

client:send("USER " .. "x x x x x" .. "\r\n")     -- Send the username to the server
print("USER " .. "x x x x x" .. "\r\n")           

handleInput()

client:send("JOIN " .. bot.chan .. "\r\n")        -- Join the channel
print("JOIN " .. bot.chan .. "\r\n") 
sleep(5)                                          -- Sleep for 5 seconds

while true do
	if bot.manual == true then                -- If the bot is in manual mode then ask for input from the user
    	print("type input: ")
    	input = io.read()
      
    	if input ~= "james:auto" then             -- if the input isn't james:auto then make the bot say the intput
        	sendMsg(input)
         
      	elseif input == "james:auto" then         -- If the user types james:auto then it'll switch it back into auto
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
