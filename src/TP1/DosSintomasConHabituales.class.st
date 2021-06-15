Class {
	#name : #DosSintomasConHabituales,
	#superclass : #Sintomas,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
DosSintomasConHabituales >> agregarSintomaHabitual: listaSintomas [
	^(TresSintomasConHabituales new) conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
DosSintomasConHabituales >> agregarSintomaNoHabitual: listaSintomas [
	^(TresSintomasConHabituales new) conSintomas: listaSintomas.
]

{ #category : #initialization }
DosSintomasConHabituales >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidSospechoso new.
]
