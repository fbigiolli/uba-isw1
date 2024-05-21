!classDefinition: #FloorTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #FloorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:57:35'!
assertThatAPesosAmout: aPesosAmount equalsTotalProfitsAt: aFloor. 

	self assert: aPesosAmount equals: aFloor totalProfits! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:53:58'!
assertThatThereIsANumberOfRoomsOccupied: aNumberOfRoomsOccupied andANumberOfRoomsReserved: aNumberOfRoomsReserved at: aFloor

	self assert: aNumberOfRoomsOccupied equals: aFloor totalRoomsOccupied.
	self assert: aNumberOfRoomsReserved equals: aFloor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 16:54:55'!
test01CannotCreateFloorWithoutRooms

	self
		should: [ self createFloorWith: 0 and: self defaultPriceList ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor numberOfRoomsMustBePositiveErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 16:55:02'!
test02CannotCreateFloorWithNoIntergerNumberOfRooms

	self
		should: [ self createFloorWith: 1.5 and: self defaultPriceList ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor numberOfRoomsMustBeIntegerErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:32:09'!
test03CannotCreateFloorWithoutPrices
	
	self
		should: [ self createFloorWith: 10 and:  Dictionary new ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor pricesListCannotBeEmptyErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:53:58'!
test04WhenAFloorIsCreatedAllTheRoomsAreAvailable

	| floor |
	
	floor := self createFloorWith: 10 and: self defaultPriceList.
	
	self assert: floor isAvailable.
	
	self assertThatThereIsANumberOfRoomsOccupied: 0 andANumberOfRoomsReserved: 0 at: floor.

! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:53:58'!
test05WhenAFloorReceivesAGuestInARoomReducesTheAvailableRoomsByOneAndIncreaseOccupiedByOne

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	
	self assert: roomsNumber - 1 equals: floor totalRoomsAvailable. 
	self assertThatThereIsANumberOfRoomsOccupied: 1 andANumberOfRoomsReserved: 0 at: floor.

! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:55:23'!
test06WhenAFloorReceivesOnReservationAGuestInARoomKeepsTheAvailableRoomsAndOccupiedAndReducesTheReservedByOne

	| floor roomsNumber roomsAvailable roomsOccupied roomsReserved |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) reserve.

	roomsAvailable := floor totalRoomsAvailable.
	roomsOccupied := floor totalRoomsOccupied.
	roomsReserved := floor totalRoomsReserved.

	"Tech Debt"
	((floor rooms) at: 1) receiveWithReservation: self guestTypeVacation.

	self assert: roomsAvailable equals: floor totalRoomsAvailable. 
	self assert: roomsOccupied equals: floor totalRoomsOccupied.
	self assert: roomsReserved - 1 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:56:07'!
test07WhenARoomIsReservedTheFloorAvailableRoomsReducesByOneAndIncreaseReservedAndOccupiedByOne

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) reserve.
	
	self assert: roomsNumber - 1 equals: floor totalRoomsAvailable. 
	self assertThatThereIsANumberOfRoomsOccupied: 1 andANumberOfRoomsReserved: 1 at: floor.
! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:58:12'!
test08TotalProfitShouldBeTheSumOfOccupiedRoomsProfits

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	((floor rooms) at: 2) receive: self guestTypeConference.
	((floor rooms) at: 3) reserve.
	
	self assertThatAPesosAmout: ( (100*peso) + (200*peso) + (50*peso)) equalsTotalProfitsAt: floor. 
	! !

!FloorTest methodsFor: 'testing' stamp: 'fb 4/29/2024 20:59:53'!
test09TotalLossesShouldBeTheSumOfAvailableRoomsLosses

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	((floor rooms) at: 2) receive: self guestTypeConference.
	((floor rooms) at: 3) reserve.

	self assert: (200*peso) * 7 equals: floor totalLosses
! !


!FloorTest methodsFor: 'create' stamp: 'fb 4/29/2024 17:36:27'!
createFloorWith: aNumberOfRooms and: aPriceList

	| floor |

	floor := Floor new initializeWith: aPriceList and: aNumberOfRooms.

	^ floor.! !

!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:01:23'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: 100*peso;
		at: self guestTypeConference put: 200*peso;
		yourself ! !

!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:00:09'!
guestTypeConference
	
	^ #conferenceGuest! !

!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:00:42'!
guestTypeVacation
	
	^ #vacationGuest! !


!classDefinition: #HotelTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #HotelTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 17:44:59'!
test01CannotCreateHotelWithoutFloors

	self
		should: [ Hotel new initializeWithFloors: OrderedCollection new. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Hotel noFloorsErrorDescription.! !

!HotelTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 11:30:09'!
test02NewHotelsAreEmpty

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel isEmpty.! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:22'!
test03HotelCanReceiveATypeOfGuestInRoomAtFloor

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 2.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 0 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.
! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:32'!
test04HotelCanTakeAReservationForARoomAtFloor

	| hotel |
	
	hotel := self createHotel.

	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel reserveRoom: 2 atFloor: 1.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 1 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:41'!
test05HotelCanReceiveWithReservationATypeOfGuestInRoomAtFloor

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel reserveRoom: 2 atFloor: 1.
	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 2.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 0 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.
! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:17:34'!
test06HotelCannotReceiveWithReservationWithoutPreviousReservation
	
	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	self 
		should: [ 	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [		:error |	
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.
			
			self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
			self assert: 0 equals: hotel totalRoomsReserved.
			self assert: 0 equals: hotel totalRoomsOccupied.
		]


! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 17:44:59'!
test07HotelProfitsAreTheSumOfEachFloorProfits
	
	| hotel floor1 floor2 floors |
	
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.
	floor2 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1 with: floor2.
	hotel := 	Hotel new initializeWithFloors: floors.
	
	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 1.
	hotel receive: self guestTypeConference atFloor: 2 atRoom: 1.

	self assert: floor1 totalProfits + floor2 totalProfits equals:		hotel totalProfits.! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 17:44:59'!
test08HotelLossesAreTheSumOfEachFloorLosses
	
	| hotel floor1 floor2 floors |
	
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.
	floor2 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1 with: floor2.
	hotel := 	Hotel new initializeWithFloors: floors.
	
	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 1.
	hotel receive: self guestTypeConference atFloor: 2 atRoom: 1.

	hotel reserveRoom: 4 atFloor: 1.
	hotel reserveRoom: 2 atFloor: 2.

	self assert: floor1 totalLosses + floor2 totalLosses equals:		hotel totalLosses.! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 18:51:00'!
test09HotelCannotReserveANonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new initializeWithFloors: floors.
	
	self 
	should: [ 	hotel reserveRoom: 42 atFloor: 1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Floor roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]
! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 17:44:59'!
test10HotelCannotReserveANonexistentFloor
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new initializeWithFloors: floors.
	
	self 
	should: [ 	hotel reserveRoom: 1 atFloor: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel floorNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 18:51:05'!
test11HotelCannotReceiveAtNonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new initializeWithFloors: floors.
	
	self 
	should: [ 	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Floor roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 17:44:59'!
test12HotelCannotReceiveAtNonexistentFloor
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new initializeWithFloors: floors.
	
	self 
	should: [ 	hotel receive: self guestTypeVacation atFloor: 42 atRoom: 1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel floorNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 'fb 4/29/2024 18:51:10'!
test13HotelCannotReceiveWithReservationAtNonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new initializeWithFloors: floors.

	hotel reserveRoom: 1 atFloor: 1. 
	
	self 
	should: [ 	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Floor roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
		self assert: 1 equals: hotel totalRoomsReserved.
		self assert: 1 equals: hotel totalRoomsOccupied.
	]! !


!HotelTest methodsFor: 'create' stamp: 'fb 4/29/2024 20:36:15'!
createFloorWith: aNumberOfRooms and: aPrice

	| floor |

	floor := Floor new.
	floor initializeRooms: aNumberOfRooms.
	floor initializePriceList: aPrice.
	
	^ floor.! !

!HotelTest methodsFor: 'create' stamp: 'fb 4/29/2024 17:46:17'!
createHotel

	^ Hotel withFloors: self twoFloorsCollection.
								! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:22'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: self minPriceInList;
		at: self guestTypeConference put: self maxPriceInList;
		yourself ! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:36'!
guestTypeConference
	
	^ #conferenceGuest! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:42'!
guestTypeVacation
	
	^ #vacationGuest! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:48'!
maxPriceInList
	
	^ 200*peso ! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:53'!
minPriceInList
	
	^ 100*peso ! !

!HotelTest methodsFor: 'create' stamp: 'fb 4/29/2024 17:44:00'!
twoFloorsCollection

	^ OrderedCollection with: (self createFloorWith: 10 and: self defaultPriceList)
								      	 with: (self createFloorWith: 1 and: self defaultPriceList)! !


!classDefinition: #RoomTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #RoomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 22:11:08'!
test01NewRoomsAreAvailable

	| room |
	
	room := Room new.

	self assert: room isAvailable.
	
	self deny: room isOccupied.
	self deny: room isReserved.! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:03:07'!
test02ReceivingAGuestMakesTheRoomOccupied

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.

	self assert: room isOccupied.

	self deny: room isAvailable.
	self deny: room isReserved.! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:04:16'!
test03ReservingARoomMakesTheRoomReservedAndOccupied

	| room |
	
	room := Room new.

	room reserve.

	self assert: room isReserved.
	self assert: room isOccupied.

	self deny: room isAvailable.
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:25'!
test04CannotReceiveAGuestInAOccupiedRoom

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.
	
	self 
		should: [ room receive: self guestTypeVacation ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotEmptyErrorDescription equals: error messageText.

			self assert: room isOccupied.
			
			self deny: room isAvailable.
			self deny: room isReserved.
		]
	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:32'!
test05CannotReceiveAGuestInAReservedRoom

	| room |
	
	room := Room new.

	room reserve.
	
	self 
		should: [ room receive: self guestTypeVacation ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotEmptyErrorDescription equals: error messageText.
			
			self assert: room isReserved.
			self assert: room isOccupied.
			
			self deny: room isAvailable.
		]

	

	
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 11:58:29'!
test06ReceivingOnReservationMakesTheRoomOccupied

	| room |
	
	room := Room new.

	room reserve.
	
	room receiveWithReservation: self guestTypeVacation.
	
	self assert: room isOccupied.
	
	self deny: room isReserved.
	self deny: room isAvailable.
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:40'!
test07CannotReceiveOnReservationAnAvailableRoom

	| room |
	
	room := Room new.

	self 
		should: [ room receiveWithReservation: self guestTypeVacation. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.

			self assert: room isAvailable.

			self deny: room isReserved.
			self deny: room isOccupied.
		]

	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:50'!
test08CannotReceiveOnReservationAnOccupiedRoom

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.

	self 
		should: [ room receiveWithReservation: self guestTypeVacation. ] 
		raise: Error - MessageNotUnderstood 	
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.
			
			self assert: room isOccupied.

			self deny: room isReserved.
			self deny: room isAvailable.
		]

	
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:22:02'!
test09ProfitOfAvailableRoomIsCeroPesos

	| room |
	
	room := Room new.

	self assert: 0*peso equals: (room profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:22:57'!
test10ProfitOfReservedRoomIsHalfTheMinPriceInList

	| room |
	
	room := Room new.

	room reserve.

	self assert: self minPriceInList / 2 equals: (room profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:45:00'!
test11ProfitOfOccupiedRoomDependsOnGuestType

	| roomWithConferenceGuest roomWithVacationGuest |
	
	roomWithConferenceGuest := Room new.
	roomWithConferenceGuest receive: self guestTypeConference.
	
	roomWithVacationGuest := Room new.
	roomWithVacationGuest receive: self guestTypeVacation.

	self assert: (self defaultPriceList at: self guestTypeConference) 
		equals: (roomWithConferenceGuest profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).

	self assert: (self defaultPriceList at: self guestTypeVacation) 
		equals: (roomWithVacationGuest profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 'fb 4/29/2024 19:26:29'!
test12NoProfitOnOccupiedRoomByUnknownGuestType

	| room |
	
	room := Room new.
	room receive: #unknownGuest.
	
	room profitUsing: self defaultPriceList ifAbsentGuestType: [ ^self ].
	
	"we should not get here"
	self failWith: 'should not calculate profit on room occupied by unknown guest type'.
! !

!RoomTest methodsFor: 'testing' stamp: 'fb 4/29/2024 19:57:13'!
test13LossesOfAvailableRoomIsHalfTheMaxPriceInList

	
	| room |

	room := Room new.

	self assert: self maxPriceInList equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).

! !

!RoomTest methodsFor: 'testing' stamp: 'fb 4/29/2024 19:57:16'!
test14LossesOfReservedRoomIsCeroPesos


	| room |

	room := Room new.

	room reserve.

	self assert: 0*peso equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).

! !

!RoomTest methodsFor: 'testing' stamp: 'fb 4/29/2024 19:57:20'!
test15LossesOfOccupiedRoomIsCeroPesos


	| room |

	room := Room new.

	room receive: self guestTypeVacation.

	self assert: 0*peso equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/28/2024 15:53:31'!
test16CannotReserveWhenReserved

	| room |
	
	room := Room new.

	room reserve.

	self 
		should: [ room reserve ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room roomIsNotEmptyErrorDescription equals: anError messageText.
			self assert: room isReserved ].! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/28/2024 15:53:48'!
test17CannotReserveWhenOccupied

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.

	self 
		should: [ room reserve ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room roomIsNotEmptyErrorDescription equals: anError messageText.
			self assert: room isOccupied ].! !


!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:16:28'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: self minPriceInList;
		at: self guestTypeConference put: self maxPriceInList;
		yourself ! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:20:45'!
guestTypeConference
	
	^ #conferenceGuest! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:02:15'!
guestTypeVacation
	
	^ #vacationGuest! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:16:13'!
maxPriceInList
	
	^ 200*peso ! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:40:38'!
minPriceInList
	
	^ 100*peso ! !


!classDefinition: #Floor category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Floor
	instanceVariableNames: 'rooms prices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Floor methodsFor: 'testing' stamp: 'FRT 4/21/2024 15:02:31'!
isAvailable
	
	^ self totalRooms = self totalRoomsAvailable

		
! !


!Floor methodsFor: 'accessing' stamp: 'fb 4/29/2024 18:48:53'!
roomAt: aRoomNumber

	^rooms at: aRoomNumber ifAbsent: [ self class signalRoomNumberDoesNotExist] .! !

!Floor methodsFor: 'accessing' stamp: 'fb 4/29/2024 20:22:12'!
rooms

	^ rooms copy! !


!Floor methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:27:11'!
totalLosses
	
	| total |
	
	total := 0*peso.

	rooms do: [ :room | room isAvailable ifTrue: [ total := total + prices values max ] ].

	^ total

		
! !

!Floor methodsFor: 'accounting' stamp: 'FRT 4/21/2024 22:06:47'!
totalProfits

	| total |
	
	total := 0*peso.
	rooms do: [ :room | | roomTotal | 
		room isOccupied ifTrue: [
			roomTotal := 	room profitUsing: prices ifAbsentGuestType: [ self class signalUnknownGuestType ].
			total := total + roomTotal.
		]
	].

	^ total
! !


!Floor methodsFor: 'totals' stamp: 'fb 4/29/2024 18:41:44'!
isEmpty
	
	^rooms inject: true  into: [:empty :room | empty & (room isAvailable)]. 

! !

!Floor methodsFor: 'totals' stamp: 'FRT 4/21/2024 14:49:55'!
totalRooms
	
	^ rooms size
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:49:36'!
totalRoomsAvailable
	
	^rooms count: [ :room | room isAvailable ]
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:49:47'!
totalRoomsOccupied
	
	^rooms count: [ :room | room isOccupied ]
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:50:07'!
totalRoomsReserved
	
	^rooms count: [ :room | room isReserved ]! !


!Floor methodsFor: 'assertions' stamp: 'fb 4/29/2024 17:39:05'!
assertEveryPriceIsPositive: aPriceList

	^ aPriceList values do: [ :price | 
		self class assertIsPositive: price ifFalse: [ self class signalPriceMustBePositive ].
	]! !

!Floor methodsFor: 'assertions' stamp: 'fb 4/29/2024 20:20:14'!
assertThatAPriceListIsNotEmpty: aPriceList

	^ aPriceList isEmpty ifTrue: [ self class signalNoPrices ]! !


!Floor methodsFor: 'initialization' stamp: 'fb 4/29/2024 20:35:44'!
initializeANumberOfRooms: aNumberOfRooms

	rooms := OrderedCollection new.
	1 to: aNumberOfRooms do: [:currentRoomNumber | rooms addLast: Room new].

! !

!Floor methodsFor: 'initialization' stamp: 'fb 4/29/2024 20:21:25'!
initializePriceList: aPriceList

	self assertThatAPriceListIsNotEmpty: aPriceList.
	self assertEveryPriceIsPositive: aPriceList.
	
	prices := aPriceList! !

!Floor methodsFor: 'initialization' stamp: 'fb 4/29/2024 20:36:15'!
initializeRooms: aNumberOfRooms

	self class assertIsPositive: aNumberOfRooms ifFalse: [ self class signalNumberOfRoomsMustBePositive ].
	self class assertIsInteger: aNumberOfRooms ifFalse: [ self class signalNumberOfRoomsMustBeInteger ].
	
	self initializeANumberOfRooms: aNumberOfRooms.
! !

!Floor methodsFor: 'initialization' stamp: 'fb 4/29/2024 20:36:15'!
initializeWith: aPriceList and: aNumberOfRooms

	self initializeRooms: aNumberOfRooms.
	self initializePriceList: aPriceList.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Floor class' category: #'ISW1-2024-1C-Parcial'!
Floor class
	instanceVariableNames: ''!

!Floor class methodsFor: 'assertions' stamp: 'FRT 4/20/2024 19:39:26'!
assertIsInteger: aNumber ifFalse: signalsBlock

	aNumber isInteger ifFalse: signalsBlock! !

!Floor class methodsFor: 'assertions' stamp: 'FRT 4/20/2024 19:40:06'!
assertIsPositive: aNumber ifFalse: signalsBlock

	aNumber strictlyPositive ifFalse: signalsBlock! !


!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:02:53'!
numberOfRoomsMustBeIntegerErrorDescription
	
	^ 'Number of rooms must be integer'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:35:54'!
numberOfRoomsMustBePositiveErrorDescription
	
	^'The number of rooms must be positive'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:42:12'!
priceMustBeIntegerErrorDescription
	
	^ 'Price must be integer'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:42:25'!
priceMustBePositiveErrorDescription
	
	^'Price must be positive'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/21/2024 14:43:01'!
pricesListCannotBeEmptyErrorDescription 
	
	^ 'Prices List must not be empty'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/21/2024 14:47:30'!
unknownGuestTypeErrorDescription
	
	^ 'The guest type is unknown'! !


!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/21/2024 14:42:33'!
signalNoPrices
	
	self error: self pricesListCannotBeEmptyErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:02:35'!
signalNumberOfRoomsMustBeInteger
	
	self error: self numberOfRoomsMustBeIntegerErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:35:54'!
signalNumberOfRoomsMustBePositive

	self error: self numberOfRoomsMustBePositiveErrorDescription! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:41:37'!
signalPriceMustBeInteger
	
	self error: self priceMustBeIntegerErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:41:58'!
signalPriceMustBePositive

	self error: self priceMustBePositiveErrorDescription! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/21/2024 14:48:09'!
signalUnknownGuestType

	self error: self class unknownGuestTypeErrorDescription
! !


!Floor class methodsFor: 'initialization' stamp: 'fb 4/29/2024 18:48:05'!
roomNumberDoesNotExistErrorDescription

	^ 'Room number does not exist'.! !

!Floor class methodsFor: 'initialization' stamp: 'fb 4/29/2024 18:47:48'!
signalRoomNumberDoesNotExist

	self error: self roomNumberDoesNotExistErrorDescription.! !

!Floor class methodsFor: 'initialization' stamp: 'fb 4/29/2024 17:25:41'!
with: aPrice and: aNumberOfRooms

	^ self new initializeWith: aPrice and: aNumberOfRooms ! !


!classDefinition: #Hotel category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Hotel
	instanceVariableNames: 'floors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Hotel methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:14:30'!
totalLosses

	^ floors sum:[:floor | floor totalLosses].
! !

!Hotel methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:14:39'!
totalProfits

	^ floors sum:[:floor | floor totalProfits].
! !


!Hotel methodsFor: 'initialization' stamp: 'fb 4/29/2024 20:17:37'!
initializeWithFloors: aFloorsCollection

	self class assertHaveFloors: aFloorsCollection.

	floors := aFloorsCollection.
	! !


!Hotel methodsFor: 'totals' stamp: 'fb 4/29/2024 20:18:00'!
totalRooms
	
	^floors sum:[:floor | floor totalRooms].! !

!Hotel methodsFor: 'totals' stamp: 'fb 4/29/2024 20:17:02'!
totalRoomsAvailable

	^floors sum:[:floor | floor totalRoomsAvailable].! !

!Hotel methodsFor: 'totals' stamp: 'fb 4/29/2024 20:16:44'!
totalRoomsOccupied

	^floors sum:[:floor | floor totalRoomsOccupied].

	

! !

!Hotel methodsFor: 'totals' stamp: 'fb 4/29/2024 20:16:28'!
totalRoomsReserved
	
	^floors sum:[:floor | floor totalRoomsReserved].

	! !


!Hotel methodsFor: 'testing' stamp: 'fb 4/29/2024 18:41:07'!
isEmpty
	
	^floors inject: true  into: [:empty :floor | empty & (floor isAvailable)]. 


! !


!Hotel methodsFor: 'guests' stamp: 'fb 4/29/2024 20:11:43'!
performGuestManagementAction: anActionToValue atFloor: aFloorNumber	 inRoom: aRoomNumber
	
	| floor room |
	
	floor := floors at: aFloorNumber ifAbsent:  [ self class signalFloorNumberDoesNotExist ].
	room := floor roomAt: aRoomNumber.

	anActionToValue value: room.! !

!Hotel methodsFor: 'guests' stamp: 'fb 4/29/2024 20:18:21'!
receive: aGuestType atFloor: aFloorNumber atRoom: aRoomNumber

	self performGuestManagementAction: [:room | room receive: aGuestType] atFloor: aFloorNumber  inRoom: aRoomNumber.
	
! !

!Hotel methodsFor: 'guests' stamp: 'fb 4/29/2024 20:11:43'!
receiveWithReservation: aGuestType atFloor: aFloorNumber atRoom: aRoomNumber

	self performGuestManagementAction: [:room | room receiveWithReservation: aGuestType] atFloor: aFloorNumber  inRoom: aRoomNumber.

	! !

!Hotel methodsFor: 'guests' stamp: 'fb 4/29/2024 20:18:28'!
reserveRoom: aRoomNumber atFloor: aFloorNumber

	self performGuestManagementAction: [:room | room reserve] atFloor: aFloorNumber  inRoom: aRoomNumber.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hotel class' category: #'ISW1-2024-1C-Parcial'!
Hotel class
	instanceVariableNames: ''!

!Hotel class methodsFor: 'assertions' stamp: 'HAW 4/29/2024 08:48:39'!
assertHaveFloors: aFloorsCollection

	aFloorsCollection isEmpty ifTrue: [ self signalNoFloors ].! !


!Hotel class methodsFor: 'error description' stamp: 'FRT 4/25/2024 21:42:02'!
floorNumberDoesNotExistErrorDescription

	^ 'Floor number does not exist'.! !

!Hotel class methodsFor: 'error description' stamp: 'FRT 4/20/2024 21:42:02'!
noFloorsErrorDescription

	^ 'Cannot have a Hotel without floors'! !


!Hotel class methodsFor: 'initialization' stamp: 'fb 4/29/2024 17:45:59'!
withFloors: aFloorsCollection

	^self new initializeWithFloors: aFloorsCollection! !


!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/25/2024 21:42:24'!
signalFloorNumberDoesNotExist

	self error: self floorNumberDoesNotExistErrorDescription.! !

!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 21:41:30'!
signalNoFloors

	self error: self noFloorsErrorDescription.! !


!classDefinition: #Room category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Room
	instanceVariableNames: 'state guest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:10:03'!
raiseErrorRoomIsNotEmpty

	^ self error: self class roomIsNotEmptyErrorDescription! !

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:19:07'!
raiseErrorRoomNotReserved

	^ self error: self class roomIsNotReservedErrorDescription! !

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:12:57'!
receive: aGuestType

	state receiveGuest: aGuestType inRoom: self.

! !

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:11:27'!
receiveGuest: aGuestType

	state := Occupied new.
	^ guest := aGuestType! !

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:21:36'!
receiveWithReservation: aGuestType

	state receiveGuestWithReservation: aGuestType in: self.
	
! !

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:16:44'!
reserve

	state reserveRoom: self.
! !

!Room methodsFor: 'guests' stamp: 'fb 4/29/2024 18:15:54'!
reserveRoom

	^ state := Reserved new.! !


!Room methodsFor: 'room status' stamp: 'fb 4/29/2024 17:58:37'!
isAvailable

	^ state isAvailable ! !

!Room methodsFor: 'room status' stamp: 'fb 4/29/2024 17:59:01'!
isOccupied

	^ state isOccupied
! !

!Room methodsFor: 'room status' stamp: 'fb 4/29/2024 17:59:09'!
isReserved

	^ state isReserved! !


!Room methodsFor: 'initialization' stamp: 'fb 4/29/2024 18:04:57'!
initialize

	state := Available new.
	guest := #noGuest.! !


!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:52:59'!
calculateAvailableRoomLossUsing: aPriceList

	^ aPriceList values max! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:42:57'!
calculateAvailableRoomProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock 

	^ 0*peso! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:55:16'!
calculateOccupiedRoomLossUsing: aPriceList

	^ 0! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:37:59'!
calculateOccupiedRoomProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock 

	^ aPriceList at: guest ifAbsent: unknownGuestTypeBlock! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:55:36'!
calculateReservedRoomLossUsing: aPriceList

	^ 0! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:41:16'!
calculateReservedRoomProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock 

	^ aPriceList values min / 2! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:54:21'!
lossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock

	^state calculateLossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: self.
! !

!Room methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:48:12'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock

	^ state calculateProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Room class' category: #'ISW1-2024-1C-Parcial'!
Room class
	instanceVariableNames: ''!

!Room class methodsFor: 'error messages' stamp: 'FRT 4/22/2024 09:01:14'!
roomIsNotEmptyErrorDescription

	^ 'Room is not empty.'! !

!Room class methodsFor: 'error messages' stamp: 'FRT 4/22/2024 09:01:43'!
roomIsNotReservedErrorDescription

	^ 'Room is not reserved.'! !



!classDefinition: #RoomState category: #'ISW1-2024-1C-Parcial'!
Object subclass: #RoomState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomState methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:51:44'!
calculateLossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	self subclassResponsibility! !

!RoomState methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:37:08'!
calculateProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	self subclassResponsibility! !


!RoomState methodsFor: 'guests' stamp: 'fb 4/29/2024 18:07:09'!
receiveGuest: aGuestType inRoom: aRoom

	self subclassResponsibility! !

!RoomState methodsFor: 'guests' stamp: 'fb 4/29/2024 18:20:12'!
receiveGuestWithReservation: aGuestType in: aRoom

	self subclassResponsibility! !

!RoomState methodsFor: 'guests' stamp: 'fb 4/29/2024 18:14:45'!
reserveRoom: aRoom

	self subclassResponsibility! !


!RoomState methodsFor: 'current state' stamp: 'fb 4/29/2024 20:44:46'!
isAvailable

	self subclassResponsibility! !

!RoomState methodsFor: 'current state' stamp: 'fb 4/29/2024 20:44:54'!
isOccupied

	self subclassResponsibility! !

!RoomState methodsFor: 'current state' stamp: 'fb 4/29/2024 20:44:58'!
isReserved

	self subclassResponsibility! !


!classDefinition: #Available category: #'ISW1-2024-1C-Parcial'!
RoomState subclass: #Available
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Available methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:55:56'!
calculateLossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	^aRoom calculateAvailableRoomLossUsing: aPriceList! !

!Available methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:43:08'!
calculateProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	^aRoom calculateAvailableRoomProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock ! !


!Available methodsFor: 'current state' stamp: 'fb 4/29/2024 17:59:32'!
isAvailable 

	^true! !

!Available methodsFor: 'current state' stamp: 'fb 4/29/2024 18:00:04'!
isOccupied

	^false! !

!Available methodsFor: 'current state' stamp: 'fb 4/29/2024 18:00:45'!
isReserved

	^false! !


!Available methodsFor: 'guests' stamp: 'fb 4/29/2024 18:09:07'!
receiveGuest: aGuestType inRoom: aRoom

	aRoom receiveGuest: aGuestType ! !

!Available methodsFor: 'guests' stamp: 'fb 4/29/2024 18:20:40'!
receiveGuestWithReservation: aGuestType in: aRoom

	aRoom raiseErrorRoomNotReserved! !

!Available methodsFor: 'guests' stamp: 'fb 4/29/2024 18:15:41'!
reserveRoom: aRoom

	aRoom reserveRoom! !


!classDefinition: #Occupied category: #'ISW1-2024-1C-Parcial'!
RoomState subclass: #Occupied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Occupied methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:56:12'!
calculateLossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	^ aRoom calculateOccupiedRoomLossUsing: aPriceList! !

!Occupied methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:47:54'!
calculateProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	^aRoom calculateOccupiedRoomProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock ! !


!Occupied methodsFor: 'current state' stamp: 'fb 4/29/2024 17:59:40'!
isAvailable 

	^false! !

!Occupied methodsFor: 'current state' stamp: 'fb 4/29/2024 18:00:12'!
isOccupied

	^true! !

!Occupied methodsFor: 'current state' stamp: 'fb 4/29/2024 18:00:56'!
isReserved

	^false! !


!Occupied methodsFor: 'guests' stamp: 'fb 4/29/2024 18:10:33'!
receiveGuest: aGuestType inRoom: aRoom

 	aRoom raiseErrorRoomIsNotEmpty ! !

!Occupied methodsFor: 'guests' stamp: 'fb 4/29/2024 18:20:50'!
receiveGuestWithReservation: aGuestType in: aRoom

	aRoom raiseErrorRoomNotReserved! !

!Occupied methodsFor: 'guests' stamp: 'fb 4/29/2024 18:15:04'!
reserveRoom: aRoom

	aRoom raiseErrorRoomIsNotEmpty.! !


!classDefinition: #Reserved category: #'ISW1-2024-1C-Parcial'!
RoomState subclass: #Reserved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Reserved methodsFor: 'accounting' stamp: 'fb 4/29/2024 19:56:27'!
calculateLossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom
	
	^ aRoom calculateReservedRoomLossUsing: aPriceList.! !

!Reserved methodsFor: 'accounting' stamp: 'fb 4/29/2024 20:41:27'!
calculateProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock in: aRoom

	^aRoom calculateReservedRoomProfitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock ! !


!Reserved methodsFor: 'current state' stamp: 'fb 4/29/2024 17:59:47'!
isAvailable 

	^false! !

!Reserved methodsFor: 'current state' stamp: 'fb 4/29/2024 18:16:15'!
isOccupied

	^true! !

!Reserved methodsFor: 'current state' stamp: 'fb 4/29/2024 18:17:52'!
isReserved

	^true! !


!Reserved methodsFor: 'guests' stamp: 'fb 4/29/2024 18:10:41'!
receiveGuest: aGuestType inRoom: aRoom

	 aRoom raiseErrorRoomIsNotEmpty ! !

!Reserved methodsFor: 'guests' stamp: 'fb 4/29/2024 18:21:25'!
receiveGuestWithReservation: aGuestType in: aRoom

	aRoom receiveGuest: aGuestType ! !

!Reserved methodsFor: 'guests' stamp: 'fb 4/29/2024 18:15:21'!
reserveRoom: aRoom

	aRoom raiseErrorRoomIsNotEmpty ! !
