# Sesión 04 · GitHub y GitHub Pages
**Fecha en vivo:** 07/11/2026 · **Video de repaso:** ~30 min · **Capturas:** `paso-01` a `paso-04` en `capturas/sesion-04/`

**Objetivo:** que cada docente publique su examen en una dirección web propia, sin comandos ni servidores.
**Evidencia:** examen publicado y accesible mediante una URL funcional.

**Antes de grabar:**
- Crea una cuenta de GitHub nueva de demostración o usa una de pruebas (no la personal).
- Ten la carpeta del examen de la sesión 3 lista, con un archivo principal llamado **`index.html`** en la raíz.
- Haz la demostración completa una vez antes de grabar, para saber cuánto tarda en publicarse.

---

### Diapositiva 1 · 00:00–01:30 · Repaso y objetivo
- **En pantalla:** examen funcionando en tu computador → "Hoy: que lo vea cualquiera con un enlace".
- **Dices:** "Su examen funciona en su computadora, pero para que lo abran sus estudiantes necesita estar en internet. Hoy lo publicamos gratis con GitHub Pages, y sin escribir un solo comando."

### Diapositiva 2 · 01:30–04:00 · ¿Qué son GitHub y GitHub Pages?
- **En pantalla:** esquema: **repositorio = carpeta en la nube** → **Pages = la convierte en sitio web**.
- **Dices:** "GitHub es un lugar para guardar carpetas de archivos en la nube. GitHub Pages toma esa carpeta y la publica como sitio web con una dirección propia."

### Diapositiva 3 · 04:00–08:00 · Crear la cuenta y el repositorio
- **En pantalla (demo):** github.com → Sign up → verificar correo. Luego **New repository**: nombre `examen-estadistica-1`, visibilidad **Public**, y crear.
- **Dices:** "El nombre del repositorio será parte de la dirección, así que uso minúsculas, sin espacios ni tildes. Lo dejo público, porque GitHub Pages gratuito funciona con repositorios públicos."
- **Captura:** `paso-01` · formulario de nuevo repositorio.

### Diapositiva 4 · 08:00–14:00 · Subir los archivos
- **En pantalla (demo):** **Add file → Upload files** → arrastrar el contenido de la carpeta → **Commit changes**.
- **Dices:** "Arrastro los archivos del examen, no la carpeta contenedora: el `index.html` debe quedar suelto en la raíz del repositorio. Luego pulso 'Commit changes', que es simplemente 'guardar'."
- **Captura:** `paso-02` · archivos subidos y botón de commit.

### Diapositiva 5 · 14:00–19:00 · Activar GitHub Pages
- **En pantalla (demo):** **Settings → Pages** → *Source*: **Deploy from a branch** → rama `main`, carpeta `/ (root)` → **Save**.
- **Dices:** "En Settings busco Pages, elijo la rama main y la carpeta raíz, y guardo. GitHub empieza a construir el sitio."
- **Captura:** `paso-03` · configuración de Pages.

### Diapositiva 6 · 19:00–24:00 · Abrir la URL pública
- **En pantalla (demo):** esperar 1–2 minutos, actualizar la página de Pages, abrir el enlace `https://USUARIO.github.io/examen-estadistica-1/`.
- **Dices:** "Cuando aparece el aviso verde con la dirección, la abro. Esta es la URL que compartiré con mis estudiantes. La copio y la pruebo desde mi celular."
- **Captura:** `paso-04` · el examen abierto con la URL visible.

### Diapositiva 7 · 24:00–27:30 · Si algo falla
- **En pantalla:** tabla de problemas:
  | Síntoma | Causa más común | Solución |
  |---|---|---|
  | Error 404 | El archivo no se llama `index.html` o quedó dentro de una subcarpeta | Renombrarlo / subirlo a la raíz |
  | Página sin cambios | Todavía se está publicando | Esperar 2 minutos y recargar con `Ctrl + F5` |
  | No aparece la opción Pages | Repositorio privado | Cambiar a **Public** en Settings |
- **Dices:** "El 90 % de los problemas son esos tres."

### Diapositiva 8 · 27:30–30:00 · Actividad y cierre
- **En pantalla:** "Evidencia: URL funcional del examen". Anuncio de la Sesión 5 (12/11): "Creación de una Skill propia".
- **Dices:** "Su tarea: publicar su examen y enviarme la URL. Recuerden: un repositorio público es visible para cualquiera. Nunca suban datos de estudiantes ni información confidencial."

---

## Checklist de capturas
| Archivo | Qué muestra |
|---|---|
| `paso-01` | Nuevo repositorio público |
| `paso-02` | Archivos subidos y commit |
| `paso-03` | Settings → Pages configurado |
| `paso-04` | URL pública funcionando |

## Capítulos para YouTube
```
00:00 Repaso y objetivo
01:30 Qué son GitHub y GitHub Pages
04:00 Crear cuenta y repositorio
08:00 Subir archivos
14:00 Activar GitHub Pages
19:00 Abrir la URL pública
24:00 Si algo falla
27:30 Actividad y cierre
```
