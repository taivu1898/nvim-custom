# Hello World

This is my structure folder

```bash
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── init.lua
    │   └── settings
    │       ├── mappings.lua
    │       └── options.lua
    ├── guide
    │   └── utils
    │       └── nvim-tree.md
    └── plugins
        ├── configs
        │   ├── editor
        │   │   ├── conform.lua
        │   │   └── lsp
        │   │       ├── lspconfig.lua
        │   │       └── mason.lua
        │   ├── ui
        │   │   ├── headlines.lua
        │   │   └── statusline.lua
        │   └── utils
        │       ├── autopairs.lua
        │       ├── cmp.lua
        │       ├── nvim-tree.lua
        │       ├── nvim-treesitter.lua
        │       └── which-key.lua
        └── init.lua
```

## Run C++ file for Competitive Programming

- add file to workspace

```bash
#!/bin/bash

clang++ -std=c++23 main.cpp -o main

if [ -f "./main" ]; then
    ./main < input.txt > output.txt
    echo "Program executed successfully. Output written to output.txt."
else
    echo "Compilation failed, executable not found."
fi

```
