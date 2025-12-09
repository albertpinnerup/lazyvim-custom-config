return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        provider = "ollama", -- 🔴 <– THIS is the important part
        providers = {
            ollama = {
                endpoint = "http://127.0.0.1:11434", -- default Ollama server
                model = "qwen2.5-coder:7b", -- the model you pulled
                timeout = 30000,
                -- You can tweak context length if avante exposes it for Ollama;
                -- many setups just use default Ollama context, which is fine.
            },
        },
    },
}
