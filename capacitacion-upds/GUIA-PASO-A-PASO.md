# Guía paso a paso: del guion al curso en línea

Capacitación **Claude AI y GitHub para la Creación y Publicación de Recursos Digitales** · UPDS, Facultad de Ingeniería.

La idea central:

> **GitHub Pages guarda solo la página y capturas livianas. Los videos viven en YouTube (no listado) o en Google Drive y se incrustan en la página.**

| Pieza | Dónde vive | Quién la ve | Peso en GitHub |
|---|---|---|---|
| Página del curso (`index.html`) | GitHub Pages | Cualquiera con el enlace | ~30 KB |
| Capturas paso a paso (WebP) | GitHub Pages (`capturas/`) | Cualquiera con el enlace | ~100 KB c/u |
| **Video de repaso (~30 min)**, con tu cameo | **YouTube "No listado"** | Cualquiera con el enlace | 0 |
| **Grabación completa de la sesión en vivo** | **Google Drive** restringido a la UPDS | Solo docentes | 0 |

Con esto el repositorio queda por debajo de 20 MB y GitHub nunca recibe un video.

---

## Parte 1. Preparar tu computador (una sola vez)

Abre **PowerShell** y ejecuta:

```powershell
# 1. Instalar Git
winget install --id Git.Git -e

# 2. Cerrar y volver a abrir PowerShell, luego identificarte
git config --global user.name  "Tu Nombre y Apellido"
git config --global user.email "tu-correo@ejemplo.com"

# 3. Instalar ImageMagick (para optimizar capturas)
winget install ImageMagick.ImageMagick
```

Instala también **Visual Studio Code** (`winget install Microsoft.VisualStudioCode`) para editar `index.html`.

## Parte 2. Traer el proyecto y mi rama de trabajo

Trabajé en la rama `claude/exciting-allen-f01oyz` de `bolivianotech/bolivianotech.github.io`. Esa rama no toca `main`, así que **nada se publica hasta que la fusiones**.

```powershell
cd $HOME\Documents
git clone https://github.com/bolivianotech/bolivianotech.github.io.git
cd bolivianotech.github.io

# Traer y cambiarte a mi rama
git fetch origin claude/exciting-allen-f01oyz
git switch claude/exciting-allen-f01oyz

# Verifica que ves la carpeta del curso
dir capacitacion-upds
```

### Ver la página en tu computador antes de publicar

```powershell
cd capacitacion-upds
py -m http.server 8000
```

Abre <http://localhost:8000/> en el navegador. Para detener el servidor pulsa `Ctrl + C`.

> Abre la página con ese servidor y no con doble clic en el archivo. Si la abres con doble clic, la página no puede comprobar qué capturas existen y no las muestra.

## Parte 3. Cómo crear tu propia rama para cada avance

Recomiendo **una rama por sesión**: si algo sale mal, `main` queda intacto.

```powershell
# Siempre parte de la rama actualizada
git switch claude/exciting-allen-f01oyz
git pull origin claude/exciting-allen-f01oyz

# Crear tu rama para la sesión 1
git switch -c sesion-01-video
```

Después de editar (por ejemplo, pegar el ID del video en `index.html`):

```powershell
git status                                   # ver qué cambió
git add capacitacion-upds/index.html capacitacion-upds/capturas
git commit -m "Sesión 01: agrega video de repaso y capturas"
git push -u origin sesion-01-video
```

### Publicar (fusionar con `main`)

La forma más segura es con un Pull Request en la web:

1. Abre el repositorio en GitHub. Aparece un aviso amarillo **"Compare & pull request"**; púlsalo.
2. Revisa los cambios y pulsa **Create pull request**, y luego **Merge pull request**.
3. En 1 o 2 minutos GitHub Pages actualiza el sitio.

O por comandos, si prefieres:

```powershell
git switch main
git pull origin main
git merge sesion-01-video
git push origin main
```

### Dónde queda publicada la página

Con tu dominio personalizado (`CNAME` = `www.bolivianotech.com`):

```
https://www.bolivianotech.com/capacitacion-upds/
```

Comprueba una vez en **Settings → Pages** del repositorio que *Source* sea **Deploy from a branch → `main` → `/ (root)`**. En el repositorio también hay una carpeta `docs/` con un `CNAME`; si *Source* estuviera en `/docs`, la carpeta del curso no se publicaría.

> Si prefieres seguir usando el repositorio donde ya publicaste la versión anterior, copia la carpeta `capacitacion-upds` allá. Todo funciona igual.

---

## Parte 4. Grabar el video de repaso (~30 min) con tu cameo

Necesitas un video limpio, y es distinto de la grabación en vivo. Ese video se llama **video de repaso**.

### Opción A (la más fácil): PowerPoint con tu cámara en cada diapositiva

1. Prepara las diapositivas con el guion de `guiones/sesion-0X.md`.
2. **Grabar → Grabar presentación de diapositivas**. Activa **cámara** y **micrófono**.
3. Habla cada diapositiva con el texto de la sección "Dices". Tu cameo aparece en la esquina.
4. **Archivo → Exportar → Crear un video** y elige **Full HD (1080p)**. Obtienes un `.mp4`.

### Opción B: OBS Studio (cuando necesitas mostrar la aplicación de Windows en vivo)

```powershell
winget install OBSProject.OBSStudio
```

Configuración recomendada:

1. **Fuentes → Captura de pantalla** para ver la aplicación de Windows.
2. **Fuentes → Dispositivo de captura de video** para tu cámara. Redúcela al 15–20 % del ancho y colócala en la esquina inferior derecha.
3. **Ajustes → Vídeo**: base y salida 1920×1080, 30 FPS.
4. **Ajustes → Salida → Grabación**: formato **mp4** y calidad "Alta calidad, tamaño de archivo mediano".
5. En el micrófono, **Filtros → Supresión de ruido**.
6. Graba y guarda en una carpeta `videos-locales/` (está ignorada por Git).

### Consejos de cameo

- Luz de frente, nunca de espalda (ventana detrás = silueta).
- Mira a la cámara al saludar y al cerrar; en la demostración puedes mirar la pantalla.
- Cierra notificaciones (Windows: `Win + N`, activar "No molestar").
- Oculta tu correo, claves y tokens antes de grabar o capturar.
- Para 30 minutos, graba **por bloques** (por diapositiva). Si te equivocas, repites solo ese bloque.

Un video de 30 minutos en 1080p pesa entre 300 y 600 MB. Eso no es problema para YouTube ni Drive, pero **sí lo sería para GitHub**: nunca lo subas allí.

## Parte 5. Publicar el video de repaso en YouTube "No listado"

1. Entra a <https://studio.youtube.com> con la cuenta que usarás para la capacitación.
2. **Verificación del canal**: YouTube limita los videos a 15 minutos hasta que verificas el canal en <https://www.youtube.com/verify>. Hazlo antes de subir el primero.
3. **Crear → Subir videos** y elige el `.mp4`.
4. **Título** (sugerido): `UPDS · Sesión 01 · Fundamentos de Claude en Windows`.
5. **Descripción** con capítulos (el primero debe ser `00:00`, y deben ser al menos tres):
   ```
   00:00 Bienvenida
   02:30 Instalar Claude en Windows
   08:00 Crear la cuenta
   ```
6. Audiencia: **No, no es contenido para niños**.
7. **Visibilidad: "No listado"**. Así no aparece en búsquedas ni en tu canal, pero cualquiera con el enlace lo ve.
8. Comprueba que esté activada la incorporación: **Mostrar más → Permitir la incorporación** (*Allow embedding*). Si no, el video no se reproduce dentro de tu página.
9. Cuando termine de procesar, copia el **ID** de la dirección:

   ```
   https://www.youtube.com/watch?v=AbC123xyz45   →   ID = AbC123xyz45
   ```
10. Pégalo en `index.html`, en la sesión que corresponda:
    ```js
    video: { youtube: "AbC123xyz45", drive: "" },
    ```

Opcional: crea una **lista de reproducción** "No listada" llamada *Capacitación UPDS* con los 6 videos, para tener todo junto.

## Parte 6. Grabar y guardar las sesiones en vivo para consulta futura

Para que **todas las sesiones queden grabadas**, graba cada reunión en vivo y guárdala en Google Drive.

### Con Google Workspace (Meet + Drive)

1. Inicia la reunión en **Google Meet** con tu cuenta institucional.
2. **Actividades → Grabación → Iniciar grabación**. Esta función depende de la edición de Workspace de la universidad. Si no aparece, pide a TI que la habiliten.
3. Al terminar, Meet guarda el video en tu Drive, en la carpeta **Meet Recordings**. Tarda unos minutos.
4. Muévelo a una carpeta compartida, por ejemplo `Capacitación IA UPDS / Sesiones en vivo`.
5. **Compartir → Acceso general → "Cualquier persona de [tu organización] con el enlace" → Lector**.
6. Copia el enlace y pégalo en `index.html`:
   ```js
   enVivo: "https://drive.google.com/file/d/1AbC.../view",
   ```
   Aparecerá en la tarjeta de la sesión como "Ver la sesión en vivo completa →".

### Si prefieres que el repaso también viva en Drive

Usa el campo `drive` y deja `youtube` vacío:

```js
video: { youtube: "", drive: "1AbC..." },
```

El ID es el texto entre `/d/` y `/view`. Los docentes necesitan estar conectados con su cuenta institucional para verlo.

> **Sobre "Stream"**: Microsoft Stream pertenece a Microsoft 365, no a Google Workspace. Si la universidad usa Microsoft 365, las grabaciones de Teams quedan en OneDrive o SharePoint; en esos servicios se obtiene el enlace de **Compartir → Insertar**.

### Privacidad (importante en una grabación en vivo)

- Avisa al inicio: "Esta sesión se está grabando para consulta posterior" y deja constancia en la convocatoria.
- Mantén las grabaciones en vivo restringidas a la UPDS en Drive, por las preguntas y los rostros de los participantes.
- El video de repaso, que solo muestra tu pantalla y tu cameo, sí puede ir en YouTube "No listado".

## Parte 7. Capturas de pantalla optimizadas

Usa capturas solo en los pasos donde ayudan; el resto lo explica el video.

1. Captura con `Win + Shift + S` y guarda cada una como PNG:
   ```
   capacitacion-upds\capturas-originales\sesion-01\paso-01.png
   capacitacion-upds\capturas-originales\sesion-01\paso-02.png
   ```
   Los nombres `paso-01`, `paso-02`... son los que espera la página. En cada `guiones/sesion-0X.md` está la lista de capturas necesarias.
2. Desde la carpeta `capacitacion-upds`, convierte a WebP:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\herramientas\optimizar-capturas.ps1
   # o solo una sesión:
   powershell -ExecutionPolicy Bypass -File .\herramientas\optimizar-capturas.ps1 -Sesion 01
   ```
   Esto reduce cada imagen a 1280 px de ancho y unos 80–150 KB. Los originales quedan en `capturas-originales/`, que Git ignora.
3. Sin instalar nada, también puedes usar <https://squoosh.app>: formato WebP, calidad 80, ancho 1280.

La página oculta el bloque **"Ver paso a paso"** hasta que existe la captura `paso-01`. Si falta otra captura, esa simplemente no se muestra.

## Parte 8. Ritmo de trabajo por sesión (checklist)

Repite este ciclo para cada sesión:

1. [ ] Leer `guiones/sesion-0X.md` y preparar las diapositivas.
2. [ ] Hacer las capturas de los 4 pasos y optimizarlas (Parte 7).
3. [ ] **Antes de la sesión en vivo**: probar cámara, micrófono y grabación de Meet.
4. [ ] **En vivo**: avisar que se graba, grabar la sesión, presentar.
5. [ ] **Después**: grabar el video de repaso de ~30 min (Parte 4) y subirlo a YouTube (Parte 5).
6. [ ] Mover la grabación en vivo a Drive y compartirla con la UPDS (Parte 6).
7. [ ] En `index.html`, pegar `youtube` y `enVivo` de la sesión.
8. [ ] Probar en local (`py -m http.server 8000`), hacer commit, push y Pull Request (Parte 3).
9. [ ] Abrir la página publicada, reproducir el video y revisar en el celular.

### Calendario sugerido

| Sesión | Fecha en vivo | Preparar antes | Entregar después |
|---|---|---|---|
| 01 | 29/10 | Diapositivas, capturas, prueba de Meet | Repaso en YouTube + en vivo en Drive |
| 02 | 31/10 | Plan analítico de ejemplo para el Proyecto | Ídem |
| 03 | 05/11 | Skill `generador-examenes-upds` probada | Ídem |
| 04 | 07/11 | Cuenta de GitHub de demostración | Ídem |
| 05 | 12/11 | Ficha de tarea repetitiva (plantilla) | Ídem |
| 06 | 14/11 | Aula de prueba en Moodle | Ídem y cierre del curso |

## Parte 9. Cómo avanzamos juntos

- Cuando tengas el ID de un video, o las capturas de una sesión, súbelos a tu rama o pásamelos. Yo actualizo `index.html` y los guiones.
- Pídeme también una versión final de las diapositivas en PPTX, ajustes de texto, o una sección "Preguntas frecuentes".
- Los **Pull Requests** los abro solo si me lo pides.

## Apéndice. Qué contiene la carpeta

```
capacitacion-upds/
├── index.html                    ← la página (los IDs de video se editan arriba, en SESIONES)
├── GUIA-PASO-A-PASO.md           ← este documento
├── guiones/sesion-01..06.md      ← guion por diapositiva de cada video
├── capturas/sesion-0X/           ← capturas WebP (se suben)
├── capturas-originales/          ← tus PNG/JPG (se ignoran, no se suben)
├── videos-locales/               ← tus .mp4 (se ignoran, no se suben)
└── herramientas/optimizar-capturas.ps1
```
