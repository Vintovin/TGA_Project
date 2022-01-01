
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
### UserStore.getUserInfo(*UserId*) -> [*String* ResponseCode, *Array* UserProfile]
Queries the configured database for the stored profile of a requested user
### Parameters
| Name |DataType  | Description|
|--|--|--|
|  UserId| Int |The UserId of the requested User |
### Returns
| Name |DataType  | Description|
|--|--|--|
| ResponseCode| String |Suc/Fail - Indicated the state of the function |
| UserProfile| Array | UserAccountTemplate Object|
 
 
