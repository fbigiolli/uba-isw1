!classDefinition: #MineFieldTest category: #Minefield!
TestCase subclass: #MineFieldTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test01CannotInitializeBoardWithLessHeightThan2

	self should: [MineFieldGame ofHeight: 1 andWidth: 2 andStartingPosition: 1@1 andPlayerInitialLifes: 3.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame invalidHeightErrorDescription]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test02CannotInitializeBoardWithLessWidthThan2

	self should: [MineFieldGame ofHeight: 2 andWidth: 1 andStartingPosition: 1@1 andPlayerInitialLifes: 3.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame invalidWidthErrorDescription]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test03StartingPositionCanOnlyBeFirstRow

	self should: [MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 1@2 andPlayerInitialLifes: 3.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame invalidStartingPositionErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test04StartingPositionMustBeLessThanWidth

	self should: [MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 3@1 andPlayerInitialLifes: 3.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame invalidStartingPositionErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test05StartingPositionMustBePositive

	self should: [MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 0@1 andPlayerInitialLifes: 3.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame invalidStartingPositionErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test06PlayerMovesUpCorrectly

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 1@1 andPlayerInitialLifes: 3.
	
	game movePlayerUp.
	
	self assert: (game playerIsAt: 1@2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test07PlayerMovesRightCorrectly

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 1@1 andPlayerInitialLifes: 3.
	
	game movePlayerRight.
	
	self assert: (game playerIsAt: 2@1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test08PlayerMovesLeftCorrectly

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game movePlayerLeft.
	
	self assert: (game playerIsAt: 1@1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test09PlayerMovesDownCorrectly

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game movePlayerUp.
	game movePlayerDown.
	
	self assert: (game playerIsAt: 2@1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test10MovingLeftWhenPlayerIsAtFirstColumnDoesntMovePlayer

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 1@1 andPlayerInitialLifes: 3.
	
	game movePlayerLeft.
	
	self assert: (game playerIsAt: 1@1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test11MovingRightWhenPlayerIsAtLastColumnDoesntMovePlayer

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game movePlayerRight.
	
	self assert: (game playerIsAt: 2@1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test12MovingDownWhenPlayerIsAtFirstRowDoesntMovePlayer

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game movePlayerDown.
	
	self assert: (game playerIsAt: 2@1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test13MovingUpWhenPlayerIsAtLastRowDoesntMovePlayer

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game movePlayerUp.
	game movePlayerUp.
	
	self assert: (game playerIsAt: 2@2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test14PlayerWinsWhenGettingToLastRow

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game movePlayerUp.
	
	self assert: game playerHasWon.! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test15PlayerHasntWonWhenIsntAtLastRow

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	self deny: game playerHasWon.! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:46:13'!
test16CannotPlaceSmallBombOutOfRange

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 2 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	self should: [game placeSmallBombAt: 3@2.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame outOfRangePositionErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 16:50:31'!
test17CannotInitializeWithLessThanZeroLifes

	self should: [MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 0.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame invalidNumberOfLifesErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:30:46'!
test18SmallBombExplodesOnlyOnce

	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeSmallBombAt: 2@2.
	game movePlayerUp.
	
	self assert: (game playerHasLives: 2).
	
	game movePlayerUp.
	game movePlayerDown.
	
	self assert: (game playerHasLives: 2).
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:32:58'!
test19SteppingOnASmallBombDecreasesLifeBy1

	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeSmallBombAt: 2@2.
	game movePlayerUp.
	
	self assert: (game playerHasLives: 2). 
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:36:38'!
test20PlayerWithZeroLivesHasLost

	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 1.
	
	game placeSmallBombAt: 2@2.
	game movePlayerUp.
	
	self assert: game playerHasLost. 
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:39:33'!
test21PlayerThatArrivesToLastRowWith0LivesHasLostAndHasntWon

	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 1.
	
	game placeSmallBombAt: 2@2.
	game movePlayerUp.
	
	self assert: game playerHasLost. 
	self deny: game playerHasWon 
	
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:41:44'!
test22CannotPlaceTwoItemsOnTheSamePosition
	
	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 1.
	
	game placeSmallBombAt: 2@2.

	self should: [game placeSmallBombAt: 2@2.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame positionAlreadyOccupiedErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:44:59'!
test23CannotPlaceAnItemOnPlayersPosition
	
	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 1.
	
	self should: [game placeSmallBombAt: 2@1.]
	       raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: MineFieldGame positionAlreadyOccupiedErrorMessage]
! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:49:25'!
test24SteppingOnABigBombDecreasesLifeBy2
	
	| game |
	
	game := MineFieldGame ofHeight: 2 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeBigBombAt: 2@2.
	game movePlayerUp.
	
	self assert: (game playerHasLives: 1).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 19:57:54'!
test25SteppingIntoASmallBombWithALightArmorDoesntDecreaseLives
	
	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeSmallBombAt: 1@2.
	game placeLightArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	
	self assert: (game playerHasLives: 3).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 20:01:29'!
test26SteppingIntoASmallBombWithALightArmorRemovesArmor
	
	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeSmallBombAt: 1@2.
	game placeSmallBombAt: 1@3.
	game placeLightArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	game movePlayerUp.
	
	self assert: (game playerHasLives: 2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 20:03:50'!
test27SteppingIntoABigBombWithALightArmorDoesntDecreaseLives
	
	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeBigBombAt: 1@2.
	game placeLightArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	
	self assert: (game playerHasLives: 3).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/26/2024 20:05:16'!
test28SteppingIntoABigBombWithALightArmorRemovesArmor
	
	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeBigBombAt: 1@2.
	game placeSmallBombAt: 1@3.
	game placeLightArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	game movePlayerUp.
	
	self assert: (game playerHasLives: 2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:19:49'!
test29SteppingIntoABigBombWithAHeavyArmorRemovesArmor

	| game |
	
	game := MineFieldGame ofHeight: 3 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeBigBombAt: 1@2.
	game placeSmallBombAt: 1@3.
	game placeHeavyArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	game movePlayerUp.
	
	self assert: (game playerHasLives: 2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:23:43'!
test30HeavyArmorLastsTwoUsesAgainstSmallBombs

	| game |
	
	game := MineFieldGame ofHeight: 4 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeSmallBombAt: 1@2.
	game placeSmallBombAt: 1@3.
	game placeSmallBombAt: 2@3.
	game placeHeavyArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	game movePlayerUp.
	game movePlayerRight.
	
	self assert: (game playerHasLives: 2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:28:24'!
test31PlayerStaysInTheSamePositionAfterSteppingIntoABigBombWithHeavyArmor

	| game |
	
	game := MineFieldGame ofHeight: 4 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeBigBombAt: 1@2.
	game placeHeavyArmorAt: 2@2.
	
	game movePlayerUp.
	game movePlayerLeft.
	
	self assert: (game playerIsAt: 1@2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:33:09'!
test32PlayerKeepsLastArmorPicked


	| game |
	
	game := MineFieldGame ofHeight: 4 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeSmallBombAt: 1@2.
	game placeSmallBombAt: 2@3.
	game placeSmallBombAt: 3@3.

	game placeHeavyArmorAt: 2@2.
	game placeHeavyArmorAt: 1@3.
	
	game movePlayerUp.
	game movePlayerLeft. "le saca un uso"
	game movePlayerUp. "pickea otra"
	game movePlayerRight. "se come una bomba"
	game movePlayerRight. " se come otra "

	self assert: (game playerHasLives: 3).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:39:47'!
test33SteppingIntoATunnelMovesPlayerCorrectly

	| game |
	
	game := MineFieldGame ofHeight: 4 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeTunnelStartingAt: 2@2 andEndingAt: 1@3.

	game movePlayerUp.

	self assert: (game playerIsAt: 1@3).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:51:03'!
test34TunnelsWorkBidirectionally

	| game |
	
	game := MineFieldGame ofHeight: 4 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeTunnelStartingAt: 2@2 andEndingAt: 1@3.

	game movePlayerUp.
	game movePlayerDown.
	game movePlayerUp.

	self assert: (game playerIsAt: 2@2).! !

!MineFieldTest methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:12:42'!
test35TunnelsDontDissapearAfterUse

	| game |
	
	game := MineFieldGame ofHeight: 4 andWidth: 3 andStartingPosition: 2@1 andPlayerInitialLifes: 3.
	
	game placeTunnelStartingAt: 2@2 andEndingAt: 1@3.

	game movePlayerUp.
	game movePlayerDown.
	game movePlayerUp.
	"nos volvemos a meter"
	game movePlayerLeft.
	game movePlayerRight.

	self assert: (game playerIsAt: 1@3).! !


!classDefinition: #GameItems category: #Minefield!
Object subclass: #GameItems
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!GameItems methodsFor: 'game' stamp: 'fb 6/27/2024 11:54:52'!
playerSteppedOnYouInGame: aMineFieldGame

	self subclassResponsibility! !


!classDefinition: #BigBomb category: #Minefield!
GameItems subclass: #BigBomb
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!BigBomb methodsFor: 'game' stamp: 'fb 6/27/2024 11:58:47'!
playerSteppedOnYouInGame: aMineFieldGame

	aMineFieldGame playerSteppedOnABigBomb.! !


!classDefinition: #SmallBomb category: #Minefield!
GameItems subclass: #SmallBomb
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!SmallBomb methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:58:32'!
playerSteppedOnYouInGame: aMineFieldGame

	aMineFieldGame playerSteppedOnASmallBomb.! !


!classDefinition: #TunnelEntrance category: #Minefield!
GameItems subclass: #TunnelEntrance
	instanceVariableNames: 'tunnelExitPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!TunnelEntrance methodsFor: 'initialization' stamp: 'fb 6/27/2024 11:44:49'!
initializeEndingAt: anEndingPosition 

	tunnelExitPosition := anEndingPosition.! !


!TunnelEntrance methodsFor: 'game' stamp: 'fb 6/27/2024 11:59:20'!
playerSteppedOnYouInGame: aMineFieldGame

	aMineFieldGame playerSteppedOnATunnelEntranceEndingAt: tunnelExitPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TunnelEntrance class' category: #Minefield!
TunnelEntrance class
	instanceVariableNames: ''!

!TunnelEntrance class methodsFor: 'instance creation' stamp: 'fb 6/27/2024 11:44:32'!
endingAt: anEndingPosition 

	^self new initializeEndingAt: anEndingPosition ! !


!classDefinition: #ZPlayerEquipment category: #Minefield!
GameItems subclass: #ZPlayerEquipment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!ZPlayerEquipment methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:14:42'!
playerSteppedOnABigBombInGame: aMineFieldGame

	self subclassResponsibility! !

!ZPlayerEquipment methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:17:58'!
playerSteppedOnASmallBombInGame: aMineFieldGame

	self subclassResponsibility! !

!ZPlayerEquipment methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:07:54'!
playerSteppedOnYouInGame: aMineFieldGame

	self subclassResponsibility! !


!classDefinition: #HeavyArmor category: #Minefield!
ZPlayerEquipment subclass: #HeavyArmor
	instanceVariableNames: 'usesLeft'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!HeavyArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:24:12'!
initialize

	usesLeft := 2.! !

!HeavyArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:10:06'!
playerSteppedOnABigBombInGame: aMineFieldGame

	aMineFieldGame removeEquippedArmor.! !

!HeavyArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:10:06'!
playerSteppedOnASmallBombInGame: aMineFieldGame

	usesLeft := usesLeft - 1.

	usesLeft = 0
		ifTrue: [aMineFieldGame removeEquippedArmor.]! !

!HeavyArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:08:13'!
playerSteppedOnYouInGame: aMineFieldGame

	aMineFieldGame equipHeavyArmor.! !


!classDefinition: #LightArmor category: #Minefield!
ZPlayerEquipment subclass: #LightArmor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!LightArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:39:12'!
playerSteppedOnABigBombInGame: aMineFieldGame

	aMineFieldGame removeEquippedArmor.
	"aMineFieldGame lightBlastOffPlayer."

	! !

!LightArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:10:06'!
playerSteppedOnASmallBombInGame: aMineFieldGame

	aMineFieldGame removeEquippedArmor.
	! !

!LightArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:08:40'!
playerSteppedOnYouInGame: aMineFieldGame

	aMineFieldGame equipLightArmor.! !


!classDefinition: #NoArmor category: #Minefield!
ZPlayerEquipment subclass: #NoArmor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!NoArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 12:39:40'!
playerSteppedOnABigBombInGame: aMineFieldGame

	aMineFieldGame decreaseLivesBy: 2.
	"aMineFieldGame  blastOffPlayer. "

	! !

!NoArmor methodsFor: 'as yet unclassified' stamp: 'fb 6/27/2024 11:18:58'!
playerSteppedOnASmallBombInGame: aMineFieldGame

	aMineFieldGame decreaseLivesBy: 1.! !


!classDefinition: #MineFieldGame category: #Minefield!
Object subclass: #MineFieldGame
	instanceVariableNames: 'height width currentPlayerPosition playerLives itemsByPosition playerEquipment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Minefield'!

!MineFieldGame methodsFor: 'initialization' stamp: 'fb 6/27/2024 11:14:59'!
initializeOfHeight: aHeight andWidth: aWidth andStartingPosition: aPlayerInitialPosition andPlayerInitialLife: aPlayerInitialLife   
	
	playerEquipment := NoArmor new.
	itemsByPosition := Dictionary new.
	playerLives := aPlayerInitialLife .
	currentPlayerPosition := aPlayerInitialPosition.
	height := aHeight.
	width := aWidth.! !


!MineFieldGame methodsFor: 'accessing' stamp: 'fb 6/26/2024 19:19:21'!
playerHasLives: aNumberOfLives
 
	^ playerLives = aNumberOfLives ! !

!MineFieldGame methodsFor: 'accessing' stamp: 'fb 6/26/2024 19:37:10'!
playerHasLost
	
	^ playerLives = 0! !

!MineFieldGame methodsFor: 'accessing' stamp: 'fb 6/26/2024 19:37:57'!
playerHasWon
	
	^ (currentPlayerPosition y = height) & (playerLives > 0)! !

!MineFieldGame methodsFor: 'accessing' stamp: 'fb 6/26/2024 15:38:42'!
playerIsAt: aPosition 
	
	^ currentPlayerPosition = aPosition.! !


!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:38:05'!
blastOffPlayer

	| newXPosition newYPosition newPosition |
	
	newXPosition := (Random new nextInteger: 7) - 4.
	newYPosition := (Random new nextInteger: 7) - 4.
	
	newPosition := currentPlayerPosition  + (newXPosition@newYPosition).
	
	self movePlayerIfPositionIsInRangeTo: newPosition. 	! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:02:40'!
consumeItemAtCurrentPosition

	^ itemsByPosition removeKey: currentPlayerPosition! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 11:13:39'!
decreaseLivesBy: aNumberOfLives

	playerLives := playerLives - aNumberOfLives .! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:10:40'!
equipHeavyArmor	
	
	self consumeItemAtCurrentPosition.
	playerEquipment := HeavyArmor new.
	
! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:10:36'!
equipLightArmor

	self consumeItemAtCurrentPosition.
	playerEquipment := LightArmor new.
	
! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:38:05'!
lightBlastOffPlayer

	| newXPosition newYPosition newPosition |
	
	newXPosition := ((Random new nextInteger: 7) - 4) // 2.
	newYPosition := ((Random new nextInteger: 7) - 4) // 2.
	
	newPosition := currentPlayerPosition  + (newXPosition@newYPosition).
	
	self movePlayerIfPositionIsInRangeTo: newPosition. 	
		
	! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:38:05'!
movePlayerIfPositionIsInRangeTo: aNewPosition

	^ (aNewPosition between: 0@0 and: width@height)
		ifTrue: [currentPlayerPosition := aNewPosition.
			     self updateGameStatus]! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:02:55'!
playerSteppedOnABigBomb

	self consumeItemAtCurrentPosition.
	playerEquipment playerSteppedOnABigBombInGame: self! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:02:52'!
playerSteppedOnASmallBomb
	
	self consumeItemAtCurrentPosition.
	playerEquipment playerSteppedOnASmallBombInGame: self
! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:04:51'!
playerSteppedOnATunnelEntranceEndingAt: tunnelExitPosition

	currentPlayerPosition := tunnelExitPosition.! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:10:06'!
removeEquippedArmor
	
	playerEquipment := NoArmor new.! !

!MineFieldGame methodsFor: 'game status - private' stamp: 'fb 6/27/2024 12:09:33'!
updateGameStatus
	
	| currentPositionItem |

	currentPositionItem := itemsByPosition at: currentPlayerPosition ifAbsent:[^self]. 
	
	currentPositionItem playerSteppedOnYouInGame: self.
	

! !


!MineFieldGame methodsFor: 'player movement' stamp: 'fb 6/26/2024 19:21:38'!
movePlayerDown
	
	currentPlayerPosition y = 1
		ifFalse:[currentPlayerPosition := currentPlayerPosition - (0@1)].
		
	self updateGameStatus.! !

!MineFieldGame methodsFor: 'player movement' stamp: 'fb 6/26/2024 19:21:32'!
movePlayerLeft
	
	currentPlayerPosition x = 1
		ifFalse:[currentPlayerPosition := currentPlayerPosition - (1@0)].
		
	self updateGameStatus.! !

!MineFieldGame methodsFor: 'player movement' stamp: 'fb 6/26/2024 19:21:28'!
movePlayerRight
	
	currentPlayerPosition x = width 
		ifFalse: [currentPlayerPosition := currentPlayerPosition + (1@0)].
		
	self updateGameStatus.! !

!MineFieldGame methodsFor: 'player movement' stamp: 'fb 6/26/2024 19:21:21'!
movePlayerUp
	
	currentPlayerPosition y = height 
		ifFalse:[currentPlayerPosition := currentPlayerPosition + (0@1)].
		
	self updateGameStatus.! !


!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/26/2024 16:37:15'!
assertPositionIsInRange: aPosition

	((aPosition y > height) | (aPosition y < 1))
		ifTrue: [self error: self class outOfRangePositionErrorMessage].
		
	((aPosition x > width) | (aPosition x < 1))
		ifTrue: [self error: self class outOfRangePositionErrorMessage].! !

!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/26/2024 19:45:34'!
assertPositionIsntOccupied: aPosition
	
	((itemsByPosition includesKey: aPosition) |  (aPosition = currentPlayerPosition))
		ifTrue: [self error: self class positionAlreadyOccupiedErrorMessage].! !

!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/27/2024 12:01:39'!
placeBigBombAt: aPosition 
	
	self assertPositionIsInRange: aPosition.
	self assertPositionIsntOccupied: aPosition.
	
	itemsByPosition at: aPosition put: BigBomb new.! !

!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/27/2024 12:01:54'!
placeHeavyArmorAt: aPosition 

	self assertPositionIsInRange: aPosition.
	self assertPositionIsntOccupied: aPosition.
	
	itemsByPosition at: aPosition put: HeavyArmor new.! !

!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/27/2024 12:01:50'!
placeLightArmorAt: aPosition 
	
	self assertPositionIsInRange: aPosition.
	self assertPositionIsntOccupied: aPosition.
	
	itemsByPosition at: aPosition put: LightArmor new.! !

!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/27/2024 12:01:43'!
placeSmallBombAt: aPosition 
	
	self assertPositionIsInRange: aPosition.
	self assertPositionIsntOccupied: aPosition.
	
	itemsByPosition at: aPosition put: SmallBomb new.! !

!MineFieldGame methodsFor: 'items placing' stamp: 'fb 6/27/2024 11:44:04'!
placeTunnelStartingAt: aStartingPosition andEndingAt: anEndingPosition 
	
	self assertPositionIsInRange: aStartingPosition.
	self assertPositionIsntOccupied: aStartingPosition.
	self assertPositionIsInRange: anEndingPosition.
	self assertPositionIsntOccupied: anEndingPosition.
	
	itemsByPosition at: aStartingPosition put: (TunnelEntrance endingAt: anEndingPosition).
	itemsByPosition at: anEndingPosition put: (TunnelEntrance endingAt: aStartingPosition)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MineFieldGame class' category: #Minefield!
MineFieldGame class
	instanceVariableNames: ''!

!MineFieldGame class methodsFor: 'instance creation' stamp: 'fb 6/26/2024 16:48:53'!
ofHeight: aHeight andWidth: aWidth andStartingPosition: aPlayerInitialPosition andPlayerInitialLifes: aPlayerInitialLife   
	
	self assertIsValidHeight: aHeight.
	self assertIsValidWidth: aWidth.
	self assertIsValidStartingPosition: aPlayerInitialPosition forWidth: aWidth.
	self assertIsValidNumberOfLifes: aPlayerInitialLife.
	
	^self new initializeOfHeight: aHeight andWidth: aWidth andStartingPosition: aPlayerInitialPosition andPlayerInitialLife: aPlayerInitialLife ! !


!MineFieldGame class methodsFor: 'assertions' stamp: 'fb 6/26/2024 15:19:00'!
assertIsValidHeight: aHeight 
	
	aHeight > 1
		ifFalse: [self error: self invalidHeightErrorDescription]! !

!MineFieldGame class methodsFor: 'assertions' stamp: 'fb 6/26/2024 16:52:16'!
assertIsValidNumberOfLifes: aPlayerInitialLife
	
	aPlayerInitialLife < 1
		ifTrue: [self error: self invalidNumberOfLifesErrorMessage ].
		! !

!MineFieldGame class methodsFor: 'assertions' stamp: 'fb 6/26/2024 15:57:42'!
assertIsValidStartingPosition: aPlayerInitialPosition forWidth: aWidth 
	
	aPlayerInitialPosition y = 1
		ifFalse: [self error: self invalidStartingPositionErrorMessage].
		
	((aPlayerInitialPosition x > aWidth) | (aPlayerInitialPosition x < 1))
		ifTrue: [self error: self invalidStartingPositionErrorMessage].! !

!MineFieldGame class methodsFor: 'assertions' stamp: 'fb 6/26/2024 15:22:13'!
assertIsValidWidth: aWidth

	aWidth > 1
		ifFalse: [self error: self invalidWidthErrorDescription]! !

!MineFieldGame class methodsFor: 'assertions' stamp: 'fb 6/26/2024 15:22:26'!
invalidWidthErrorDescription

	^'el ancho debe ser mayor igual a 2'! !


!MineFieldGame class methodsFor: 'error descriptions' stamp: 'fb 6/26/2024 15:20:24'!
invalidHeightErrorDescription
	
	^'el alto debe ser mayor igual a 2'! !

!MineFieldGame class methodsFor: 'error descriptions' stamp: 'fb 6/26/2024 16:50:46'!
invalidNumberOfLifesErrorMessage

	^'el numero de vidas no puede ser negativo ni 0'! !

!MineFieldGame class methodsFor: 'error descriptions' stamp: 'fb 6/26/2024 15:51:28'!
invalidStartingPositionErrorMessage
	
	^'el jugador solo puede comenzar en la primera fila'! !

!MineFieldGame class methodsFor: 'error descriptions' stamp: 'fb 6/26/2024 19:44:25'!
positionAlreadyOccupiedErrorMessage

	^'la posicion ya esta ocupada'! !


!MineFieldGame class methodsFor: 'items placing' stamp: 'fb 6/26/2024 16:37:37'!
outOfRangePositionErrorMessage
	
	^'La posicion esta fuera de rango querido'! !
