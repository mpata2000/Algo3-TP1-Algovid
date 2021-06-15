Class {
	#name : #BurbujaTest,
	#superclass : #TestCase,
	#instVars : [
		'burbuja'
	],
	#category : #'TP1-Tests'
}

{ #category : #running }
BurbujaTest >> setUp [
	burbuja := Burbuja new.
]

{ #category : #tests }
BurbujaTest >> test01BurbujaPorDefectoNoEstaPinchada [
	self deny: burbuja burbujaPinchada
]

{ #category : #tests }
BurbujaTest >> test02BurbujaConPersonaCovidSPositivoPrevioPinchada [
	| persona |
	persona := Persona new.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Fiebre'.
	persona agregarSintoma: 'Dolor'.	
	burbuja agregar: persona.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self assert: burbuja burbujaPinchada.
]

{ #category : #tests }
BurbujaTest >> test03BurbujaSinPincharDejaCircular [
	self assert: burbuja puedeCircular.
]

{ #category : #tests }
BurbujaTest >> test04LaBurbujaSePuedePinchar [
	burbuja pincharBurbuja.
	self assert: burbuja burbujaPinchada.
]

{ #category : #tests }
BurbujaTest >> test05LaBurbujaPincharNoDejaCircular [
	burbuja pincharBurbuja.
	self deny: burbuja puedeCircular.
]

{ #category : #tests }
BurbujaTest >> test06BurbujaConPersonaCovidNegativoNoPinchada [
	| persona |
	persona := Persona new.
	
	burbuja agregar: persona.
	
	self assert: persona diagnostico equals: 'Negativo'.
	self deny: burbuja burbujaPinchada.
]

{ #category : #tests }
BurbujaTest >> test07BurbujaConPersonaCovidSospechosoNoPinchada [
	| persona |
	persona := Persona new.
	persona agregarSintoma: 'Tos'.
	burbuja agregar: persona.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: burbuja burbujaPinchada.
]

{ #category : #tests }
BurbujaTest >> test08BurbujaConPersonaCovidSPositivoPosteriorPinchada [
	| persona |
	persona := Persona new.
	burbuja agregar: persona.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Fiebre'.
	persona agregarSintoma: 'Dolor'.	
	
	self assert: persona diagnostico equals: 'Positivo'.
	self assert: burbuja burbujaPinchada.
]
