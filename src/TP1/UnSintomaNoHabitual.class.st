Class {
	#name : #UnSintomaNoHabitual,
	#superclass : #Sintomas,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
UnSintomaNoHabitual >> agregarSintomaHabitual: listaSintomas [
	^(DosSintomasConHabituales new) conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
UnSintomaNoHabitual >> agregarSintomaNoHabitual: listaSintomas [
	^(DosSintomasSinHabituales new) conSintomas: listaSintomas.
]

{ #category : #initialization }
UnSintomaNoHabitual >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidSospechoso new.
]
