!classDefinition: #NumeroTest category: 'Numero-Solution-2'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two three four five eight oneFifth oneHalf twoFifth twoTwentyfifth fiveHalfs negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-2'!

!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:23:56'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:03:05'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:03:37'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:03:54'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:05:54'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:06:13'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:07:55'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:08:03'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 21:40:28'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 22:02:37'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:27:52'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:30:38'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:30:48'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:32:45'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)
	! !


!classDefinition: #Numero category: 'Numero-Solution-2'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-2'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:19:03'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:59:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:45:31'!
addToEntero: anEnteroBeingAdded

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:47:39'!
addToFraccion: aFraccionBeingAdded

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:07:21'!
divideEntero: anEnteroDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:07:26'!
divideFraccion: aFraccionDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:49:27'!
multiplyToEntero: anEnteroBeingMultiplied

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:52:16'!
multiplyToFraccion: aFraccionBeingMultiplied

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:02:21'!
subtractFromEntero: anEnteroMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:02:42'!
subtractFromFraccion: aFraccionMinuend

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:23:54'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Solution-2'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: 'Numero-Solution-2'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-2'!

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 06:49:27'!
* aMultiplier 
	
	^aMultiplier multiplyToEntero: self ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 06:44:33'!
+ anAdder 
	
	^anAdder addToEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:02:21'!
- aSubtrahend 
	
	^aSubtrahend subtractFromEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:01'!
/ aDivisor 
	
	^aDivisor divideEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:45:06'!
addToEntero: anEnteroBeingAdded
	
	^self class with: anEnteroBeingAdded integerValue + value
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:47:39'!
addToFraccion: aFraccionBeingAdded

	^self + aFraccionBeingAdded
	
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:30:26'!
divideEntero: anEnteroDividend

	^Fraccion with: anEnteroDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:30:52'!
divideFraccion: aFraccionDividend

	^aFraccionDividend numerator / (aFraccionDividend denominator * self) ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:49:27'!
multiplyToEntero: anEnteroBeingMultiplied

	^self class with: anEnteroBeingMultiplied integerValue * value! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:52:16'!
multiplyToFraccion: aFraccionBeingMultiplied

	^self * aFraccionBeingMultiplied ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:02:21'!
subtractFromEntero: anEnteroMinuend 
	
	^self class with: anEnteroMinuend integerValue - value
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:02:42'!
subtractFromFraccion: aFraccionMinuend 
			
	^aFraccionMinuend numerator - (self * aFraccionMinuend denominator) / (aFraccionMinuend denominator). 
! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 21:49:48'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Solution-2'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !


!Entero class methodsFor: 'error descriptions' stamp: 'NR 9/23/2018 22:03:31'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para enteros negativos'! !


!classDefinition: #Fraccion category: 'Numero-Solution-2'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-2'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 06:52:16'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 06:47:39'!
+ anAdder 
	
	^anAdder addToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:02:42'!
- aSubtrahend 
	
	^aSubtrahend subtractFromFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:06'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:45:51'!
addToEntero: anEnteroBeingAdded

	^anEnteroBeingAdded * denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:47:39'!
addToFraccion: aFraccionBeingAdded

	| newNumerator newDenominator |
	
	newNumerator := (denominator * aFraccionBeingAdded numerator) + (numerator * aFraccionBeingAdded denominator).
	newDenominator := denominator * aFraccionBeingAdded denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:31:10'!
divideEntero: anEnteroDividend

	^anEnteroDividend * denominator / numerator
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:31:24'!
divideFraccion: aFraccionDividend

	^(aFraccionDividend numerator * denominator) / (aFraccionDividend denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:49:53'!
multiplyToEntero: anEnteroBeingMultiplied

	^anEnteroBeingMultiplied * numerator / denominator 
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 06:52:16'!
multiplyToFraccion: aFraccionBeingMultiplied

	^(aFraccionBeingMultiplied numerator * numerator) / (aFraccionBeingMultiplied denominator * denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:02:21'!
subtractFromEntero: anEnteroMinuend

	^anEnteroMinuend * denominator - numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:02:42'!
subtractFromFraccion: aFraccionMinuend

	| newNumerator newDenominator |
	
	newNumerator := (denominator * aFraccionMinuend numerator) - (numerator * aFraccionMinuend denominator) .
	newDenominator := denominator * aFraccionMinuend denominator.
	
	^newNumerator / newDenominator 
! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 4/24/2021 17:32:44'!
isNegative
	
	^numerator isNegative! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Solution-2'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:05:03'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
! !
