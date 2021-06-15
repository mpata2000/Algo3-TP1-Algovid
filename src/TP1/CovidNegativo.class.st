Class {
	#name : #CovidNegativo,
	#superclass : #Object,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
CovidNegativo >> contactoEstrechoNoPuedeCircular [
	^false.
]

{ #category : #'as yet unclassified' }
CovidNegativo >> diagnostico [
	^'Negativo'.
]

{ #category : #'as yet unclassified' }
CovidNegativo >> pincharBurbuja: unaBurbuja [
]

{ #category : #'as yet unclassified' }
CovidNegativo >> puedeCircular [
	^true.
]
