Class {
	#name : #AlgoVidTestCatedra,
	#superclass : #TestCase,
	#instVars : [
		'algovid'
	],
	#category : #'TP1-Tp1-TestCatedra'
}

{ #category : #running }
AlgoVidTestCatedra >> setUp [
	algovid := AlgoVid new. "Aislamiento estricto por defecto"
]

{ #category : #tests }
AlgoVidTestCatedra >> test01PorDefectoNoPuedeSalir [
  algovid nuevaPersona: 'Joaquin'.
  
  self deny: (algovid puedeCircular: 'Joaquin').
]

{ #category : #tests }
AlgoVidTestCatedra >> test02SiEstaVacunadxPuedeCircular [
  algovid nuevaPersona: 'Martín'.
 
  algovid estaVacunadx: 'Martín'.

  self assert: (algovid puedeCircular: 'Martín').

]

{ #category : #tests }
AlgoVidTestCatedra >> test03SiEsSospechosxDeCovidConDosSintomasOMenosNoPuedeCircular [
  algovid nuevaPersona: 'Nico'.
  algovid estaVacunadx: 'Nico'.
  "Uno o dos síntomas lo hace sospechoso"
 
  algovid agregarSintoma: 'Fiebre' a: 'Nico'.
	
  self assert: (algovid diagnosticoDe: 'Nico') equals: 'Sospechoso'. 
  self deny: (algovid puedeCircular: 'Nico').

  algovid agregarSintoma: 'Tos' a: 'Nico'.

  self assert: (algovid diagnosticoDe: 'Nico') equals: 'Sospechoso'. 
  self deny: (algovid puedeCircular: 'Nico').

]

{ #category : #tests }
AlgoVidTestCatedra >> test04SiEsSospechosxDeCovidConTresSintomasNoPuedeCircular [
  algovid nuevaPersona: 'Tomás'.
  algovid estaVacunadx: 'Tomás'.
  "Tres síntomas, pero ningno habitual (fiebre, tos o cansancio) lo hace sospechoso"
 
  algovid agregarSintoma: 'Dolor de garganta' a: 'Tomás'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Tomás'.
  algovid agregarSintoma: 'Diarrea' a: 'Tomás'.
	
  self assert: (algovid diagnosticoDe: 'Tomás') equals: 'Sospechoso'. 
  self deny: (algovid puedeCircular: 'Tomás').

]

{ #category : #tests }
AlgoVidTestCatedra >> test05SiEsConfirmadoDeCovidConTresSintomasNoPuedeCircular [
  algovid nuevaPersona: 'Cami'.
  algovid estaVacunadx: 'Cami'.
  "Tres síntomas, pero uno habitual (fiebre, tos o cansancio) lo hace confirmado"
 
  algovid agregarSintoma: 'Fiebre' a: 'Cami'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Cami'.
  algovid agregarSintoma: 'Diarrea' a: 'Cami'.
	
  self assert: (algovid diagnosticoDe: 'Cami') equals: 'Positivo'. 
  self deny: (algovid puedeCircular: 'Cami').

]

{ #category : #tests }
AlgoVidTestCatedra >> test06SiEsConfirmadoDeCovidCon4SintomasNoPuedeCircular [
  algovid nuevaPersona: 'Carlos'.
  algovid estaVacunadx: 'Carlos'.
  "Cuatro síntomas o más lo hace confirmado"
 
  algovid agregarSintoma: 'Dolor de garganta' a: 'Carlos'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Carlos'.
  algovid agregarSintoma: 'Diarrea' a: 'Carlos'.
  algovid agregarSintoma: 'Pérdida del gusto' a: 'Carlos'.
	
  self assert: (algovid diagnosticoDe: 'Carlos') equals: 'Positivo'. 
  self deny: (algovid puedeCircular: 'Carlos').

]

{ #category : #tests }
AlgoVidTestCatedra >> test07SiEsPersonalEsencialPuedeCircular [
  algovid nuevaPersona: 'Eugenio'.
 
  algovid esPersonalEsencial: 'Eugenio'.

  self assert: (algovid puedeCircular: 'Eugenio').

]

{ #category : #tests }
AlgoVidTestCatedra >> test08SiEsPersonalEsencialPeroTieneContactoEstrechoConUnCasoSospechosoNoPuedeCircular [
  algovid nuevaPersona: 'Diego'.
 
  "Un síntoma lo hace sospechoso"
  algovid agregarSintoma: 'Dolor de garganta' a: 'Diego'.

  self assert: (algovid diagnosticoDe: 'Diego') equals: 'Sospechoso'. 

  algovid nuevaPersona: 'Edson'.
  algovid esPersonalEsencial: 'Edson'.

  algovid contactoEstrechoEntre: 'Edson' y: 'Diego'.
 
  self deny: (algovid puedeCircular: 'Edson').

]

{ #category : #tests }
AlgoVidTestCatedra >> test09SiEsPersonalEsencialPeroTieneContactoEstrechoConUnCasoPositivoNoPuedeCircular [
  algovid nuevaPersona: 'Diego'.
  "Cuatro síntomas lo hace confirmado"
 
  algovid esPersonalEsencial: 'Diego'.
  algovid agregarSintoma: 'Dolor de garganta' a: 'Diego'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Diego'.
  algovid agregarSintoma: 'Diarrea' a: 'Diego'.
  algovid agregarSintoma: 'Pérdida del gusto' a: 'Diego'.

  self assert: (algovid diagnosticoDe: 'Diego') equals: 'Positivo'. 

  algovid nuevaPersona: 'Edson'.

  algovid contactoEstrechoEntre: 'Edson' y: 'Diego'.
 
  self deny: (algovid puedeCircular: 'Edson').

]

{ #category : #tests }
AlgoVidTestCatedra >> test10SiEsPersonaDeRiesgoNoPuedeCircular [
  algovid nuevaPersona: 'Magui'.
  algovid estaVacunadx: 'Magui'.

  algovid esPersonaDeRiesgo: 'Magui'.

  self deny: (algovid puedeCircular: 'Magui').

]

{ #category : #tests }
AlgoVidTestCatedra >> test11SiEsPersonalEsencialYPersonaDeRiesgoNoPuedeCircular [
  algovid nuevaPersona: 'Mariano'.
 
  algovid esPersonaDeRiesgo: 'Mariano'.
  algovid esPersonalEsencial: 'Mariano'.

  self deny: (algovid puedeCircular: 'Mariano').

]

{ #category : #tests }
AlgoVidTestCatedra >> test12SiEstaVacunadxYEsSospechosoNoPuedeCircular [
  algovid nuevaPersona: 'Martín'.
 
  algovid estaVacunadx: 'Martín'.
  algovid agregarSintoma: 'Fiebre' a: 'Martín'.

  self deny: (algovid puedeCircular: 'Martín').

]

{ #category : #tests }
AlgoVidTestCatedra >> test13SiAlguienEnLaBurbujaEsUnCasoConfirmadoEntoncesLaBurbujaEstaPinchada [
  algovid nuevaPersona: 'Thiago'.
  algovid nuevaPersona: 'Pablo'.
  algovid nuevaPersona: 'Santi'.
 
  algovid nuevaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Thiago' aLaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Pablo' aLaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Santi' aLaBurbuja: 'Ayudantes Algo3'.

  algovid estaVacunadx: 'Thiago'.
  algovid estaVacunadx: 'Pablo'.
  algovid estaVacunadx: 'Santi'.

  algovid agregarSintoma: 'Fiebre' a: 'Pablo'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Pablo'.
  algovid agregarSintoma: 'Diarrea' a: 'Pablo'.

  self assert: (algovid diagnosticoDe: 'Pablo') equals: 'Positivo'. 

  self assert: (algovid burbujaPinchada: 'Ayudantes Algo3'). 

  self deny: (algovid puedeCircular: 'Thiago').
  self deny: (algovid puedeCircular: 'Santi').

]

{ #category : #tests }
AlgoVidTestCatedra >> test14SiAlguienEnLaBurbujaEsUnCasoSospechosoEntoncesLaBurbujaNoEstaPinchada [
  algovid nuevaPersona: 'Thiago'.
  algovid nuevaPersona: 'Pablo'.
  algovid nuevaPersona: 'Santi'.
 
  algovid nuevaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Thiago' aLaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Pablo' aLaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Santi' aLaBurbuja: 'Ayudantes Algo3'.

  algovid estaVacunadx: 'Thiago'.
  algovid estaVacunadx: 'Pablo'.
  algovid estaVacunadx: 'Santi'.

  algovid agregarSintoma: 'Fiebre' a: 'Pablo'.

  self assert: (algovid diagnosticoDe: 'Pablo') equals: 'Sospechoso'. 

  self deny: (algovid burbujaPinchada: 'Ayudantes Algo3'). 

  self assert: (algovid puedeCircular: 'Thiago').
  self assert: (algovid puedeCircular: 'Santi').

]

{ #category : #tests }
AlgoVidTestCatedra >> test15SiMenosDel40PorcientoDeLasBurbujasEstanPinchadasEntoncesLasClasesSonPresenciales [
  algovid nuevaPersona: 'Thiago'.
  algovid nuevaPersona: 'Pablo'.
 
  algovid nuevaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Thiago' aLaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Pablo' aLaBurbuja: 'Ayudantes Algo3'.

  algovid nuevaPersona: 'Martín'.
  algovid nuevaPersona: 'Cami'.

  algovid nuevaBurbuja: 'Ayudantes Algo2'.
  algovid agregarA: 'Martín' aLaBurbuja: 'Ayudantes Algo2'.
  algovid agregarA: 'Cami' aLaBurbuja: 'Ayudantes Algo2'.

  algovid nuevaPersona: 'Diego'.
  algovid nuevaPersona: 'Valen'.

  algovid nuevaBurbuja: 'Ayudantes Algo1'.
  algovid agregarA: 'Diego' aLaBurbuja: 'Ayudantes Algo1'.
  algovid agregarA: 'Valen' aLaBurbuja: 'Ayudantes Algo1'.

  algovid nuevoColegio: 'UBA'.
  algovid agregarA: 'Ayudantes Algo1' alColegio: 'UBA'.
  algovid agregarA: 'Ayudantes Algo2' alColegio: 'UBA'.
  algovid agregarA: 'Ayudantes Algo3' alColegio: 'UBA'.

  algovid agregarSintoma: 'Fiebre' a: 'Diego'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Diego'.
  algovid agregarSintoma: 'Tos' a: 'Diego'.

  self assert: (algovid diagnosticoDe: 'Diego') equals: 'Positivo'. 
  self assert: (algovid burbujaPinchada: 'Ayudantes Algo1'). 
  self assert: (algovid clasesPresencialesEn: 'UBA').

]

{ #category : #tests }
AlgoVidTestCatedra >> test16SiMasDel40PorcientoDeLasBurbujasEstanPinchadasEntoncesLasClasesNoSonPresenciales [
  algovid nuevaPersona: 'Thiago'.
  algovid nuevaPersona: 'Pablo'.
 
  algovid nuevaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Thiago' aLaBurbuja: 'Ayudantes Algo3'.
  algovid agregarA: 'Pablo' aLaBurbuja: 'Ayudantes Algo3'.

  algovid nuevaPersona: 'Martín'.
  algovid nuevaPersona: 'Cami'.

  algovid nuevaBurbuja: 'Ayudantes Algo2'.
  algovid agregarA: 'Martín' aLaBurbuja: 'Ayudantes Algo2'.
  algovid agregarA: 'Cami' aLaBurbuja: 'Ayudantes Algo2'.

  algovid nuevaPersona: 'Diego'.
  algovid nuevaPersona: 'Valen'.

  algovid nuevaBurbuja: 'Ayudantes Algo1'.
  algovid agregarA: 'Diego' aLaBurbuja: 'Ayudantes Algo1'.
  algovid agregarA: 'Valen' aLaBurbuja: 'Ayudantes Algo1'.

  algovid nuevoColegio: 'UBA'.
  algovid agregarA: 'Ayudantes Algo1' alColegio: 'UBA'.
  algovid agregarA: 'Ayudantes Algo2' alColegio: 'UBA'.
  algovid agregarA: 'Ayudantes Algo3' alColegio: 'UBA'.

  algovid agregarSintoma: 'Fiebre' a: 'Diego'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Diego'.
  algovid agregarSintoma: 'Tos' a: 'Diego'.

  algovid agregarSintoma: 'Fiebre' a: 'Cami'.
  algovid agregarSintoma: 'Dolor de cabeza' a: 'Cami'.
  algovid agregarSintoma: 'Tos' a: 'Cami'.

  self assert: (algovid diagnosticoDe: 'Diego') equals: 'Positivo'. 
  self assert: (algovid burbujaPinchada: 'Ayudantes Algo1'). 

  self assert: (algovid diagnosticoDe: 'Cami') equals: 'Positivo'. 
  self assert: (algovid burbujaPinchada: 'Ayudantes Algo2'). 

  self deny: (algovid clasesPresencialesEn: 'UBA').

]
