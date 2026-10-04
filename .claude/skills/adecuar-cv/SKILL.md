---
name: adecuar-cv
description: Actualiza y adecua el CV de Jimmy Requena (ES y EN, formato ATS) al perfil de una oferta (soporte, docente, gerente de TI, desarrollo, QA/SDET, agentes de IA) y mantiene sincronizados la página bolivianotech.github.io, los PDF y el texto de LinkedIn. Usar cuando pida actualizar, adecuar o enviar su CV, o cuando haya un dato nuevo de su carrera.
---

# Adecuar CV — Jimmy Requena

Raíz del proyecto: `D:\bolivianotech.github.io` (remoto `bolivianotech/bolivianotech.github.io`, rama `main`).

## Arquitectura (una sola fuente de verdad)

| Archivo | Función |
|---|---|
| `cv/data/master.json` | TODOS los hechos de su carrera, bilingües (es/en), con `tags` por viñeta. Es la única fuente. |
| `cv/profiles/profiles.json` | Perfiles: titular, resumen, orden de experiencias, viñetas por empleo y etiquetas prioritarias. Solo eligen y ordenan; nunca agregan hechos. |
| `cv/build_cv.py` | Genera DOCX + PDF ATS (una columna, sin tablas ni cuadros de texto) en `cv/output/<perfil>/`. |
| `cv/CV_Jimmy_Requena_ES.pdf` / `_EN.pdf` | CVs `general` publicados en la página (los enlaza `index.html`). |
| `index.html` | Página pública. Debe decir lo mismo que el maestro. |
| `cv/linkedin.md` | Texto listo para pegar en LinkedIn (titular, Acerca de, experiencia). |

Perfiles existentes: `general`, `ia-agentes`, `docente`, `gerente-it`, `desarrollo`, `soporte`, `qa-sdet`.

## Flujo cada vez que se invoca

1. **Leer** `cv/data/master.json` y `cv/profiles/profiles.json`.
2. **Dato nuevo** (empleo, curso, herramienta, certificación, métrica): agregarlo al maestro en ES y EN, con `tags`. Si falta un dato (fecha, empresa, cifra), **preguntar; nunca inventar**.
3. **Oferta concreta**: leer la descripción del puesto, elegir el perfil más cercano o crear uno nuevo en `profiles.json` (titular, resumen con hechos del maestro, `priority_tags`, `experience_order`, `max_bullets`, `skill_order`). Usar en el CV las palabras clave exactas de la oferta solo si son verdad según el maestro.
4. **Generar**: `python cv/build_cv.py <perfil> [es|en]` (sin argumentos genera todos). Revisar el PDF (largo ≤ 3 páginas, sin cortes raros).
5. **Sincronizar** siempre que cambie el maestro:
   - `index.html` (perfil, trayectoria, formación, proyectos, chips),
   - PDFs `general` (se copian solos al correr `build_cv.py general`),
   - `cv/linkedin.md`.
6. **Publicar**: mostrar `git status` y el resumen de cambios, y hacer commit + `git push` a `main` solo con el visto bueno de Jimmy en esa invocación. GitHub Pages se actualiza en 1–2 minutos.
7. **LinkedIn** (https://www.linkedin.com/in/jimrequena): no se puede editar sin su sesión; entregar el texto de `cv/linkedin.md` actualizado y listar qué secciones cambiaron. Si pide automatizarlo, usar el skill `/browse` de gstack (nunca `mcp__claude-in-chrome__*`).

## Reglas de contenido

- **Resaltar siempre**: expositor de agentes de IA para monitoreo de IaC en sistemas altamente escalables; sabe crear agentes de IA; docencia (lista de materias dictadas y las actuales: Diseño Web I, Tecnologías Web I y II); interés en desarrollo de software asistido por IA; herramientas de IA para docentes y administrativos en la UPDS; co-creación del Diplomado de IA Administrativa (en fase inicial: módulos definidos, implementación pendiente; decirlo así); experiencia en desarrollo, administración Oracle y PL/SQL; Scrum Master y PO.
- **Cifras confirmadas**: 25+ años de experiencia, 15+ años de docencia (desde 1995), 4 países, 60% menos tiempo de prototipo a producción, 40% menos latencia p95.
- **Maestría**: «Ingeniería Matemática e Informática, mención en Sistemas Flexibles Inteligentes» (UCB). Se puede abreviar a «Sistemas Flexibles Inteligentes» solo en titulares cortos.
- **ATS**: una columna, títulos estándar (Perfil, Experiencia, Educación…), texto real (no imágenes), sin tablas, iconos ni foto en el CV, fechas `MM/AAAA – MM/AAAA`, palabras clave de la oferta en resumen y competencias.
- **Referencias**: no publicar datos de terceros; el CV dice «Disponibles a solicitud».
- **QA/SDET**: el maestro no declara Selenium, Playwright, Cypress ni CI de pruebas. Si la oferta los pide, preguntar a Jimmy si los tiene antes de agregarlos; si no, el perfil se apoya en Test Lead (Huawei/TIGO), Python/JS/Java, agilidad y auditorías WCAG.
- **Soporte / gerente / docente / desarrollo**: mismo maestro, distinto orden y énfasis; ver `profiles.json`.

## Datos por confirmar (pendientes conocidos)

Preguntar a Jimmy y corregir el maestro cuando los traiga:

1. Fechas exactas de Banco Mercantil Santa Cruz, Intersoft y ASOBAN (hoy agrupadas como «2000 – 2012» con Fortaleza, RUAT y Zurich).
2. Fechas de Digital Harbor (hoy sin fechas en el CV).
3. Año de la Licenciatura en la UCB (hoy sin año; la docencia empezó en 1995 durante el pregrado).
4. Cliente del Contact Center de Oktana: hoy «AT&T, cliente de Google». El CV anterior mencionaba Sony y Google.
5. Materias de Inteligencia de Negocios y Auditoría de Sistemas en la UPDS (aparecían en el CV anterior; no están en la lista actual).
