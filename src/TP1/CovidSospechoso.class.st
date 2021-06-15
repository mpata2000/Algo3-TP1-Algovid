Class {
	#name : #CovidSospechoso,
	#superclass : #Object,
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
CovidSospechoso >> contactoEstrechoNoPuedeCircular [
	^true.
]

{ #category : #'as yet unclassified' }
CovidSospechoso >> diagnostico [
	^'Sospechoso'.
]

{ #category : #'as yet unclassified' }
CovidSospechoso >> pincharBurbuja: unaBurbuja [
]

{ #category : #'as yet unclassified' }
CovidSospechoso >> puedeCircular [
	^false.
]
