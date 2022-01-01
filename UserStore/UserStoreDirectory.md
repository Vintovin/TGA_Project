
# UserStore Module Documentation

## Introduction
This is a brief documentation to explain the use setup and appropriate uses of the UserStore module.
##
## Installation
Place the file in an appropriate location within the Game.

![Example placement](https://i.imgur.com/Mnx7X9X.png)

It should be noted that this should be placed in an appropriate location, where clients would not be able to access, as this could lead to exploitation of the User Database system ***Which is not ideal for anyone***
##
## Setting up for use
### Configure the Module
In order to access the correct and secure datastore, you must make sure that the `GS` Constant is set to the correct Datastore. 

For the repository and pre-publication testing, the datastore in use is `"TESTDATASTORE:VINTOVIN_BIMBLES"`
Which is further supported by UserId async keys

In order to use the module and access the relevant information and functions held within your datastore, you must utilise the built in ```lua require()``` function.

### Example
```lua
local UserStoreModule = game:GetService("ServerScriptService").Modules.UserStore
local UserStore = require(UserStoreModule)

UserStore.Test()
```

In this case, the output would be

```
  This is a test - UserStore:48
  -
   {
    ["TestBool"] = true,
    ["TestInt"] = 52,
    ["TestValue"] = "This is a test String"
   } - UserStore:54
```

## Usage
### Objects
As this module is using an OOP Paradigm, it is important to understand the possible objects utilised within the module to make best use of it.

The End/Middle user will not have direct access to these object constructors without editing the source code, which I would not recommend. 
##
### UserAccount
Constructor Code:
```lua
local UserAccountTemplate = {}
UserAccountTemplate.__index = UserAccountTemplate
--#######################################################
function UserAccountTemplate.new(uid,name,cred,acc,spec)
	local NewUser = {}
	setmetatable(NewUser,UserAccountTemplate)
	NewUser.UserID = uid
	NewUser.Name = name
	NewUser.Credits = cred
	NewUser.AccessLevel = acc
	NewUser.SpecialPermissions = spec

	return(NewUser)
end
```

### Properties
| Name | Datatype | Description | 
|--|--|--|
| UserID| Int | The UserId of the user|
| Name | String | The username of the user|
| Credits | Int | The amount of in-game currency a user has accumulated|
| AccessLevel | Int | The numerical representation of a users in-game zone access |
| SpecialPermissions | Array | An array of any special permissions which a user holds, such as, Administrator, Police, Moderator, Education Staff|

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
UserStore.*Function*(*Parameters*) -> *ReturnDataType ReturnData*



##
### UserStore.Test() -> nil
Tests the connection to your datastore
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  None |  | |
##
### UserStore.getUserInfo(*UserId*) -> *ReturnStatement*
Queries the configured database for the stored profile of a requested user
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  UserId| Int |The UserId of the requested User |
### Returns
The structure of the return Statement
| Name |DataType  | Description|
|--|--|--|
| ResponseCode| String |Suc/Fail - Indicated the state of the function |
| Data | UserAccount | UserAccount Object holding the requested User's data|
 
### UserStore.createNewUser(*UID*,*name*,*Cred*,*Acc*,*Spec*) -> *ReturnStatement*
Creates a new user object within the database
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  UID | Int |The UserId of the requested new user |
|  name | String |The Username of the requested new user |
|  Cred | Int |The Credits belonging to the new user |
|  Acc | Int |The Access level of the requested new user |
|  Spec | Array |Any special permissions given to the requested new user |
### Returns
The structure of the return Statement
| Name |DataType  | Description|
|--|--|--|
| ResponseCode| String |Suc/Fail - Indicated the state of the function |
| Data | bool | The write status of the new user account|
 
### UserStore.saveData(UID, Data) -> *ReturnStatement*
Updates the existing entry of a user, by overwriting the previous UserAccount object with a new amended UserAccount object 
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  UID | Int |The UserId of the requested new user |
|  Data | UserAccount |The new UserAccount object of the desired user |

### Returns
The structure of the return Statement
| Name |DataType  | Description|
|--|--|--|
| ResponseCode| String |Suc/Fail - Indicated the state of the function |
| Data | bool | The write status of the new user account|
