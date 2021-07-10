require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "cpp", "go", "gomod", "rust", "bash", "lua",  "javascript",
        "scss", "jsdoc", "tsx", "typescript", "graphql", "dart", "html",
        "css", "json"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {
        "beancount", "bibtex", "c_sharp", "clojure", "comment",
        "commonlisp", "cuda", "devicetree", "elixir", "erlang",
        "fennel", "Godot", "glimmer", "java", "julia",
        "kotlin", "ledger", "nix", "ocaml", "ocaml_interface", "php", "ql",
        "query", "r", "rst", "ruby", "sparql", "supercollider",
        "svelte", "teal", "turtle", "verilog", "vue", "zig"
    }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {} -- list of language that will be disabled
    }
}
