; \1 Label
; \2 Label address
MACRO? dr
	IF BANK(@) == 0
		DEF inc_start = @
	ELSE
		DEF inc_start = @ - $4000
	ENDC

	DEF bank_start = BANK(@) * $4000
	DEF inc_size = (\2) - @

	ASSERT FATAL, inc_size + inc_start <= $4000, "Bank overflow: \1"
	ASSERT FATAL, inc_size >= 0, "Negative binary INCLUDE: \1"

	INCBIN "baserom.bin", bank_start + inc_start, inc_size
	\1::
ENDM

; Predefs
MACRO drp
	dr \1Predef, (\2) * 3 + $681d
ENDM


EXPORT DEF hDMARoutine EQU $ff80

EXPORT DEF CardKeySuccessText EQU $6653
EXPORT DEF CardKeyFailText EQU $665d
EXPORT DEF RedBedroomPCText EQU $5bb7
EXPORT DEF RedBedroomSNESText EQU $5baa
EXPORT DEF PushStartText EQU $62fc
EXPORT DEF SaveOptionText EQU $631a
EXPORT DEF StrengthsAndWeaknessesText EQU $631f
EXPORT DEF OakLabEmailText EQU $6693
EXPORT DEF AerodactylFossilText EQU $5beb
EXPORT DEF Route15UpstairsBinocularsText EQU $5bd5
EXPORT DEF KabutopsFossilText EQU $5c01
EXPORT DEF FanClubPicture1Text EQU $5c17
EXPORT DEF FanClubPicture2Text EQU $5c2d
EXPORT DEF GymStatueText1 EQU $6622
EXPORT DEF GymStatueText2 EQU $6627
EXPORT DEF BookcaseText EQU $66e9
EXPORT DEF ViridianCityPokecenterBenchGuyText EQU $667b
EXPORT DEF PewterCityPokecenterBenchGuyText EQU $6680
EXPORT DEF CeruleanCityPokecenterBenchGuyText EQU $6685
EXPORT DEF LavenderCityPokecenterBenchGuyText EQU $668a
EXPORT DEF VermilionCityPokecenterBenchGuyText EQU $66a8
EXPORT DEF CeladonCityPokecenterBenchGuyText EQU $66ad
EXPORT DEF CeladonCityHotelText EQU $66da
EXPORT DEF FuchsiaCityPokecenterBenchGuyText EQU $66b2
EXPORT DEF CinnabarIslandPokecenterBenchGuyText EQU $66b7
EXPORT DEF SaffronCityPokecenterBenchGuyText EQU $66bc
EXPORT DEF MtMoonPokecenterBenchGuyText EQU $668f
EXPORT DEF RockTunnelPokecenterBenchGuyText EQU $6694
EXPORT DEF UnusedBenchGuyText1 EQU $6699
EXPORT DEF UnusedBenchGuyText2 EQU $669e
EXPORT DEF UnusedBenchGuyText3 EQU $66a3
EXPORT DEF UnusedPredefText EQU $66e0
EXPORT DEF PokemonCenterPCText EQU $6701
EXPORT DEF ViridianSchoolNotebook EQU $690f
EXPORT DEF ViridianSchoolBlackboard EQU $5d41
EXPORT DEF JustAMomentText EQU $58a8
EXPORT DEF OpenBillsPCText EQU $58bb
EXPORT DEF FoundHiddenItemText EQU $6045
EXPORT DEF HiddenItemBagFullText EQU $607e
EXPORT DEF VermilionGymTrashText EQU $5e49
EXPORT DEF IndigoPlateauHQText EQU $69a2
EXPORT DEF GameCornerOutOfOrderText EQU $7f1d
EXPORT DEF GameCornerOutToLunchText EQU $7f22
EXPORT DEF GameCornerSomeonesKeysText EQU $7f27
EXPORT DEF FoundHiddenCoinsText EQU $6138
EXPORT DEF DroppedHiddenCoinsText EQU $613e
EXPORT DEF BillsHouseMonitorText EQU $65bb
EXPORT DEF BillsHouseInitiatedText EQU $65c0
EXPORT DEF BillsHousePokemonList EQU $65de
EXPORT DEF MagazinesText EQU $6547
EXPORT DEF CinnabarGymQuiz EQU $63c0
EXPORT DEF GameCornerNoCoinsText EQU $7e2b
EXPORT DEF GameCornerCoinCaseText EQU $7e26
EXPORT DEF LinkCableHelp EQU $5c82
EXPORT DEF TMNotebook EQU $6909
EXPORT DEF FightingDojoText EQU $698f
EXPORT DEF EnemiesOnEverySideText EQU $6975
EXPORT DEF WhatGoesAroundComesAroundText EQU $6982
EXPORT DEF NewBicycleText EQU $62ef
EXPORT DEF IndigoPlateauStatues EQU $7a3d
EXPORT DEF VermilionGymTrashSuccessText1 EQU $5f01
EXPORT DEF VermilionGymTrashSuccessText2 EQU $5f14
EXPORT DEF VermilionGymTrashSuccessText3 EQU $5f28
EXPORT DEF VermilionGymTrashFailText EQU $5f3b
EXPORT DEF TownMapText EQU $7a90
EXPORT DEF BookOrSculptureText EQU $7a66
EXPORT DEF ElevatorText EQU $7a8b
EXPORT DEF PokemonStuffText EQU $7ac3


SECTION "rom1", ROMX[$4000], BANK[1]
; ROM $01 : $4000 - $7FFF

	dr PrepareTitleScreen, $414b
	dr LoadMonData_, $442c
	dr ItemPrices, $4495
	dr ItemNames, $45b8
	dr UnusedBadgeNames, $499a
	dr PrepareOAMData, $4a17
	dr WriteDMACodeToHRAM, $4b0e
	dr _IsTilePassable, $4b26
	dr PrintWaitingText, $4c05
	dr _UpdateSprites, $4c32
	dr SpecialEnterMap, $5d60
	dr PrepareForSpecialWarp, $60cb
	dr SubtractAmountPaidFromMoney_, $691f
	dr HandleItemListSwapping, $6942
	dr DisplayPokemartDialogue_, $6a1e
	dr DisplayPokemonCenterDialogue_, $6e10
	dr DisplayTextIDInit, $6f87
	dr DrawStartMenu, $6ff9
	dr CableClubNPC, $70b2
	dr DisplayTextBoxID_, $723c
	dr PlayerPC, $77e1
	dr _RemovePokemon, $7a69
	dr _DisplayPokedex, $7b19


SECTION "rom3", ROMX[$4000], BANK[3]
; ROM $03 : $C000 - $FFFF

	dr ReadJoypad_, $4000
	dr _Joypad, $402d
	dr ClearVariablesOnEnterMap, $407c
	dr IsPlayerStandingOnWarp, $40a6
	dr CheckForceBikeOrSurf, $40d2
	dr IsPlayerFacingEdgeOfMap, $4148
	dr IsWarpTileInFrontOfPlayer, $4197
	dr IsPlayerStandingOnDoorTileOrWarpTile, $41e6
	dr PrintSafariZoneSteps, $427b
	dr LoadWildData, $4b62
	dr UseItem_, $52ed
	dr TossItem_, $6625
	dr IsKeyItem_, $6698
	dr IsNextTileShoreOrWater, $67f8
	dr MarkTownVisitedAndLoadToggleableObjects, $6f83
	dr TryPushingBoulder, $7091
	dr DoBoulderDustAnimation, $7121
	dr _AddPartyMon, $7151
	dr _AddEnemyMonToPlayerParty, $7313
	dr _MoveMon, $7394
	dr PrintBookshelfText, $79ce


SECTION "rom4", ROMX[$4000], BANK[4]
; ROM $04 : $10000 - $13FFF

	dr FontGraphics, $4600
	dr FontGraphicsEnd, $4a00
	dr HpBarAndStatusGraphics, $4a20
	dr HpBarAndStatusGraphicsEnd, $4c00
	dr TextBoxGraphics, $4e28
	dr TextBoxGraphicsEnd, $5028
	dr DrawPartyMenu_, $5883
	dr RedrawPartyMenu_, $5894
	dr RedPicFront, $5aa5
	dr StartMenu_Pokedex, $5c30
	dr StartMenu_Pokemon, $5c44
	dr ErasePartyMenuCursors, $5ea6
	dr StartMenu_Item, $5ebb
	dr StartMenu_TrainerInfo, $6018
	dr StartMenu_SaveReset, $61a4
	dr StartMenu_Option, $61b7
	dr SwitchPartyMon, $61d4


SECTION "rom5", ROMX[$4000], BANK[5]
; ROM $05 : $14000 - $17FFF

	dr _InitMapSprites, $401b
	dr RedBikeSprite, $43f1
	dr RedSprite, $4571
	dr SeelSprite, $7ab1
	dr ActivatePC, $7cb0


SECTION "rom6", ROMX[$4000], BANK[6]
; ROM $06 : $18000 - $1BFFF

	dr PlayerStepOutFromDoor, $64ea
	dr _EndNPCMovementScript, $6527
	dr PalletMovementScriptPointerTable, $654c
	dr PewterMuseumGuyMovementScriptPointerTable, $6622
	dr PewterGymGuyMovementScriptPointerTable, $6685
	dr HandleLedges, $67f4


SECTION "rom7", ROMX[$4000], BANK[7]
; ROM $07 : $1C000 - $1FFFF

	dr SafariZoneCheck, $6324
	dr SafariZoneCheckSteps, $6333
	dr PrintSafariGameOverText, $6388
	dr UpdateCinnabarGymGateTileBlocks_, $64c2


SECTION "rom8", ROMX[$5472], BANK[8]
; ROM $08 : $20000 - $23FFF

	dr BillsPC_, $5472


SECTION "rom9", ROMX[$7dfc], BANK[9]
; ROM $09 : $24000 - $27FFF

	dr SaveTrainerName, $7dfc


;SECTION "rom10", ROMX[$4000], BANK[10]
; ROM $0a : $28000 - $2BFFF


;SECTION "rom11", ROMX[$4000], BANK[11]
; ROM $0b : $2C000 - $2FFFF


;SECTION "rom12", ROMX[$4000], BANK[12]
; ROM $0c : $30000 - $33FFF


;SECTION "rom13", ROMX[$4000], BANK[13]
; ROM $0d : $34000 - $37FFF


SECTION "rom14", ROMX[$4000], BANK[14]
; ROM $0e : $38000 - $3BFFF

	dr BaseStats, $43de
	dr CryData, $5462
	dr TrainerPicAndMoneyPointers, $5893
	dr TrainerNames, $597e


SECTION "rom15", ROMX[$4000], BANK[15]
; ROM $0f : $3C000 - $3FFFF
DisplayBattleMenu::

	dr AnyPartyAlive, $4ae8


;SECTION "rom16", ROMX[$4000], BANK[16]
; ROM $10 : $40000 - $43FFF


SECTION "rom17", ROMX[$4000], BANK[17]
; ROM $11 : $44000 - $47FFF

	dr LoadSpinnerArrowTiles, $5077


;SECTION "rom18", ROMX[$4000], BANK[18]
; ROM $12 : $48000 - $4BFFF


;SECTION "rom19", ROMX[$4000], BANK[19]
; ROM $13 : $4C000 - $4FFFF


SECTION "rom20", ROMX[$4000], BANK[20]
; ROM $14 : $50000 - $53FFF

	dr CeladonPrizeMenu, $6680


SECTION "Trainer Sight", ROMX[$4000], BANK[21]
SECTION "rom21", ROMX[$4000], BANK[21]
; ROM $15 : $54000 - $57FFF

	dr _GetSpritePosition1, $6745
	dr _GetSpritePosition2, $6765
	dr _SetSpritePosition1, $6789
	dr _SetSpritePosition2, $67a9
	dr TrainerWalkUpToPlayer, $67cd


SECTION "rom22", ROMX[$4000], BANK[22]
; ROM $16 : $58000 - $5BFFF

	dr PrintStatusAilment, $4e8b


;SECTION "rom23", ROMX[$4000], BANK[23]
; ROM $17 : $5C000 - $5FFFF


;SECTION "rom24", ROMX[$4000], BANK[24]
; ROM $18 : $60000 - $63FFF


;SECTION "rom25", ROMX[$4000], BANK[25]
; ROM $19 : $64000 - $67FFF


;SECTION "rom26", ROMX[$4000], BANK[26]
; ROM $1a : $68000 - $6BFFF


;SECTION "rom27", ROMX[$4000], BANK[27]
; ROM $1b : $6C000 - $6FFFF


SECTION "rom28", ROMX[$4000], BANK[28]
; ROM $1c : $70000 - $73FFF

	dr EnterMapAnim, $4568
	dr _LeaveMapAnim, $4616
	dr IsPlayerStandingOnWarpPadOrHole, $47e8
	dr _HandleMidJump, $48e0
	dr LoadTownMap_Fly, $5017
	dr TownMapSpriteBlinkingAnimation, $5724
	dr AnimatePartyMon, $575d
	dr _UpdateCGBPal_BGP, $64f5
	dr _UpdateCGBPal_OBP, $653d


SECTION "rom29", ROMX[$4000], BANK[29]
; ROM $1d : $74000 - $77FFF

	dr VendingMachineMenu, $4721


;SECTION "rom30", ROMX[$4000], BANK[30]
; ROM $1e : $78000 - $7BFFF


;SECTION "rom32", ROMX[$4000], BANK[32]
; ROM $20 : $80000 - $83FFF


SECTION "rom38", ROMX[$4000], BANK[38]
; ROM $26 : $98000 - $9BFFF

	dr _TrainerNameText, $404d
	dr _ExclamationText, $409c
	dr _GroundRoseText, $409f
	dr _BoulderText, $40bf
	dr _MartSignText, $40df
	dr _PokeCenterSignText, $4107


;SECTION "rom39", ROMX[$4000], BANK[39]
; ROM $27 : $9C000 - $9FFFF


SECTION "rom40", ROMX[$4000], BANK[40]
; ROM $28 : $A0000 - $A3FFF

	dr _SleepingPikachuText1, $411c
	dr _TextIDErrorText, $4d74
	dr _ContCharText, $4d82


;SECTION "rom41", ROMX[$4000], BANK[41]
; ROM $29 : $A4000 - $A7FFF


;SECTION "rom42", ROMX[$4000], BANK[42]
; ROM $2a : $A8000 - $ABFFF


;SECTION "rom43", ROMX[$4000], BANK[43]
; ROM $2b : $AC000 - $AFFFF


;SECTION "rom44", ROMX[$4000], BANK[44]
; ROM $2c : $B0000 - $B3FFF


;SECTION "rom45", ROMX[$4000], BANK[45]
; ROM $2d : $B4000 - $B7FFF


;SECTION "rom46", ROMX[$4000], BANK[46]
; ROM $2e : $B8000 - $BBFFF


SECTION "rom47", ROMX[$4000], BANK[47]
; ROM $2f : $BC000 - $BFFFF

	dr MoveNames, $4000


;SECTION "rom48", ROMX[$4000], BANK[48]
; ROM $30 : $C0000 - $C3FFF


;SECTION "rom57", ROMX[$4000], BANK[57]
; ROM $39 : $E4000 - $E7FFF


SECTION "rom58", ROMX[$4000], BANK[58]
; ROM $3a : $E8000 - $EBFFF

	dr MonsterNames, $4000
	dr PrinterSerial_, $4a5e
	dr SetEnemyTrainerToStayAndFaceAnyDirection, $69d5


SECTION "rom59", ROMX[$4000], BANK[59]
; ROM $3b : $EC000 - $EFFFF

	dr _PokemonText, $6b1b
	dr _PokemartGreetingText, $6b22
	dr _PokemonFaintedText, $6b3a
	dr _PlayerBlackedOutText, $6b49
	dr _RepelWoreOffText, $6b6d


SECTION "rom60", ROMX[$4000], BANK[60]
; ROM $3c : $F0000 - $F3FFF

	dr _AdvancePlayerSprite, $410c
	dr ResetStatusAndHalveMoneyOnBlackout, $4274
	dr SetMapSpecificScriptFlagsOnMapReload, $42da
	dr LoadToggleableObjectData, $4a55
	dr CheckForHiddenEvent, $653a


SECTION "rom61", ROMX[$5b6b], BANK[61]
; ROM $3d : $F4000 - $F7FFF

	dr AddItemToInventory_, $5b6b
	dr RemoveItemFromInventory_, $5bdb
	dr InitBattle, $5fec
	dr CopyUncompressedPicToHL, $6203
	dr GetMachinePrice, $65d4
	dr _Multiply, $660e
	dr _Divide, $6672
	dr _GivePokemon, $66fa
	dr GetTrainerName_, $67a5
	dr Random_, $67dc
	dr GetPredefPointer, $67ed
	dr PredefPointers, $681d
	drp AddBCDPredef, $b
	drp DivideBCDPredef3, $d
	drp FlagActionPredef, $10
	drp HideObject, $11
	drp ApplyOutOfBattlePoisonDamage, $13
	drp LoadTilesetHeader, $19
	drp GetQuantityOfItemInBag, $1c
	drp CableClub_Run, $2d
	drp PlayIntro, $32
	drp GetTileAndCoordsInFrontOfPlayer, $35
	drp TrainerEngage, $39
	drp IndexToPokedex, $3a
	drp LoadSGB, $40
	drp _RunPaletteCommand, $45
	drp EmotionBubble, $4c
	drp PickUpItem, $5c


;SECTION "rom62", ROMX[$4000], BANK[62]
; ROM $3e : $F8000 - $FBFFF


SECTION "rom63", ROMX[$4000], BANK[63]
; ROM $3f : $FC000 - $FFFFF

	dr MapSongBanks, $4000
	dr MapHeaderPointers, $41f2
	dr MapHeaderBanks, $43e4
	dr SchedulePikachuSpawnForAfterText, $44fa
	dr SetPikachuSpawnOutside, $45fa
	dr SetPikachuSpawnWarpPad, $465b
	dr SetPikachuSpawnBackOutside, $469a
	dr SpawnPikachu_, $46d5
	dr Func_fcc08, $4c08
	dr IsStarterPikachuAliveInOurParty, $4db8
	dr IsThisPartyMonStarterPikachu, $4e18
	dr IsPlayerTalkingToPikachu, $4f0c
	dr TalkToPikachu, $5004
	dr ApplyPikachuMovementData_, $52a1
	dr SurfingPikachuSprite, $6def
