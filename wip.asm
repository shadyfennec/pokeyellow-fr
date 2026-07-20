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


EXPORT DEF RedBedroomPCText EQU $5bb7
EXPORT DEF RedBedroomSNESText EQU $5baa
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
EXPORT DEF ViridianSchoolBlackboard EQU $5d41
EXPORT DEF FoundHiddenItemText EQU $6045
EXPORT DEF HiddenItemBagFullText EQU $607e
EXPORT DEF VermilionGymTrashText EQU $5e49
EXPORT DEF FoundHiddenCoinsText EQU $6138
EXPORT DEF DroppedHiddenCoinsText EQU $613e
EXPORT DEF LinkCableHelp EQU $5c82
EXPORT DEF VermilionGymTrashSuccessText1 EQU $5f01
EXPORT DEF VermilionGymTrashSuccessText2 EQU $5f14
EXPORT DEF VermilionGymTrashSuccessText3 EQU $5f28
EXPORT DEF VermilionGymTrashFailText EQU $5f3b

EXPORT DEF CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL EQU $02
EXPORT DEF CERULEANCAVE1F_RARE_CANDY                EQU $01
EXPORT DEF CERULEANCAVE1F_MAX_ELIXER                EQU $02
EXPORT DEF CERULEANCAVE1F_MAX_REVIVE                EQU $03
EXPORT DEF CERULEANCAVE1F_ULTRA_BALL                EQU $04
EXPORT DEF CERULEANMELANIESHOUSE_BULBASAUR          EQU $02
EXPORT DEF CHAMPIONSROOM_OAK                        EQU $02
EXPORT DEF FIGHTINGDOJO_HITMONLEE_POKE_BALL         EQU $06
EXPORT DEF FIGHTINGDOJO_HITMONCHAN_POKE_BALL        EQU $07
EXPORT DEF MUSEUM1F_OLD_AMBER                       EQU $05
EXPORT DEF POKEMONMANSION1F_ESCAPE_ROPE             EQU $02
EXPORT DEF POKEMONMANSION1F_CARBOS                  EQU $03
EXPORT DEF POKEMONMANSION2F_CALCIUM                 EQU $02
EXPORT DEF POKEMONTOWER2F_RIVAL                     EQU $01
EXPORT DEF POKEMONTOWER3F_ESCAPE_ROPE               EQU $04
EXPORT DEF POKEMONTOWER4F_ELIXER                    EQU $04
EXPORT DEF POKEMONTOWER4F_AWAKENING                 EQU $05
EXPORT DEF POKEMONTOWER4F_HP_UP                     EQU $06
EXPORT DEF POKEMONTOWER5F_NUGGET                    EQU $06
EXPORT DEF POKEMONTOWER6F_RARE_CANDY                EQU $04
EXPORT DEF POKEMONTOWER6F_X_ACCURACY                EQU $05
EXPORT DEF POKEMONTOWER7F_JESSIE                    EQU $01
EXPORT DEF POKEMONTOWER7F_JAMES                     EQU $02
EXPORT DEF POKEMONTOWER7F_MR_FUJI                   EQU $03
EXPORT DEF SILPHCO11F_GIOVANNI                      EQU $03
EXPORT DEF SILPHCO11F_JAMES                         EQU $04
EXPORT DEF SILPHCO11F_ROCKET                        EQU $05
EXPORT DEF SILPHCO11F_JESSIE                        EQU $06
EXPORT DEF SILPHCO1F_LINK_RECEPTIONIST              EQU $01
EXPORT DEF SILPHCO9F_ROCKET1                        EQU $02
EXPORT DEF SILPHCO9F_SCIENTIST                      EQU $03
EXPORT DEF SILPHCO9F_ROCKET2                        EQU $04
EXPORT DEF SSANNE1FROOMS_TM_BODY_SLAM               EQU $0a
EXPORT DEF SSANNE2F_RIVAL                           EQU $02
EXPORT DEF SSANNE2FROOMS_MAX_ETHER                  EQU $06
EXPORT DEF SSANNE2FROOMS_RARE_CANDY                 EQU $09
EXPORT DEF SSANNEB1FROOMS_ETHER                     EQU $09
EXPORT DEF SSANNEB1FROOMS_TM_REST                   EQU $0a
EXPORT DEF SSANNEB1FROOMS_MAX_POTION                EQU $0b
EXPORT DEF VICTORYROAD1F_TM_SKY_ATTACK              EQU $03
EXPORT DEF VICTORYROAD1F_RARE_CANDY                 EQU $04
EXPORT DEF VICTORYROAD3F_MAX_REVIVE                 EQU $05
EXPORT DEF VICTORYROAD3F_TM_EXPLOSION               EQU $06
EXPORT DEF VICTORYROAD3F_BOULDER4                   EQU $0a
EXPORT DEF VIRIDIANFOREST_POTION1                   EQU $07
EXPORT DEF VIRIDIANFOREST_POTION2                   EQU $08
EXPORT DEF VIRIDIANFOREST_POKE_BALL                 EQU $09
EXPORT DEF VIRIDIANGYM_GIOVANNI                     EQU $01
EXPORT DEF VIRIDIANGYM_REVIVE                       EQU $0b
EXPORT DEF WARDENSHOUSE_RARE_CANDY                  EQU $02

EXPORT DEF SCRIPT_MUSEUM1F_NOOP                     EQU 1
EXPORT DEF SCRIPT_SAFARIZONEGATE_PLAYER_MOVING      EQU 3
EXPORT DEF SCRIPT_SAFARIZONEGATE_PLAYER_MOVING_DOWN EQU 4
EXPORT DEF SCRIPT_SAFARIZONEGATE_LEAVING_SAFARI     EQU 5


INCLUDE "main.asm"


SECTION "rom23", ROMX[$4000], BANK[23]
; ROM $17 : $5C000 - $5FFFF

	dr StarterDex, $40d4
	dr EvolveMon, $5a64
	dr SetPartyMonTypes, $5b87


;SECTION "rom24", ROMX[$4000], BANK[24]
; ROM $18 : $60000 - $63FFF


SECTION "rom29", ROMX[$4000], BANK[29]
; ROM $1d : $74000 - $77FFF

	dr HiddenItemNear, $405c
	dr CeruleanHideRocket, $40af
	dr VendingMachineMenu, $4721
	dr PKMNLeaguePC, $5df3
	dr ShakeElevator, $5efc


SECTION "rom58", ROMX[$4000], BANK[58]
; ROM $3a : $E8000 - $EBFFF

	dr MonsterNames, $4000
	dr IsPlayerJustOutsideMap, $476c
	dr PrinterSerial_, $4a5e
	dr PrintPokedexEntry, $4b74
	dr PrintSurfingMinigameHighScore, $4c5c
	dr PrintDiploma, $4cb1
	dr PrintPCBox, $4d35
	dr PrintFanClubPortrait, $4e24
	dr PrinterDebug, $4e79
	dr Printer_PrepareSurfingMinigameHighScoreTileMap, $5101
	dr DisplayDiplomaTop, $59ee
	dr SetEnemyTrainerToStayAndFaceAnyDirection, $69d5


SECTION "rom60", ROMX[$653a], BANK[60]

	dr CheckForHiddenEvent, $653a


SECTION "rom62", ROMX[$4000], BANK[62]
; ROM $3e : $F8000 - $FBFFF

	dr SurfingPikachuMinigame, $4000
    dr PlayIntroScene, $582a


SECTION "rom63", ROMX[$4000], BANK[63]
; ROM $3f : $FC000 - $FFFFF

	dr MapSongBanks, $4000
	dr MapHeaderPointers, $41f2
	dr MapHeaderBanks, $43e4

SECTION "rom63_2", ROMX[$44dd], BANK[63]

INCLUDE "engine/pikachu/pikachu_follow.asm"
INCLUDE "engine/pikachu/pikachu_status.asm"
INCLUDE "engine/pikachu/pikachu_emotions.asm"
INCLUDE "engine/pikachu/pikachu_movement.asm"
INCLUDE "engine/pikachu/pikachu_pic_animation.asm"
INCLUDE "engine/debug/debug_menu.asm"
