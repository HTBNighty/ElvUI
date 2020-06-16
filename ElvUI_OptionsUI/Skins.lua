local E, _, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local C, L = unpack(select(2, ...))
local B = E:GetModule("Blizzard")
local ACH = E.Libs.ACH

E.Options.args.skins = {
	type = "group",
	name = L["Skins"],
	childGroups = "tab",
	order = 2,
	args = {
		intro = ACH:Description(L["SKINS_DESC"], 0),
		general = {
			order = 1,
			type = 'multiselect',
			name = L["General"],
			get = function(info, key)
				if key == 'blizzardEnable' then
					return E.private.skins.blizzard.enable
				else
					return E.private.skins[key]
				end
			end,
			set = function(info, key, value)
				if key == 'blizzardEnable' then
					E.private.skins.blizzard.enable = value
				else
					E.private.skins[key] = value
				end
				E:StaticPopup_Show("PRIVATE_RL")
			end,
			sortByValue = true,
			values = {
				ace3Enable = "Ace3",
				blizzardEnable = L["Blizzard"],
				checkBoxSkin = L["CheckBox Skin"],
				cleanBossButton = L["Clean Boss Button"],
				parchmentRemoverEnable = L["Parchment Remover"],
			},
		},
		talkingHead = {
			order = 2,
			type = 'group',
			guiInline = true,
			name = L["TalkingHead"],
			args = {
				talkingHeadFrameScale = {
					order = 24,
					type = "range",
					name = L["Talking Head Scale"],
					isPercent = true,
					min = 0.5, max = 2, step = 0.01,
					get = function(info) return E.db.general.talkingHeadFrameScale end,
					set = function(info, value) E.db.general.talkingHeadFrameScale = value; B:ScaleTalkingHeadFrame() end,
				},
				talkingHeadFrameBackdrop = {
					order = 25,
					type = "toggle",
					name = L["Talking Head Backdrop"],
					get = function(info) return E.db.general.talkingHeadFrameBackdrop end,
					set = function(info, value) E.db.general.talkingHeadFrameBackdrop = value; E:StaticPopup_Show("CONFIG_RL") end
				},
			},
		},
		blizzard = {
			order = 3,
			type = 'multiselect',
			name = L["Blizzard"],
			get = function(info, key) return E.private.skins.blizzard[key] end,
			set = function(info, key, value) E.private.skins.blizzard[key] = value; E:StaticPopup_Show("PRIVATE_RL") end,
			disabled = function() return not E.private.skins.blizzard.enable end,
			sortByValue = true,
			values = {
				achievement = L["ACHIEVEMENTS"],
				addonManager = L["AddOn Manager"],
				AdventureMap = L["ADVENTURE_MAP_TITLE"],
				alertframes = L["Alert Frames"],
				AlliedRaces = L["Allied Races"],
				archaeology = L["Archaeology Frame"],
				artifact = L["ITEM_QUALITY6_DESC"],
				auctionhouse = L["AUCTIONS"],
				AzeriteEssence = L["Azerite Essence"],
				AzeriteRespec = L["AZERITE_RESPEC_TITLE"],
				AzeriteUI = L["AzeriteUI"],
				bags = L["Bags"],
				barber = L["BARBERSHOP"],
				bgmap = L["BG Map"],
				bgscore = L["BG Score"],
				binding = L["KEY_BINDINGS"],
				BlizzardOptions = L["INTERFACE_OPTIONS"],
				bmah = L["BLACK_MARKET_AUCTION_HOUSE"],
				calendar = L["Calendar Frame"],
				Channels  = L["CHANNELS"],
				character = L["Character Frame"],
				collections = L["COLLECTIONS"],
				Communities = L["COMMUNITIES"],
				Contribution = L["Contribution"],
				deathRecap = L["DEATH_RECAP_TITLE"],
				debug = L["Debug Tools"],
				dressingroom = L["DRESSUP_FRAME"],
				encounterjournal = L["ENCOUNTER_JOURNAL"],
				friends = L["FRIENDS"],
				garrison = L["GARRISON_LOCATION_TOOLTIP"],
				gbank = L["GUILD_BANK"],
				GMChat = L["GM Chat"],
				gossip = L["Gossip Frame"],
				guild = L["GUILD"],
				guildcontrol = L["Guild Control Frame"],
				guildregistrar = L["Guild Registrar"],
				help = L["Help Frame"],
				inspect = L["INSPECT"],
				IslandQueue = L["ISLANDS_HEADER"],
				IslandsPartyPose = L["Island Party Pose"],
				ItemInteraction = L["Item Interaction"],
				itemUpgrade = L["Item Upgrade"],
				lfg = L["LFG_TITLE"],
				lfguild = L["LF Guild Frame"],
				loot = L["Loot Frames"],
				losscontrol = L["LOSS_OF_CONTROL"],
				macro = L["MACROS"],
				mail = L["Mail Frame"],
				merchant = L["Merchant Frame"],
				mirrorTimers = L["Mirror Timers"],
				misc = L["Misc Frames"],
				nonraid = L["Non-Raid Frame"],
				objectiveTracker = L["OBJECTIVES_TRACKER_LABEL"],
				Obliterum = L["OBLITERUM_FORGE_TITLE"],
				orderhall = L["Orderhall"],
				petbattleui = L["Pet Battle"],
				petition = L["Petition Frame"],
				pvp = L["PvP Frames"],
				quest = L["Quest Frames"],
				questChoice = L["Quest Choice"],
				raid = L["Raid Frame"],
				Scrapping = L["SCRAP_BUTTON"],
				socket = L["Socket Frame"],
				spellbook = L["SPELLBOOK"],
				stable = L["Stable"],
				tabard = L["Tabard Frame"],
				talent = L["TALENTS"],
				talkinghead = L["TalkingHead"],
				taxi = L["FLIGHT_MAP"],
				timemanager = L["TIMEMANAGER_TITLE"],
				tooltip = L["Tooltip"],
				trade = L["TRADE"],
				tradeskill = L["TRADESKILLS"],
				trainer = L["Trainer Frame"],
				transmogrify = L["TRANSMOGRIFY"],
				Tutorials = L["Tutorials"],
				voidstorage = L["VOID_STORAGE"],
				Warboard = L["Warboard"],
				worldmap = L["WORLD_MAP"],
			},
		},
	},
}
