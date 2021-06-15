Class {
	#name : #SintomasTest,
	#superclass : #TestCase,
	#instVars : [
		'sintomas'
	],
	#category : #'TP1-Tests'
}

{ #category : #running }
SintomasTest >> setUp [
	sintomas := SinSintomas new.
]

{ #category : #tests }
SintomasTest >> test01SInSintomasDiagnosticoNegativo [
	self assert: sintomas diagnostico equals: 'Negativo'
]

{ #category : #tests }
SintomasTest >> test02Agregar1SintomaHabitualDaSospechoso [
	sintomas := sintomas agregarSintoma: 'Tos'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test03Agregar1SintomaNoHabitualDaSospechoso [
	sintomas := sintomas agregarSintoma: 'Dolor'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test04Agregar1SintomaNoHabitualy1HabitualDaSospechoso [
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Tos'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test05Agregar1HabitualSintomaY1NoHabitualDaSospechoso [
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Tos'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test06Agregar2SintomasNoHabitualesDaSospechoso [
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Vomito'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test07Agregar3SintomasNoHabitualesDaSospechoso [
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Vomito'.
	sintomas := sintomas agregarSintoma: 'Estornudos'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test08Agregar4SintomasNoHabitualesDaPositivo [
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Vomito'.
	sintomas := sintomas agregarSintoma: 'Estornudos'.
	sintomas := sintomas agregarSintoma: 'Sarpullido'.
	self assert: sintomas diagnostico equals: 'Positivo'
]

{ #category : #tests }
SintomasTest >> test09Agregar2SintomasHabitualesDaSospechoso [
 "'FIEBRE' 'TOS' 'CANSANCIO'"
	sintomas := sintomas agregarSintoma: 'Tos'.
	sintomas := sintomas agregarSintoma: 'Fiebre'.
	self assert: sintomas diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
SintomasTest >> test10Agregar3SintomasHabitualesDaPositivo [
 	"'FIEBRE' 'TOS' 'CANSANCIO'"
	sintomas := sintomas agregarSintoma: 'Tos'.
	sintomas := sintomas agregarSintoma: 'Fiebre'.
	sintomas := sintomas agregarSintoma: 'Cansancio'.
	self assert: sintomas diagnostico equals: 'Positivo'
]

{ #category : #tests }
SintomasTest >> test11Agregar1SintomaHabitualY3SintomasHabitualesDaPositivo [
 	"'FIEBRE' 'TOS' 'CANSANCIO'"
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Tos'.
	sintomas := sintomas agregarSintoma: 'Fiebre'.
	sintomas := sintomas agregarSintoma: 'Cansancio'.
	self assert: sintomas diagnostico equals: 'Positivo'
]

{ #category : #tests }
SintomasTest >> test11Agregar3SintomasHabitualesY1HabitualDaPositivo [
 	"'FIEBRE' 'TOS' 'CANSANCIO'"
	sintomas := sintomas agregarSintoma: 'Tos'.
	sintomas := sintomas agregarSintoma: 'Fiebre'.
	sintomas := sintomas agregarSintoma: 'Cansancio'.
	sintomas := sintomas agregarSintoma: 'Dolor'.
	self assert: sintomas diagnostico equals: 'Positivo'
]

{ #category : #tests }
SintomasTest >> test12Agregar2SintomasHabitualesY1SintomaHabitualDaPositivo [
 	"'FIEBRE' 'TOS' 'CANSANCIO'"
	sintomas := sintomas agregarSintoma: 'Dolor'.
	sintomas := sintomas agregarSintoma: 'Mocos'.
	sintomas := sintomas agregarSintoma: 'Fiebre'.
	self assert: sintomas diagnostico equals: 'Positivo'
]

{ #category : #tests }
SintomasTest >> test13NoSePuedeAgregarDosVecesElMismoSintoma [
	sintomas agregarSintoma: 'Tos'.
	self should: [ sintomas  agregarSintoma: 'Tos' ] raise: PersonaYaTieneEseSintomaError.
]
