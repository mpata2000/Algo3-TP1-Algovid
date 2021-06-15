Class {
	#name : #CuatroSintomasOMas,
	#superclass : #Sintomas,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
CuatroSintomasOMas >> agregarSintomaHabitual: listaSintomas [

]

{ #category : #'as yet unclassified' }
CuatroSintomasOMas >> agregarSintomaNoHabitual: listaSintomas [
]

{ #category : #initialization }
CuatroSintomasOMas >> initialize [
	sintomas := OrderedCollection new.
	diagnostico := CovidPositivo new.
]
