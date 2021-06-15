Class {
	#name : #UnSintomaHabitual,
	#superclass : #Sintomas,
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
UnSintomaHabitual >> agregarSintomaHabitual: listaSintomas [
	^(DosSintomasConHabituales new) conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
UnSintomaHabitual >> agregarSintomaNoHabitual: listaSintomas [
	^(DosSintomasConHabituales new) conSintomas: listaSintomas.
]

{ #category : #initialization }
UnSintomaHabitual >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidSospechoso new.
]
