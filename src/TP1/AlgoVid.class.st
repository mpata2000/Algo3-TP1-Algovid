Class {
	#name : #AlgoVid,
	#superclass : #Object,
	#instVars : [
		'personas',
		'burbujas',
		'colegios'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
AlgoVid >> agregarA: unaPersona aLaBurbuja: unaBurbuja [
	(self encontrarBurbuja: unaBurbuja) agregar: (self encontrarPersona: unaPersona).
]

{ #category : #'as yet unclassified' }
AlgoVid >> agregarA: unaBurbuja alColegio: unColegio [ 
	(self encontrarColegio: unColegio ) agregarBurbuja: (self encontrarBurbuja: unaBurbuja ) .
]

{ #category : #'as yet unclassified' }
AlgoVid >> agregarSintoma: unSintoma a: unNombre [
	(self encontrarPersona: unNombre) agregarSintoma: unSintoma.
]

{ #category : #'as yet unclassified' }
AlgoVid >> burbujaPinchada: unaBurbuja [ 
	^(self encontrarBurbuja: unaBurbuja) burbujaPinchada.
]

{ #category : #'as yet unclassified' }
AlgoVid >> clasesPresencialesEn: unColegio [
	^(self encontrarColegio: unColegio ) clasesPresenciales.
]

{ #category : #'as yet unclassified' }
AlgoVid >> contactoEstrechoEntre: unPersona1 y: unPersona2 [
	| persona1 persona2 |

	persona1 := self encontrarPersona: unPersona1.
	persona2 := self encontrarPersona: unPersona2.
	
	persona1 contactoEstrechoCon: persona2.
	persona2 contactoEstrechoCon: persona1.
]

{ #category : #'as yet unclassified' }
AlgoVid >> diagnosticoDe: unNombre [
	| persona |
	persona := self encontrarPersona: unNombre.

	^persona diagnostico.
]

{ #category : #'as yet unclassified' }
AlgoVid >> encontrarBurbuja: unBurbuja [
	^ burbujas at: unBurbuja ifAbsent: [ BurbujaNoExisteError new signal ]
]

{ #category : #'as yet unclassified' }
AlgoVid >> encontrarColegio: unColegio [
	^ colegios at: unColegio ifAbsent: [ ColegioNoExisteError new signal ]
]

{ #category : #'as yet unclassified' }
AlgoVid >> encontrarPersona: unNombre [
	^ personas at: unNombre ifAbsent: [ PersonaNoExisteError new signal].
]

{ #category : #'as yet unclassified' }
AlgoVid >> esPersonaDeRiesgo: unNombre [
	| persona |
	persona := self encontrarPersona: unNombre.
	persona esPersonaDeRiesgo.
]

{ #category : #'as yet unclassified' }
AlgoVid >> esPersonalEsencial: unNombre [
	| persona |
	persona := self encontrarPersona: unNombre.
	persona esPersonalEsencial.
]

{ #category : #'as yet unclassified' }
AlgoVid >> estaVacunadx: unNombre [
	| persona |
	persona := self encontrarPersona: unNombre.
	persona vacunar. 
]

{ #category : #initialization }
AlgoVid >> initialize [
	personas := Dictionary new.
	burbujas := Dictionary new.
	colegios := Dictionary new.
]

{ #category : #'as yet unclassified' }
AlgoVid >> nuevaBurbuja: unaBurbuja [
	burbujas at: unaBurbuja ifPresent: [ ^BurbujaYaExisteError new signal]  ifAbsentPut: [Burbuja new].

]

{ #category : #'as yet unclassified' }
AlgoVid >> nuevaPersona: unNombre [
	personas at: unNombre ifPresent: [ ^PersonaYaExisteError new signal]  ifAbsentPut: [Persona new].
]

{ #category : #'as yet unclassified' }
AlgoVid >> nuevoColegio: unColegio [
	colegios at: unColegio ifPresent: [ ^ColegioYaExisteError new signal]  ifAbsentPut: [Colegio new].
]

{ #category : #'as yet unclassified' }
AlgoVid >> puedeCircular: unNombre [ 
	| persona |
	persona := self encontrarPersona: unNombre.
	
	^persona puedeCircular.
]
