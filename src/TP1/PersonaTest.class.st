Class {
	#name : #PersonaTest,
	#superclass : #TestCase,
	#instVars : [
		'persona'
	],
	#category : #'TP1-Tests'
}

{ #category : #running }
PersonaTest >> setUp [ 
	persona := Persona new.
]

{ #category : #tests }
PersonaTest >> test01PersonaPorDefectoNegativoCovid [
	self assert: persona diagnostico equals: 'Negativo'
]

{ #category : #tests }
PersonaTest >> test02PersonaPorDefectoNoPuedeCircular [
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test03PersonaVacunadaPuedeCircular [
	persona vacunar.
	self assert: persona  puedeCircular.
]

{ #category : #'as yet unclassified' }
PersonaTest >> test04PersonaConUnSitomaHabitualEsSospechoso [
	persona agregarSintoma: 'Tos'.
	self assert: persona diagnostico equals: 'Sospechoso'.
]

{ #category : #tests }
PersonaTest >> test05PersonaConUnSitomNoHabitualEsSospechoso [
	persona agregarSintoma: 'Dolor'.
	self assert: persona diagnostico equals: 'Sospechoso'.
]

{ #category : #tests }
PersonaTest >> test06PersonaConTresSintomasNoHabitualesEsSospechoso [
	persona agregarSintoma: 'Dolor'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	self assert: persona diagnostico equals: 'Sospechoso'
]

{ #category : #tests }
PersonaTest >> test07PersonaConDosSintomasNoHabitualesYUnoHabitualEsPositivoCovid [
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	self assert: persona diagnostico equals: 'Positivo'
]

{ #category : #tests }
PersonaTest >> test08PersonaSospechosoDeCovidNoPuedeCircular [
	persona agregarSintoma: 'Dolor'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test09PersonaConCovidNoPuedeCircular [
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test10PersonaEsencialPuedeCircular [
	persona esPersonalEsencial.
	self assert: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test11PersonaVacunadaYEscencialPuedeCircular [
	persona vacunar.
	persona esPersonalEsencial.
	
	self assert: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test12PersonaVacunadaYDeRiesgoNoPuedeCircular [
	persona vacunar.
	persona esPersonaDeRiesgo.
	
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test13PersonaEscencialYDeRiesgoNoPuedeCircular [
	persona esPersonalEsencial.
	persona esPersonaDeRiesgo.
	
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test14PersonaVacunadaEsencialYDeRiesgoNoPuedeCircular [
	persona vacunar.
	persona esPersonalEsencial.
	persona esPersonaDeRiesgo.
	
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test15NoSePuedeAgregarDosVecesElMismoSintoma [
	persona agregarSintoma: 'Tos'.
	self should: [ persona agregarSintoma: 'Tos' ] raise: PersonaYaTieneEseSintomaError.
]

{ #category : #tests }
PersonaTest >> test16PersonaCon6SintomasDaPositivo [
	persona agregarSintoma: 'Dolor'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Fiebre'.
	persona agregarSintoma: 'Vomito'.
	self assert: persona diagnostico equals: 'Positivo'
]

{ #category : #tests }
PersonaTest >> test17PersonaConCovidYVacunadaNoPuedeCircular [
	persona vacunar.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test18PersonaConCovidYEsencialNoPuedeCircular [
	persona esPersonalEsencial.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test19PersonaConCovidVacunadaYEsencialNoPuedeCircular [
	persona vacunar.
	persona esPersonalEsencial.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test20PersonaSospechosaYVacunadaNoPuedeCircular [
	persona vacunar.
	persona agregarSintoma: 'Tos'.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test21PersonaSospechosaYEsencialNoPuedeCircular [
	persona esPersonalEsencial.
	persona agregarSintoma: 'Tos'.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test22PersonaSospechosaEsencialYVacunadaNoPuedeCircular [
	persona vacunar.
	persona esPersonalEsencial.
	persona agregarSintoma: 'Tos'.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test23PersonaConCovidPinchaSuBurbujaNoPuedeCircular [
	| burbuja |
	
	burbuja := Burbuja new.
	
	persona asignarBurbuja: burbuja.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self assert: burbuja burbujaPinchada.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test24PersonaConCovidYVacundadaPinchaSuBurbujaNoPuedeCircular [
	| burbuja |
	
	burbuja := Burbuja new.
	
	persona asignarBurbuja: burbuja.
	persona agregarSintoma: 'Tos'.
	persona agregarSintoma: 'Escalofrios'.
	persona agregarSintoma: 'Nausea'.
	persona vacunar.
	
	self assert: persona diagnostico equals: 'Positivo'.
	self assert: burbuja burbujaPinchada.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test25PersonaSospechosaNoPinchaSuBurbujaNoPuedeCircular [
	| burbuja |
	
	burbuja := Burbuja new.
	
	persona asignarBurbuja: burbuja.
	persona agregarSintoma: 'Tos'.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: burbuja burbujaPinchada.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test26PersonaSospechosaYVacunadaNoPinchaSuBurbujaNoPuedeCircular [
	| burbuja |
	
	burbuja := Burbuja new.
	
	persona asignarBurbuja: burbuja.
	persona agregarSintoma: 'Tos'.
	persona vacunar.
	
	self assert: persona diagnostico equals: 'Sospechoso'.
	self deny: burbuja burbujaPinchada.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test27PersonaCovidNegativoYVacunadaNoPinchaSuBurbujaPuedeCircular [
	| burbuja |
	
	burbuja := Burbuja new.
	
	persona asignarBurbuja: burbuja.
	persona vacunar.
	
	self assert: persona diagnostico equals: 'Negativo'.
	self deny: burbuja burbujaPinchada.
	self assert: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test28PersonaCovidNegativoNoPinchaSuBurbujaNoPuedeCircular [
	| burbuja |
	
	burbuja := Burbuja new.
	
	persona asignarBurbuja: burbuja.
	
	self assert: persona diagnostico equals: 'Negativo'.
	self deny: burbuja burbujaPinchada.
	self deny: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test29PersonaVacunadaEnBurbujaPinchadCambiaABurbujaNoPinchadaPuedeCircular [
	| burbuja1 burbuja2|
	
	burbuja1 := Burbuja new.
	burbuja2 := Burbuja new.
	
	persona vacunar.
	persona asignarBurbuja: burbuja1.
	burbuja1 pincharBurbuja.
	persona asignarBurbuja: burbuja2.
	
	self assert: burbuja1 burbujaPinchada.
	self deny: burbuja2 burbujaPinchada.
	self assert: persona puedeCircular.
]

{ #category : #tests }
PersonaTest >> test30PersonaEsencialEnBurbujaPinchadCambiaABurbujaNoPinchadaPuedeCircular [
	| burbuja1 burbuja2|
	
	burbuja1 := Burbuja new.
	burbuja2 := Burbuja new.
	
	persona esPersonalEsencial.
	persona asignarBurbuja: burbuja1.
	burbuja1 pincharBurbuja.
	persona asignarBurbuja: burbuja2.
	
	self assert: burbuja1 burbujaPinchada.
	self deny: burbuja2 burbujaPinchada.
	self assert: persona puedeCircular.
]
