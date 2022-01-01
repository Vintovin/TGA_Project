local DS = game:GetService("DataStoreService")
local GS = DS:GetDataStore("TESTDATASTORE:VINTOVIN_BIMBLES")
local yes = {}


--###########################################################################################################
--////////////////////////////////////////////UserTemplate Object////////////////////////////////////////////
--###########################################################################################################
local UserAccountTemplate = {}
UserAccountTemplate.__index = UserAccountTemplate
--#######################################################
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
--###########################################################################################################
--//////////////////////////////////////////Return Statement Object//////////////////////////////////////////
--###########################################################################################################
local ReturnStatement = {}
ReturnStatement.__index = ReturnStatement
--#######################################################
--#######################################################
function ReturnStatement.new(code,data)
	local NewStatement = {}
	setmetatable(NewStatement,ReturnStatement)
	
	NewStatement.Code = code
	NewStatement.Data = data
	
	return(NewStatement)
end

--###########################################################################################################
--//////////////////////////////////////////////Module Functions/////////////////////////////////////////////
--###########################################################################################################
yes.test = function()
    print("This is a test")

    local success, currentExperience = pcall(function()
        return GS:GetAsync("TestGroup")
    end)
    if success then
        print(currentExperience)
    end
end
--#######################################################
--#######################################################  GET USER
--#######################################################
yes.getUserInfo = function(UID)
	local success, User = pcall(function()
		return GS:GetAsync(UID)
	end)
	if success then
		local rs = ReturnStatement.new("suc",User)
		return(rs)
	else
		local rs = ReturnStatement.new("fail","")
		return(rs)
	end
end
--#######################################################
--#######################################################  CREATE USER
--#######################################################
yes.createNewUser = function(UID,name,cred,acc,spec)
	local User = UserAccountTemplate.new(UID,name,cred,acc,spec)
	
	local success, errorMessage = pcall(function()
		GS:SetAsync(UID, User)
	end)
	if not success then
		print(errorMessage)
		local rs = ReturnStatement.new("fail",errorMessage)
		return(rs)
	end
	local rs = ReturnStatement.new("suc",success)
	return(rs)
end
--###########################################################################################################
--///////////////////////////////////////////////////Returns/////////////////////////////////////////////////
--###########################################################################################################
return(yes)
