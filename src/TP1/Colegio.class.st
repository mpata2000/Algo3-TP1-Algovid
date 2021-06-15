Class {
	#name : #Colegio,
	#superclass : #Object,
	#instVars : [
		'burbujas'
	],
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
Colegio >> agregarBurbuja: unaBurbuja [
	burbujas add: unaBurbuja.
]

{ #category : #'as yet unclassified' }
Colegio >> clasesPresenciales [
	| porcentaje |
	(burbujas isEmpty )ifTrue:[ ColegioSinBurbujasError new signal ].
	porcentaje := ((burbujas count: [:burbuja | burbuja burbujaPinchada]) / burbujas size) asFloat.
	
	^porcentaje < 0.4
]

{ #category : #initialization }
Colegio >> initialize [ 
	burbujas := Set new.
]
