

# PlayTime Module Documentation

## Introduction
This is a brief documentation to explain the use setup and appropriate uses of the PlayTime Module. This module is used to track and report user playtime statistics to the relevant bots/database.
##
## Installation
Place the file in an appropriate location within the Game.

[Example placement](https://i.imgur.com/Mnx7X9X.png)

*Should be placed within a dedicated module folder*

It should be noted that this should be placed in an appropriate location, where clients would not be able to access, as this could lead to exploitation of the PlayTime Tracking system ***Which is not ideal for anyone***
##
## Setting up for use
### Configure the Module
In order to access the correct and secure datastore, you must make sure that the `IP` Constant is set to the correct URL for the bot VPS/Host, *Including "HTTP://"*

In order to use the module and access the relevant information and functions held within your datastore, you must utilise the built in ```lua require()``` function.
### Example
```lua
local PlayTimeModule = game:GetService("ServerScriptService").Modules.PlayTime
local PlayTime = require(PlayTimeModule)

PlayTime.Test()
```

In this case, the output would be

```
  This is a test - PlayTime:61
```

## Usage
### Objects
As this module is using an OOP Paradigm, it is important to understand the possible objects utilised within the module to make best use of it.

The End/Middle user will not have direct access to these object constructors without editing the source code, which I would not recommend. 
##

### ReturnStatement
Constructor Code:
```lua
local ReturnStatement = {}
ReturnStatement.__index = ReturnStatement
--#######################################################
function ReturnStatement.new(code,data)
	local NewStatement = {}
	setmetatable(NewStatement,ReturnStatement)
	NewStatement.Code = code
	NewStatement.Data = data
	
	return(NewStatement)
end
```

### Properties
| Name | Datatype | Description | 
|--|--|--|
| Code| String | The resultant Code of an operation *E.g "Suc"/"Fail"*|
| Data |  | The return data of an method/function|

##
### Functions
### Format:
PlayTime.*Function*(*Parameters*) -> *ReturnDataType ReturnData*



##
### PlayTime.Test() -> nil
Tests the connection to your Server
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  None |  | |
##

### PlayTime.UserJoined(*Player*) -> *ReturnStatement*
Logs the target user to initiate the playtime service specific to a user
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  plr| PlayerObject |The PlayerObject of the target User|
### Returns
The structure of the return Statement
| Name |DataType  | Description|
|--|--|--|
| ResponseCode| String |Suc/Fail - Indicated the state of the function |
| Data |  ||

### PlayTime.UserLeaving(*Player*) -> *ReturnStatement*
Target user is logged as leaving and the points accumulated are submitted to the linked bot/VPS
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  plr| PlayerObject |The PlayerObject of the target User|
### Returns
The structure of the return Statement
| Name |DataType  | Description|
|--|--|--|
| ResponseCode| String |Suc/Fail - Indicated the state of the function |
| Data |  ||


## HTTP Post Request

### Send command
```lua 
HTTP:PostAsync(IP,HTTP:JSONEncode(sendData),Enum.HttpContentType.ApplicationJson,false)
```
### sendData Format
| Name |DataType  | Description|
|--|--|--|
| JoinTime | Int | The integer time which the game was joined |
| LeaveTime | Int | The integer time which the game was left | 
| TimeElaplsed| Int | The integer time spent in the game | 
| Points | Int | The integer points earned while being in the game | 
| UID | Int | A users unique identifying number | 
