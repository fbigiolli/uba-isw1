!classDefinition: #I category: #'Ejercicio 4'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Ejercicio 4'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:02:08'!
* aMultiplicand
	^ aMultiplicand! !

!I class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:02:16'!
+ anAdder
	^ anAdder next! !

!I class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:02:28'!
- aSustrahend
	self error: 'No permitido'! !

!I class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:02:36'!
/ aDividend
	self error: 'No permitido'! !

!I class methodsFor: 'as yet unclassified' stamp: 'FB 3/24/2024 17:39:04'!
next
	^ II! !

!I class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:03:12'!
previous
	self error: 'No permitido'! !


!classDefinition: #II category: #'Ejercicio 4'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Ejercicio 4'!
II class
	instanceVariableNames: 'prev'!

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:07:20'!
* aMultiplicand
	| suma temp |
	suma := self. 
	temp := aMultiplicand.
	[temp = I] 
		whileFalse: [suma := suma + self . temp := temp previous]. 
	^ suma! !

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:03:58'!
+ anAdder
	^ self previous + anAdder next! !

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:18:24'!
- anSustrahend
	anSustrahend = I
		ifTrue: [^self previous]
		ifFalse:[^self previous - anSustrahend previous]! !

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/25/2024 11:25:26'!
/ dividend
	| divisor dividendo cociente|
	divisor := self.
	dividendo := dividend.
	cociente := I.
	[dividend = I]
		whileFalse: [ divisor := divisor - dividendo. cociente := cociente next]
	^cociente! !

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/24/2024 17:41:12'!
establecerPrevio: unNumero
	prev := unNumero
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/24/2024 18:04:53'!
next
	| nuevo |
	nuevo := II createChildNamed: self name , 'I'.
	nuevo establecerPrevio: self.
	^nuevo! !

!II class methodsFor: 'as yet unclassified' stamp: 'FB 3/24/2024 17:38:41'!
previous
	^prev! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'FB 3/25/2024 11:25:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := I.! !


!classDefinition: #III category: #'Ejercicio 4'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Ejercicio 4'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'FB 3/25/2024 11:25:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := II.! !


!classDefinition: #IIII category: #'Ejercicio 4'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Ejercicio 4'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'FB 3/25/2024 11:25:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := III.! !


!classDefinition: #IIIII category: #'Ejercicio 4'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Ejercicio 4'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'FB 3/25/2024 11:25:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := IIII.! !


!classDefinition: #IIIIII category: #'Ejercicio 4'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Ejercicio 4'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FB 3/25/2024 11:25:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := IIIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!