# Sesión 03 · Skill de Exámenes
**Fecha en vivo:** 05/11/2026 · **Video de repaso:** ~30 min · **Capturas:** `paso-01` a `paso-04` en `capturas/sesion-03/`

**Objetivo:** que cada docente active la Skill `generador-examenes-upds`, genere un examen interactivo de su materia y lo pruebe localmente.
**Evidencia:** 1 examen interactivo, con sus archivos de salida listos para despliegue.

**Antes de grabar:**
- Verifica que la Skill esté cargada y activa en tu cuenta, y haz una prueba completa.
- Anota **qué archivos entrega** tu Skill (por ejemplo, un `index.html` y sus recursos) y ajusta la diapositiva 6 a eso.
- Ten una lista de 10 temas o reactivos de ejemplo.
- Confirma el nombre exacto del menú de Skills en tu versión (suele estar en la configuración, en la sección de capacidades).

---

### Diapositiva 1 · 00:00–01:30 · Repaso y objetivo
- **En pantalla:** "Sesión 3 · de la conversación al examen".
- **Dices:** "Ya sabemos pedir y tenemos un Proyecto. Hoy pasamos de las ideas a un producto: un examen interactivo que los estudiantes pueden responder en el navegador."

### Diapositiva 2 · 01:30–04:00 · ¿Qué es una Skill?
- **En pantalla:** esquema: **Skill = instrucciones especializadas + recursos** que Claude carga solo cuando la tarea lo requiere.
- **Dices:** "Una Skill es como darle a Claude un manual de procedimiento. Si le pido un examen, aplica el procedimiento de la Skill: formato, estilo, estructura de archivos. Siempre sale parecido y bien hecho."

### Diapositiva 3 · 04:00–08:00 · Activar la Skill
- **En pantalla (demo):** configuración → capacidades → Skills; mostrar `generador-examenes-upds` activa.
- **Dices:** "Aquí veo mis Skills. Activo la de exámenes. Si no aparece en su cuenta, avísenme para ayudarles a cargarla."
- **Captura:** `paso-01` · la Skill visible y activada.

### Diapositiva 4 · 08:00–13:00 · Cómo pedir un examen
- **En pantalla:** plantilla de pedido:
  ```
  Usa la skill generador-examenes-upds.
  Materia: [materia] · Carrera: [carrera] · Semestre: [semestre]
  Tema: [tema]
  Cantidad: 10 preguntas de opción múltiple con 4 alternativas
  Nivel: medio (mezcla de recordar, comprender y aplicar)
  Incluir: retroalimentación breve por cada respuesta
  ```
- **Dices:** "Es la misma fórmula de la sesión 1: contexto, tarea y formato. La Skill se encarga del resto."
- **Captura:** `paso-02` · pedido enviado a Claude.

### Diapositiva 5 · 13:00–18:00 · Demostración: generar el examen
- **En pantalla (demo en vivo):** ejecutar el pedido y mostrar cómo Claude genera los archivos.
- **Dices:** "Mientras trabaja, miren cómo arma los archivos. Cuando termina, los descargo."

### Diapositiva 6 · 18:00–23:00 · Revisar los archivos producidos
- **En pantalla:** carpeta con los archivos descargados (ajusta a lo que entregue tu Skill).
- **Dices:** "Reviso que haya un archivo principal llamado index.html y los recursos que lo acompañan. Estos son los archivos que subiremos a GitHub en la próxima sesión."
- **Captura:** `paso-03` · archivos descargados.

### Diapositiva 7 · 23:00–27:00 · Probar el examen y revisar las preguntas
- **En pantalla (demo):** abrir `index.html` en el navegador, responder 2 preguntas, ver la retroalimentación.
- **Dices:** "Siempre pruebo el examen yo mismo antes de compartirlo. Reviso tres cosas: que las respuestas correctas sean realmente correctas, que no haya ambigüedades y que el nivel sea el que quiero. Si algo no me gusta, se lo pido a Claude: 'Cambia la pregunta 4 por una de aplicación'."
- **Captura:** `paso-04` · examen abierto en el navegador.

### Diapositiva 8 · 27:00–30:00 · Actividad y cierre
- **En pantalla:** "Evidencia: 1 examen interactivo + sus archivos". Anuncio de la Sesión 4 (07/11): "GitHub y GitHub Pages".
- **Dices:** "Su tarea: generar y probar un examen de su asignatura. Guarden la carpeta con los archivos: la vamos a publicar en la web."

---

## Checklist de capturas
| Archivo | Qué muestra |
|---|---|
| `paso-01` | Skill activa en la configuración |
| `paso-02` | Pedido de examen enviado |
| `paso-03` | Archivos generados |
| `paso-04` | Examen funcionando en el navegador |

## Capítulos para YouTube
```
00:00 Repaso y objetivo
01:30 Qué es una Skill
04:00 Activar la Skill
08:00 Cómo pedir un examen
13:00 Generar el examen
18:00 Revisar los archivos
23:00 Probar y revisar preguntas
27:00 Actividad y cierre
```
