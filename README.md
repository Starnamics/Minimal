![Banner|690x280](https://doy2mn9upadnk.cloudfront.net/uploads/default/optimized/4X/e/8/d/e8d2f8c7b1c214d23ec94a5809c3d8fbabcb2aa3_2_690x280.png) 
<hr>
Almost all admin modules are complicated and hard to setup or add things to. Minimal avoids doing this and tries to make it as easy as possible for developers to configure and mess around with.

## Features

- Simple & easy to use UI
- Easy to setup
- Pre-made commands
- and more!

Minimal's UI is very simple, you don't need to worry about clicking tons of buttons, with Minimal, you only need to press a single key to execute a command.

## Setup

Setting up Minimal is quite easy, first get the [model](https://www.roblox.com/library/6868046577/Minimal) or [download](https://github.com/Starnamics/Minimal/releases/latest) it

Current Version: 0.7

Once you've got it, insert it into your game and follow the steps below:

1. Drag the "Minimal" folder into `ReplicatedStorage`
2. Drag the "Minimal" GUI into `StarterGui`
3. Drag the "Minimal" script into `ServerScriptStorage`

and you're done!

## Configuring

After you have setup Minimal, you need to configure it. To do so, follow the steps below.

1. Open the "Configuration" module
2. Replace the numbers with your User ID<br>
![image|166x64](https://doy2mn9upadnk.cloudfront.net/uploads/default/original/4X/c/4/7/c47cdb42f40709454d30a7dd9cec468e6e696238.png) 
3. Read through the configuration module to see how to set the rest up

## Custom Commands
Custom Commands are our core feature, they allow you to easily program in whatever commands you'd like!

To program a custom command, open the "Commands" folder and duplicate the `Test` module<br>
![image|188x310](https://doy2mn9upadnk.cloudfront.net/uploads/default/original/4X/7/2/e/72ec572ea782574c26e05439f0292da7d04e1747.png) 

Once you've duplicated it, open it and you should see this:
![image|690x135](https://doy2mn9upadnk.cloudfront.net/uploads/default/original/4X/d/5/7/d57de9943cd75df7a106214a078062a07a20bc57.png) 

You will need to configure all of these or it will break the command.

**Command:** The name of your command and the main command players will type to execute it
**Aliases:** Shorter names for your command which players can type to execute your command easier
**Description:** A short description of what your command does
**Usage:** How to use the command
**Permission Level:** The permission level a player needs to have to execute the command

Once you have filled all that out, you can move onto the scripting part!

The testing command should already have a script which will print all the arguments in the command<br>
![image|670x186](https://doy2mn9upadnk.cloudfront.net/uploads/default/original/4X/3/3/a/33a12758305086701df6d5efeeeeebef62aff25d.png) 

You can replace this script with the command you want to have

Once you've scripted your script, enter your game and press `;` (or the keybind you set) then type in your command!

## API

To make Minimal easier to use, I've made an API for you to use to make scripting commands a bit easier.

To use it, simply require the API at the top of your scripts.

**Minimal:FindCommand()**
This function will check to see if a string is a command, it's useful for when you want to make a custom UI
```lua
local API = require(path.to.MinimalAPI)

print(API:FindCommand("commands"))

-->> true
```
It will return either `true` or `false` depending on if the command exists.

**Minimal:GetCommand()**
This function will return a commands ModuleScript which you can use to get the commands information.
```lua
local API = require(path.to.MinimalAPI)

print(API:GetCommand("commands"))

-->> Commands 
```
If the command exists, it will return the commands instance or `nil` if it does not exist.

**Minimal:FindAlias()**
This has the same usage as **Minimal:FindCommand()** but instead will look for the commands alias

```lua
local API = require(path.to.MinimalAPI)

print(API:FindAlias("cmds"))

-->> true
```

**Minimal:GetAlias()**
This has the same usage as **Minimal:GetCommand()** but instead will get the commands alias

```lua
local API = require(path.to.MinimalAPI)

print(API:GetAlias("cmds"))

-->> Commands
```
**Minimal:GetPermission()**
This will get the permission level for a specific player, useful for checking if a user has access to the admin or not
```lua
local API = require(path.to.MinimalAPI)

print(API:GetPermission(game.Players.LocalPlayer))

-->> 1
```
This will return either `1` (player), `2` (moderator) or `3` (administrator)

**Minimal:GetPlayer()**
This is useful for finding a player using a partial name (eg: ROBL for ROBLOX)
```lua
local API = require(path.to.MinimalAPI)

print(API:GetPlayer("Star"))
print(API:GetPlayer("Player",true))

-->> Starnamics (Player Instance)
-->> {Player1,Player2,Player3,Player4}
```
This will return either a player instance (if player is found and 2nd argument is empty), a table (if player is found and the 2nd argument is empty) or `nil` if the player is not found

**Minimal:FilterString()**
This is useful for filtering strings for message/announcement commands.
```lua
local API = require(path.to.MinimalAPI)

print(API:FilterString("Hello!",Player))

-->> Hello!
```
Returns a string or nil if argument 1 or 2 are empty

## Notes

Arguments are by default separated by the `/` key, if your command is not executing, make sure you type `/` before each argument, using spacebar as an argument separator is fine but you may need to add change the Minimal script in ServerScriptStorage to handle multiple words in a single argument.

I'll be making a GitHub repo for Minimal shortly.

## Support Server

If you're running into some problems, you can join our support server to get some help

[Discord Server](https://discord.gg/8DZYpKs4Be)

This server is also useful for getting notified when Minimal updates or when you're looking for custom commands!
