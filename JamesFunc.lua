function sleep(sec)
    socket.select(nil, nil, sec)
end

function sendMsg(msg)
	client:send("PRIVMSG " .. bot.chan .. " :" .. msg .. "\r\n")
end

function dice(min, max)
   local diceOutcome = math.random(min, max)
   print(diceOutcome)
end

function handleInput()
    irc.msg = client:receive()
    print(irc.msg)
    if not string.find(irc.msg, "NOTICE AUTH") then
		if string.find(irc.msg, "PING") then
			print("Sending pong!")
			client:send("PONG :" .. string.sub(irc.msg, 7) .. "\r\n")

		elseif string.find(irc.msg, "james:die") and string.find(irc.msg, bot.admin) then
			sendMsg("Dying! D: NOOOO! SAVE MEEEE!")
			client:send("PART " .. bot.chan .. "\r\n")--chanel
			client:send("QUIT " .. "\r\n")
			os.exit(1)

		elseif string.find(irc.msg, "hello " .. bot.nick) or string.find(irc.msg, "o/ " .. bot.nick) or string.find(irc.msg, "\\o " .. bot.nick) or string.find(irc.msg, "hullo " .. bot.nick) or string.find(irc.msg, "hola " .. bot.nick) or string.find(irc.msg, "hey " .. bot.nick) or string.find(irc.msg, "greetings " .. bot.nick) or string.find(irc.msg, "aloha " .. bot.nick) or string.find(irc.msg, "hai " .. bot.nick) or string.find(irc.msg, "hi" .. bot.nick) then
		--elseif string.find(irc.msg, "hello" or "o/" or "\\o") and string.find(irc.msg, "JamesTheMadman") then
			-- personName = string.sub(irc.msg, 2)
			--print(string.match(irc.msg, "%! %:"))
			if bot.asleep == false then
				local sentence = math.random(1, 5)
				if sentence == 1 then
					sendMsg("hello to you too!")
				elseif sentence == 2 then
					sendMsg("hey!")
				elseif sentence == 3 then
					sendMsg("hullo!")
				elseif sentence == 4 then
					sendMsg("hola!")
				elseif sentence == 5 then
					sendMsg("greetings!")
				end
			end
		elseif string.find(irc.msg, "hits " .. bot.nick) or string.find(irc.msg, "shoots " .. bot.nick) or string.find(irc.msg, "stabs " .. bot.nick) then
			if bot.asleep == false then
				local chance = math.random(0, 1)
				if chance == 1 then
					if string.find(irc.msg, "hits " .. bot.nick) then
						sendMsg("\001ACTION evades!\001")
						sendMsg("\001ACTION hits you back!\001")
					elseif string.find(irc.msg, "shoots " .. bot.nick) then
						sendMsg("\001ACTION evades! \001")
						sendMsg("\001ACTION shoots you back! \001")
					elseif string.find(irc.msg, "stabs " .. bot.nick) then
						sendMsg("\001ACTION evades! \001")
						sendMsg("\001ACTION shoots you back! \001")
					end
				elseif chance == 0 then
					sendMsg("\001ACTION slumps to the floor\001")
					bot.asleep = true
				end
			end
		elseif string.find(irc.msg, "how goes") and string.find(irc.msg, bot.nick) then
			if bot.asleep == false then
				sendMsg("very good, thanks :)")
			end
		elseif string.find(irc.msg, "shakes " .. bot.nick) then
			if bot.asleep == true then
				bot.asleep = false
				sendMsg("Whu? WhaddIMiss?")
			end
		elseif string.find(irc.msg, "james:manual") and string.find(irc.msg, bot.admin) then
			bot.manual = true
		elseif string.find(irc.msg, "james:auto") and string.find(irc.msg, bot.admin) then
			bot.manual = false
		elseif string.find(irc.msg, "ONE OF US") then
			sendMsg("ONE OF US")
		elseif string.find(irc.msg, "!real") and string.find(irc.msg, "programmers") then
			local Rprog = math.random(0, 48)
			if Rprog == 1 then
				sendMsg("Real programmers say things like 'DO 10 I=1,10' and 'ABEND' (they actually talk in capital letters, you understand")
			elseif Rprog == 2 then
				sendMsg("Real Programmers use FORTRAN. Quiche Eaters use PASCAL.")
			elseif Rprog == 3 then
				sendMsg("Real programmers don't need abstract concepts to get their jobs done: they are perfectly happy with a keypunch, a FORTRAN IV compiler, and a beer.")
			elseif Rprog == 4 then
				sendMsg("Real Programmers do List Processing in FORTRAN.")
			elseif Rprog == 5 then
				sendMsg("Real Programmers do String Manipulation in FORTRAN.")
			elseif Rprog == 6 then
				sendMsg("Real Programmers do Accounting (if they do it at all) in FORTRAN.")
			elseif Rprog == 7 then
				sendMsg("Real Programmers do Artificial Intelligence programs in FORTRAN.")
			elseif Rprog == 8 then
				sendMsg("If you can't do it in FORTRAN, do it in assembly language. If you can't do it in assembly language, it isn't worth doing.")
			elseif Rprog == 9 then
				sendMsg("Real Programmers aren't afraid to use GOTOs.")
			elseif Rprog == 10 then
				sendMsg("Real Programmers can write five page long DO loops without getting confused.")
			elseif Rprog == 11 then
				sendMsg("Real Programmers enjoy Arithmetic IF statements because they make the code more interesting.")
			elseif Rprog == 12 then
				sendMsg("Real Programmers write self-modifying code, especially if it saves them 20 nanoseconds in the middle of a tight loop.")
			elseif Rprog == 13 then
				sendMsg("Real Programmers don't need comments: the code is obvious.")
			elseif Rprog == 14 then
				sendMsg("Since FORTRAN doesn't have a structured IF, REPEAT ... UNTIL, or CASE statement, Real Programmers don't have to worry about not using them. Besides, they can be simulated when necessary using assigned GOTOs.")
			elseif Rprog == 15 then
				sendMsg("All Real Programmers know, the only useful data structure is the array. Strings, lists, structures, sets -- these are all special cases of arrays and and can be treated that way just as easily without messing up your programing language with all sorts of complications.")
			elseif Rprog == 16 then
				sendMsg("Real Programming Languages, as we all know, have implicit typing based on the first letter of the (six character) variable name.")
			elseif Rprog == 17 then
				sendMsg("Unix is a glorified video game. People don't do Serious Work on Unix systems: they send jokes around the world on USENET and write adventure games and research papers.")
			elseif Rprog == 18 then
				sendMsg("A Real Programmer uses OS/370.")
			elseif Rprog == 19 then
				sendMsg("A truly outstanding programmer can find bugs buried in a 6 megabyte core dump without using a hex calculator. (I have actually seen this done.)")
			elseif Rprog == 20 then
				sendMsg("OS/370 is a truly remarkable operating system. It's possible to destroy days of work with a single misplaced space, so alertness in the programming staff is encouraged.")
			elseif Rprog == 21 then
				sendMsg("Your typical Real Programmer knew the entire bootstrap loader by memory in hex, and toggled it in whenever it got destroyed by his program. (Back then, memory was memory -- it didn't go away when the power went off. Today, memory either forgets things when you don't want it to, or remembers things long after they're better forgotten.)")
			elseif Rprog == 22 then
				sendMsg("No Real Programmer would ever use a computer whose operating system is called SmallTalk, and would certainly not talk to the computer with a mouse.")
			elseif Rprog == 23 then
				sendMsg("The Real Programmer wants a 'you asked for it, you got it' text editor -- complicated, cryptic, powerful, unforgiving, dangerous. TECO, to be precise. It has been observed that a TECO command sequence more closely resembles transmission line noise than readable text. One of the more entertaining games to play with TECO is to type your name in as a command line and try to guess what it does. Just about any possible typing error while talking with TECO will probably destroy your program, or even worse -- introduce subtle and mysterious bugs in a once working subroutine.")
			elseif Rprog == 24 then
				sendMsg("Real Programmers don't use Source language debuggers. Real Programmers can read core dumps.")
			elseif Rprog == 25 then
				sendMsg("Real Programmers don't use Source code maintainance systems. A Real Programmer keeps his code locked up in a card file, because it implies that its owner cannot leave his important programs unguarded")
			elseif Rprog == 26 then
				sendMsg("No real Programmer would be caught dead writing accounts-receivable programs in COBOL, or sorting mailing lists for People magazine.")
			elseif Rprog == 27 then
				sendMsg("A Real Programmer wants tasks of earth-shaking importance (literally!)")
			elseif Rprog == 28 then
				sendMsg("Real Programmers work for the National Security Agency, decoding Russian transmissions.")
			elseif Rprog == 29 then
				sendMsg("It was largely due to the efforts of thousands of Real Programmers working for NASA that our boys got to the moon and back before the cosmonauts.")
			elseif Rprog == 30 then
				sendMsg("The computers in the Space Shuttle were programmed by Real Programmers.")
			elseif Rprog == 31 then
				sendMsg("Programmers are at work for Boeing designing the operating systems for cruise missiles.")
			elseif Rprog == 32 then
				sendMsg("The determined Real Programmer can write FORTRAN programs in any language.")
			elseif Rprog == 33 then
				sendMsg("The Real Programmer plays the same way he works -- with computers. He is constantly amazed that his employer actually pays him to do what he would be doing for fun anyway, although he is careful not to express this opinion out loud.")
			elseif Rprog == 34 then
				sendMsg("At a party, the Real Programmers are the ones in the corner talking about operating system security and how to get around it.")
			elseif Rprog == 35 then
				sendMsg("At a football game, the Real Programmer is the one comparing the plays against his simulations printed on 11 by 14 fanfold paper.")
			elseif Rprog == 36 then
				sendMsg("At the beach, the Real Programmer is the one drawing flowcharts in the sand.")
			elseif Rprog == 37 then
				sendMsg("A Real Programmer goes to a disco to watch the light show.")
			elseif Rprog == 38 then
				sendMsg("At a funeral, the Real Programmer is the one saying 'Poor George. And he almost had the sort routine working before the coronary.'")
			elseif Rprog == 39 then
				sendMsg("In a grocery store, the Real Programmer is the one who insists on running the cans past the laser checkout scanner himself, because he never could trust keypunch operators to get it right the first time.")
			elseif Rprog == 40 then
				sendMsg ("The Real Programmer is capable of working 30, 40, even 50 hours at a stretch, under intense pressure. In fact, he prefers it that way. Bad response time doesn't bother the Real Programmer -- it gives him a chance to catch a little sleep between compiles.")
			elseif Rprog == 41 then
				sendMsg("If there is not enough schedule pressure on the Real Programmer, he tends to make things more challenging by working on some small but interesting part of the problem for the first nine weeks, then finishing the rest in the last week, in two or three 50-hour marathons. This not only inpresses his manager, who was despairing of ever getting the project done on time, but creates a convenient excuse for not doing the documentation.")
			elseif Rprog == 42 then
				sendMsg("No Real Programmer works 9 to 5. (Unless it's 9 in the evening to 5 in the morning.)")
			elseif Rprog == 43 then
				sendMsg("Real Programmers don't wear neckties.")
			elseif Rprog == 44 then
				sendMsg("Real Programmers don't wear high heeled shoes.")
			elseif Rprog == 45 then
				sendMsg("Real Programmers arrive at work in time for lunch.")
			elseif Rprog == 46 then
				sendMsg("A Real Programmer might or might not know his wife's name. He does, however, know the entire ASCII (or EBCDIC) code table.")
			elseif Rprog == 47 then
				sendMsg("Real Programmers don't know how to cook. Grocery stores aren't often open at 3 a.m., so they survive on Twinkies and coffee.")
			elseif Rprog == 48 then
				sendMsg(" As long as there are ill-defined goals, bizarre bugs, and unrealistic schedules, there will be Real Programmers willing to jump in and Solve The Problem, saving the documentation for later. Long live FORTRAN!")
			end
		elseif string.find(irc.msg, "!help " .. bot.nick) then
			sendMsg("COMMANDS:")
			sendMsg("THE COMMAND LIST IS COMING SOON TO A BOT NEAR YOU")

		elseif string.find(irc.msg, "how are you" .. bot.nick) or string.find(irc.msg, bot.nick .. ", how are you") then
			sendMsg("I'm okay, you?")
		end
	else
	end
end

















