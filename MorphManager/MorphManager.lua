local module = {}


Morphs = game:GetService("ServerStorage")
GARMorphs = Morphs:FindFirstChild("GAR")
--###########################################################################################################
--///////////////////////////////////////////////Local Functions/////////////////////////////////////////////
--###########################################################################################################
--#######################################################
--#######################################################  FindInList
--#######################################################
function FindInList(List,ValueName)
	for i,v in pairs(List) do
		print(i)
		print("---")
		print(v)
		print("-------------")

		if(i == ValueName) then
			return(v)
		end
	end
	return(nil)
end
--#######################################################
--#######################################################  PCheck
--#######################################################
local function Pcheck(plr)
	local List = {}
	
	local M = plr:FindFirstChild('Morph')
	if M == nil then
		local Folder = Instance.new('Folder')
		Folder.Name = 'Morph'
		Folder.Parent = plr
		List.Morph = Folder
	else
		List.Morph = M
	end
	
	local C =  plr:FindFirstChild('Coat')
	if C == nil then
		local Folder = Instance.new('Folder')
		Folder.Name = 'Coat'
		Folder.Parent = plr
		List.Coat = Folder
	else
		List.Coat = C
	end
	
	local A = plr:FindFirstChild('Add')
	if A == nil then
		local Folder = Instance.new('Folder')
		Folder.Name = 'Add'
		Folder.Parent = plr
		List.Add = Folder
	else
		List.Add = A
	end
	
	local P = plr:FindFirstChild('Pauld')
	if P == nil then
		local Folder = Instance.new('Folder')
		Folder.Name = 'Pauld'
		Folder.Parent = plr
		List.Pauld = Folder
	else
		List.Pauld = P
	end
	return(List)
end
--#######################################################
--#######################################################
--#######################################################
--###########################################################################################################
--///////////////////////////////////////////////Global Variables/////////////////////////////////////////////
--###########################################################################################################
--#######################################################
--#######################################################  Setup Group Ranks
--#######################################################
local Group_Ranks = {}

function GatherRanks(GroupInfo)
	local Ranks = FindInList(GroupInfo,"Roles")
	for i,v in pairs(Ranks) do
		print(v)
	end
end




--###########################################################################################################
--//////////////////////////////////////////////Module Functions/////////////////////////////////////////////
--###########################################################################################################
--#######################################################
--#######################################################  Init
--#######################################################
module.Init = function()
	GatherRanks
end
--#######################################################
--#######################################################  buildMorph
--#######################################################
module.buildMorph = function(plr, Class, Rank , test)
	
	local Folders = Pcheck(plr)
	local Char = plr.Character
	
	local MorphFolder = GARMorphs:FindFirstChild(Class):FindFirstChild(Rank)
	if MorphFolder then
		local Active = Folders.Morph
		local g = MorphFolder:Clone()
		for i,v in pairs(MorphFolder:GetChildren()) do
			g.Parent = Active
			for i, v in ipairs(g:GetChildren()) do
				if v:IsA("BasePart") then
					local W = Instance.new("Weld")
					W.Part0 = g.Middle
					W.Part1 = v
					local CJ = CFrame.new(g.Middle.Position)
					local C0 = g.Middle.CFrame:inverse() * CJ
					local C1 = v.CFrame:inverse() * CJ
					W.C0 = C0
					W.C1 = C1
					W.Parent = g.Middle
				end
				local Y = Instance.new("Weld")
				Y.Part0 = plr:FindFirstChild(i)
				Y.Part1 = g.Middle
				Y.C0 = CFrame.new(0, 0, 0)
				Y.Parent = Y.Part0
			end
			local h = g:GetChildren()
			for i = 1, # h do
				if h[i].className == "Part" or  h[i].className == "UnionOperation" or  h[i].className == "MeshPart" or  h[i].className == "WedgePart" then  
					h[i].Anchored = false
					h[i].CanCollide = false
				end
			end
		end
	end
	
end
--###########################################################################################################
--///////////////////////////////////////////////////Returns/////////////////////////////////////////////////
--###########################################################################################################
return module
