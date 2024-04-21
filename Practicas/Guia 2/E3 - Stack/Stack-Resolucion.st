!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'itemCollection status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'status updates' stamp: 'fb 4/21/2024 19:25:46'!
addItemToCollection: anItem

	itemCollection addLast: anItem! !

!OOStack methodsFor: 'status updates' stamp: 'fb 4/21/2024 19:38:41'!
updateStatusToEmpty

	status := Empty new.! !

!OOStack methodsFor: 'status updates' stamp: 'fb 4/21/2024 19:36:42'!
updateStatusToMoreThanOneElement

	status := MoreThanOneElement  new.! !

!OOStack methodsFor: 'status updates' stamp: 'fb 4/21/2024 19:29:25'!
updateStatusToOneElement

	status := OneElement new.! !


!OOStack methodsFor: 'internal messages' stamp: 'fb 4/21/2024 19:31:02'!
popElement

	^itemCollection removeLast! !

!OOStack methodsFor: 'internal messages' stamp: 'fb 4/21/2024 19:32:07'!
topElement

	^itemCollection at: itemCollection size ! !


!OOStack methodsFor: 'operations' stamp: 'fb 4/21/2024 19:00:42'!
isEmpty
	
	^ itemCollection size = 0! !

!OOStack methodsFor: 'operations' stamp: 'fb 4/21/2024 19:46:25'!
pop

	^status popIfItsPossible: self.! !

!OOStack methodsFor: 'operations' stamp: 'fb 4/21/2024 19:27:44'!
push: anItem
	
	status push: anItem into: self ! !

!OOStack methodsFor: 'operations' stamp: 'fb 4/21/2024 19:02:10'!
size

	^ itemCollection size! !

!OOStack methodsFor: 'operations' stamp: 'fb 4/21/2024 19:46:43'!
top

	^status topIfItsPossible: self.! !


!OOStack methodsFor: 'error raising' stamp: 'fb 4/21/2024 19:23:04'!
raiseEmptyStackError

	^self error:OOStack stackEmptyErrorDescription! !


!OOStack methodsFor: 'initialization' stamp: 'fb 4/21/2024 19:27:05'!
initialize
	
	itemCollection := OrderedCollection ofSize: 0.
	status := Empty new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackStatus category: #'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:25'!
popIfItsPossible: anOOStack

	self subclassResponsibility! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:21:16'!
pushItemInto: anOOStack

	self subclassResponsibility! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:43'!
topIfItsPossible: anOOStack

	self subclassResponsibility! !


!classDefinition: #Empty category: #'Stack-Exercise'!
OOStackStatus subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:25'!
popIfItsPossible: anOOStack

	anOOStack raiseEmptyStackError! !

!Empty methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:26:22'!
push: anItem into: anOOStack

	anOOStack updateStatusToOneElement.
	anOOStack addItemToCollection: anItem.! !

!Empty methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:43'!
topIfItsPossible: anOOStack

	anOOStack raiseEmptyStackError! !


!classDefinition: #MoreThanOneElement category: #'Stack-Exercise'!
OOStackStatus subclass: #MoreThanOneElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!MoreThanOneElement methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:25'!
popIfItsPossible: anOOStack

	"hay que poner un if para ver si tenemos que cambiar al estado OneElement... que triste que es la vida sin
	 polimorfismo... -Comentarista secreto"
	
	anOOStack size = 2
		ifTrue: [anOOStack updateStatusToOneElement].

	^anOOStack popElement! !

!MoreThanOneElement methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:34:09'!
push: anItem into: anOOStack

	anOOStack addItemToCollection: anItem.! !

!MoreThanOneElement methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:43'!
topIfItsPossible: anOOStack

	^anOOStack topElement! !


!classDefinition: #OneElement category: #'Stack-Exercise'!
OOStackStatus subclass: #OneElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OneElement methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:25'!
popIfItsPossible: anOOStack

	anOOStack updateStatusToEmpty.
	^anOOStack popElement.! !

!OneElement methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:33:52'!
push: anItem into: anOOStack

	anOOStack updateStatusToMoreThanOneElement.
	anOOStack addItemToCollection: anItem.! !

!OneElement methodsFor: 'as yet unclassified' stamp: 'fb 4/21/2024 19:46:43'!
topIfItsPossible: anOOStack

	^anOOStack topElement! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
