Class {
	#name : #DatosCirculacionTest,
	#superclass : #TestCase,
	#instVars : [
		'datosCirculacion'
	],
	#category : #'TP1-Tests'
}

{ #category : #running }
DatosCirculacionTest >> setUp [ 
	datosCirculacion := DatosCirculacion new.
]

{ #category : #tests }
DatosCirculacionTest >> test01PorDefectoNoPuedeCircular [
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test02AlguienVacunadoPuedeCircular [
	datosCirculacion vacunar.
	self assert: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test03AlguienEsencialPuedeCircular [
	datosCirculacion esPersonalEsencial.
	self assert: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test04AlguienDeRiesgoNoPuedeCircular [.
	datosCirculacion esPersonaDeRiesgo.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test05AlguienVacunadoYEsencialPuedeCircular [
	datosCirculacion vacunar.
	datosCirculacion esPersonalEsencial.
	self assert: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test06ContactoEstrechoConNegativoYEsencialPuedeCircular [
	| persona |
	
	persona := Persona new.
	
	datosCirculacion esPersonalEsencial.
	datosCirculacion contactoEstrechoCon: persona.
	
	self assert: persona diagnostico equals: 'Negativo'.
	self assert: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test07ContactoEstrechoConSospechosoYEsencialNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	persona agregarSintoma: 'Tos'.
		
	datosCirculacion esPersonalEsencial.
	datosCirculacion contactoEstrechoCon: persona.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test08ContactoEstrechoConSospechosoYNegativoYEsEsencialNoPuedeCircular [
	| persona1 persona2 |
	
	persona1 := Persona new.
	persona1 agregarSintoma: 'Tos'.
	persona2 := Persona new.
		
	datosCirculacion esPersonalEsencial.
	datosCirculacion contactoEstrechoCon: persona1.
	datosCirculacion contactoEstrechoCon: persona2.
	
	self assert: persona1 diagnostico equals: 'Sospechoso'.
	self assert: persona2 diagnostico equals: 'Negativo'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test09ContactoEstrechoConPositivoYEsencialNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Fiebre'.
	persona agregarSintoma: 'Dolor'.
		
	datosCirculacion esPersonalEsencial.
	datosCirculacion contactoEstrechoCon: persona.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test10ContactoEstrechoConPositivoYNegativoYEsEsencialNoPuedeCircular [
	| persona1 persona2 |
	
	persona1 := Persona new.
	persona1 agregarSintoma: 'Tos'.
	persona1 agregarSintoma: 'Fiebre'.
	persona1 agregarSintoma: 'Dolor'.
	persona2 := Persona new.
		
	datosCirculacion esPersonalEsencial.
	datosCirculacion contactoEstrechoCon: persona1.
	datosCirculacion contactoEstrechoCon: persona2.
	
	self assert: persona1 diagnostico equals: 'Positivo'.
	self assert: persona2 diagnostico equals: 'Negativo'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test11ContactoEstrechoConNegativoNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	datosCirculacion contactoEstrechoCon: persona.
	
	self assert: persona diagnostico equals: 'Negativo'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test12ContactoEstrechoConSospechosoNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	persona agregarSintoma: 'Tos'.
	datosCirculacion contactoEstrechoCon: persona.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test13ContactoEstrechoConPositivoNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Fiebre'.
	persona agregarSintoma: 'Dolor'.

	datosCirculacion contactoEstrechoCon: persona.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test14VacunadoContactoEstrechoConNegativoDespuesSospechosoNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	datosCirculacion vacunar.
	datosCirculacion contactoEstrechoCon: persona.
	persona agregarSintoma: 'Tos'.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: datosCirculacion puedeCircular.
]

{ #category : #tests }
DatosCirculacionTest >> test15VacunadoContactoEstrechoConNegativoDespuesPositivoNoPuedeCircular [
	| persona |
	
	persona := Persona new.
	datosCirculacion vacunar.
	
	datosCirculacion contactoEstrechoCon: persona.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Fiebre'.
	persona agregarSintoma: 'Dolor'.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self deny: datosCirculacion puedeCircular.
]
