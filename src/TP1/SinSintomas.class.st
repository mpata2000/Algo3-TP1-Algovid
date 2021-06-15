Class {
	#name : #SinSintomas,
	#superclass : #Sintomas,
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
SinSintomas >> agregarSintomaHabitual: listaSintomas [
	^ (UnSintomaHabitual new)conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
SinSintomas >> agregarSintomaNoHabitual: listaSintomas [
	^(UnSintomaNoHabitual new) conSintomas: listaSintomas.
]

{ #category : #initialization }
SinSintomas >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidNegativo new.
]
