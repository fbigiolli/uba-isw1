!classDefinition: #Bill category: #'Ejercicio 2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #'Ejercicio 2'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: '-- all --' stamp: 'FB 3/18/2024 21:23:04'!
caminar: cantidadDeKilometros
	energia := energia - ((3 + cantidadDeKilometros) * day)! !

!Bill class methodsFor: '-- all --' stamp: 'FB 3/18/2024 21:18:36'!
comer: cantidadDeKilosDeCerebro
	energia := energia + ((cantidadDeKilosDeCerebro/4) * day )! !

!Bill class methodsFor: '-- all --' stamp: 'FB 3/18/2024 21:04:44'!
energia
	^energia! !

!Bill class methodsFor: '--** private fileout/in **--' stamp: 'Fb 4/5/2024 10:54:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 2575e-2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'Fb 4/5/2024 10:54:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 2575e-2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !

Bill initializeAfterFileIn!