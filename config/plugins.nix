{pkgs, ...}: {
  plugins = {
    # Buffer bar
    bufferline = {
      enable = true;
    };

    # Good old Telescope
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };
  
    # Status bar
    lualine = {
      enable = true;
    };

    # Make `nvim .` look prettier
    oil = {
      enable = true;
    };

    # smooth scrolling
    neoscroll = {
      enable = true;
    };

    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
    };
 
    # Lazygit
    lazygit = {
      enable = true;
    };

    # Notify
    notify = {
      enable = true;
      backgroundColour = "#1e1e2e";
      fps = 60;
      render = "default";
      timeout = 500;
      topDown = true;
    };

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    which-key = {
      enable = true;
      registrations = {
        "<leader>fg" = "Find Git files with telescope";
        "<leader>fw" = "Find text with telescope";
        "<leader>ff" = "Find files with telescope";
      };
    };

    # Prettier fancier command window
    noice = {
      enable = true;
    };

    # Todo comments
    todo-comments = {
      enable = true;
      colors = {
        error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
        warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
        info = ["DiagnosticInfo" "#2563EB"];
        hint = ["DiagnosticHint" "#10B981"];
        default = ["Identifier" "#7C3AED"];
        test = ["Identifier" "#FF00FF"];
      };
    };

    # File tree
    neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
        };
      };
    };

    # Highlight word under cursor
    illuminate = {
      enable = true;
      underCursor = false;
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
        "alpha"
        "harpoon"
        "reason"
      ];
    };

    # Nix expressions in Neovim
    nix = {
      enable = true;
    };

    # Language server
    lsp = {
      enable = true;
      servers = {
        # Average webdev LSPs
        tsserver.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        vuels.enable = false; # Vue
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil-ls.enable = true; # Nix
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        csharp-ls.enable = true; # C#
        yamlls.enable = true; # YAML

        lua-ls = { # Lua
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };

        cmp-emoji = {
      enable = true;
    };

    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = { expand = "luasnip"; };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          # { name = "copilot"; } # enable/disable copilot
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true; # file system paths
    };
    cmp_luasnip = {
      enable = true; # snippets
    };
    cmp-cmdline = {
      enable = true; # autocomplete for cmdline
    }; 
  };

  extraConfigLua = ''
      require("telescope").load_extension("lazygit")

      luasnip = require("luasnip")

      local cmp = require'cmp'

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/', "?" }, {
        sources = {
          { name = 'buffer' }
        }
      })
  '';
}
