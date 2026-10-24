# Sesión 05 · Creación de una Skill propia
**Fecha en vivo:** 12/11/2026 · **Video de repaso:** ~30 min · **Capturas:** `paso-01` a `paso-04` en `capturas/sesion-05/`

**Objetivo:** que cada docente identifique una tarea repetitiva, escriba las instrucciones de una Skill propia, la cargue en Claude y la pruebe.
**Evidencia:** versión inicial de la Skill con sus instrucciones redactadas y una prueba documentada.

**Antes de grabar:**
- Elige un ejemplo sencillo y cercano. En este guion usamos **"generador de rúbricas"**.
- Prueba la carga de una Skill propia en tu cuenta y anota el camino exacto del menú y el formato que acepta (una carpeta con un archivo `SKILL.md`, comprimida en `.zip`). Ajusta la diapositiva 6 a lo que veas.

---

### Diapositiva 1 · 00:00–01:30 · Repaso y objetivo
- **En pantalla:** "Sesión 5 · tu propia Skill".
- **Dices:** "En la sesión 3 usamos una Skill ya hecha. Hoy creamos una para una tarea que ustedes repiten una y otra vez."

### Diapositiva 2 · 01:30–05:00 · Identificar una tarea repetitiva
- **En pantalla:** preguntas guía:
  1. ¿Qué hago al menos una vez al mes y siempre de forma parecida?
  2. ¿Cuánto tiempo me toma?
  3. ¿Se puede describir en pasos?
- **Dices:** "Buenos candidatos: rúbricas, guías de estudio, ejercicios de repaso, comentarios de retroalimentación, planificación de clases."

### Diapositiva 3 · 05:00–10:00 · La ficha: Entrada → Pasos → Salida
- **En pantalla (ejemplo):**
  | | Generador de rúbricas |
  |---|---|
  | **Entrada** | Nombre del trabajo, materia, nivel, 4 criterios, puntaje total |
  | **Pasos** | 1) Define 4 niveles de logro. 2) Escribe descriptores observables. 3) Reparte puntos. |
  | **Salida** | Tabla con criterios y niveles, lista para pegar en Moodle |
- **Dices:** "Si no puedo llenar esta ficha, la tarea todavía no está lista para ser una Skill."
- **Captura:** `paso-01` · ficha completada.

### Diapositiva 4 · 10:00–17:00 · Redactar el archivo SKILL.md
- **En pantalla (demo):** abrir el Bloc de notas o VS Code, crear la carpeta `generador-rubricas` y dentro el archivo `SKILL.md`:
  ```markdown
  ---
  name: generador-rubricas
  description: Genera rúbricas analíticas para trabajos universitarios. Úsala cuando el docente pida una rúbrica, criterios de evaluación o una escala de calificación.
  ---

  # Generador de rúbricas

  ## Datos que debo pedir si faltan
  - Nombre del trabajo, materia y nivel (semestre)
  - Criterios a evaluar (si no los da, propongo 4)
  - Puntaje total

  ## Pasos
  1. Defino 4 niveles de logro: Excelente, Bueno, Regular, Insuficiente.
  2. Para cada criterio escribo descriptores observables y medibles.
  3. Reparto el puntaje total de forma proporcional.

  ## Formato de salida
  - Una tabla: filas = criterios, columnas = niveles de logro con su puntaje.
  - Debajo, una línea con el puntaje total y un comentario de uso.
  - Español claro, sin adjetivos vagos como "bueno" sin explicar.
  ```
- **Dices:** "El nombre y la descripción son lo más importante: así Claude decide cuándo usar la Skill. Las instrucciones deben ser concretas, como si se las dieran a un ayudante nuevo."
- **Captura:** `paso-02` · el archivo `SKILL.md` redactado.

### Diapositiva 5 · 17:00–21:00 · Empaquetar la Skill
- **En pantalla (demo):** clic derecho sobre la carpeta `generador-rubricas` → **Comprimir en archivo ZIP** (o **Enviar a → Carpeta comprimida**).
- **Dices:** "La carpeta debe contener el archivo `SKILL.md`. La comprimo en un `.zip` con el mismo nombre de la Skill."

### Diapositiva 6 · 21:00–25:00 · Cargar la Skill en Claude
- **En pantalla (demo):** configuración → capacidades → Skills → cargar el `.zip` → activar.
- **Dices:** "La cargo, la activo y ya está disponible en mis conversaciones."
- **Captura:** `paso-03` · Skill cargada y activada.
- **Verifica antes de grabar:** que el nombre del menú y el formato aceptado sean los de tu versión.

### Diapositiva 7 · 25:00–28:00 · Probar y ajustar
- **En pantalla (demo):** `Usa la skill generador-rubricas. Trabajo: informe de laboratorio de Física II, 2.º semestre, 20 puntos, criterios: procedimiento, resultados, análisis, redacción.` Mostrar la rúbrica.
- **Dices:** "Reviso: ¿los descriptores son medibles? ¿Suman 20 puntos? Si no, edito el `SKILL.md`, la cargo de nuevo y repito."
- **Captura:** `paso-04` · rúbrica generada.

### Diapositiva 8 · 28:00–30:00 · Actividad y cierre
- **En pantalla:** "Evidencia: Skill con instrucciones + 1 prueba documentada". Anuncio de la Sesión 6 (14/11): "Buenas prácticas e integración con Moodle".
- **Dices:** "Su tarea: redactar el `SKILL.md` de su propia tarea repetitiva, cargarlo y probarlo. Anoten qué mejorarían."

---

## Checklist de capturas
| Archivo | Qué muestra |
|---|---|
| `paso-01` | Ficha Entrada → Pasos → Salida |
| `paso-02` | `SKILL.md` redactado |
| `paso-03` | Skill cargada y activa |
| `paso-04` | Resultado de la prueba |

## Capítulos para YouTube
```
00:00 Repaso y objetivo
01:30 Identificar una tarea repetitiva
05:00 La ficha Entrada → Pasos → Salida
10:00 Redactar el SKILL.md
17:00 Empaquetar la Skill
21:00 Cargar la Skill en Claude
25:00 Probar y ajustar
28:00 Actividad y cierre
```
