Class {
	#name : #ColegioTest,
	#superclass : #TestCase,
	#instVars : [
		'colegio'
	],
	#category : #'TP1-Tests'
}

{ #category : #running }
ColegioTest >> setUp [ 
	colegio := Colegio new.
]

{ #category : #'as yet unclassified' }
ColegioTest >> test01AgregarDosVecesLaMismaBurbujaNoAfectaLasClasesPresenciales [
	| burbuja1 burbuja2 burbuja3 burbuja4 |
	
	burbuja1 := Burbuja new.
	burbuja2 := Burbuja new.
	burbuja3 := Burbuja new.
	burbuja4 := Burbuja new.

	colegio agregarBurbuja: burbuja1.
	colegio agregarBurbuja: burbuja2.
	colegio agregarBurbuja: burbuja3.
	colegio agregarBurbuja: burbuja4.

	"1/4 pinchada = 25%"	
	burbuja1 pincharBurbuja.
	"Si agrego otra vez burbuja1 no deberia afectar (con 2/5 pinchada no habria clases)"
	colegio agregarBurbuja: burbuja1.

	
	self assert: colegio clasesPresenciales.
]

{ #category : #tests }
ColegioTest >> test02ClasesPresencialesSinBurbujasDaError [
	self should: [ colegio clasesPresenciales ] raise: ColegioSinBurbujasError .
]

{ #category : #tests }
ColegioTest >> test03ClasesPresencialesConNingunaBurbujaPinchada [
	| burbuja |
	
	burbuja := Burbuja new.
	colegio agregarBurbuja: burbuja.
	self assert: colegio clasesPresenciales.
]

{ #category : #tests }
ColegioTest >> test04NoHayClasesPresencialesConTodasBurbujasPinchadas [
	| burbuja |
	
	burbuja := Burbuja new.
	burbuja pincharBurbuja.
	colegio agregarBurbuja: burbuja.
	self deny: colegio clasesPresenciales.
]

{ #category : #'as yet unclassified' }
ColegioTest >> test05NoHayClasesPresencialesCon40PorcientoDeBurbujasPinchadas [
	| burbuja1 burbuja2 burbuja3 burbuja4 burbuja5 |
	
	burbuja1 := Burbuja new.
	burbuja2 := Burbuja new.
	burbuja3 := Burbuja new.
	burbuja4 := Burbuja new.
	burbuja5 := Burbuja new.

	colegio agregarBurbuja: burbuja1.
	colegio agregarBurbuja: burbuja2.
	colegio agregarBurbuja: burbuja3.
	colegio agregarBurbuja: burbuja4.
	colegio agregarBurbuja: burbuja5.

	"2/5 pinchadas = 40%"	
	burbuja1 pincharBurbuja.
	burbuja2 pincharBurbuja.
	
	self deny: colegio clasesPresenciales.
]
