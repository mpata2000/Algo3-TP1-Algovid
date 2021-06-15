Class {
	#name : #DatosCirculacion,
	#superclass : #Object,
	#instVars : [
		'personal',
		'personaDeRiesgo',
		'contactosEstrechos',
		'vacunadx'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
DatosCirculacion >> contactoEstrechoCon: unaPersona [ 
	contactosEstrechos add: unaPersona.
]

{ #category : #'as yet unclassified' }
DatosCirculacion >> contactosEstrechosPuedeCircular [
	^(contactosEstrechos anySatisfy: [ :persona | persona contactoEstrechoNoPuedeCircular ]) not.
]

{ #category : #'as yet unclassified' }
DatosCirculacion >> esPersonaDeRiesgo [
	personaDeRiesgo := PersonaDeRiesgo new.
]

{ #category : #'as yet unclassified' }
DatosCirculacion >> esPersonalEsencial [
	personal := PersonalEsencial new.
]

{ #category : #initialization }
DatosCirculacion >> initialize [ 
	vacunadx := NoVacunadx new.
	personal := PersonalNoEscencial new.
	personaDeRiesgo := PersonaNoDeRiesgo new.
	contactosEstrechos := Set new.
]

{ #category : #'as yet unclassified' }
DatosCirculacion >> puedeCircular [
	^(vacunadx estaVacunadx | personal esEsencial ) & (personaDeRiesgo esDeRiesgo) not & self contactosEstrechosPuedeCircular.
]

{ #category : #'as yet unclassified' }
DatosCirculacion >> vacunar [
	vacunadx := Vacunadx new.
]
