Class {
	#name : #DosSintomasSinHabituales,
	#superclass : #Sintomas,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
DosSintomasSinHabituales >> agregarSintomaHabitual: listaSintomas [
	^(TresSintomasConHabituales new) conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
DosSintomasSinHabituales >> agregarSintomaNoHabitual: listaSintomas [
	^(TresSintomasSinHabituales new) conSintomas: listaSintomas.
]

{ #category : #initialization }
DosSintomasSinHabituales >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidSospechoso new.
]
