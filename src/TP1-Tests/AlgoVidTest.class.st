Class {
	#name : #AlgoVidTest,
	#superclass : #TestCase,
	#instVars : [
		'algovid'
	],
	#category : #'TP1-Tests'
}

{ #category : #running }
AlgoVidTest >> setUp [
	algovid := AlgoVid new. "Aislamiento estricto por defecto"
]

{ #category : #tests }
AlgoVidTest >> test01PorDefectoNoPuedeSalir [
  algovid nuevaPersona: 'Joaquin'.
  
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test02NoSePuedeCrearDosVecesLaMismaPersona [
	algovid nuevaPersona: 'Martín'.
	self should: [algovid nuevaPersona: 'Martín'.] raise: PersonaYaExisteError.
]

{ #category : #tests }
AlgoVidTest >> test03NoSePuedeCrearDosVecesLaMismaBurbuja [
	algovid nuevaBurbuja: 'Algo3'.
	self should: [algovid nuevaBurbuja: 'Algo3'.] raise: BurbujaYaExisteError.
]

{ #category : #tests }
AlgoVidTest >> test04NoSePuedeCrearDosVecesElMismoColegio [
	algovid nuevoColegio: 'UBA'.
	self should: [algovid nuevoColegio: 'UBA'.] raise: ColegioYaExisteError.
]

{ #category : #tests }
AlgoVidTest >> test05SeAgregaUnSintomaAUnaPersonaNoPuedeCircularCovidSospechoso [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
  
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Sospechoso'.
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test06PersonaPorDefectoNegativo [
	algovid nuevaPersona: 'Joaquin'.
  
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Negativo'.
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test07PersonaVacunadaPuedeCircular [
	algovid nuevaPersona: 'Joaquin'.
	algovid estaVacunadx: 'Joaquin'.
  
  self assert: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test08PersonaEscencialPuedeCircular [
	algovid nuevaPersona: 'Joaquin'.
	algovid esPersonalEsencial: 'Joaquin'.
  
  self assert: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test09PersonaDeRiegoNoPuedeCircular [
	algovid nuevaPersona: 'Joaquin'.
	algovid esPersonaDeRiesgo: 'Joaquin'.

  
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test10PersonaDeRiegoYEsencialNoPuedeCircular [
	algovid nuevaPersona: 'Joaquin'.
	algovid esPersonalEsencial: 'Joaquin'.
	algovid esPersonaDeRiesgo: 'Joaquin'.
  
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test11PersonaDeRiegoVacunadaYEsencialNoPuedeCircular [
	algovid nuevaPersona: 'Joaquin'.
	algovid esPersonalEsencial: 'Joaquin'.
	algovid esPersonaDeRiesgo: 'Joaquin'.
	algovid estaVacunadx: 'Joaquin'.
  
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test12SPersonaCon4SintomasPositivo [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
	algovid agregarSintoma: 'Fiebre' a: 'Joaquin'.
	algovid agregarSintoma: 'Dolor' a: 'Joaquin'.
	algovid agregarSintoma: 'Vomito' a: 'Joaquin'.
  
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Positivo'.
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTest >> test13BurbujaPorDefectoNoPinchada [
	algovid nuevaBurbuja: 'Algo'.
	self deny: (algovid burbujaPinchada: 'Algo')
]

{ #category : #tests }
AlgoVidTest >> test14BurbujaConUnaPersonaNegativaNoPinchada [
	algovid nuevaPersona: 'Joaquin'.
	algovid nuevaBurbuja: 'Algo'.
	algovid  agregarA: 'Joaquin' aLaBurbuja: 'Algo' .
	
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Negativo'.
	self deny: (algovid burbujaPinchada: 'Algo')
]

{ #category : #tests }
AlgoVidTest >> test15BurbujaConUnaPersonaSospechosaNoPinchada [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
	
	algovid nuevaBurbuja: 'Algo'.
	algovid  agregarA: 'Joaquin' aLaBurbuja: 'Algo' .
	
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Sospechoso'.
	self deny: (algovid burbujaPinchada: 'Algo')
]

{ #category : #tests }
AlgoVidTest >> test16BurbujaConUnaPersonaPositivaPinchada [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
	algovid agregarSintoma: 'Fiebre' a: 'Joaquin'.
	algovid agregarSintoma: 'Dolor' a: 'Joaquin'.
	
	algovid nuevaBurbuja: 'Algo'.
	algovid  agregarA: 'Joaquin' aLaBurbuja: 'Algo' .
	
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Positivo'.
	self assert: (algovid burbujaPinchada: 'Algo')
]

{ #category : #tests }
AlgoVidTest >> test17BurbujaConUnaPersonaSospechosaNoPinchadaDejaCircularAlRestoDeLaBurbuja [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
	
	algovid nuevaPersona: 'Leo'.
	algovid estaVacunadx: 'Leo'.
	
	algovid nuevaBurbuja: 'Algo'.
	algovid  agregarA: 'Joaquin' aLaBurbuja: 'Algo' .
	algovid  agregarA: 'Leo' aLaBurbuja: 'Algo' .
	
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Sospechoso'.
	self deny: (algovid burbujaPinchada: 'Algo').
	self assert: (algovid puedeCircular: 'Leo').
]

{ #category : #tests }
AlgoVidTest >> test18BurbujaConUnaPersonaPositivaPinchadaNoDejaCircularAlRestoDeLaBurbuja [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
	algovid agregarSintoma: 'Fiebre' a: 'Joaquin'.
	algovid agregarSintoma: 'Dolor' a: 'Joaquin'.
	
	algovid nuevaPersona: 'Leo'.
	algovid estaVacunadx: 'Leo'.
	
	algovid nuevaBurbuja: 'Algo'.
	algovid  agregarA: 'Joaquin' aLaBurbuja: 'Algo' .
	algovid  agregarA: 'Leo' aLaBurbuja: 'Algo' .
	
	self assert: (algovid diagnosticoDe: 'Joaquin' ) equals: 'Positivo'.
	self assert: (algovid burbujaPinchada: 'Algo').
	self deny: (algovid puedeCircular: 'Leo').
]

{ #category : #tests }
AlgoVidTest >> test19ColegioConUnaBurbujaSinPincharClasesPresenciales [
	algovid nuevaBurbuja: 'Algo'.
	algovid nuevoColegio: 'UBA'.
	
	algovid agregarA: 'Algo' alColegio: 'UBA' .
	
	self deny: (algovid burbujaPinchada: 'Algo').
	self assert: (algovid clasesPresencialesEn: 'UBA').
]

{ #category : #tests }
AlgoVidTest >> test20ColegioConUnaBurbujaPinchadaNoHayClasesPresenciales [
	algovid nuevaPersona: 'Joaquin'.
	algovid agregarSintoma: 'Tos' a: 'Joaquin'.
	algovid agregarSintoma: 'Fiebre' a: 'Joaquin'.
	algovid agregarSintoma: 'Dolor' a: 'Joaquin'.
	
	algovid nuevaBurbuja: 'Algo'.
	algovid  agregarA: 'Joaquin' aLaBurbuja: 'Algo' .
	
	algovid nuevoColegio: 'UBA'.
	
	algovid agregarA: 'Algo' alColegio: 'UBA' .
	
	self assert: (algovid burbujaPinchada: 'Algo').
	self deny: (algovid clasesPresencialesEn: 'UBA').
]

{ #category : #tests }
AlgoVidTest >> test21ContactoEstrechoEntreDosNegativosVacunadosPuedenCircular [
	algovid nuevaPersona: 'Leo'.
	algovid estaVacunadx: 'Leo'.
	
	algovid nuevaPersona: 'Tin'.
	algovid estaVacunadx: 'Tin'.
	
	algovid contactoEstrechoEntre: 'Leo' y: 'Tin'.
	
	self assert: (algovid puedeCircular: 'Leo' ).
	self assert: (algovid puedeCircular: 'Tin' ).
]

{ #category : #tests }
AlgoVidTest >> test21ContactoEstrechoEntreUnSospechosoYNegativosVacunadoNoPuedenCircular [
	algovid nuevaPersona: 'Leo'.
	algovid agregarSintoma: 'Tos' a: 'Leo'.
	
	algovid nuevaPersona: 'Tin'.
	algovid estaVacunadx: 'Tin'.
	
	algovid contactoEstrechoEntre: 'Leo' y: 'Tin'.
	
	self assert: (algovid diagnosticoDe: 'Leo' ) equals: 'Sospechoso'.
	self deny: (algovid puedeCircular: 'Leo' ).
	self deny: (algovid puedeCircular: 'Tin' ).
]

{ #category : #tests }
AlgoVidTest >> test22ContactoEstrechoEntreUnPositivoYNegativosVacunadoNoPuedenCircular [
	algovid nuevaPersona: 'Leo'.
	algovid agregarSintoma: 'Tos' a: 'Leo'.
	algovid agregarSintoma: 'Fiebre' a: 'Leo'.
	algovid agregarSintoma: 'Dolor' a: 'Leo'.
	
	algovid nuevaPersona: 'Tin'.
	algovid estaVacunadx: 'Tin'.
	
	algovid contactoEstrechoEntre: 'Leo' y: 'Tin'.
	
	self assert: (algovid diagnosticoDe: 'Leo' ) equals: 'Positivo'.
	self deny: (algovid puedeCircular: 'Leo' ).
	self deny: (algovid puedeCircular: 'Tin' ).
]

{ #category : #tests }
AlgoVidTest >> test23BuscarPersonaInexistenteDaError [
	self should: [ algovid puedeCircular: 'Leo' ] raise: PersonaNoExisteError .
]

{ #category : #tests }
AlgoVidTest >> test24BuscarBurbujaInexistenteDaError [
	self should: [ algovid burbujaPinchada: 'Al' ] raise: BurbujaNoExisteError .
]

{ #category : #tests }
AlgoVidTest >> test25BuscarColegioInexistenteDaError [
	self should: [ algovid clasesPresencialesEn: 'UBA' ] raise: ColegioNoExisteError .
]
