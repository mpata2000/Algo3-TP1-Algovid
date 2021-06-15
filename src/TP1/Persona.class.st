Class {
	#name : #Persona,
	#superclass : #Object,
	#instVars : [
		'sintomas',
		'burbuja',
		'datosCirculacion'
	],
	#category : #'TP1-Modelo'
}

{ #category : #'as yet unclassified' }
Persona >> agregarSintoma: unSintoma [
	sintomas := sintomas agregarSintoma: unSintoma.
	sintomas pincharBurbuja: burbuja.
]

{ #category : #'as yet unclassified' }
Persona >> asignarBurbuja: unaBurbuja [ 
	burbuja := unaBurbuja.
	sintomas pincharBurbuja: burbuja.
]

{ #category : #'as yet unclassified' }
Persona >> contactoEstrechoCon: unaPersona [ 
	datosCirculacion contactoEstrechoCon: unaPersona.
]

{ #category : #'as yet unclassified' }
Persona >> contactoEstrechoNoPuedeCircular [
	^sintomas contactoEstrechoNoPuedeCircular.
]

{ #category : #'as yet unclassified' }
Persona >> diagnostico [
	^sintomas diagnostico.
	
]

{ #category : #'as yet unclassified' }
Persona >> esPersonaDeRiesgo [
	datosCirculacion esPersonaDeRiesgo.
]

{ #category : #'as yet unclassified' }
Persona >> esPersonalEsencial [
	datosCirculacion esPersonalEsencial.
]

{ #category : #initialization }
Persona >> initialize [ 
	sintomas := SinSintomas new.
	burbuja := SinBurbuja new.
	datosCirculacion := DatosCirculacion new.
]

{ #category : #'as yet unclassified' }
Persona >> puedeCircular [
	^ datosCirculacion puedeCircular & sintomas puedeCircular & burbuja puedeCircular.
]

{ #category : #'as yet unclassified' }
Persona >> vacunar [
	datosCirculacion vacunar.
]
