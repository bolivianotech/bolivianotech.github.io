# Guía: limpiar el historial de git del repositorio

Repositorio: `bolivianotech/bolivianotech.github.io` (público). Guía pensada para ejecutarse en Windows con PowerShell y Git for Windows.

## 1. Qué hay que limpiar

| Commit | Problema |
|---|---|
| `cfbf9ec` (PR #1) | El autor y el correo no son los tuyos (correo `noreply` de un tercero). |
| `b8a6a34` (en `main`) | El mensaje tiene una línea de coautoría (`Co-Authored-By:`) de una herramienta. |
| `a23e950` (PR #2) | El mensaje menciona un archivo interno de trabajo que ya no se versiona. |

Todo lo demás (commits `68ea16d` en adelante) usa tu correo `95052718+bolivianotech@users.noreply.github.com` y mensajes sin atribuciones.

## 2. Qué se puede y qué no se puede borrar

- **Se puede** reescribir `main` para que ningún commit visible tenga esos datos.
- **No se puede** borrar desde tu cuenta lo que GitHub guarda de los pull requests: los commits de los PR #1 y #2 siguen accesibles por URL con el hash y por las referencias `refs/pull/1/head` y `refs/pull/2/head`, aunque reescribas `main`.
- Para eliminarlos de verdad hay dos caminos: **recrear el repositorio** (Opción C) o pedir a GitHub Support que purgue vistas en caché y referencias (se indica al final).

## 3. Antes de empezar (siempre)

1. **Fusiona primero el PR #2** desde la web (Merge pull request → Confirm merge). En el cuadro del squash deja solo el título y el resumen, sin líneas `Co-authored-by`.
2. Actualiza tu copia local:
   ```powershell
   cd D:\bolivianotech.github.io
   git switch main
   git pull
   ```
3. Verifica que no haya archivos internos de trabajo versionados: la lista solo debe mostrar archivos del sitio y de `cv/` y `docs/`.
   ```powershell
   git ls-files
   ```
4. Haz un respaldo completo del repositorio (solo se hace una vez):
   ```powershell
   New-Item -ItemType Directory -Force D:\respaldos | Out-Null
   git clone --mirror https://github.com/bolivianotech/bolivianotech.github.io.git D:\respaldos\bolivianotech.github.io.git
   ```
5. Confirma tu identidad en el repo:
   ```powershell
   git config user.name
   git config user.email    # debe ser 95052718+bolivianotech@users.noreply.github.com
   ```
6. Si `main` tiene protección de rama: Settings → Branches → edita la regla y permite temporalmente **Allow force pushes** (o desactiva la regla). Al terminar, vuelve a activarla.

## 4. Opción A (recomendada): historial nuevo con un solo commit

Es la más simple y segura para un portafolio: el contenido actual se conserva y el historial anterior desaparece de `main`.

```powershell
cd D:\bolivianotech.github.io
git checkout --orphan limpio
git add -A
git status --short            # revisa que solo estén los archivos del sitio y de cv/
git commit -m "Portafolio y CV de Jimmy Requena"
git push --force-with-lease origin limpio:main
git branch -M main
git branch --set-upstream-to=origin/main main
```

Después, borra las ramas viejas de GitHub y locales:

```powershell
git fetch --prune
git branch -r                       # lista las ramas remotas; deja solo origin/main
git push origin --delete NOMBRE-DE-LA-RAMA   # repite por cada rama que no sea main
git branch -D feat/cv-alineado
```

(La rama del PR #1 aparece en esa lista con un nombre generado automáticamente. Si algún `--delete` dice que la rama ya no existe, ignóralo.)

## 5. Opción B: conservar el historial pero corregirlo con `git filter-repo`

Útil si quieres mantener los commits intermedios.

1. Instala la herramienta: `pip install git-filter-repo`.
2. Trabaja sobre un **clon nuevo** (la herramienta lo exige):
   ```powershell
   cd D:\
   git clone https://github.com/bolivianotech/bolivianotech.github.io.git bolivianotech-limpio
   cd bolivianotech-limpio
   ```
3. Crea el archivo `D:\reemplazos.txt` con estas líneas (sin comillas):
   ```
   regex:(?mi)^co-authored-by:.*\r?\n==>
   ```
4. Crea el archivo `D:\autores.txt` para cambiar el autor del PR #1 (reemplaza `NOMBRE-ANTERIOR` y `CORREO-ANTERIOR` por los que muestra `git log --format="%an <%ae>" cfbf9ec -1`):
   ```
   NOMBRE-ANTERIOR <CORREO-ANTERIOR> ==> Jim Nataniel <95052718+bolivianotech@users.noreply.github.com>
   ```
5. Ejecuta:
   ```powershell
   git filter-repo --replace-message D:\reemplazos.txt --mailmap D:\autores.txt
   ```
6. `filter-repo` quita el remoto: vuelve a agregarlo y sube:
   ```powershell
   git remote add origin https://github.com/bolivianotech/bolivianotech.github.io.git
   git push --force --all origin
   ```
7. Tus otras copias locales deben re-sincronizarse (sección 7).

## 6. Opción C: recrear el repositorio (la única que elimina también los PR)

Pierdes los PR, las ejecuciones de Actions y las estrellas, pero queda 100 % limpio. Úsala si realmente necesitas que no quede rastro.

1. Haz la Opción A en local (para tener el historial de un solo commit), **sin** hacer el push todavía.
2. En GitHub: repo → Settings → General → Danger Zone → **Delete this repository** (escribe el nombre para confirmar).
3. Crea el repositorio de nuevo con el mismo nombre y súbelo:
   ```powershell
   gh repo create bolivianotech/bolivianotech.github.io --public --source . --remote origin --push
   ```
   Si el remoto `origin` ya existe: `git remote remove origin` y repite el comando.
4. Activa Pages: Settings → Pages → Source: **Deploy from a branch** → Branch: `main` / `(root)` → Save.
5. Espera 1–2 minutos y abre https://bolivianotech.github.io.

## 7. Después de reescribir el historial

- En cualquier otra copia local del repositorio:
  ```powershell
  git fetch origin
  git switch main
  git reset --hard origin/main
  ```
- Vuelve a activar la protección de rama si la desactivaste.
- Revisa que Pages se publique: pestaña **Actions** → "pages build and deployment" en verde, y abre el sitio.

## 8. Verificación

Estos comandos no deben imprimir nada (o solo tu nombre y tu correo `noreply`):

```powershell
git log --all --format="%B" | Select-String -Pattern "co-authored"
git log --all --format="%an <%ae>" | Sort-Object -Unique
```

En GitHub, revisa la lista de commits de `main` (pestaña Code → clic en el número de commits) y la sección **Contributors**: puede tardar algunas horas en actualizarse.

## 9. Pedirle a GitHub que purgue lo que queda (Opciones A y B)

Los commits de los PR #1 y #2 quedan en caché. En https://support.github.com/contact (categoría *Repositories* → *Remove sensitive data / cached views*) pide que eliminen las referencias `refs/pull/*` y las vistas en caché de los commits indicados en la sección 1. Incluye el nombre del repositorio y los hashes.

## 10. Prevenir que vuelva a pasar

1. **Correo de commits:** mantén `git config user.email` con el `noreply` a nivel de repo (ya está configurado).
2. **Hook local** que rechaza mensajes con coautoría o textos generados. Crea el archivo `.git/hooks/commit-msg` (sin extensión) con este contenido:
   ```sh
   #!/bin/sh
   if grep -qiE '^co-authored-by:|generated with' "$1"; then
     echo "Mensaje rechazado: contiene una atribución no permitida."
     exit 1
   fi
   ```
   En Git for Windows no hace falta darle permisos de ejecución.
3. **Ramas + PR:** trabaja siempre en una rama `feat/...`, abre el PR y revisa el mensaje del squash antes de confirmar el merge.
4. **Archivos internos de trabajo:** están en `.git/info/exclude` (solo local) para que no se suban. Verifica con `git status` antes de cada commit.
