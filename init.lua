
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup(plugins, opts)


--------------------------------	$$$$$$$$$$$$$$$$$$$$$$$$	-------------------------

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  -- My plugins here
  -- 'foo1/bar1.nvim';
  -- 'foo2/bar2.nvim';
}


-------------------------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true



-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- Ensure termguicolors is enabled if not already
vim.opt.termguicolors = true

require("nvim-highlight-colors").setup {
	---Render style
	---@usage 'background'|'foreground'|'virtual'
	render = 'background',

	---Set virtual symbol (requires render to be set to 'virtual')
	virtual_symbol = '■',

	---Set virtual symbol suffix (defaults to '')
	virtual_symbol_prefix = '',

	---Set virtual symbol suffix (defaults to ' ')
	virtual_symbol_suffix = ' ',

	---Set virtual symbol position()
 	---@usage 'inline'|'eol'|'eow'
 	---inline mimics VS Code style
 	---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
 	---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
	virtual_symbol_position = 'inline',

	---Highlight hex colors, e.g. '#FFFFFF'
	enable_hex = true,

	---Highlight rgb colors, e.g. 'rgb(0 0 0)'
	enable_rgb = true,

	---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
	enable_hsl = true,

	---Highlight CSS variables, e.g. 'var(--testing-color)'
	enable_var_usage = true,

	---Highlight named colors, e.g. 'green'
	enable_named_colors = true,

	---Highlight tailwind colors, e.g. 'bg-blue-500'
	enable_tailwind = false,

	---Set custom colors
	---Label must be properly escaped with '%' to adhere to `string.gmatch`
	--- :help string.gmatch
	custom_colors = {
		{ label = '%-%-theme%-primary%-color', color = '#0f1219' },
		{ label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
	}
}

-----------------------------------------

{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
}

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)


---------------------------------------------------------------------------
require("neo-tree").setup({
    sources = {
        "filesystem", -- Neotree filesystem source
        "netman.ui.neo-tree", -- The one you really care about 😉
    }
})


-- conform.nvim
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- These can also be set directly
require("conform").formatters.yamlfix = {
  env = {
    YAMLFIX_SEQUENCE_STYLE = "block_style",
  },
}

require("conform").formatters.shfmt = {
  inherit = false,
  command = "shfmt",
  args = { "-i", "2", "-filename", "$FILENAME" },
}


--	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
  }
})

------------------

require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}


------------------------------------------------------------------------------------------------------------


vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme "catppuccin"

vim.cmd[[colorscheme gruvbox-flat]]

-- Debugging
vim.g.netman_log_level = 1

vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)

-- When used in visual mode prefills the selection as body.
vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)


vim.cmd("colorscheme cyberdream")


--------	*********************************************************************************	--------


vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")


--------------------------	############################################	------------------------------

local neogit = require("neogit")

neogit.setup {
  -- Hides the hints at the top of the status buffer
  disable_hint = false,
  -- Disables changing the buffer highlights based on where the cursor is.
  disable_context_highlighting = false,
  -- Disables signs for sections/items/hunks
  disable_signs = false,
  -- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
  -- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
  -- normal mode.
  disable_insert_on_commit = "auto",
  -- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
  -- events.
  filewatcher = {
    interval = 1000,
    enabled = true,
  },
  -- "ascii"   is the graph the git CLI generates
  -- "unicode" is the graph like https://github.com/rbong/vim-flog
  graph_style = "ascii",
  -- Used to generate URL's for branch popup action "pull request".
  git_services = {
    ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
    ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
    ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
  },
  -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
  -- sorter instead. By default, this function returns `nil`.
  telescope_sorter = function()
    return require("telescope").extensions.fzf.native_fzf_sorter()
  end,
  -- Persist the values of switches/options within and across sessions
  remember_settings = true,
  -- Scope persisted settings on a per-project basis
  use_per_project_settings = true,
  -- Table of settings to never persist. Uses format "Filetype--cli-value"
  ignored_settings = {
    "NeogitPushPopup--force-with-lease",
    "NeogitPushPopup--force",
    "NeogitPullPopup--rebase",
    "NeogitCommitPopup--allow-empty",
    "NeogitRevertPopup--no-edit",
  },
  -- Configure highlight group features
  highlight = {
    italic = true,
    bold = true,
    underline = true
  },
  -- Set to false if you want to be responsible for creating _ALL_ keymappings
  use_default_keymaps = true,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  -- Value used for `--sort` option for `git branch` command
  -- By default, branches will be sorted by commit date descending
  -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
  -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
  sort_branches = "-committerdate",
  -- Change the default way of opening neogit
  kind = "tab",
  -- Disable line numbers and relative line numbers
  disable_line_numbers = true,
  -- The time after which an output console is shown for slow running commands
  console_timeout = 2000,
  -- Automatically show console if a command takes more than console_timeout milliseconds
  auto_show_console = true,
  status = {
    show_head_commit_hash = true,
    recent_commit_count = 10,
    HEAD_padding = 10,
    mode_padding = 3,
    mode_text = {
      M = "modified",
      N = "new file",
      A = "added",
      D = "deleted",
      C = "copied",
      U = "updated",
      R = "renamed",
      DD = "unmerged",
      AU = "unmerged",
      UD = "unmerged",
      UA = "unmerged",
      DU = "unmerged",
      AA = "unmerged",
      UU = "unmerged",
      ["?"] = "",
    },
  },
  commit_editor = {
    kind = "tab",
    show_staged_diff = true,
    -- Accepted values:
    -- "split" to show the staged diff below the commit editor
    -- "vsplit" to show it to the right
    -- "split_above" Like :top split
    -- "vsplit_left" like :vsplit, but open to the left
    -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
    staged_diff_split_kind = "split"
  },
  commit_select_view = {
    kind = "tab",
  },
  commit_view = {
    kind = "vsplit",
    verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
  },
  log_view = {
    kind = "tab",
  },
  rebase_editor = {
    kind = "auto",
  },
  reflog_view = {
    kind = "tab",
  },
  merge_editor = {
    kind = "auto",
  },
  tag_editor = {
    kind = "auto",
  },
  preview_buffer = {
    kind = "split",
  },
  popup = {
    kind = "split",
  },
  signs = {
    -- { CLOSED, OPENED }
    hunk = { "", "" },
    item = { ">", "v" },
    section = { ">", "v" },
  },
  -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
  integrations = {
    -- If enabled, use telescope for menu selection rather than vim.ui.select.
    -- Allows multi-select and some things that vim.ui.select doesn't.
    telescope = nil,
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
    -- The diffview integration enables the diff popup.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    diffview = nil,

    -- If enabled, uses fzf-lua for menu selection. If the telescope integration
    -- is also selected then telescope is used instead
    -- Requires you to have `ibhagwan/fzf-lua` installed.
    fzf_lua = nil,
  },
  sections = {
    -- Reverting/Cherry Picking
    sequencer = {
      folded = false,
      hidden = false,
    },
    untracked = {
      folded = false,
      hidden = false,
    },
    unstaged = {
      folded = false,
      hidden = false,
    },
    staged = {
      folded = false,
      hidden = false,
    },
    stashes = {
      folded = true,
      hidden = false,
    },
    unpulled_upstream = {
      folded = true,
      hidden = false,
    },
    unmerged_upstream = {
      folded = false,
      hidden = false,
    },
    unpulled_pushRemote = {
      folded = true,
      hidden = false,
    },
    unmerged_pushRemote = {
      folded = false,
      hidden = false,
    },
    recent = {
      folded = true,
      hidden = false,
    },
    rebase = {
      folded = true,
      hidden = false,
    },
  },
  mappings = {
    commit_editor = {
      ["q"] = "Close",
      ["<c-c><c-c>"] = "Submit",
      ["<c-c><c-k>"] = "Abort",
    },
    commit_editor_I = {
      ["<c-c><c-c>"] = "Submit",
      ["<c-c><c-k>"] = "Abort",
    },
    rebase_editor = {
      ["p"] = "Pick",
      ["r"] = "Reword",
      ["e"] = "Edit",
      ["s"] = "Squash",
      ["f"] = "Fixup",
      ["x"] = "Execute",
      ["d"] = "Drop",
      ["b"] = "Break",
      ["q"] = "Close",
      ["<cr>"] = "OpenCommit",
      ["gk"] = "MoveUp",
      ["gj"] = "MoveDown",
      ["<c-c><c-c>"] = "Submit",
      ["<c-c><c-k>"] = "Abort",
      ["[c"] = "OpenOrScrollUp",
      ["]c"] = "OpenOrScrollDown",
    },
    rebase_editor_I = {
      ["<c-c><c-c>"] = "Submit",
      ["<c-c><c-k>"] = "Abort",
    },
    finder = {
      ["<cr>"] = "Select",
      ["<c-c>"] = "Close",
      ["<esc>"] = "Close",
      ["<c-n>"] = "Next",
      ["<c-p>"] = "Previous",
      ["<down>"] = "Next",
      ["<up>"] = "Previous",
      ["<tab>"] = "MultiselectToggleNext",
      ["<s-tab>"] = "MultiselectTogglePrevious",
      ["<c-j>"] = "NOP",
    },
    -- Setting any of these to `false` will disable the mapping.
    popup = {
      ["?"] = "HelpPopup",
      ["A"] = "CherryPickPopup",
      ["D"] = "DiffPopup",
      ["M"] = "RemotePopup",
      ["P"] = "PushPopup",
      ["X"] = "ResetPopup",
      ["Z"] = "StashPopup",
      ["b"] = "BranchPopup",
      ["B"] = "BisectPopup",
      ["c"] = "CommitPopup",
      ["f"] = "FetchPopup",
      ["l"] = "LogPopup",
      ["m"] = "MergePopup",
      ["p"] = "PullPopup",
      ["r"] = "RebasePopup",
      ["v"] = "RevertPopup",
      ["w"] = "WorktreePopup",
    },
    status = {
      ["q"] = "Close",
      ["I"] = "InitRepo",
      ["1"] = "Depth1",
      ["2"] = "Depth2",
      ["3"] = "Depth3",
      ["4"] = "Depth4",
      ["<tab>"] = "Toggle",
      ["x"] = "Discard",
      ["s"] = "Stage",
      ["S"] = "StageUnstaged",
      ["<c-s>"] = "StageAll",
      ["K"] = "Untrack",
      ["u"] = "Unstage",
      ["U"] = "UnstageStaged",
      ["$"] = "CommandHistory",
      ["Y"] = "YankSelected",
      ["<c-r>"] = "RefreshBuffer",
      ["<enter>"] = "GoToFile",
      ["<c-v>"] = "VSplitOpen",
      ["<c-x>"] = "SplitOpen",
      ["<c-t>"] = "TabOpen",
      ["{"] = "GoToPreviousHunkHeader",
      ["}"] = "GoToNextHunkHeader",
      ["[c"] = "OpenOrScrollUp",
      ["]c"] = "OpenOrScrollDown",
    },
  },
}

-------------------------------------------------------------------------------------------------------

require('render-markdown').setup({
    -- Configure whether Markdown should be rendered by default or not
    start_enabled = true,
    -- Maximum file size (in MB) that this plugin will attempt to render
    -- Any file larger than this will effectively be ignored
    max_file_size = 1.5,
    -- Capture groups that get pulled from markdown
    markdown_query = [[
        (atx_heading [
            (atx_h1_marker)
            (atx_h2_marker)
            (atx_h3_marker)
            (atx_h4_marker)
            (atx_h5_marker)
            (atx_h6_marker)
        ] @heading)

        (thematic_break) @dash

        (fenced_code_block) @code

        [
            (list_marker_plus)
            (list_marker_minus)
            (list_marker_star)
        ] @list_marker

        (task_list_marker_unchecked) @checkbox_unchecked
        (task_list_marker_checked) @checkbox_checked

        (block_quote (block_quote_marker) @quote_marker)
        (block_quote (paragraph (inline (block_continuation) @quote_marker)))

        (pipe_table) @table
        (pipe_table_header) @table_head
        (pipe_table_delimiter_row) @table_delim
        (pipe_table_row) @table_row
    ]],
    -- Capture groups that get pulled from inline markdown
    inline_query = [[
        (code_span) @code

        (shortcut_link) @callout
    ]],
    -- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'
    -- Only intended to be used for plugin development / debugging
    log_level = 'error',
    -- Filetypes this plugin will run on
    file_types = { 'markdown' },
    -- Vim modes that will show a rendered view of the markdown file
    -- All other modes will be uneffected by this plugin
    render_modes = { 'n', 'c' },
    -- Characters that will replace the # at the start of headings
    headings = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    -- Character to use for the horizontal break
    dash = '—',
    -- Character to use for the bullet points in lists
    bullets = { '●', '○', '◆', '◇' },
    checkbox = {
        -- Character that will replace the [ ] in unchecked checkboxes
        unchecked = '󰄱 ',
        -- Character that will replace the [x] in checked checkboxes
        checked = ' ',
    },
    -- Character that will replace the > at the start of block quotes
    quote = '┃',
    -- Symbol / text to use for different callouts
    callout = {
        note = '  Note',
        tip = '  Tip',
        important = '󰅾  Important',
        warning = '  Warning',
        caution = '󰳦  Caution',
    },
    -- See :h 'conceallevel' for more information about meaning of values
    conceal = {
        -- conceallevel used for buffer when not being rendered, get user setting
        default = vim.opt.conceallevel:get(),
        -- conceallevel used for buffer when being rendered
        rendered = 3,
    },
    -- Determines how tables are rendered
    --  full: adds a line above and below tables + normal behavior
    --  normal: renders the rows of tables
    --  none: disables rendering, use this if you prefer having cell highlights
    table_style = 'full',
    -- Define the highlight groups to use when rendering various components
    highlights = {
        heading = {
            -- Background of heading line
            backgrounds = { 'DiffAdd', 'DiffChange', 'DiffDelete' },
            -- Foreground of heading character only
            foregrounds = {
                'markdownH1',
                'markdownH2',
                'markdownH3',
                'markdownH4',
                'markdownH5',
                'markdownH6',
            },
        },
        -- Horizontal break
        dash = 'LineNr',
        -- Code blocks
        code = 'ColorColumn',
        -- Bullet points in list
        bullet = 'Normal',
        checkbox = {
            -- Unchecked checkboxes
            unchecked = '@markup.list.unchecked',
            -- Checked checkboxes
            checked = '@markup.heading',
        },
        table = {
            -- Header of a markdown table
            head = '@markup.heading',
            -- Non header rows in a markdown table
            row = 'Normal',
        },
        -- LaTeX blocks
        latex = '@markup.math',
        -- Quote character in a block quote
        quote = '@markup.quote',
        -- Highlights to use for different callouts
        callout = {
            note = 'DiagnosticInfo',
            tip = 'DiagnosticOk',
            important = 'DiagnosticHint',
            warning = 'DiagnosticWarn',
            caution = 'DiagnosticError',
        },
    },
})


-------------------------------

require('image').setup({
  integrations = {
    markdown = {
      resolve_image_path = function(document_path, image_path, fallback)
        -- document_path is the path to the file that contains the image
        -- image_path is the potentially relative path to the image. for
        -- markdown it's `![](this text)`

        -- you can call the fallback function to get the default behavior
        return fallback(document_path, image_path)
      end,
    }
  }
})

-------------------------------------------------------------

local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
	
	
----------------------------------------------

require("dressing").setup({
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,

    -- Default prompt string
    default_prompt = "Input",

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Can be 'left', 'right', or 'center'
    title_pos = "left",

    -- When true, <Esc> will close the modal
    insert_only = true,

    -- When true, input will start in insert mode.
    start_in_insert = true,

    -- These are passed to nvim_open_win
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    buf_options = {},
    win_options = {
      -- Disable line wrapping
      wrap = false,
      -- Indicator for when text exceeds window
      list = true,
      listchars = "precedes:…,extends:…",
      -- Increase this for more context when text scrolls off the window
      sidescrolloff = 0,
    },

    -- Set to `false` to disable
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = nil,

    -- Options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- Options for fzf-lua
    fzf_lua = {
      -- winopts = {
      --   height = 0.5,
      --   width = 0.5,
      -- },
    },

    -- Options for nui Menu
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 0,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },

    -- Options for built-in selector
    builtin = {
      -- Display numbers for options and set up keymaps
      show_numbers = true,
      -- These are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      buf_options = {},
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },

      -- Set to `false` to disable
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },

      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },

    -- Used to override format_item. See :help dressing-format
    format_item_override = {},

    -- see :help dressing_get_config
    get_config = nil,
  },
})



{
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}


--------------------------------------------------------

{
    win_opts = {
        row = vim.o.lines - vim.o.cmdheight - 1,
        col = vim.o.columns - 1,
        relative = "editor",
        anchor = "SE",
        width = 40,
        height = 3,
        border = "single",
    },
    compress_after = 3,
    clear_after = 3,
    disable = {
        filetypes = {},
        buftypes = {},
    },
    group_mappings = false,
    keys = {
        ["<TAB>"] = "󰌒",
        ["<CR>"] = "󰌑",
        ["<ESC>"] = "Esc",
        ["<SPACE>"] = "␣",
        ["<BS>"] = "󰌥",
        ["<DEL>"] = "Del",
        ["<LEFT>"] = "",
        ["<RIGHT>"] = "",
        ["<UP>"] = "",
        ["<DOWN>"] = "",
        ["<HOME>"] = "Home",
        ["<END>"] = "End",
        ["<PAGEUP>"] = "PgUp",
        ["<PAGEDOWN>"] = "PgDn",
        ["<INSERT>"] = "Ins",
        ["<F1>"] = "󱊫",
        ["<F2>"] = "󱊬",
        ["<F3>"] = "󱊭",
        ["<F4>"] = "󱊮",
        ["<F5>"] = "󱊯",
        ["<F6>"] = "󱊰",
        ["<F7>"] = "󱊱",
        ["<F8>"] = "󱊲",
        ["<F9>"] = "󱊳",
        ["<F10>"] = "󱊴",
        ["<F11>"] = "󱊵",
        ["<F12>"] = "󱊶",
        ["CTRL"] = "Ctrl",
        ["ALT"] = "Alt",
        ["SUPER"] = "󰘳",
    },
}


---------------------	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	-------------------------

{
  debug = false, -- Enable debug logging
  proxy = nil, -- [protocol://]host[:port] Use this proxy
  allow_insecure = false, -- Allow insecure server connections

  system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
  model = 'gpt-4', -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
  temperature = 0.1, -- GPT temperature

  question_header = '## User ', -- Header to use for user questions
  answer_header = '## Copilot ', -- Header to use for AI answers
  error_header = '## Error ', -- Header to use for errors
  separator = '---', -- Separator to use in chat

  show_folds = true, -- Shows folds for sections in chat
  show_help = true, -- Shows help message as virtual lines when waiting for user input
  auto_follow_cursor = true, -- Auto-follow cursor in chat
  auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
  clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

  context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
  history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
  callback = nil, -- Callback to use when ask response is received

  -- default selection (visual or line)
  selection = function(source)
    return select.visual(source) or select.line(source)
  end,

  -- default prompts
  prompts = {
    Explain = {
      prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
    },
    Review = {
      prompt = '/COPILOT_REVIEW Review the selected code.',
      callback = function(response, source)
        -- see config.lua for implementation
      end,
    },
    Fix = {
      prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
    },
    Optimize = {
      prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
    },
    Docs = {
      prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
    },
    Tests = {
      prompt = '/COPILOT_GENERATE Please generate tests for my code.',
    },
    FixDiagnostic = {
      prompt = 'Please assist with the following diagnostic issue in file:',
      selection = select.diagnostics,
    },
    Commit = {
      prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
      selection = select.gitdiff,
    },
    CommitStaged = {
      prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
      selection = function(source)
        return select.gitdiff(source, true)
      end,
    },
  },

  -- default window options
  window = {
    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
    width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    row = nil, -- row position of the window, default is centered
    col = nil, -- column position of the window, default is centered
    title = 'Copilot Chat', -- title of chat window
    footer = nil, -- footer of chat window
    zindex = 1, -- determines if window is on top or below other floating windows
  },

  -- default mappings
  mappings = {
    complete = {
      detail = 'Use @<Tab> or /<Tab> for options.',
      insert ='<Tab>',
    },
    close = {
      normal = 'q',
      insert = '<C-c>'
    },
    reset = {
      normal ='<C-l>',
      insert = '<C-l>'
    },
    submit_prompt = {
      normal = '<CR>',
      insert = '<C-m>'
    },
    accept_diff = {
      normal = '<C-y>',
      insert = '<C-y>'
    },
    yank_diff = {
      normal = 'gy',
    },
    show_diff = {
      normal = 'gd'
    },
    show_system_prompt = {
      normal = 'gp'
    },
    show_user_selection = {
      normal = 'gs'
    },
  },
}


--------------------------------------------------------------

-- No need to copy this inside `setup()`. Will be used automatically.
{
  -- In which modes mappings from this `config` should be created
  modes = { insert = true, command = false, terminal = false },

  -- Global mappings. Each right hand side should be a pair information, a
  -- table with at least these fields (see more in |MiniPairs.map|):
  -- - <action> - one of 'open', 'close', 'closeopen'.
  -- - <pair> - two character string for pair to be used.
  -- By default pair is not inserted after `\`, quotes are not recognized by
  -- `<CR>`, `'` does not insert pair after a letter.
  -- Only parts of tables can be tweaked (others will use these defaults).
  mappings = {
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
  },
}


----------------------------------------------------------------

{
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
}


------------------------	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	--------------------------------

{
  -- labels = "abcdefghijklmnopqrstuvwxyz",
  labels = "asdfghjklqwertyuiopzxcvbnm",
  search = {
    -- search/jump in all windows
    multi_window = true,
    -- search direction
    forward = true,
    -- when `false`, find only matches in the given direction
    wrap = true,
    ---@type Flash.Pattern.Mode
    -- Each mode will take ignorecase and smartcase into account.
    -- * exact: exact match
    -- * search: regular search
    -- * fuzzy: fuzzy search
    -- * fun(str): custom function that returns a pattern
    --   For example, to only match at the beginning of a word:
    --   mode = function(str)
    --     return "\\<" .. str
    --   end,
    mode = "exact",
    -- behave like `incsearch`
    incremental = false,
    -- Excluded filetypes and custom window filters
    ---@type (string|fun(win:window))[]
    exclude = {
      "notify",
      "cmp_menu",
      "noice",
      "flash_prompt",
      function(win)
        -- exclude non-focusable windows
        return not vim.api.nvim_win_get_config(win).focusable
      end,
    },
    -- Optional trigger character that needs to be typed before
    -- a jump label can be used. It's NOT recommended to set this,
    -- unless you know what you're doing
    trigger = "",
    -- max pattern length. If the pattern length is equal to this
    -- labels will no longer be skipped. When it exceeds this length
    -- it will either end in a jump or terminate the search
    max_length = false, ---@type number|false
  },
  jump = {
    -- save location in the jumplist
    jumplist = true,
    -- jump position
    pos = "start", ---@type "start" | "end" | "range"
    -- add pattern to search history
    history = false,
    -- add pattern to search register
    register = false,
    -- clear highlight after jump
    nohlsearch = false,
    -- automatically jump when there is only one match
    autojump = false,
    -- You can force inclusive/exclusive jumps by setting the
    -- `inclusive` option. By default it will be automatically
    -- set based on the mode.
    inclusive = nil, ---@type boolean?
    -- jump position offset. Not used for range jumps.
    -- 0: default
    -- 1: when pos == "end" and pos < current position
    offset = nil, ---@type number
  },
  label = {
    -- allow uppercase labels
    uppercase = true,
    -- add any labels with the correct case here, that you want to exclude
    exclude = "",
    -- add a label for the first match in the current window.
    -- you can always jump to the first match with `<CR>`
    current = true,
    -- show the label after the match
    after = true, ---@type boolean|number[]
    -- show the label before the match
    before = false, ---@type boolean|number[]
    -- position of the label extmark
    style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
    -- flash tries to re-use labels that were already assigned to a position,
    -- when typing more characters. By default only lower-case labels are re-used.
    reuse = "lowercase", ---@type "lowercase" | "all" | "none"
    -- for the current window, label targets closer to the cursor first
    distance = true,
    -- minimum pattern length to show labels
    -- Ignored for custom labelers.
    min_pattern_length = 0,
    -- Enable this to use rainbow colors to highlight labels
    -- Can be useful for visualizing Treesitter ranges.
    rainbow = {
      enabled = false,
      -- number between 1 and 9
      shade = 5,
    },
    -- With `format`, you can change how the label is rendered.
    -- Should return a list of `[text, highlight]` tuples.
    ---@class Flash.Format
    ---@field state Flash.State
    ---@field match Flash.Match
    ---@field hl_group string
    ---@field after boolean
    ---@type fun(opts:Flash.Format): string[][]
    format = function(opts)
      return { { opts.match.label, opts.hl_group } }
    end,
  },
  highlight = {
    -- show a backdrop with hl FlashBackdrop
    backdrop = true,
    -- Highlight the search matches
    matches = true,
    -- extmark priority
    priority = 5000,
    groups = {
      match = "FlashMatch",
      current = "FlashCurrent",
      backdrop = "FlashBackdrop",
      label = "FlashLabel",
    },
  },
  -- action to perform when picking a label.
  -- defaults to the jumping logic depending on the mode.
  ---@type fun(match:Flash.Match, state:Flash.State)|nil
  action = nil,
  -- initial pattern to use when opening flash
  pattern = "",
  -- When `true`, flash will try to continue the last search
  continue = false,
  -- Set config to a function to dynamically change the config
  config = nil, ---@type fun(opts:Flash.Config)|nil
  -- You can override the default options for a specific mode.
  -- Use it with `require("flash").jump({mode = "forward"})`
  ---@type table<string, Flash.Config>
  modes = {
    -- options used when flash is activated through
    -- a regular search with `/` or `?`
    search = {
      -- when `true`, flash will be activated during regular search by default.
      -- You can always toggle when searching with `require("flash").toggle()`
      enabled = false,
      highlight = { backdrop = false },
      jump = { history = true, register = true, nohlsearch = true },
      search = {
        -- `forward` will be automatically set to the search direction
        -- `mode` is always set to `search`
        -- `incremental` is set to `true` when `incsearch` is enabled
      },
    },
    -- options used when flash is activated through
    -- `f`, `F`, `t`, `T`, `;` and `,` motions
    char = {
      enabled = true,
      -- dynamic configuration for ftFT motions
      config = function(opts)
        -- autohide flash when in operator-pending mode
        opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

        -- disable jump labels when not enabled, when using a count,
        -- or when recording/executing registers
        opts.jump_labels = opts.jump_labels
          and vim.v.count == 0
          and vim.fn.reg_executing() == ""
          and vim.fn.reg_recording() == ""

        -- Show jump labels only in operator-pending mode
        -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
      end,
      -- hide after jump when not using jump labels
      autohide = false,
      -- show jump labels
      jump_labels = false,
      -- set to `false` to use the current line only
      multi_line = true,
      -- When using jump labels, don't use these keys
      -- This allows using those keys directly after the motion
      label = { exclude = "hjkliardc" },
      -- by default all keymaps are enabled, but you can disable some of them,
      -- by removing them from the list.
      -- If you rather use another key, you can map them
      -- to something else, e.g., { [";"] = "L", [","] = H }
      keys = { "f", "F", "t", "T", ";", "," },
      ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
      -- The direction for `prev` and `next` is determined by the motion.
      -- `left` and `right` are always left and right.
      char_actions = function(motion)
        return {
          [";"] = "next", -- set to `right` to always go right
          [","] = "prev", -- set to `left` to always go left
          -- clever-f style
          [motion:lower()] = "next",
          [motion:upper()] = "prev",
          -- jump2d style: same case goes next, opposite case goes prev
          -- [motion] = "next",
          -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
        }
      end,
      search = { wrap = false },
      highlight = { backdrop = true },
      jump = { register = false },
    },
    -- options used for treesitter selections
    -- `require("flash").treesitter()`
    treesitter = {
      labels = "abcdefghijklmnopqrstuvwxyz",
      jump = { pos = "range" },
      search = { incremental = false },
      label = { before = true, after = true, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
    treesitter_search = {
      jump = { pos = "range" },
      search = { multi_window = true, wrap = true, incremental = false },
      remote_op = { restore = true },
      label = { before = true, after = true, style = "inline" },
    },
    -- options used for remote flash
    remote = {
      remote_op = { restore = true, motion = true },
    },
  },
  -- options for the floating window that shows the prompt,
  -- for regular jumps
  prompt = {
    enabled = true,
    prefix = { { "⚡", "FlashPromptIcon" } },
    win_config = {
      relative = "editor",
      width = 1, -- when <=1 it's a percentage of the editor width
      height = 1,
      row = -1, -- when negative it's an offset from the bottom
      col = 0, -- when negative it's an offset from the right
      zindex = 1000,
    },
  },
  -- options for remote operator pending mode
  remote_op = {
    -- restore window views and cursor position
    -- after doing a remote operation
    restore = false,
    -- For `jump.pos = "range"`, this setting is ignored.
    -- `true`: always enter a new motion when doing a remote operation
    -- `false`: use the window's cursor position and jump target
    -- `nil`: act as `true` for remote windows, `false` for the current window
    motion = false,
  },
}


----------------------------------------------------------------

require("cyberdream").setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italics comments
    italic_comments = false,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,

    -- Modern borderless telescope theme
    borderless_telescope = true,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    theme = {
        variant = "default", -- use "light" for the light variant
        highlights = {
            -- Highlight groups to override, adding new groups is also possible
            -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

            -- Example:
            Comment = { fg = "#696969", bg = "NONE", italic = true },

            -- Complete list can be found in `lua/cyberdream/theme.lua`
        },

        -- Override a color entirely
        colors = {
            -- For a list of colors see `lua/cyberdream/colours.lua`
            -- Example:
            bg = "#000000",
            green = "#00ff00",
            magenta = "#ff00ff",
        },
    },
})


---------------------------------------------------------------------------------------------


require("codesnap").setup({
  -- The save_path must be ends with .png, unless when you specified a directory path,
  -- CodeSnap will append an auto-generated filename to the specified directory path
  -- For example:
  -- save_path = "~/Pictures"
  -- parsed: "~/Pictures/CodeSnap_y-m-d_at_h:m:s.png"
  -- save_path = "~/Pictures/foo.png"
  -- parsed: "~/Pictures/foo.png"
  save_path = ...
  has_breadcrumbs = true
  show_workspace = true
  breadcrumbs_separator = "👉"
  has_line_number = true,
  g_theme = "default"
  bg_color = "#535c68"
  watermark = ""
})

-------------------------------------	===================================	----------------------------

{
    date_format = "%d.%m.%Y",
    virtual_style = "right",
    views = {
        window = window_view,
        virtual = virtual_view,
        default = window_view,
    },
    merge_consecutive = false,
    max_summary_width = 30,
    colors = nil,
    commit_detail_view = "vsplit",
    format_fn = formats.commit_date_author_fn,
    mappings = {
        commit_info = "i",
        stack_push = "<TAB>",
        stack_pop = "<BS>",
        show_commit = "<CR>",
        close = { "<esc>", "q" },
    }
}

-------------------------------------------

require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})

local default_config = {
    -- Priority of the lightbulb for all handlers except float.
    priority = 10,

    -- Whether or not to hide the lightbulb when the buffer is not focused.
    -- Only works if configured during NvimLightbulb.setup
    hide_in_unfocused_buffer = true,

    -- Whether or not to link the highlight groups automatically.
    -- Default highlight group links:
    --   LightBulbSign -> DiagnosticSignInfo
    --   LightBulbFloatWin -> DiagnosticFloatingInfo
    --   LightBulbVirtualText -> DiagnosticVirtualTextInfo
    --   LightBulbNumber -> DiagnosticSignInfo
    --   LightBulbLine -> CursorLine
    -- Only works if configured during NvimLightbulb.setup
    link_highlights = true,

    -- Perform full validation of configuration.
    -- Available options: "auto", "always", "never"
    --   "auto" only performs full validation in NvimLightbulb.setup.
    --   "always" performs full validation in NvimLightbulb.update_lightbulb as well.
    --   "never" disables config validation.
    validate_config = "auto",

    -- Code action kinds to observe.
    -- To match all code actions, set to `nil`.
    -- Otherwise, set to a table of kinds.
    -- Example: { "quickfix", "refactor.rewrite" }
    -- See: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#codeActionKind
    action_kinds = nil,

    -- Configuration for various handlers:
    -- 1. Sign column.
    sign = {
        enabled = true,
        -- Text to show in the sign column.
        -- Must be between 1-2 characters.
        text = "💡",
        -- Highlight group to highlight the sign column text.
        hl = "LightBulbSign",
    },

    -- 2. Virtual text.
    virtual_text = {
        enabled = false,
        -- Text to show in the virt_text.
        text = "💡",
        -- Position of virtual text given to |nvim_buf_set_extmark|.
        -- Can be a number representing a fixed column (see `virt_text_pos`).
        -- Can be a string representing a position (see `virt_text_win_col`).
        pos = "eol",
        -- Highlight group to highlight the virtual text.
        hl = "LightBulbVirtualText",
        -- How to combine other highlights with text highlight.
        -- See `hl_mode` of |nvim_buf_set_extmark|.
        hl_mode = "combine",
    },

    -- 3. Floating window.
    float = {
        enabled = false,
        -- Text to show in the floating window.
        text = "💡",
        -- Highlight group to highlight the floating window.
        hl = "LightBulbFloatWin",
        -- Window options.
        -- See |vim.lsp.util.open_floating_preview| and |nvim_open_win|.
        -- Note that some options may be overridden by |open_floating_preview|.
        win_opts = {
            focusable = false,
        },
    },

    -- 4. Status text.
    -- When enabled, will allow using |NvimLightbulb.get_status_text|
    -- to retrieve the configured text.
    status_text = {
        enabled = false,
        -- Text to set if a lightbulb is available.
        text = "💡",
        -- Text to set if a lightbulb is unavailable.
        text_unavailable = "",
    },

    -- 5. Number column.
    number = {
        enabled = false,
        -- Highlight group to highlight the number column if there is a lightbulb.
        hl = "LightBulbNumber",
    },

    -- 6. Content line.
    line = {
        enabled = false,
        -- Highlight group to highlight the line if there is a lightbulb.
        hl = "LightBulbLine",
    },

    -- Autocmd configuration.
    -- If enabled, automatically defines an autocmd to show the lightbulb.
    -- If disabled, you will have to manually call |NvimLightbulb.update_lightbulb|.
    -- Only works if configured during NvimLightbulb.setup
    autocmd = {
        -- Whether or not to enable autocmd creation.
        enabled = false,
        -- See |updatetime|.
        -- Set to a negative value to avoid setting the updatetime.
        updatetime = 200,
        -- See |nvim_create_autocmd|.
        events = { "CursorHold", "CursorHoldI" },
        -- See |nvim_create_autocmd| and |autocmd-pattern|.
        pattern = { "*" },
    },

    -- Scenarios to not show a lightbulb.
    ignore = {
        -- LSP client names to ignore.
        -- Example: {"null-ls", "lua_ls"}
        clients = {},
        -- Filetypes to ignore.
        -- Example: {"neo-tree", "lua"}
        ft = {},
        -- Ignore code actions without a `kind` like refactor.rewrite, quickfix.
        actions_without_kind = false,
    },
}


----------------------------------------------

require("actions-preview").setup {
  -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
  diff = {
    ctxlen = 3,
  },

  -- priority list of external command to highlight diff
  -- disabled by defalt, must be set by yourself
  highlight_command = {
    -- require("actions-preview.highlight").delta(),
    -- require("actions-preview.highlight").diff_so_fancy(),
    -- require("actions-preview.highlight").diff_highlight(),
  },

  -- priority list of preferred backend
  backend = { "telescope", "nui" },

  -- options related to telescope.nvim
  telescope = vim.tbl_extend(
    "force",
    -- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
    require("telescope.themes").get_dropdown(),
    -- a table for customizing content
    {
      -- a function to make a table containing the values to be displayed.
      -- fun(action: Action): { title: string, client_name: string|nil }
      make_value = nil,

      -- a function to make a function to be used in `display` of a entry.
      -- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
      -- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
      make_make_display = nil,
    }
  ),

  -- options for nui.nvim components
  nui = {
    -- component direction. "col" or "row"
    dir = "col",
    -- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
    keymap = nil,
    -- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
    layout = {
      position = "50%",
      size = {
        width = "60%",
        height = "90%",
      },
      min_width = 40,
      min_height = 10,
      relative = "editor",
    },
    -- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
    preview = {
      size = "60%",
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
    -- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
    select = {
      size = "40%",
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
  },
}

-----------------------------------------------------

require('goto-preview').setup {
  width = 120; -- Width of the floating window
  height = 15; -- Height of the floating window
  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
  default_mappings = false; -- Bind default mappings
  debug = false; -- Print debug information
  opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
  post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
  post_close_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
  references = { -- Configure the telescope UI for slowing the references cycling window.
    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
  };
  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  focus_on_open = true; -- Focus the floating window when opening it.
  dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
  stack_floating_preview_windows = true, -- Whether to nest floating windows
  preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
}


----------------------------------------------------------------------------

{
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
        { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
        { "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
        { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
        { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
}


--------------------------------------------


{
    -- Save modified buffer(s) when moving to mux
    -- nil - Don't save (default)
    -- 'current' - Only save the current modified buffer
    -- 'all' - Save all the buffers
    auto_save = nil,

    -- Disable navigation when the current mux pane is zoomed in
    disable_on_zoom = false,

    -- Multiplexer to use
    -- 'auto' - Chooses mux based on priority (default)
    -- table - Custom mux to use
    mux = 'auto'
}

vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')



-------------------	******************************************************	---------------------

vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })


--------------------------------------------------

let g:auto_session_{hook_name}_cmds = ["{hook_command1}", "{hook_command2}"]


local SymbolKind = vim.lsp.protocol.SymbolKind

---@type UserOpts
require('symbol-usage').setup({
  ---@type table<string, any> `nvim_set_hl`-like options for highlight virtual text
  hl = { link = 'Comment' },
  ---@type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
  kinds = { SymbolKind.Function, SymbolKind.Method },
  ---Additional filter for kinds. Recommended use in the filetypes override table.
  ---fiterKind: function(data: { symbol:table, parent:table, bufnr:integer }): boolean
  ---`symbol` and `parent` is an item from `textDocument/documentSymbol` request
  ---See: #filter-kinds
  ---@type table<lsp.SymbolKind, filterKind[]>
  kinds_filter = {},
  ---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
  vt_position = 'above',
  ---Text to display when request is pending. If `false`, extmark will not be
  ---created until the request is finished. Recommended to use with `above`
  ---vt_position to avoid "jumping lines".
  ---@type string|table|false
  request_pending_text = 'loading...',
  ---The function can return a string to which the highlighting group from `opts.hl` is applied.
  ---Alternatively, it can return a table of tuples of the form `{ { text, hl_group }, ... }`` - in this case the specified groups will be applied.
  ---If `vt_position` is 'signcolumn', then only a 1-2 length string or a `{{ icon, hl_group }}` table is expected.
  ---See `#format-text-examples`
  ---@type function(symbol: Symbol): string|table Symbol{ definition = integer|nil, implementation = integer|nil, references = integer|nil }
  -- text_format = function(symbol) end,
  references = { enabled = true, include_declaration = false },
  definition = { enabled = false },
  implementation = { enabled = false },
  ---@type { lsp?: string[], filetypes?: string[], cond?: function[] } Disables `symbol-usage.nvim' for specific LSPs, filetypes, or on custom conditions.
  ---The function in the `cond` list takes an argument `bufnr` and returns a boolean. If it returns true, `symbol-usage` will not run in that buffer.
  disable = { lsp = {}, filetypes = {}, cond = {} },
  ---@type UserOpts[] See default overridings in `lua/symbol-usage/langs.lua`
  -- filetypes = {},
  ---@type 'start'|'end' At which position of `symbol.selectionRange` the request to the lsp server should start. Default is `end` (try changing it to `start` if the symbol counting is not correct).
  symbol_request_pos = 'end', -- Recommended redefine only in `filetypes` override table
})


--------------------------------------------

require("live-command").setup {
  defaults = {
    enable_highlighting = true,
    inline_highlighting = true,
    hl_groups = {
      insertion = "DiffAdd",
      deletion = "DiffDelete",
      change = "DiffChange",
    },
  },
}

----------------------------------------------------------

local default_config = {
  client = "curl",
  env_file = ".env",
  env_pattern = "\\.env$",
  env_edit_command = "tabedit",
  encode_url = true,
  skip_ssl_verification = false,
  custom_dynamic_variables = {},
  logs = {
    level = "info",
    save = true,
  },
  result = {
    split = {
      horizontal = false,
      in_place = false,
      stay_in_current_window_after_split = true,
    },
    behavior = {
      decode_url = true,
      show_info = {
        url = true,
        headers = true,
        http_info = true,
        curl_command = true,
      },
      statistics = {
        enable = true,
        ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
        stats = {
          { "total_time", title = "Time taken:" },
          { "size_download_t", title = "Download size:" },
        },
      },
      formatters = {
        json = "jq",
        html = function(body)
          if vim.fn.executable("tidy") == 0 then
            return body, { found = false, name = "tidy" }
          end
          local fmt_body = vim.fn.system({
            "tidy",
            "-i",
            "-q",
            "--tidy-mark",      "no",
            "--show-body-only", "auto",
            "--show-errors",    "0",
            "--show-warnings",  "0",
            "-",
          }, body):gsub("\n$", "")

          return fmt_body, { found = true, name = "tidy" }
        end,
      },
    },
    keybinds = {
      buffer_local = true,
      prev = "H",
      next = "L",
    },
  },
  highlight = {
    enable = true,
    timeout = 750,
  },
  ---Example:
  ---
  ---```lua
  ---keybinds = {
  ---  {
  ---    "<localleader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
  ---  },
  ---  {
  ---    "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
  ---  },
  ---}
  ---
  ---```
  ---@see vim.keymap.set
  keybinds = {},
}


----------------------------------------------

{
  glow_path = "", -- will be filled automatically with your glow bin in $PATH, if any
  install_path = "~/.local/bin", -- default path for installing glow binary
  border = "shadow", -- floating window border config
  style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
  pager = false,
  width = 80,
  height = 100,
  width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 0.7,
}


---------------------------------------------------------------------------------------

  -- default mapping
  maps = {
    close_view = '<C-e>',
    send_qf = '<C-q>',
    save = '<C-s>',
    jump_to_list = '<C-w>k',
    jump_to_preview = '<C-w>j',
    prev = '<C-p>',
    next = '<C-n>',
    pageup = '<C-b>',
    pagedown = '<C-f>',
    confirm = '<C-o>',
    split = '<C-s>',
    vsplit = '<C-v>',
    tabnew = '<C-t>',
  }

  -- default icons for panel
  -- will be tbl_deep_extend() if you override any of those
  local icons = {
    panel_icons = {
      section_separator = '─', --'',
      line_num_left = ':', --'',
      line_num_right = '', --',

      range_left = '', --'',
      range_right = '',
      inner_node = '', --├○',
      folded = '◉',
      unfolded = '○',

      outer_node = '', -- '╰○',
      bracket_left = '', -- ⟪',
      bracket_right = '', -- '⟫',
    },
    syntax_icons = {
      var = ' ', -- "👹", -- Vampaire
        method = 'ƒ ', --  "🍔", -- mac
        ['function'] = ' ', -- "🤣", -- Fun
        ['arrow_function'] = ' ', -- "🤣", -- Fun
          parameter = '', -- Pi
            associated = '🤝',
      namespace = '🚀',
      type = ' ',
      field = '🏈',
      interface = '',
      module = '📦',
      flag = '🎏',
    }
  }

  --
  require('guihua.maps').setup({
  maps = {
    close_view = '<C-x>',
  }
  })
  
  
--------------------------------------------------------------------

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- disables mark tracking for specific buftypes. default {}
  excluded_buftypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}

----------------------------------------------------------------

local ColorInput = require("ccc.input")
local convert = require("ccc.utils.convert")

local RgbHslCmykInput = setmetatable({
    name = "RGB/HSL/CMYK",
    max = { 1, 1, 1, 360, 1, 1, 1, 1, 1, 1 },
    min = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    delta = { 1 / 255, 1 / 255, 1 / 255, 1, 0.01, 0.01, 0.005, 0.005, 0.005, 0.005 },
    bar_name = { "R", "G", "B", "H", "S", "L", "C", "M", "Y", "K" },
}, { __index = ColorInput })

function RgbHslCmykInput.format(n, i)
    if i <= 3 then
        -- RGB
        n = n * 255
    elseif i == 5 or i == 6 then
        -- S or L of HSL
        n = n * 100
    elseif i >= 7 then
        -- CMYK
        return ("%5.1f%%"):format(math.floor(n * 200) / 2)
    end
    return ("%6d"):format(n)
end

function RgbHslCmykInput.from_rgb(RGB)
    local HSL = convert.rgb2hsl(RGB)
    local CMYK = convert.rgb2cmyk(RGB)
    local R, G, B = unpack(RGB)
    local H, S, L = unpack(HSL)
    local C, M, Y, K = unpack(CMYK)
    return { R, G, B, H, S, L, C, M, Y, K }
end

function RgbHslCmykInput.to_rgb(value)
    return { value[1], value[2], value[3] }
end

function RgbHslCmykInput:_set_rgb(RGB)
    self.value[1] = RGB[1]
    self.value[2] = RGB[2]
    self.value[3] = RGB[3]
end

function RgbHslCmykInput:_set_hsl(HSL)
    self.value[4] = HSL[1]
    self.value[5] = HSL[2]
    self.value[6] = HSL[3]
end

function RgbHslCmykInput:_set_cmyk(CMYK)
    self.value[7] = CMYK[1]
    self.value[8] = CMYK[2]
    self.value[9] = CMYK[3]
    self.value[10] = CMYK[4]
end

function RgbHslCmykInput:callback(index, new_value)
    self.value[index] = new_value
    local v = self.value
    if index <= 3 then
        local RGB = { v[1], v[2], v[3] }
        local HSL = convert.rgb2hsl(RGB)
        local CMYK = convert.rgb2cmyk(RGB)
        self:_set_hsl(HSL)
        self:_set_cmyk(CMYK)
    elseif index <= 6 then
        local HSL = { v[4], v[5], v[6] }
        local RGB = convert.hsl2rgb(HSL)
        local CMYK = convert.rgb2cmyk(RGB)
        self:_set_rgb(RGB)
        self:_set_cmyk(CMYK)
    else
        local CMYK = { v[7], v[8], v[9], v[10] }
        local RGB = convert.cmyk2rgb(CMYK)
        local HSL = convert.rgb2hsl(RGB)
        self:_set_rgb(RGB)
        self:_set_hsl(HSL)
    end
end

local ccc = require("ccc")
ccc.setup({
    inputs = {
        RgbHslCmykInput,
    },
})

----------------------------------------------------

require('smart-splits').setup({
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = { 'NvimTree' },
  -- the default number of lines/columns to resize by at a time
  default_amount = 3,
  -- Desired behavior when your cursor is at an edge and you
  -- are moving towards that same edge:
  -- 'wrap' => Wrap to opposite side
  -- 'split' => Create a new split in the desired direction
  -- 'stop' => Do nothing
  -- function => You handle the behavior yourself
  -- NOTE: If using a function, the function will be called with
  -- a context object with the following fields:
  -- {
  --    mux = {
  --      type:'tmux'|'wezterm'|'kitty'
  --      current_pane_id():number,
  --      is_in_session(): boolean
  --      current_pane_is_zoomed():boolean,
  --      -- following methods return a boolean to indicate success or failure
  --      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
  --      next_pane(direction:'left'|'right'|'up'|'down'):boolean
  --      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
  --      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
  --    },
  --    direction = 'left'|'right'|'up'|'down',
  --    split(), -- utility function to split current Neovim pane in the current direction
  --    wrap(), -- utility function to wrap to opposite Neovim pane
  -- }
  -- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
  -- multiplexer, as there is no way to determine layout via the CLI
  at_edge = 'wrap',
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- whether the cursor should follow the buffer when swapping
  -- buffers by default; it can also be controlled by passing
  -- `{ move_cursor = true }` or `{ move_cursor = false }`
  -- when calling the Lua function.
  cursor_follows_swapped_bufs = false,
  -- resize mode options
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = '<ESC>',
    -- keys to use for moving in resize mode
    -- in order of left, down, up' right
    resize_keys = { 'h', 'j', 'k', 'l' },
    -- set to true to silence the notifications
    -- when entering/exiting persistent resize mode
    silent = false,
    -- must be functions, they will be executed when
    -- entering or exiting the resize mode
    hooks = {
      on_enter = nil,
      on_leave = nil,
    },
  },
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  -- enable or disable a multiplexer integration;
  -- automatically determined, unless explicitly disabled or set,
  -- by checking the $TERM_PROGRAM environment variable,
  -- and the $KITTY_LISTEN_ON environment variable for Kitty
  multiplexer_integration = nil,
  -- disable multiplexer navigation if current multiplexer pane is zoomed
  -- this functionality is only supported on tmux and Wezterm due to kitty
  -- not having a way to check if a pane is zoomed
  disable_multiplexer_nav_when_zoomed = true,
  -- Supply a Kitty remote control password if needed,
  -- or you can also set vim.g.smart_splits_kitty_password
  -- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
  kitty_password = nil,
  -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
  log_level = 'info',
})


-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)


-- resizing splits
-- amount defaults to 3 if not specified
-- use absolute values, no + or -
-- the functions also check for a range,
-- so for example if you bind `<A-h>` to `resize_left`,
-- then `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
require('smart-splits').resize_up(amount)
require('smart-splits').resize_down(amount)
require('smart-splits').resize_left(amount)
require('smart-splits').resize_right(amount)
-- moving between splits
-- You can override config.at_edge and
-- config.move_cursor_same_row via opts
-- See Configuration.
require('smart-splits').move_cursor_up({ same_row = boolean, at_edge = 'wrap' | 'split' | 'stop' })
require('smart-splits').move_cursor_down()
require('smart-splits').move_cursor_left()
require('smart-splits').move_cursor_right()
require('smart-splits').move_cursor_previous()
-- Swapping buffers directionally with the window to the specified direction
require('smart-splits').swap_buf_up()
require('smart-splits').swap_buf_down()
require('smart-splits').swap_buf_left()
require('smart-splits').swap_buf_right()
-- the buffer swap functions can also take an `opts` table to override the
-- default behavior of whether or not the cursor follows the buffer
require('smart-splits').swap_buf_right({ move_cursor = true })
-- persistent resize mode
-- temporarily remap your configured resize keys to
-- smart resize left, down, up, and right, respectively,
-- press <ESC> to stop resize mode (unless you've set a different key in config)
-- resize keys also accept a range, e.e. pressing `5j` will resize down 5 times the default_amount
require('smart-splits').start_resize_mode()

----------------------------------------------------------------------------------------


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


------------------------------------------------------

{
    auto_enable = {
        description = [[Enable nvim-hlslens automatically]],
        default = true
    },
    enable_incsearch = {
        description = [[When `incsearch` option is on and enable_incsearch is true, add lens
            for the current matched instance]],
        default = true
    },
    calm_down = {
        description = [[If calm_down is true, clear all lens and highlighting When the cursor is
            out of the position range of the matched instance or any texts are changed]],
        default = false,
    },
    nearest_only = {
        description = [[Only add lens for the nearest matched instance and ignore others]],
        default = false
    },
    nearest_float_when = {
        description = [[When to open the floating window for the nearest lens.
            'auto': floating window will be opened if room isn't enough for virtual text;
            'always': always use floating window instead of virtual text;
            'never': never use floating window for the nearest lens]],
        default = 'auto',
    },
    float_shadow_blend = {
        description = [[Winblend of the nearest floating window. `:h winbl` for more details]],
        default = 50,
    },
    virt_priority = {
        description = [[Priority of virtual text, set it lower to overlay others.
        `:h nvim_buf_set_extmark` for more details]],
        default = 100,
    },
    override_lens  = {
        description = [[Hackable function for customizing the lens. If you like hacking, you
            should search `override_lens` and inspect the corresponding source code.
            There's no guarantee that this function will not be changed in the future. If it is
            changed, it will be listed in the CHANGES file.
            @param render table an inner module for hlslens, use `setVirt` to set virtual text
            @param splist table (1,1)-indexed position
            @param nearest boolean whether nearest lens
            @param idx number nearest index in the plist
            @param relIdx number relative index, negative means before current position,
                                  positive means after
        ]],
        default = nil
    },
}


----------------------------------------------------------------


require("scrollbar").setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
        text = " ",
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color = nil,
        color_nr = nil, -- cterm
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 6,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
})


-------------------------------

local packer = require('packer')
packer.util = require('packer.util')

packer.init({
  ensure_dependencies = true, -- Should packer install plugin dependencies?
  snapshot = nil, -- Name of the snapshot you would like to load at startup
  snapshot_path = packer.util.join_paths(vim.fn.stdpath('cache'), 'packer.nvim'), -- Default save directory for snapshots
  package_root  = packer.util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  compile_path  = packer.util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
  plugin_package = 'packer', -- The default package for plugins
  max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
  auto_clean = true, -- During sync(), remove unused plugins
  compile_on_sync = true, -- During sync(), run packer.compile()
  disable_commands = false, -- Disable creating commands
  opt_default = false, -- Default to using opt (as opposed to start) plugins
  transitive_opt = true, -- Make dependencies of opt plugins also opt by default
  transitive_disable = true, -- Automatically disable dependencies of disabled plugins
  auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
  preview_updates = false, -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      update         = 'pull --ff-only --progress --rebase=false --force',
      install        = 'clone --depth %i --no-single-branch --progress',
      fetch          = 'fetch --depth 999999 --progress --force',
      checkout       = 'checkout %s --',
      update_branch  = 'merge --ff-only @{u}',
      current_branch = 'branch --show-current',
      diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt       = '%%h %%s (%%cr)',
      get_rev        = 'rev-parse --short HEAD',
      get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules     = 'submodule update --init --recursive --progress'
    },
    depth = 1, -- Git clone depth
    clone_timeout = 60, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    compact = false, -- If true, fold updates results by default
    open_fn  = nil, -- An optional function to open a window for packer's display
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_update = 'u', -- only in preview
      continue = 'c', -- only in preview
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
  },
  luarocks = {
    python_cmd = 'python' -- Set the python command to use for running hererocks
  },
  log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  profile = {
    enable = false,
    threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  },
  autoremove = false, -- Remove disabled or unused plugins without prompting the user
})



-------------------------------------------------------------

require("inc_rename").setup {
 -- the name of the command
  cmd_name = "IncRename",
   -- the highlight group used for highlighting the identifier's new name
  hl_group = "Substitute",
   -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
  preview_empty_name = false,
   -- whether to display a `Renamed m instances in n files` message after a rename operation
  show_message = true,
   -- whether to save the "IncRename" command in the commandline history (set to false to prevent issues with
   -- navigating to older entries that may arise due to the behavior of command preview)
  save_in_cmdline_history = true,
   -- the type of the external input buffer to use (the only supported value is currently "dressing")
  input_buffer_type = nil,
   -- callback to run after renaming, receives the result table (from LSP handler) as an argument
  post_hook = nil,
}


----------------------------------	$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$	--------------------------------------

-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
  theme = {
    -- this highlight is used to override other highlights
    -- you can take advantage of its `bg` and set a background throughout your winbar
    -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
    normal = { fg = "#c0caf5" },

    -- these highlights correspond to symbols table from config
    ellipsis = { fg = "#737aa2" },
    separator = { fg = "#737aa2" },
    modified = { fg = "#737aa2" },

    -- these highlights represent the _text_ of three main parts of barbecue
    dirname = { fg = "#737aa2" },
    basename = { bold = true },
    context = {},

    -- these highlights are used for context/navic icons
    context_file = { fg = "#ac8fe4" },
    context_module = { fg = "#ac8fe4" },
    context_namespace = { fg = "#ac8fe4" },
    context_package = { fg = "#ac8fe4" },
    context_class = { fg = "#ac8fe4" },
    context_method = { fg = "#ac8fe4" },
    context_property = { fg = "#ac8fe4" },
    context_field = { fg = "#ac8fe4" },
    context_constructor = { fg = "#ac8fe4" },
    context_enum = { fg = "#ac8fe4" },
    context_interface = { fg = "#ac8fe4" },
    context_function = { fg = "#ac8fe4" },
    context_variable = { fg = "#ac8fe4" },
    context_constant = { fg = "#ac8fe4" },
    context_string = { fg = "#ac8fe4" },
    context_number = { fg = "#ac8fe4" },
    context_boolean = { fg = "#ac8fe4" },
    context_array = { fg = "#ac8fe4" },
    context_object = { fg = "#ac8fe4" },
    context_key = { fg = "#ac8fe4" },
    context_null = { fg = "#ac8fe4" },
    context_enum_member = { fg = "#ac8fe4" },
    context_struct = { fg = "#ac8fe4" },
    context_event = { fg = "#ac8fe4" },
    context_operator = { fg = "#ac8fe4" },
    context_type_parameter = { fg = "#ac8fe4" },
  },
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})


-----------------------------------------------------------------

local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}


----------------------------------------------

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local no_really = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown", "text" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("really")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col + 1,
                        source = "no-really",
                        message = "Don't use 'really!'",
                        severity = vim.diagnostic.severity.WARN,
                    })
                end
            end
            return diagnostics
        end,
    },
}

null_ls.register(no_really)

local markdownlint = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown" },
    -- null_ls.generator creates an async source
    -- that spawns the command with the given arguments and options
    generator = null_ls.generator({
        command = "markdownlint",
        args = { "--stdin" },
        to_stdin = true,
        from_stderr = true,
        -- choose an output format (raw, json, or line)
        format = "line",
        check_exit_code = function(code, stderr)
            local success = code <= 1

            if not success then
                -- can be noisy for things that run often (e.g. diagnostics), but can
                -- be useful for things that run on demand (e.g. formatting)
                print(stderr)
            end

            return success
        end,
        -- use helpers to parse the output from string matchers,
        -- or parse it manually with a function
        on_output = helpers.diagnostics.from_patterns({
            {
                pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
                groups = { "row", "col", "message" },
            },
            {
                pattern = [[:(%d+) [%w-/]+ (.*)]],
                groups = { "row", "message" },
            },
        }),
    }),
}

null_ls.register(markdownlint)


-----------------	#####################################	------------------------


require('hlslens').setup({
	override_lens = function(render, posList, nearest, idx, relIdx)
        local sfw = vim.v.searchforward == 1
        local indicator, text, chunks
        local absRelIdx = math.abs(relIdx)
        if absRelIdx > 1 then
            indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
        elseif absRelIdx == 1 then
            indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
        else
            indicator = ''
        end

        local lnum, col = unpack(posList[idx])
        if nearest then
            local cnt = #posList
            if indicator ~= '' then
                text = ('[%s %d/%d]'):format(indicator, idx, cnt)
            else
                text = ('[%d/%d]'):format(idx, cnt)
            end
            chunks = {{' '}, {text, 'HlSearchLensNear'}}
        else
            text = ('[%s %d]'):format(indicator, idx)
            chunks = {{' '}, {text, 'HlSearchLens'}}
        end
        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
    end
	
	auto_enable = {
        description = [[Enable nvim-hlslens automatically]],
        default = true
    },
    enable_incsearch = {
        description = [[When `incsearch` option is on and enable_incsearch is true, add lens
            for the current matched instance]],
        default = true
    },
    calm_down = {
        description = [[If calm_down is true, clear all lens and highlighting When the cursor is
            out of the position range of the matched instance or any texts are changed]],
        default = false,
    },
    nearest_only = {
        description = [[Only add lens for the nearest matched instance and ignore others]],
        default = false
    },
    nearest_float_when = {
        description = [[When to open the floating window for the nearest lens.
            'auto': floating window will be opened if room isn't enough for virtual text;
            'always': always use floating window instead of virtual text;
            'never': never use floating window for the nearest lens]],
        default = 'auto',
    },
    float_shadow_blend = {
        description = [[Winblend of the nearest floating window. `:h winbl` for more details]],
        default = 50,
    },
    virt_priority = {
        description = [[Priority of virtual text, set it lower to overlay others.
        `:h nvim_buf_set_extmark` for more details]],
        default = 100,
    },
    override_lens  = {
        description = [[Hackable function for customizing the lens. If you like hacking, you
            should search `override_lens` and inspect the corresponding source code.
            There's no guarantee that this function will not be changed in the future. If it is
            changed, it will be listed in the CHANGES file.
            @param render table an inner module for hlslens, use `setVirt` to set virtual text
            @param splist table (1,1)-indexed position
            @param nearest boolean whether nearest lens
            @param idx number nearest index in the plist
            @param relIdx number relative index, negative means before current position,
                                  positive means after
        ]],
        default = nil
    },
})

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

-- run `:nohlsearch` and export results to quickfix
-- if Neovim is 0.8.0 before, remap yourself.
vim.keymap.set({'n', 'x'}, '<Leader>L', function()
    vim.schedule(function()
        if require('hlslens').exportLastSearchToQuickfix() then
            vim.cmd('cw')
        end
    end)
    return ':noh<CR>'
end, {expr = true})


--------------------------------------------------------------------------------

{
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 0, -- turn off the statusline in zen mode
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = false,
      font = "14", -- font size
    },
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
    wezterm = {
      enabled = false,
      -- can be either an absolute font size or the number of incremental steps
      font = "+4", -- (10% increase per step)
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}



---------------------------------------------------------

local dap = require('dap')

-- point dap to the installed cpptools, if you don't use mason, you'll need to change `cpptools_path`
local cpptools_path = vim.fn.stdpath("data").."/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = cpptools_path,
}

-- these mappings represent the maps that you usually use for dap. Change them according to your preference
vim.keymap.set("n", "<F1>", dap.terminate)
vim.keymap.set("n", "<F6>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F7>", dap.continue)
vim.keymap.set("n", "<F8>", dap.step_over)
vim.keymap.set("n", "<F9>", dap.step_out)
vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.pause)
vim.keymap.set("n", "<F56>", dap.down) -- <A-F8>
vim.keymap.set("n", "<F57>", dap.up) -- <A-F9>

local rr_dap = require("nvim-dap-rr")
rr_dap.setup({
    mappings = {
        -- you will probably want to change these defaults to that they match
        -- your usual debugger mappings
        continue = "<F7>",
        step_over = "<F8>",
        step_out = "<F9>",
        step_into = "<F10>",
        reverse_continue = "<F19>", -- <S-F7>
        reverse_step_over = "<F20>", -- <S-F8>
        reverse_step_out = "<F21>", -- <S-F9>
        reverse_step_into = "<F22>", -- <S-F10>
        -- instruction level stepping
        step_over_i = "<F32>", -- <C-F8>
        step_out_i = "<F33>", -- <C-F8>
        step_into_i = "<F34>", -- <C-F8>
        reverse_step_over_i = "<F44>", -- <SC-F8>
        reverse_step_out_i = "<F45>", -- <SC-F9>
        reverse_step_into_i = "<F46>", -- <SC-F10>
    }
})

dap.configurations.rust = { rr_dap.get_rust_config() }
dap.configurations.cpp = { rr_dap.get_config() }


----------------------------------------------------------------

require("codecompanion").setup({
  adapters = {
    anthropic = "anthropic",
    ollama = "ollama",
    openai = "openai",
  },
  strategies = {
    chat = "openai",
    inline = "openai",
    tools = "openai",
  },
  tools = {
    ["code_runner"] = {
      name = "Code Runner",
      description = "Run code generated by the LLM",
      enabled = true,
    },
    opts = {
      auto_submit_errors = false, -- Automatically send and submit the errors to the LLM?
      mute_errors = false, -- Hide any tool errors from being displayed in Neovim?
    },
  },
  saved_chats = {
    save_dir = vim.fn.stdpath("data") .. "/codecompanion/saved_chats", -- Path to save chats to
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
    },
    chat = { -- Options for the chat strategy
      type = "float", -- float|buffer
      show_settings = true, -- Show the model settings in the chat buffer?
      show_token_count = true, -- Show the token count for the current chat in the buffer?
      buf_options = { -- Buffer options for the chat buffer
        buflisted = false,
      },
      float_options = { -- Float window options if the type is "float"
        border = "single",
        buflisted = false,
        max_height = 0,
        max_width = 0,
        padding = 1,
      },
      win_options = { -- Window options for the chat buffer
        cursorcolumn = false,
        cursorline = false,
        foldcolumn = "0",
        linebreak = true,
        list = false,
        signcolumn = "no",
        spell = false,
        wrap = true,
      },
    },
  },
  keymaps = {
    ["<C-s>"] = "keymaps.save", -- Save the chat buffer and trigger the LLM
    ["<C-c>"] = "keymaps.close", -- Close the chat buffer
    ["q"] = "keymaps.cancel_request", -- Cancel the currently streaming request
    ["gc"] = "keymaps.clear", -- Clear the contents of the chat
    ["ga"] = "keymaps.codeblock", -- Insert a codeblock into the chat
    ["gs"] = "keymaps.save_chat", -- Save the current chat
    ["gt"] = "keymaps.add_tool", -- Add a tool to the current chat buffer
    ["]"] = "keymaps.next", -- Move to the next header in the chat
    ["["] = "keymaps.previous", -- Move to the previous header in the chat
  },
  log_level = "ERROR", -- TRACE|DEBUG|ERROR
  send_code = true, -- Send code context to the LLM? Disable to prevent leaking code outside of Neovim
  silence_notifications = false, -- Silence notifications for actions like saving saving chats?
  use_default_actions = true, -- Use the default actions in the action palette?
})


--------------------------------------------

-- :GitDevOpen moyiz/git-dev.nvim
require("git-dev").open("moyiz/git-dev.nvim")

-- :GitDevOpen derailed/k9s '{ tag = "v0.32.4" }'
require("git-dev").open("derailed/k9s", { tag = "v0.32.4" })

-- :GitDevOpen echasnovski/mini.nvim '{ branch = "stable" }' '{ ephemeral = false }'
require("git-dev").open("echasnovski/mini.nvim", { branch = "stable "}, { ephemeral = false })

-- :GitDevOpen https://git.savannah.gnu.org/git/bash.git '{}' '{ read_only = false }'
require("git-dev").open("https://git.savannah.gnu.org/git/bash.git", {}, { read_only = false })


M.config = {
  -- Whether to delete an opened repository when nvim exits.
  -- If `true`, it will create an auto command for opened repositories
  -- to delete the local directory when nvim exists.
  ephemeral = true,
  -- Set buffers of opened repositories to be read-only and unmodifiable.
  read_only = true,
  -- Whether / how to CD into opened repository.
  -- Options: global|tab|window|none
  cd_type = "global",
  -- The actual `open` behavior.
  ---@param dir string The path to the local repository.
  ---@param repo_uri string The URI that was used to clone this repository.
  ---@param selected_path? string A relative path to a file in this repository.
  opener = function(dir, repo_uri, selected_path)
    vim.print("Opening " .. repo_uri)
    local dest =
      vim.fn.fnameescape(selected_path and dir .. "/" .. selected_path or dir)
    vim.cmd("edit " .. dest)
  end,
  -- Location of cloned repositories. Should be dedicated for this purpose.
  repositories_dir = vim.fn.stdpath "cache" .. "/git-dev",
  -- Extend the builtin URL parsers.
  -- Should map domains to parse functions. See |parser.lua|.
  extra_domain_to_parser = nil,
  git = {
    -- Name / path of `git` command.
    command = "git",
    -- Default organization if none is specified.
    -- If given repository name does not contain '/' and `default_org` is
    -- not `nil` nor empty, it will be prepended to the given name.
    default_org = nil,
    -- Base URI to use when given repository name is scheme-less.
    base_uri_format = "https://github.com/%s.git",
    -- Arguments for `git clone`.
    -- Triggered when repository does not exist locally.
    -- It will clone submodules too, disable it if it is too slow.
    clone_args = "--jobs=2 --single-branch --recurse-submodules "
      .. "--shallow-submodules",
    -- Arguments for `git fetch`.
    -- Triggered when repository is already exists locally to refresh the local
    -- copy.
    fetch_args = "--jobs=2 --no-all --update-shallow -f --prune --no-tags",
    -- Arguments for `git checkout`.
    -- Triggered when a branch, tag or commit is given.
    checkout_args = "-f --recurse-submodules",
  },
  -- Print command outputs.
  verbose = false,
}


----------------------------------

require("image_preview").setup({})

require("neo-tree").setup({
  filesystem = {
    window = {
      mappings = {
        ["<leader>p"] = "image_wezterm", -- " or another map
      },
    },
    commands = {
      image_wezterm = function(state)
        local node = state.tree:get_node()
        if node.type == "file" then
          require("image_preview").PreviewImage(node.path)
        end
      end,
    },
  },
}


-------------------------------------------------

{
  -- Project directories
  projects = {
    "~/projects/*",
    "~/p*cts/*", -- glob pattern is supported
    "~/projects/repos/*",
    "~/.config/*",
    "~/work/*",
  },
  -- Path to store history and sessions
  datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
  -- Load the most recent session on startup if not in the project directory
  last_session_on_startup = true,
  -- Dashboard mode prevent session autoload on startup
  dashboard_mode = false,
  -- Timeout in milliseconds before trigger FileType autocmd after session load
  -- to make sure lsp servers are attached to the current buffer.
  -- Set to 0 to disable triggering FileType autocmd
  filetype_autocmd_timeout = 200,

  -- Overwrite some of Session Manager options
  session_manager_opts = {
    autosave_ignore_dirs = {
      vim.fn.expand("~"), -- don't create a session for $HOME/
      "/tmp",
    },
    autosave_ignore_filetypes = {
      -- All buffers of these file types will be closed before the session is saved
      "ccc-ui",
      "gitcommit",
      "gitrebase",
      "qf",
      "toggleterm",
    },
  },
}


--------------------------------------

local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('lang'):fmt('format-tool-1')
          :append('format-tool-2')
          :env(env_table)
          :lint('lint-tool-1')
          :extra(extra_args)


ft('lua'):fmt('lsp')
        :append('stylua')
        :lint('selene')
		
ft('typescript,javascript,typescriptreact'):fmt('prettier')

ft('asm'):fmt({
    cmd = 'asmfmt',
    stdin = true
})

ft('c'):fmt('clang-format')
       :lint('clang-tidy')


-- NB: this does not work with formatters
ft('*'):lint('codespell')

	   
-- Call setup() LAST!
require('guard').setup({
    -- Choose to format on every write to a buffer
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
    -- By default, Guard writes the buffer on every format
    -- You can disable this by setting:
    -- save_on_fmt = false,
})

-------------------------------


require("workspaces").setup({
    -- path to a file to store workspaces data in
    -- on a unix system this would be ~/.local/share/nvim/workspaces
    path = vim.fn.stdpath("data") .. "/workspaces",

    -- to change directory for nvim (:cd), or only for window (:lcd)
    -- deprecated, use cd_type instead
    -- global_cd = true,

    -- controls how the directory is changed. valid options are "global", "local", and "tab"
    --   "global" changes directory for the neovim process. same as the :cd command
    --   "local" changes directory for the current window. same as the :lcd command
    --   "tab" changes directory for the current tab. same as the :tcd command
    --
    -- if set, overrides the value of global_cd
    cd_type = "global",

    -- sort the list of workspaces by name after loading from the workspaces path.
    sort = true,

    -- sort by recent use rather than by name. requires sort to be true
    mru_sort = true,

    -- option to automatically activate workspace when opening neovim in a workspace directory
    auto_open = false,

    -- enable info-level notifications after adding or removing a workspace
    notify_info = true,

    -- lists of hooks to run after specific actions
    -- hooks can be a lua function or a vim command (string)
    -- lua hooks take a name, a path, and an optional state table
    -- if only one hook is needed, the list may be omitted
    hooks = {
        add = {},
        remove = {},
        rename = {},
        open_pre = {},
        open = {},
    },
})

----------------------------------------

local Hydra = require("hydra")
Hydra({
    -- string? only used in auto-generated hint
    name = "Hydra's name",

    -- string | string[] modes where the hydra exists, same as `vim.keymap.set()` accepts
    mode = "n",

    -- string? key required to activate the hydra, when excluded, you can use
    -- Hydra:activate()
    body = "<leader>o",

    -- these are explained below
    hint = [[ ... ]],
    config = { ... },
    heads = { ... },
})

config = {
    -- see :h hydra-heads
    exit = false, -- set the default exit value for each head in the hydra

    -- decides what to do when a key which doesn't belong to any head is pressed
    --   nil: hydra exits and foreign key behaves normally, as if the hydra wasn't active
    --   "warn": hydra stays active, issues a warning and doesn't run the foreign key
    --   "run": hydra stays active, runs the foreign key
    foreign_keys = nil,

    -- see `:h hydra-colors`
    color = "red", -- "red" | "amaranth" | "teal" | "pink"

    -- define a hydra for the given buffer, pass `true` for current buf
    buffer = nil,

    -- when true, summon the hydra after pressing only the `body` keys. Normally a head is
    -- required
    invoke_on_body = false,

    -- description used for the body keymap when `invoke_on_body` is true
    desc = nil, -- when nil, "[Hydra] .. name" is used

    -- see :h hydra-hooks
    on_enter = nil, -- called when the hydra is activated
    on_exit = nil, -- called before the hydra is deactivated
    on_key = nil, -- called after every hydra head

    -- timeout after which the hydra is automatically disabled. Calling any head
    -- will refresh the timeout
    --   true: timeout set to value of 'timeoutlen' (:h 'timeoutlen')
    --   5000: set to desired number of milliseconds
    timeout = false, -- by default hydras wait forever

    -- see :h hydra-hint-hint-configuration
    hint = false,
}

Hydra({
    config = {
        -- either a table like below, or `false` to disable the hint
        hint = {
            -- "window" | "cmdline" | "statusline" | "statuslinemanual"
            --   "window": show hint in a floating window
            --   "cmdline": show hint in the echo area
            --   "statusline": show auto-generated hint in the status line
            --   "statuslinemanual": Do not show a hint, but return a custom status
            --                       line hint from require("hydra.statusline").get_hint()
            type = "window", -- defaults to "window" if `hint` is passed to the hydra
                             -- otherwise defaults to "cmdline"

            -- set the position of the hint window. one of:
            --    top-left   |   top    |  top-right
            --  -------------+----------+--------------
            --   middle-left |  middle  | middle-right
            --  -------------+----------+--------------
            --   bottom-left |  bottom  | bottom-right
            position = "bottom",

            -- Offset of the floating window from the nearest editor border
            offset = 0,

            -- options passed to `nvim_open_win()`, see :h nvim_open_win()
            -- Lets you set border, header, footer, etc etc.
            float_opts = {
                -- row, col, height, width, relative, and anchor should not be
                -- overridden
                style = "minimal",
                focusable = false,
                noautocmd = true,
            },

            -- show the hydras name (or "HYDRA:" if not given a name), at the
            -- beginning of an auto-generated hint
            show_name = true,
            
            -- if set to true, this will prevent the hydra's hint window from displaying
            -- immediately.
            -- Note: you can still show the window manually by calling Hydra.hint:show()
            -- and manually close it with Hydra.hint:close()
            hide_on_load = false,

            -- Table from function names to function. Functions should return
            -- a string. These functions can be used in hints with %{func_name}
            -- more in :h hydra-hint
            funcs = {},
        }
    }
})

opts = {
    -- "When the hydra hides, this head does not stick out"
    -- Private heads are unreachable outside of the hydra state.
    private = false,

    -- When true, stops the hydra after executing this head
    -- NOTE:
    --   - All exit heads are private
    --   - If no exit head is specified, esc is set by default
    exit = false,

    -- Like exit, but stops the hydra BEFORE executing the command
    exit_before = false,

    -- when set to false, config.on_key isn't run after this head
    ok_key = true,

    -- string | false - value shown in auto-generated hint. When false, this key
    -- doesn't show up in the auto-generated hint
    desc = nil,

    -- same as the builtin map options
    expr = false, -- :h :map-expression
    silent = false, -- :h :map-silent

    -- \/ For Pink Hydras only \/ --

    -- allows binding a key which will immediately perform its action and not wait
    -- `timeoutlen` for a possible continuation
    nowait = false,

    -- Override `mode` for this head
    mode = "n",
}

require('hydra').setup({
    debug = false,
    exit = false,
    foreign_keys = nil,
    color = "red",
    timeout = false,
    invoke_on_body = false,
    hint = {
        show_name = true,
        position = { "bottom" },
        offset = 0,
        float_opts = { },
    },
    on_enter = nil,
    on_exit = nil,
    on_key = nil,
})


---------------------------------------------------


-- Open compiler
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F6>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })


----------------------------------------------------------------------

{
    -- Browse command to open commits in browser. Default fugitive GBrowse.
    browse_command = "GBrowse",
    -- fugitive or diffview
    diff_plugin = "fugitive",
    -- customize git in previewer
    -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
    git_flags = {},
    -- customize git diff in previewer
    -- e.g. flags such as { "--raw" }
    git_diff_flags = {},
    -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
    show_builtin_git_pickers = false,
    entry_default_author_or_date = "author", -- one of "author" or "date"
    keymaps = {
        -- following keymaps can be overridden
        toggle_date_author = "<C-w>",
        open_commit_in_browser = "<C-o>",
        copy_commit_hash = "<C-y>",
        show_entire_commit = "<C-e>",
    }

    -- Telescope layout setup
    telescope_theme = {
        function_name_1 = {
            -- Theme options
        },
        function_name_2 = "dropdown"
        -- e.g. realistic example
        show_custom_functions = {
            layout_config = { width = 0.4, height = 0.4 },
        },

    }
}


-------------------------------------

require("dbee").setup ({
sources = {
  require("dbee.sources").MemorySource:new({
	{
	  name = "...",
	  type = "...",
	  url = "...",
	},
	-- ...
  }),
  require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
  require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
  require("dbee").api.core.some_func()
	require("dbee").api.ui.some_func()
},

-- Define connections
export DBEE_CONNECTIONS='[
    {
        "name": "{{ exec `echo Hidden Database` }}",
        "url": "postgres://{{ env \"SECRET_DB_USER\" }}:{{ env `SECRET_DB_PASS` }}@localhost:5432/{{ env `SECRET_DB_NAME` }}?sslmode=disable",
        "type": "postgres"
    }
]'

-- Export secrets
export SECRET_DB_NAME="secretdb"
export SECRET_DB_USER="secretuser"
export SECRET_DB_PASS="secretpass"
})

----------------------------------------

require("other-nvim").setup({
    mappings = {
        -- builtin mappings
        "livewire",
        "angular",
        "laravel",
        "rails",
        "golang",
        -- custom mapping
        {
            pattern = "/path/to/file/src/app/(.*)/.*.ext$",
            target = "/path/to/file/src/view/%1/",
            transformer = "lowercase"
        }
    },
    transformers = {
        -- defining a custom transformer
        lowercase = function (inputString)
            return inputString:lower()
        end
    },
    style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = "solid",

        -- Column seperator for the window
        seperator = "|",

	-- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
	width = 0.7,

	-- min height in rows.
	-- when more columns are needed this value is extended automatically
	minHeight = 2
    },
})

vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>:Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ltn", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

-- Context specific bindings
vim.api.nvim_set_keymap("n", "<leader>lt", "<cmd>:Other test<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>:Other scss<CR>", { noremap = true, silent = true })


-- default settings
local defaults = {

	-- by default there are no mappings enabled
	mappings = {},

	-- default transformers
	transformers = {
		camelToKebap = transformers.camelToKebap,
		kebapToCamel = transformers.kebapToCamel,
		pluralize = transformers.pluralize,
		singularize = transformers.singularize,
	},

	-- Should the window show files which do not exist yet based on
	-- pattern matching. Selecting the files will create the file.
	showMissingFiles = true,

	-- When a mapping requires an initial selection of the other file, this setting controls,
	-- wether the selection should be remembered for the current user session.
	-- When this option is set to false reference between the two buffers are never saved.
	-- Existing references can be removed on the buffer with :OtherClear
	rememberBuffers = true,

	keybindings = {
		["<cr>"] = "open_file_by_command()",
		["<esc>"] = "close_window()",
		t = "open_file_tabnew()",
		o = "open_file()",
		q = "close_window()",
		v = "open_file_vs()",
		s = "open_file_sp()",
	},

	hooks = {
		-- This hook which is executed when the file-picker is shown.
		-- It could be used to filter or reorder the files in the filepicker.
		-- The function must return a lua table with the same structure as the input parameter.
		--
		-- The input parameter "files" is a lua table with each entry containing:
		-- @param table (filename (string), context (string), exists (boolean))
		-- @return table | boolean When an empty table or false is returned the filepicker is not openend.
		filePickerBeforeShow = function(files)
			return files
		end,

		-- This hook is called whenever a file is about to be opened.
		-- One example how this can be used: a non existing file needs to be opened by another plugin, which provides a template.
		--
		-- @param filename (string) the full-path of the file
		-- @param exists (boolean) doess the file already exist
		-- @return (boolean) When true (default) the plugin takes care of opening the file, when the function returns false this indicated that opening of the file is done in the hook.
		onOpenFile = function(filename, exists)
			return true
		end,

        	-- This hook is called whenever the plugin tries to find other files.
		-- It returns the matches found by the plugin. It can be used to filter or reorder the files or use the matches with another plugin.
		--
		-- @param matches (table) lua table with each entry containing: (filename (string), context (string), exists (boolean))
		-- @return (matches) Make sure to return the matches, otherwise the plugin will not work as expected.
		onFindOtherFiles = function(matches)
			return matches
		end,

	},

	style = {
		-- How the plugin paints its window borders
		-- Allowed values are none, single, double, rounded, solid and shadow
		border = "solid",

		-- Column seperator for the window
		seperator = "|",

		-- Indicator showing that the file does not yet exist
		newFileIndicator = "(* new *)",

		-- width of the window in percent. e.g. 0.5 is 50%, 1 is 100%
		width = 0.7,

		-- min height in rows.
		-- when more columns are needed this value is extended automatically
		minHeight = 2,
	},

}


-------------------------------------------------

require("range-highlight").setup {
    highlight = "Visual",
	highlight_with_out_range = {
        d = true,
        delete = true,
        m = true,
        move = true,
        y = true,
        yank = true,
        c = true,
        change = true,
        j = true,
        join = true,
        ["<"] = true,
        [">"] = true,
        s = true,
        subsititue = true,
        sno = true,
        snomagic = true,
        sm = true,
        smagic = true,
        ret = true,
        retab = true,
        t = true,
        co = true,
        copy = true,
        ce = true,
        center = true,
        ri = true,
        right = true,
        le = true,
        left = true,
        sor = true,
        sort = true
	}
}


------------------------------------------------

vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)

------------------------------------------------

require("windows").setup({
   autowidth = {			--		       |windows.autowidth|
      enable = true,
      winwidth = 5,			--		        |windows.winwidth|
      filetype = {			--	      |windows.autowidth.filetype|
         help = 2,
      },
   },
   ignore = {				--			  |windows.ignore|
      buftype = { "quickfix" },
      filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }
   },
   animation = {
      enable = true,
      duration = 300,
      fps = 30,
      easing = "in_out_sine"
   }
})
  
------------------------------------------	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	-------------------------------------


-- alternatively you can override the default configs
require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
    notification_style = 'native' | 'plugin'
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = false,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = false,
      -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      -- this will show the currently selected project configuration
      project_config = false,
    }
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {}
    register_configurations = function(paths)
      require("dap").configurations.dart = {
        <put here config that you would find in .vscode/launch.json>
      }
    end,
  },
  flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
  fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    enabled = true,
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = my_custom_on_attach,
    capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
    --- OR you can specify a function to deactivate or change or control how the config is created
    capabilities = function(config)
      config.specificThingIDontWant = false
      return config
    end,
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}

-- .nvim.lua
-- If you have more than one setup configured you will be prompted when you run
-- your app to select which one you want to use
require('flutter-tools').setup_project({
  {
    name = 'Development', -- an arbitrary name that you provide so you can recognise this config
    flavor = 'DevFlavor', -- your flavour
    target = 'lib/main_dev.dart', -- your target
    device = 'pixel6pro', -- the device ID, which you can get by running `flutter devices`
    dart_define = {
      API_URL = 'https://dev.example.com/api',
      IS_DEV = true,
    },
    dart_define_from_file = 'config.json' -- the path to a JSON configuration file
  },
  {
    name = 'Web',
    device = 'chrome',
    flavor = 'WebApp',
    web_port = 4000
  },
  {
    name = 'Profile',
    flutter_mode = 'profile', -- possible values: `debug`, `profile` or `release`, defaults to `debug`
  }
})

------------------------------------------------------------------------------------------------------

require('lualine').setup {
  options = {
    theme = 'gruvbox-flat'
    -- ... your lualine config
  }
}

let g:lightline = {'colorscheme': 'gruvbox-flat'}

-- Example config in Lua
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

-- Change the TabLineSel highlight group (used by barbar.nvim) to the "orange" color
vim.g.gruvbox_theme = { TabLineSel = { bg = "orange" } }

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-flat]]

---------------------------------------------------------------------------------------

local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
    window = {
        border = "single",  -- "rounded", "double", "solid", "none"
                            -- or an array with eight chars building up the border in a clockwise fashion
                            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
        position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil,    -- scrolloff value within navbuddy window
        sections = {
            left = {
                size = "20%",
                border = nil, -- You can set border style for each section individually as well.
            },
            mid = {
                size = "40%",
                border = nil,
            },
            right = {
                -- No size option for right most section. It fills to
                -- remaining area.
                border = nil,
                preview = "leaf",  -- Right section can show previews too.
                                   -- Options: "leaf", "always" or "never"
            }
        },
    },
    node_markers = {
        enabled = true,
        icons = {
            leaf = "  ",
            leaf_selected = " → ",
            branch = " ",
        },
    },
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = " ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    use_default_mappings = true,            -- If set to false, only mappings set
                                            -- by user are set. Else default
                                            -- mappings are used for keys
                                            -- that are not set by user
    mappings = {
        ["<esc>"] = actions.close(),        -- Close and cursor to original location
        ["q"] = actions.close(),

        ["j"] = actions.next_sibling(),     -- down
        ["k"] = actions.previous_sibling(), -- up

        ["h"] = actions.parent(),           -- Move to left panel
        ["l"] = actions.children(),         -- Move to right panel
        ["0"] = actions.root(),             -- Move to first panel

        ["v"] = actions.visual_name(),      -- Visual selection of name
        ["V"] = actions.visual_scope(),     -- Visual selection of scope

        ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name(),      -- Insert at start of name
        ["I"] = actions.insert_scope(),     -- Insert at start of scope

        ["a"] = actions.append_name(),      -- Insert at end of name
        ["A"] = actions.append_scope(),     -- Insert at end of scope

        ["r"] = actions.rename(),           -- Rename currently focused symbol

        ["d"] = actions.delete(),           -- Delete scope

        ["f"] = actions.fold_create(),      -- Create fold of current scope
        ["F"] = actions.fold_delete(),      -- Delete fold of current scope

        ["c"] = actions.comment(),          -- Comment out current scope

        ["<enter>"] = actions.select(),     -- Goto selected symbol
        ["o"] = actions.select(),

        ["J"] = actions.move_down(),        -- Move focused node down
        ["K"] = actions.move_up(),          -- Move focused node up

        ["s"] = actions.toggle_preview(),   -- Show preview of current node

        ["<C-v>"] = actions.vsplit(),       -- Open selected node in a vertical split
        ["<C-s>"] = actions.hsplit(),       -- Open selected node in a horizontal split

        ["t"] = actions.telescope({         -- Fuzzy finder at current level.
            layout_config = {               -- All options that can be
                height = 0.60,              -- passed to telescope.nvim's
                width = 0.60,               -- default can be passed here.
                prompt_position = "top",
                preview_width = 0.50
            },
            layout_strategy = "horizontal"
        }),

        ["g?"] = actions.help(),            -- Open mappings help window
    },
    lsp = {
        auto_attach = false,   -- If set to true, you don't need to manually use attach function
        preference = nil,      -- list of lsp server names in order of preference
    },
    source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
    },
	custom_hl_group = nil,     -- "Visual" or any other hl group to use instead of inverted colors
}

vim.g.navic_silence = true

vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = "#000000", fg = "#ffffff"})











