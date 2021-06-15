Class {
	#name : #CovidPositivo,
	#superclass : #Object,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
CovidPositivo >> contactoEstrechoNoPuedeCircular [
	^true.
]

{ #category : #'as yet unclassified' }
CovidPositivo >> diagnostico [
	^'Positivo'.
]

{ #category : #'as yet unclassified' }
CovidPositivo >> pincharBurbuja: unaBurbuja [ 
	unaBurbuja pincharBurbuja.
]

{ #category : #'as yet unclassified' }
CovidPositivo >> puedeCircular [
	^false.
]
