!classDefinition: #Item2 category: 'Seccion 2 Ejercicio 0'!
DenotativeObject subclass: #Item2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion 2 Ejercicio 0'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Item2 class' category: 'Seccion 2 Ejercicio 0'!
Item2 class
	instanceVariableNames: 'aVar'!

!Item2 class methodsFor: 'as yet unclassified' stamp: 'fb 4/8/2024 10:33:48'!
m1
	| b |
	
	b := 42.
	aVar := 1.
	
	^ self m2: b! !


!Item2 class methodsFor: 'methods' stamp: 'fb 4/8/2024 10:35:14'!
m2: anotherValue 
	| b |
	
	b := 24.
	aVar < 3 ifTrue: [ aVar := aVar + anotherValue ].
	
	^ aVar + b! !


!Item2 class methodsFor: '--** private fileout/in **--' stamp: 'fb 4/8/2024 11:27:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	aVar := 43.! !

Item2 initializeAfterFileIn!