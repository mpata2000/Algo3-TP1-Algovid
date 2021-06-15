# Algo3-TP1-Algovid


## Objetivo

Este es un trabajo práctico individual que tiene como objetivo aplicar los conceptos del paradigma de la orientación a objetos vistos hasta ahora en el curso mediante la resolución de un problema con Pharo.


## Consigna

Se deberá desarrollar un modelo de clases utilizando la metodología TDD. Las especificaciones son un archivo de pruebas SUnit (.st) adjunto a este enunciado y están dadas en forma de pruebas de integración. Se espera que el alumno genere una solución que permita ejecutar exitosamente las pruebas especificadas y que adicionalmente cuente con pruebas unitarias y de integración que cubran la totalidad del modelo (la cobertura se medirá excluyendo a las pruebas del enunciado).

## Implementacion

Para mas detalles de implementacion leer el [informe](./Informe.pdf)

## Correciones por Diego Pablo Corsi

### Modelo y Código: Bueno

- El modelo está completo y contempla la totalidad del problema, pero hacer una clase para cada combinación posible de cantidades de síntomas no es escalable: agregar nuevas combinaciones generaría una explosión de clases.
- Se respeta el encapsulamiento.
- Se hace un buen uso de excepciones.
- Se utiliza polimorfismo en las situaciones esperadas.
- Se respetan los estándares de codificación.
- El código no está documentado (no hay comentarios en ningún método).

### Pruebas: Bueno

- Hay suficiente cantidad de pruebas (16+98=114). La cobertura (97,98%) es buena.
- Los nombres de las pruebas son adecuados.
- Las pruebas son realmente unitarias.

### Diagramas e informe: Regular

- Los diagramas de clases están bastante completos. En la figura 1, es extraño que AlgoVid y Colegio se conecten a la clase concreta y Persona a la interfaz. ¿Por qué no se conectan todas con la interfaz? (la cual, al fin y al cabo, es implementada por SinBurbuja y por Burbuja).
- La notación en los diagramas de clases está bien utilizada, pero se recomienda usar caracteres en lugar de símbolos en PlantUML: skinparam classAttributeIconSize 0. Algunas asociaciones podrían ser composiciones o agregaciones.
- Los diagramas de secuencia están completos (el título o escenario de la situación quedaría mejor como parte del diagrama).
- La notación en los diagramas de secuencia no está del todo bien utilizada (por ejemplo, los objetos que mandan los mensajes no están correctamente identificados con su nombre [en minúsculas] y clase separados por dos puntos o con su clase precedida de dos puntos).
- No hay completa consistencia entre los diagramas de secuencia y de clases (por ejemplo, se envía en los diagramas de secuencia el mensaje `buscarPersona` que el el diagrama de clases de AlgoVid no figura como método privado). 
- Los supuestos son correctos.
- La presentación del informe es bastante prolija, aunque siempre es conveniente revisar la ortografía (“Burbja”, “sopechosa”) antes de darlo por terminado.

Nota: 6
