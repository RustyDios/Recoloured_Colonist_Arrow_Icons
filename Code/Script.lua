--[[ =========== Start:: Recoloured Colonist Arrow Icons ========== --]]

local mod_name = "Recoloured_Colonist_Arrow_Icons"
local steamID = "1660461805"
-- local author = "RustyDios"
-- local version ="2"

--[[ =========== Start:: Add Entities ========== --]]

-- list of entities we're going to be adding
local entity_list = {
	"RDRCAIArrowThirsty",
	"RDRCAIArrowFreezing",
	"RDRCAIArrowSuffocating",
	"RDRCAIArrowHungry",
	"RDRCAIArrowInsane",
	"RDRCAIArrowEarthsick",
	"RDRCAIArrowHomeless",
	"RDRCAIArrowWork",
	--"RDRCAIArrowRad",
	--"RDRCAIArrowUnable",

	"RDRCAIArrowThirsty_sml",
	"RDRCAIArrowFreezing_sml",
	"RDRCAIArrowSuffocating_sml",
	"RDRCAIArrowHungry_sml",
	"RDRCAIArrowInsane_sml",
	"RDRCAIArrowEarthsick_sml",
	"RDRCAIArrowHomeless_sml",
	"RDRCAIArrowWork_sml",
	--"RDRCAIArrowRad_sml",
	--"RDRCAIArrowUnable_sml",
	--"RDCAIArrowRogue_sml",
}
-- getting called a bunch, so make them local
local path_loc_str = string.format("%sEntities/%s.ent",CurrentModPath,"%s")
local mod = Mods.mod_name
local EntityData = EntityData
local EntityLoadEntities = EntityLoadEntities
local SetEntityFadeDistances = SetEntityFadeDistances

-- no sense in making a new one for each entity
local EntityDataTableTemplate = {
	category_Decors = true,
	entity = {
		fade_category = "Never",
		material_type = "Metal",
	},
}

-- pretty much using what happens when you use ModItemEntity
local function AddEntity(name)
	EntityData[name] = EntityDataTableTemplate
	EntityLoadEntities[#EntityLoadEntities + 1] = {
		mod,
		name,
		path_loc_str:format(name)
	}
	SetEntityFadeDistances(name, -1, -1)
end

for i = 1, #entity_list do
	AddEntity(entity_list[i])
end
--[[ =========== End:: Add Entities ========== --]]

--[[ =========== Start:: Replace Entities ========== --]]

function OnMsg.ClassesBuilt()
	-- this changes the default class entity, so no way to revert for these
	UnitArrowThirsty.entity = "RDRCAIArrowThirsty"
	UnitArrowFreezing.entity = "RDRCAIArrowFreezing"
	UnitArrowSuffocating.entity = "RDRCAIArrowSuffocating"
	UnitArrowHungry.entity = "RDRCAIArrowHungry"
	UnitArrowInsane.entity = "RDRCAIArrowInsane"
	UnitArrowEarthsick.entity = "RDRCAIArrowEarthsick"
	UnitArrowHomeless.entity = "RDRCAIArrowHomeless"
	UnitArrowUnemployed.entity = "RDRCAIArrowWork"
	--UnitArrowIrradiated.entity = "RDRCAIArrowRad"
	--UnitArrowUnableToWork.entity = "RDRCAIArrowUnable" -- I believe this is the rogue arrow for colonists

	UnitSignThirsty.entity = "RDRCAIArrowThirsty_sml"
	UnitSignFreezing.entity = "RDRCAIArrowFreezing_sml"
	UnitSignSuffocating.entity = "RDRCAIArrowSuffocating_sml"
	UnitSignStarving.entity = "RDRCAIArrowHungry_sml"
	UnitSignInsane.entity = "RDRCAIArrowInsane_sml"
	UnitSignEarthsick.entity = "RDRCAIArrowEarthsick_sml"
	UnitSignHomeless.entity = "RDRCAIArrowHomeless_sml"
	UnitSignUnemployed.entity = "RDRCAIArrowWork_sml"
	--UnitSignIrradiated.entity = "RDRCAIArrowRad_sml"
	--UnitSignUnableToWork.entity = "RDRCAIArrowUnable_sml" --I believe this is the breakdown for RC's
	--UnitSignRogue.entity = "RDCAIArrowRogue_sml"

end

-- replace existing ones (that haven't been replaced yet)
local function ChangeEntityLabel(label,cls,new)
	for i = 1, #(label or "") do
		if label[i].entity ~= new and label[i]:IsKindOf(cls) then
			label[i]:ChangeEntity(new)
		end
	end
end

local function InitialModSwap()
	-- this way it'll only fire once per savegame instead of every load
	if not UICity.RD_RCAI_Exchange then
		local l = UICity.labels
		ChangeEntityLabel(l.UnitArrowThirsty,"UnitArrowThirsty","RDRCAIArrowThirsty")
		ChangeEntityLabel(l.UnitArrowFreezing,"UnitArrowFreezing","RDRCAIArrowFreezing")
		ChangeEntityLabel(l.UnitArrowSuffocating,"UnitArrowSuffocating","RDRCAIArrowSuffocating")
		ChangeEntityLabel(l.UnitArrowHungry,"UnitArrowHungry","RDRCAIArrowHungry")
		ChangeEntityLabel(l.UnitArrowInsane,"UnitArrowInsane","RDRCAIArrowInsane")
		ChangeEntityLabel(l.UnitArrowEarthsick,"UnitArrowEarthsick","RDRCAIArrowEarthsick")
		ChangeEntityLabel(l.UnitArrowHomeless,"UnitArrowHomeless","RDRCAIArrowHomeless")
		ChangeEntityLabel(l.UnitArrowUnemployed,"UnitArrowUnemployed","RDRCAIArrowWork")
		--ChangeEntityLabel(l.UnitArrowIrradiated,"UnitArrowIrradiated","RDRCAIArrowRad")
		--ChangeEntityLabel(l.UnitArrowUnableToWork,"UnitArrowUnableToWork","RDRCAIArrowUnable")
	
		ChangeEntityLabel(l.UnitSignThirsty,"UnitSignThirsty","RDRCAIArrowThirsty_sml")
		ChangeEntityLabel(l.UnitSignFreezing,"UnitSignFreezing","RDRCAIArrowFreezing_sml")
		ChangeEntityLabel(l.UnitSignSuffocating,"UnitSignSuffocating","RDRCAIArrowSuffocating_sml")
		ChangeEntityLabel(l.UnitSignHungry,"UnitSignHungry","RDRCAIArrowHungry_sml")
		ChangeEntityLabel(l.UnitSignInsane,"UnitSignInsane","RDRCAIArrowInsane_sml")
		ChangeEntityLabel(l.UnitSignEarthsick,"UnitSignEarthsick","RDRCAIArrowEarthsick_sml")
		ChangeEntityLabel(l.UnitSignHomeless,"UnitSignHomeless","RDRCAIArrowHomeless_sml")
		ChangeEntityLabel(l.UnitSignUnemployed,"UnitSignUnemployed","RDRCAIArrowWork_sml")
		--ChangeEntityLabel(l.UnitSignIrradiated,"UnitSignIrradiated","RDRCAIArrowRad_sml")
		--ChangeEntityLabel(l.UnitSignUnableToWork,"UnitSignUnableToWork","RDRCAIArrowUnable_sml")
		--ChangeEntityLabel(l.UnitSignRogue,"UnitSignRogue","RDCAIArrowRogue_sml")

		UICity.RD_RCAI_Exchange = true
	end
end

--replace on a new map
function OnMsg.CityStart()
	InitialModSwap()
end

--replace on a loaded save that hasn't been modded yet
function OnMsg.LoadGame()
	InitialModSwap()
end

--[[ =========== End:: Replace Entities ========== --]]

--[[ =========== End ::Recoloured Colonist Arrow Icons ========== --]]
