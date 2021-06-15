Class {
	#name : #TresSintomasSinHabituales,
	#superclass : #Sintomas,
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
TresSintomasSinHabituales >> agregarSintomaHabitual: listaSintomas [
	^(CuatroSintomasOMas new) conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
TresSintomasSinHabituales >> agregarSintomaNoHabitual: listaSintomas [
	^(CuatroSintomasOMas new) conSintomas: listaSintomas.
]

{ #category : #initialization }
TresSintomasSinHabituales >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidSospechoso new.
]
