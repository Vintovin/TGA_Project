local GlobalAssets = game:GetService("ReplicatedStorage").GlobalAssets
local Leaderboard = game:GetService("ReplicatedStorage").Leaderboard
local Events = game:GetService("ReplicatedStorage").Events
local yes = {}


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
	return("Test Success")
end
--#######################################################
--#######################################################  CREATE ENTRY
--#######################################################
yes.newEntry = function(plr)
	local NewFrame = GlobalAssets.UserTemplate:Clone()
	NewFrame.Name = plr.Name
	NewFrame.Username.Text = plr.Name
	NewFrame.Credits.Text = _G.PlayerList[plr.Name].Credits
	NewFrame.Kills.Text = "0"
	NewFrame.Deaths.Text = "0"
	print("InfoLoaded")
	NewFrame.Parent = Leaderboard
	return(ReturnStatement.new("suc","New Entry Created"))
end
--#######################################################
--#######################################################  UPDATE VARIABLE
--#######################################################
yes.newEntry = function(plr)
	local NewFrame = GlobalAssets.UserTemplate:Clone()
	NewFrame.Name = plr.Name
	NewFrame.Username.Text = plr.Name
	NewFrame.Credits.Text = _G.PlayerList[plr.Name].Credits
	NewFrame.Kills.Text = "0"
	NewFrame.Deaths.Text = "0"
	print("InfoLoaded")
	NewFrame.Parent = Leaderboard
	return(ReturnStatement.new("suc","New Entry Created"))
end


--###########################################################################################################
--///////////////////////////////////////////////////Returns/////////////////////////////////////////////////
--###########################################################################################################
return(yes)
