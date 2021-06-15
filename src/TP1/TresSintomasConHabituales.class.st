Class {
	#name : #TresSintomasConHabituales,
	#superclass : #Sintomas,
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
TresSintomasConHabituales >> agregarSintomaHabitual: listaSintomas [
	^(CuatroSintomasOMas new) conSintomas: listaSintomas.

]

{ #category : #'as yet unclassified' }
TresSintomasConHabituales >> agregarSintomaNoHabitual: listaSintomas [
	^(CuatroSintomasOMas new) conSintomas: listaSintomas.
]

{ #category : #initialization }
TresSintomasConHabituales >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidPositivo new.
]
