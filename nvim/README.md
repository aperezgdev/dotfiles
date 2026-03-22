# Neovim Configuration

Configuracion personal de Neovim por **aperezgdev**.

## Requisitos

- Neovim >= 0.9
- Git
- Una [Nerd Font](https://www.nerdfonts.com/) instalada y configurada en tu terminal
- Node.js (para LSP servers de TypeScript, Tailwind, etc.)
- Go (para gopls, gofmt, goimports)
- JDK 17+ (para el LSP de Java - jdtls)

## Estructura del Proyecto

```
~/.config/nvim/
├── init.lua                   # Punto de entrada
├── lazy-lock.json             # Versiones fijadas de plugins
└── lua/aperezgdev/
    ├── init.lua               # Carga de modulos, opciones generales, autocommands
    ├── remap.lua              # Leader key y remaps principales
    ├── lazy.lua               # Bootstrap de lazy.nvim y lista de plugins
    ├── telescope.lua          # Busqueda difusa (archivos, grep, buffers)
    ├── treesitter.lua         # Resaltado de sintaxis y seleccion incremental
    ├── lsp.lua                # Configuracion LSP + Mason
    ├── lsp-signature.lua      # Hints de firma de funciones
    ├── cmp.lua                # Autocompletado
    ├── auto-tag.lua           # Cierre automatico de tags HTML/JSX
    ├── lualine.lua            # Barra de estado (tema "bubbles")
    ├── gitsigns.lua           # Indicadores Git en el gutter
    ├── discord-presence.lua   # Discord Rich Presence
    ├── gruvbox-material.lua   # Tema de colores
    ├── nvim-lint.lua          # Linters
    ├── conform.lua            # Formatters
    ├── toggleterm.lua         # Terminal integrada + LazyGit
    ├── which-key.lua          # Popup de atajos disponibles
    └── jdtls.lua              # Configuracion LSP de Java (nvim-jdtls)
```

## Gestor de Plugins

Se utiliza [lazy.nvim](https://github.com/folke/lazy.nvim) como gestor de plugins. Se hace bootstrap automatico al iniciar Neovim si no esta instalado.

## Plugins Instalados

| Plugin | Descripcion |
|--------|-------------|
| **telescope.nvim** | Busqueda difusa de archivos, contenido, buffers y ayuda |
| **nvim-treesitter** | Resaltado de sintaxis avanzado mediante AST |
| **copilot.vim** | Autocompletado con IA de GitHub Copilot |
| **lsp-zero.nvim** | Capa simplificada de configuracion LSP |
| **nvim-lspconfig** | Configuraciones oficiales de LSP |
| **mason.nvim** | Instalador de LSP servers, linters y formatters |
| **mason-lspconfig.nvim** | Puente entre Mason y lspconfig |
| **nvim-cmp** | Motor de autocompletado |
| **cmp-nvim-lsp** | Fuente de completado desde LSP |
| **cmp-buffer** | Fuente de completado desde el buffer |
| **cmp-path** | Fuente de completado de rutas del sistema |
| **cmp-cmdline** | Fuente de completado en linea de comandos |
| **LuaSnip** | Motor de snippets |
| **nvim-autopairs** | Cierre automatico de parentesis, corchetes y comillas |
| **nvim-ts-autotag** | Cierre automatico de tags HTML/JSX |
| **conform.nvim** | Formateo de codigo (format on save) |
| **nvim-lint** | Linting asincrono |
| **lualine.nvim** | Barra de estado personalizada |
| **gitsigns.nvim** | Indicadores de Git en el gutter + operaciones por hunk |
| **toggleterm.nvim** | Terminal persistente + integracion con LazyGit |
| **which-key.nvim** | Popup que muestra atajos disponibles |
| **lsp_signature.nvim** | Hints de parametros de funciones |
| **gruvbox-material** | Tema de colores (variante hard, fondo transparente) |
| **presence.nvim** | Discord Rich Presence |
| **nvim-web-devicons** | Iconos de tipo de archivo |
| **nvim-jdtls** | Soporte avanzado de Java (LSP, refactoring, imports) |

## LSP Servers

Servidores LSP instalados automaticamente mediante Mason:

| Servidor | Lenguaje |
|----------|----------|
| `gopls` | Go |
| `ts_ls` | TypeScript / JavaScript |
| `html` | HTML |
| `jsonls` | JSON |
| `tailwindcss` | Tailwind CSS |
| `astro` | Astro |
| `markdown_oxide` | Markdown |
| `jdtls` | Java (via nvim-jdtls) |

## Formatters y Linters

### Formatters (conform.nvim - se ejecutan al guardar)

| Lenguaje | Formatters |
|----------|-----------|
| Go | `gofmt`, `goimports` |
| Lua | `stylua` |
| JavaScript | `prettier` |
| Java | `google-java-format` |

### Linters (nvim-lint - se ejecutan al guardar)

| Lenguaje | Linters |
|----------|---------|
| Go | `golangci-lint` |
| Lua | `luacheck` |
| JavaScript | `eslint` |
| Java | `checkstyle` |

## Opciones Generales

| Opcion | Valor | Descripcion |
|--------|-------|-------------|
| `number` | `true` | Numeros de linea |
| `relativenumber` | `true` | Numeros de linea relativos |
| `tabstop` | `4` | Ancho del tabulador |
| `softtabstop` | `4` | Ancho del tabulador al editar |
| `shiftwidth` | `4` | Ancho de la indentacion |
| `termguicolors` | `true` | Colores de 24 bits |
| `scrolloff` | `8` | Lineas de margen al hacer scroll |
| `signcolumn` | `"yes"` | Columna de signos siempre visible |
| `undofile` | `true` | Historial de deshacer persistente |
| `updatetime` | `250` | Tiempo de inactividad antes de CursorHold (ms) |
| `timeoutlen` | `300` | Tiempo de espera para combinaciones de teclas (ms) |

## Tema

- **Colorscheme:** gruvbox-material
- **Variante:** hard (fondo mas oscuro)
- **Paleta:** material
- **Fondo transparente:** activado

## Atajos de Teclado

La tecla **Leader** es `<Space>`.

### General

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `<Space>pv` | Normal | Abrir explorador de archivos (netrw) |
| `<Space>d` | Normal | Mostrar diagnostico en ventana flotante |

### Busqueda (Telescope)

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `<Space>ff` | Normal | Buscar archivos |
| `<Space>fg` | Normal | Buscar por contenido (grep) |
| `<Space>fb` | Normal | Listar buffers abiertos |
| `<Space>fh` | Normal | Buscar en la ayuda |

### LSP

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `K` | Normal | Mostrar documentacion (hover) |
| `gd` | Normal | Ir a la definicion |
| `gD` | Normal | Ir a la declaracion |
| `gi` | Normal | Ir a la implementacion |
| `go` | Normal | Ir al tipo de definicion |
| `gr` | Normal | Ver referencias |
| `gs` | Normal | Ayuda de firma de funcion |
| `<F2>` | Normal | Renombrar simbolo |
| `<F3>` | Normal | Formatear archivo |
| `<F4>` | Normal | Acciones de codigo |
| `gl` | Normal | Mostrar diagnostico en float |
| `[d` | Normal | Ir al diagnostico anterior |
| `]d` | Normal | Ir al diagnostico siguiente |
| `<C-k>` | Normal | Alternar ventana de firma de funcion |
| `<Space>k` | Normal | Mostrar ayuda de firma |

### Autocompletado

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `<Tab>` | Insert | Confirmar seleccion |
| `<C-e>` | Insert | Cerrar menu de completado |
| `<Up>` / `<C-p>` | Insert | Seleccionar item anterior |
| `<Down>` / `<C-n>` | Insert | Seleccionar item siguiente |
| `<C-J>` | Insert | Aceptar sugerencia de Copilot |

### Git (Gitsigns)

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `]c` | Normal | Ir al siguiente hunk |
| `[c` | Normal | Ir al hunk anterior |
| `<Space>hs` | Normal/Visual | Stage del hunk |
| `<Space>hr` | Normal/Visual | Reset del hunk |
| `<Space>hS` | Normal | Stage del buffer completo |
| `<Space>hu` | Normal | Deshacer stage del hunk |
| `<Space>hR` | Normal | Reset del buffer completo |
| `<Space>hp` | Normal | Preview del hunk |
| `<Space>hb` | Normal | Git blame de la linea actual |
| `<Space>hd` | Normal | Diff contra el indice |
| `<Space>gg` | Normal | Abrir LazyGit |

### Terminal (ToggleTerm)

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `<C-\>` | Normal/Insert/Terminal | Alternar terminal |
| `<Space>tt` | Normal | Abrir terminal flotante |
| `<Space>th` | Normal | Abrir terminal horizontal |
| `<Space>tv` | Normal | Abrir terminal vertical |

### Java (nvim-jdtls)

Estos atajos solo estan disponibles en archivos `.java`:

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `<Space>jo` | Normal | Organizar imports |
| `<Space>jev` | Normal/Visual | Extraer variable |
| `<Space>jec` | Normal/Visual | Extraer constante |
| `<Space>jem` | Visual | Extraer metodo |

### Treesitter (Seleccion Incremental)

| Atajo | Modo | Descripcion |
|-------|------|-------------|
| `gnn` | Normal | Iniciar seleccion incremental |
| `grn` | Normal | Expandir seleccion al nodo padre |
| `grm` | Normal | Contraer seleccion al nodo hijo |
| `grc` | Normal | Expandir seleccion al scope |

## Autocommands

1. **Diagnostico flotante al detenerse** - Muestra automaticamente el diagnostico de la linea actual cuando el cursor esta inactivo (250ms).
2. **Formateo al guardar** - Ejecuta el formatter correspondiente antes de guardar el archivo.
3. **Linting al guardar** - Ejecuta el linter correspondiente despues de guardar el archivo.
