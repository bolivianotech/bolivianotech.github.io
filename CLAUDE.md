# bolivianotech.github.io — Portafolio y CVs de Jimmy Requena

Este repositorio es la página pública (GitHub Pages) **y** la fuente de sus CVs.

## Regla principal

Cada vez que se pida actualizar el CV, la página o LinkedIn, usar el skill **`adecuar-cv`** (`.claude/skills/adecuar-cv/SKILL.md`). Debe quedar todo sincronizado:

1. `cv/data/master.json` (fuente única de datos, ES/EN)
2. `index.html` (página)
3. `cv/CV_Jimmy_Requena_ES.pdf` y `_EN.pdf` (CVs generales publicados)
4. `cv/linkedin.md` (texto para LinkedIn: https://www.linkedin.com/in/jimrequena)

## Comandos

- Todos los CVs: `python cv/build_cv.py`
- Un perfil: `python cv/build_cv.py docente es`
- Requiere `python-docx` y LibreOffice (para el PDF).

## Convenciones

- Nunca inventar datos, fechas ni cifras: preguntar.
- Documentos para reclutadores: formato ATS (una columna, sin tablas).
- Commit y push a `main` solo con confirmación de Jimmy. La página publica en https://bolivianotech.github.io.
- Navegación web: skill `/browse` de gstack, nunca `mcp__claude-in-chrome__*`.
- `cv/output/` no se versiona (variantes por oferta; contienen datos de contacto).
