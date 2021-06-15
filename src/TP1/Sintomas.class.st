Class {
	#name : #Sintomas,
	#superclass : #Object,
	#instVars : [
		'sintomas',
		'diagnostico'
	],
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
Sintomas >> agregarSintoma: unSintoma [
	(sintomas anySatisfy: [ :sintoma | sintoma asUppercase = unSintoma asUppercase ]) ifTrue: [ ^PersonaYaTieneEseSintomaError new signal ].
	sintomas add: unSintoma.
	
	(#('FIEBRE' 'TOS' 'CANSANCIO') includes: unSintoma asUppercase ) 
		ifTrue: [ ^self agregarSintomaHabitual: sintomas].
		
	^self agregarSintomaNoHabitual: sintomas

]

{ #category : #'as yet unclassified' }
Sintomas >> agregarSintomaHabitual: listaSintomas [
	self subclassResponsibility.

]

{ #category : #'as yet unclassified' }
Sintomas >> agregarSintomaNoHabitual: listaSintomas [
	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
Sintomas >> conSintomas: listaSintomas [
	sintomas:= listaSintomas.
]

{ #category : #'as yet unclassified' }
Sintomas >> contactoEstrechoNoPuedeCircular [
	^diagnostico contactoEstrechoNoPuedeCircular.
]

{ #category : #accessing }
Sintomas >> diagnostico [ 
	^diagnostico diagnostico.
]

{ #category : #'as yet unclassified' }
Sintomas >> pincharBurbuja: unaBurbuja [
	^diagnostico pincharBurbuja: unaBurbuja.
]

{ #category : #accessing }
Sintomas >> puedeCircular [
	^diagnostico puedeCircular.
]
