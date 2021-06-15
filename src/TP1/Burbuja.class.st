Class {
	#name : #Burbuja,
	#superclass : #Object,
	#instVars : [
		'personas',
		'burbuja'
	],
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
Burbuja >> agregar: unaPersona [
	unaPersona asignarBurbuja: self.
]

{ #category : #'as yet unclassified' }
Burbuja >> burbujaPinchada [
	^burbuja burbujaPinchada
]

{ #category : #initialization }
Burbuja >> initialize [
	burbuja := BurbujaNoPinchada new
]

{ #category : #'as yet unclassified' }
Burbuja >> pincharBurbuja [
	burbuja := BurbujaPinchada new.
]

{ #category : #'as yet unclassified' }
Burbuja >> puedeCircular [ 
	^burbuja puedeCircular.
]
