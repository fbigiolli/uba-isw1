!classDefinition: #Falso category: #'Ejercicio 3'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #'Ejercicio 3'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:26:11'!
no
	^Verdadero! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:32:01'!
o: unBooleano
	^ unBooleano! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:42:38'!
siFalso: unaAccionARealizarUIgnorar

	unaAccionARealizarUIgnorar value! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:40:22'!
siVerdadero: unaAccionARealizarUIgnorar
! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:27:22'!
y: unBooleano
	^ Falso! !


!classDefinition: #Tests category: #'Ejercicio 3'!
DenotativeObject subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tests class' category: #'Ejercicio 3'!
Tests class
	instanceVariableNames: ''!

!Tests class methodsFor: '-- all --' stamp: 'FB 3/21/2024 20:46:03'!
testFalsoSiVerdadero
	
	|estadoDeEjecucion|
	
	estadoDeEjecucion := #NoSeEjecuto.
	
	Falso siVerdadero:[estadoDeEjecucion := #SeEjecuto].
	
	Assert that: estadoDeEjecucion isEqualTo: #NoSeEjecuto! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/20/2024 16:27:52'!
testNoFalso

	Assert that: (Falso no) isEqualTo: Verdadero! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/20/2024 16:27:14'!
testNoVerdadero

	Assert that: (Verdadero no) isEqualTo: Falso ! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/20/2024 16:28:19'!
testOFalsoYVerdadero

	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/20/2024 16:25:59'!
testOVerdaderoYFalso

	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero ! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/21/2024 20:43:59'!
testVerdaderoSiVerdadero
	
	|estadoDeEjecucion|
	
	estadoDeEjecucion := #NoSeEjecuto.
	
	Verdadero siVerdadero:[estadoDeEjecucion := #SeEjecuto].
	
	Assert that: estadoDeEjecucion isEqualTo: #SeEjecuto! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/20/2024 16:28:36'!
testYFalsoYVerdadero

	Assert that: (Falso y: Verdadero) isEqualTo: Falso! !

!Tests class methodsFor: '-- all --' stamp: 'FB 3/20/2024 16:26:59'!
testYVerdaderoYFalso

	Assert that: (Verdadero y: Falso) isEqualTo: Falso ! !


!classDefinition: #Verdadero category: #'Ejercicio 3'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #'Ejercicio 3'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:26:28'!
no
	^Falso! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:32:38'!
o: unBooleano
	^ Verdadero! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:46:57'!
siFalso: unaAccionARealizarUIgnorar

	! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:45:48'!
siVerdadero: unaAccionARealizarUIgnorar
	
	unaAccionARealizarUIgnorar  value! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'FB 3/18/2024 21:28:10'!
y: unBooleano
	^ unBooleano! !
