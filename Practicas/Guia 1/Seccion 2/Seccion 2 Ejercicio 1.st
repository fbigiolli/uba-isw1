!classDefinition: #Colecciones category: #'Seccion 2 Ejercicio 1'!
DenotativeObject subclass: #Colecciones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion 2 Ejercicio 1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Colecciones class' category: #'Seccion 2 Ejercicio 1'!
Colecciones class
	instanceVariableNames: ''!

!Colecciones class methodsFor: '-- all --' stamp: 'fb 4/8/2024 10:49:27'!
createArray
	|x|
	
	x := #(5 4 3 2).
	
	"indexa desde 1 los arrays"
	x at: 1 put: 42.
	"al querer ponerlo en el index 5 nos salimos de rango"
	
	^x! !

!Colecciones class methodsFor: '-- all --' stamp: 'fb 4/8/2024 11:06:49'!
createDictionary
	|x|
	
	x := Dictionary new.
	x add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.
	
	x add:#e->42.
	
	"listar keys"
	x keys.
	"listar values"
	x values.
	
	x add: #z->'boca'.
	"si existe el valor devuelve 24, si no nil"
	"el :z es porque el bloque esta siendo llamado con un parametro, y si no se lo define dentro de el
	 tira error. Los parametros de los bloques se definen con :aParameter a la izquierda de la | en el bloque."
	^ x at: #z ifPresent: [:z |^24].! !

!Colecciones class methodsFor: '-- all --' stamp: 'fb 4/8/2024 10:51:59'!
createOrderedCollection
	
	|x|
	
	x := OrderedCollection with: 4 with: 3 with: 2 with: 1.
	
	x add: 42.
	x add: 2.
	
	^x! !

!Colecciones class methodsFor: '-- all --' stamp: 'fb 4/8/2024 10:53:01'!
createSet

	|x|
	
	x := Set with: 4 with: 3 with: 2 with: 1.
	
	x add: 42.
	x add: 2.
	
	^x! !

!Colecciones class methodsFor: '-- all --' stamp: 'fb 4/8/2024 11:16:32'!
getOddsFromArray

	| elements index odds |
	
	elements:= #(1 2 5 6 9).
	
	odds := OrderedCollection new.
	index := 1.
	
	[index <= elements size]
	whileTrue: [
		((elements at: index) odd) ifTrue: [odds add: (elements at: index)].
		index := index +1.
		].
	^odds! !
