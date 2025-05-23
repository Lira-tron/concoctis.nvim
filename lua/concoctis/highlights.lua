local M = {}
local util = require 'concoctis.util'

function M.setup(config)
  local C = require('concoctis.palette').get_palette()
  for k, v in pairs(config.override_colors) do
    C[k] = v
  end
  require('concoctis.terminal').set_terminal_colors(C)

  local groups = {
    -- Base groups
    ConcoctisFg0 = { fg = C.fg0 },
    ConcoctisFgDarkenItalic = { fg = util.darken(C.fg1, 0.9, C.bg2), style = 'italic' },
    ConcoctisFg1 = { fg = C.fg1 },
    ConcoctisGray = { fg = C.gray0 },
    Concoctisbg = { fg = C.bg2 },
    Concoctisbg5 = { fg = C.bg5 },
    Concoctisbg6 = { fg = C.bg6 },
    Concoctisbg7 = { fg = C.bg7 },
    Concoctisbg8 = { fg = C.bg8 },
    ConcoctisRed = { fg = C.red },
    ConcoctisRedBold = { fg = C.red, style = 'bold' },
    ConcoctisDarkRed = { fg = C.darkRed },
    ConcoctisGreen = { fg = C.green },
    ConcoctisGreenBold = { fg = C.green, style = 'bold' },
    ConcoctisYellow = { fg = C.yellow },
    ConcoctisYellowItalic = { fg = C.yellow, style = 'italic' },
    ConcoctisYellowBold = { fg = C.yellow, style = 'bold' },
    ConcoctisBlue = { fg = C.blue },
    ConcoctisBlueBold = { fg = C.blue, style = 'bold' },
    ConcoctisPurple = { fg = C.purple },
    ConcoctisPurpleBold = { fg = C.purple, style = 'bold' },
    ConcoctisPurpleItalic = { fg = C.purple, style = 'italic' },
    ConcoctisDarkPurple = { fg = C.darkPurple },
    ConcoctisAqua = { fg = C.aqua },
    ConcoctisAquaBold = { fg = C.aqua, style = 'bold' },
    ConcoctisOrange = { fg = C.orange },
    ConcoctisOrangeBold = { fg = C.orange, style = 'bold' },
    ConcoctisOrangeBoldLine = { fg = C.orange, style = 'bold', bg = C.bg5 },
    ConcoctisRedSign = config.transparent and { fg = C.red, bg = nil } or { fg = C.red, bg = C.bg4 },
    ConcoctisGreenSign = config.transparent and { fg = C.green, bg = nil } or { fg = C.green, bg = C.bg4 },
    ConcoctisYellowSign = { fg = C.yellow, bg = C.bg4 },
    ConcoctisBlueSign = { fg = C.blue, bg = C.bg4 },
    ConcoctisPurpleSign = { fg = C.purple, bg = C.bg4 },
    ConcoctisAquaSign = config.transparent and { fg = C.aqua, bg = nil } or { fg = C.aqua, bg = C.bg4 },
    ConcoctisOrangeSign = { fg = C.orange, bg = C.bg4 },
    ConcoctisRedUnderline = { style = 'undercurl', sp = C.red },
    ConcoctisGreenUnderline = { style = 'undercurl', sp = C.green },
    ConcoctisYellowUnderline = { style = 'undercurl', sp = C.yellow },
    ConcoctisBlueUnderline = { style = 'undercurl', sp = C.blue },
    ConcoctisPurpleUnderline = { style = 'undercurl', sp = C.purple },
    ConcoctisAquaUnderline = { style = 'undercurl', sp = C.aqua },
    ConcoctisOrangeUnderline = { style = 'undercurl', sp = C.orange },
    Normal = config.transparent and { fg = C.fg1, bg = nil } or { fg = C.fg1, bg = C.bg2 },
    NormalNC = config.dim_inactive and { fg = C.fg0, bg = C.bg5 } or { link = 'Normal' },
    CursorLine = { bg = C.bg5 },
    CursorColumn = { link = 'CursorLine' },
    TabLineFill = { fg = C.bg8, bg = C.bg5 },
    TabLineSel = { fg = C.green, bg = C.bg5 },
    TabLine = { link = 'TabLineFill' },
    MatchParen = { fg = C.fg0, bg = 'none', style = 'bold' },
    ColorColumn = { bg = C.bg5 },
    Conceal = { fg = C.blue },
    CursorLineNr = config.transparent and { fg = C.yellow, bg = nil } or { fg = C.yellow, bg = C.bg5 },
    NonText = { link = 'Concoctisbg6' },
    SpecialKey = { link = 'concoctisFg1' },
    Visual = { bg = C.bg7 },
    VisualNOS = { link = 'Visual' },
    Search = { fg = C.yellow, bg = C.bg8 },
    IncSearch = { fg = C.orange, bg = C.bg8 },
    CurSearch = { link = 'IncSearch' },
    QuickFixLine = { fg = C.bg2, bg = C.yellow, style = 'bold' },
    Underlined = { fg = C.blue, style = 'underline' },
    StatusLine = { fg = C.bg6, bg = 'none' },
    StatusLineNC = { fg = C.bg5, bg = C.fg4 },
    WinBar = { fg = C.fg4, bg = C.bg2 },
    WinBarNC = { fg = C.fg3, bg = C.bg5 },
    VertSplit = { fg = C.bg7, bg = C.bg2 },
    WildMenu = { fg = C.blue, bg = C.bg6, style = 'bold' },
    Directory = { link = 'ConcoctisBlueBold' },
    Title = { link = 'ConcoctisGreenBold' },
    ErrorMsg = { fg = C.bg2, bg = C.red, style = 'bold' },
    MoreMsg = { link = 'ConcoctisYellowBold' },
    ModeMsg = { link = 'ConcoctisYellowBold' },
    Question = { link = 'ConcoctisOrangeBold' },
    WarningMsg = { link = 'ConcoctisRedBold' },
    LineNr = { fg = C.bg8 },
    SignColumn = config.transparent and { bg = nil } or { bg = C.bg4 },
    Folded = { fg = C.gray, bg = C.bg5, style = 'italic' },
    FoldColumn = { fg = C.gray, bg = C.bg5 },
    Cursor = {},
    vCursor = { link = 'Cursor' },
    iCursor = { link = 'Cursor' },
    lCursor = { link = 'Cursor' },
    Special = { fg = C.purple },
    Comment = { fg = C.bg8, style = 'italic' },
    Todo = { fg = C.fg0, style = { 'bold', 'italic' } },
    Done = { fg = C.orange, style = { 'bold', 'italic' } },
    Error = { fg = C.red, style = { 'bold' } },
    Statement = { link = 'ConcoctisRed' },
    Conditional = { link = 'ConcoctisPurple' },
    Repeat = { link = 'ConcoctisPurple' },
    Label = { link = 'ConcoctisRed' },
    Exception = { link = 'ConcoctisPurple' },
    Operator = { link = 'ConcoctisPurple' },
    Keyword = { link = 'ConcoctisOrange' },
    Identifier = { link = 'ConcoctisAqua' },
    Function = { link = 'ConcoctisAqua' },
    PreProc = { link = 'ConcoctisAqua' },
    Include = { link = 'ConcoctisPurple' },
    Define = { link = 'ConcoctisAqua' },
    Macro = { link = 'ConcoctisAqua' },
    PreCondit = { link = 'ConcoctisAqua' },
    Constant = { link = 'ConcoctisPurple' },
    Character = { link = 'ConcoctisPurple' },
    String = { fg = C.green, style = 'italic' },
    Boolean = { link = 'Concoctisorange' },
    Number = { link = 'ConcoctisRed' },
    Float = { link = 'ConcoctisPurple' },
    Type = { link = 'ConcoctisFgDarkenItalic' },
    StorageClass = { link = 'ConcoctisOrange' },
    Structure = { link = 'ConcoctisAqua' },
    Typedef = { link = 'ConcoctisBlue' },
    Pmenu = { fg = C.fg1, bg = C.bg },
    PmenuSel = { fg = C.bg, bg = C.blue, style = 'bold' },
    PmenuSbar = { bg = C.bg },
    PmenuThumb = { bg = C.bg5 },
    DiffDelete = { fg = C.red, bg = C.bg2 },
    DiffAdd = { fg = C.green, bg = C.bg2 },
    DiffChange = { fg = C.aqua, bg = C.bg2 },
    DiffText = { fg = C.yellow, bg = C.bg2 },
    SpellCap = { link = 'ConcoctisBlueUnderline' },
    SpellBad = { link = 'ConcoctisRedUnderline' },
    SpellLocal = { link = 'ConcoctisAquaUnderline' },
    SpellRare = { link = 'ConcoctisPurpleUnderline' },
    -- hlargs
    Hlargs = { fg = C.fg, style = 'bold' },
    -- Illuminate
    IlluminatedWordText = { bg = C.bg8 },
    IlluminatedWordRead = { bg = C.bg8 },
    IlluminatedWordWrite = { bg = C.bg8 },
    -- LSP Diagnostic
    DiagnosticError = { link = 'ConcoctisRed' },
    DiagnosticSignError = { link = 'ConcoctisRedSign' },
    DiagnosticUnderlineError = { link = 'ConcoctisRedUnderline' },
    DiagnosticWarn = { link = 'ConcoctisYellow' },
    DiagnosticSignWarn = { link = 'ConcoctisYellowSign' },
    DiagnosticUnderlineWarn = { link = 'ConcoctisYellowUnderline' },
    DiagnosticInfo = { link = 'ConcoctisBlue' },
    DiagnosticSignInfo = { link = 'ConcoctisBlueSign' },
    DiagnosticUnderlineInfo = { link = 'ConcoctisBlueUnderline' },
    DiagnosticHint = { link = 'ConcoctisAqua' },
    DiagnosticSignHint = { link = 'ConcoctisAquaSign' },
    DiagnosticUnderlineHint = { link = 'ConcoctisAquaUnderline' },
    DiagnosticFloatingError = { link = 'ConcoctisRed' },
    DiagnosticFloatingWarn = { link = 'ConcoctisOrange' },
    DiagnosticFloatingInfo = { link = 'ConcoctisBlue' },
    DiagnosticFloatingHint = { link = 'ConcoctisAqua' },
    DiagnosticVirtualTextError = { link = 'ConcoctisRed' },
    DiagnosticVirtualTextWarn = { link = 'ConcoctisYellow' },
    DiagnosticVirtualTextInfo = { link = 'ConcoctisBlue' },
    DiagnosticVirtualTextHint = { link = 'ConcoctisAqua' },
    LspReferenceRead = { link = 'ConcoctisYellowBold' },
    LspReferenceText = { link = 'ConcoctisYellowBold' },
    LspReferenceWrite = { link = 'ConcoctisOrangeBold' },
    LspCodeLens = { link = 'ConcoctisGray' },
    -- nvim-treesitter (0.8 compat)
    ['@annotation'] = { link = 'Operator' },
    ['@comment'] = { link = 'Comment' },
    ['@none'] = { bg = 'NONE', fg = 'NONE' },
    ['@preproc'] = { link = 'PreProc' },
    ['@define'] = { link = 'Define' },
    ['@operator'] = { link = 'Operator' },
    ['@punctuation.delimiter'] = { link = 'Delimiter' },
    ['@punctuation.bracket'] = { link = 'Delimiter' },
    ['@punctuation.special'] = { link = 'Delimiter' },
    ['@string'] = { link = 'String' },
    ['@string.regex'] = { link = 'String' },
    ['@string.escape'] = { link = 'SpecialChar' },
    ['@string.special'] = { link = 'SpecialChar' },
    ['@character'] = { link = 'Character' },
    ['@character.special'] = { link = 'SpecialChar' },
    ['@boolean'] = { link = 'Boolean' },
    ['@number'] = { link = 'Number' },
    ['@float'] = { link = 'Float' },
    ['@function'] = { link = 'Function' },
    ['@function.call'] = { link = 'Function' },
    ['@function.builtin'] = { link = 'Special' },
    ['@function.macro'] = { link = 'Macro' },
    ['@method'] = { link = 'Function' },
    ['@method.call'] = { link = 'Function' },
    ['@constructor'] = { link = 'Special' },
    ['@class'] = { link = 'ConcoctisGreen' },
    ['@parameter'] = { link = 'ConcoctisFg1' },
    ['@keyword'] = { link = 'ConcoctisOrange' },
    ['@keyword.go'] = { link = 'ConcoctisPurple' },
    ['@keyword.lua'] = { link = 'ConcoctisPurpleItalic' },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.return'] = { link = 'ConcoctisPurple' },
    ['@conditional'] = { link = 'Conditional' },
    ['@repeat'] = { link = 'Repeat' },
    ['@debug'] = { link = 'Debug' },
    ['@label'] = { link = 'Label' },
    ['@include'] = { link = 'Include' },
    ['@exception'] = { link = 'Exception' },
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    ['@type.qualifier'] = { link = 'ConcoctisPurple' },
    ['@type.definition'] = { link = 'Typedef' },
    ['@storageclass'] = { link = 'StorageClass' },
    ['@attribute'] = { link = 'PreProc' },
    ['@field'] = { link = 'Identifier' },
    ['@property'] = { link = 'Identifier' },
    ['@variable'] = { link = 'ConcoctisGreen' },
    ['@variable.builtin'] = { link = 'ConcoctisRed' },
    ['@constant'] = { link = 'Constant' },
    ['@constant.builtin'] = { link = 'ConcoctisRed' },
    ['@constant.macro'] = { link = 'Define' },
    ['@namespace'] = { link = 'ConcoctisAqua' },
    ['@symbol'] = { link = 'Identifier' },
    ['@text'] = { link = 'ConcoctisFg1' },
    ['@text.title'] = { link = 'Title' },
    ['@text.literal'] = { link = 'String' },
    ['@text.uri'] = { link = 'Underlined' },
    ['@text.math'] = { link = 'Special' },
    ['@text.environment'] = { link = 'Macro' },
    ['@text.environment.name'] = { link = 'Type' },
    ['@text.reference'] = { link = 'Constant' },
    ['@text.todo'] = { link = 'Todo' },
    ['@text.todo.unchecked'] = { link = 'Todo' },
    ['@text.todo.checked'] = { link = 'Done' },
    ['@text.note'] = { link = 'SpecialComment' },
    ['@text.warning'] = { link = 'WarningMsg' },
    ['@text.danger'] = { link = 'ErrorMsg' },
    ['@text.diff.add'] = { link = 'diffAdded' },
    ['@text.diff.delete'] = { link = 'diffRemoved' },
    ['@tag'] = { link = 'Tag' },
    ['@tag.attribute'] = { link = 'Identifier' },
    ['@tag.delimiter'] = { link = 'Delimiter' },

    -- nvim-treesitter (0.8 overrides)
    ['@text.strong'] = { style = 'bold' },
    ['@text.strike'] = { style = 'strikethrough' },
    ['@text.emphasis'] = { style = 'italic' },
    ['@text.underline'] = { style = 'underline' },
    ['@keyword.operator'] = { link = 'ConcoctisRed' },
    -- gitcommit
    gitcommitSelectedFile = { link = 'ConcoctisGreen' },
    gitcommitDiscardedFile = { link = 'ConcoctisRed' },
    -- gitsigns.nvim
    GitSignsAdd = { link = 'ConcoctisGreenSign' },
    GitSignsChange = { link = 'ConcoctisAquaSign' },
    GitSignsDelete = { link = 'ConcoctisRedSign' },
    -- nvim-tree
    NvimTreeSymlink = { fg = C.darkAqua },
    NvimTreeRootFolder = { fg = C.darkPurple, style = 'bold' },
    NvimTreeFolderIcon = { fg = C.darkBlue, style = 'bold' },
    NvimTreeFileIcon = { fg = C.light2 },
    NvimTreeExecFile = { fg = C.darkGreen, style = 'bold' },
    NvimTreeOpenedFile = { fg = C.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = C.darkYellow, style = { 'bold', 'underline' } },
    NvimTreeImageFile = { fg = C.darkPurple },
    NvimTreeIndentMarker = { fg = C.dark3 },
    NvimTreeGitDirty = { fg = C.darkYellow },
    NvimTreeGitStaged = { fg = C.darkYellow },
    NvimTreeGitMerge = { fg = C.darkPurple },
    NvimTreeGitRenamed = { fg = C.darkPurple },
    NvimTreeGitNew = { fg = C.darkYellow },
    NvimTreeGitDeleted = { fg = C.darkRed },
    NvimTreeWindowPicker = { bg = C.darkAqua },
    -- termdebug
    debugPC = { bg = C.faded_blue },
    debugBreakpoint = { link = 'ConcoctisRedSign' },
    -- vim-startify
    StartifyBracket = { link = 'concoctisFg1' },
    StartifyFile = { link = 'ConcoctisFg1' },
    StartifyNumber = { link = 'ConcoctisBlue' },
    StartifyPath = { link = 'ConcoctisGray' },
    StartifySlash = { link = 'ConcoctisGray' },
    StartifySection = { link = 'ConcoctisYellow' },
    StartifySpecial = { link = 'Concoctisbg6' },
    StartifyHeader = { link = 'ConcoctisOrange' },
    StartifyFooter = { link = 'Concoctisbg6' },
    StartifyVar = { link = 'StartifyPath' },
    StartifySelect = { link = 'Title' },
    -- vim-dirvish
    DirvishPathTail = { link = 'ConcoctisAqua' },
    DirvishArg = { link = 'ConcoctisYellow' },
    -- RainbowTS
    RainbowCol1 = { link = 'ConcoctisPurpleBold' },
    RainbowCol2 = { link = 'ConcoctisOrangeBold' },
    RainbowCol3 = { link = 'ConcoctisGreenBold' },
    RainbowCol4 = { link = 'ConcoctisYellowBold' },
    RainbowCol5 = { link = 'ConcoctisAquaBold' },
    RainbowCol6 = { link = 'ConcoctisBlueBold' },
    RainbowCol7 = { link = 'ConcoctisRedBold' },
    -- netrw
    netrwDir = { link = 'ConcoctisAqua' },
    netrwClassify = { link = 'ConcoctisAqua' },
    netrwLink = { link = 'ConcoctisGray' },
    netrwSymLink = { link = 'ConcoctisFg1' },
    netrwExe = { link = 'ConcoctisYellow' },
    netrwComment = { link = 'ConcoctisGray' },
    netrwList = { link = 'ConcoctisBlue' },
    netrwHelpCmd = { link = 'ConcoctisAqua' },
    netrwCmdSep = { link = 'concoctisFg1' },
    netrwVersion = { link = 'ConcoctisGreen' },
    -- nerdtree
    NERDTreeDir = { link = 'ConcoctisAqua' },
    NERDTreeDirSlash = { link = 'ConcoctisAqua' },
    NERDTreeOpenable = { link = 'ConcoctisOrange' },
    NERDTreeClosable = { link = 'ConcoctisOrange' },
    NERDTreeFile = { link = 'ConcoctisFg1' },
    NERDTreeExecFile = { link = 'ConcoctisYellow' },
    NERDTreeUp = { link = 'ConcoctisGray' },
    NERDTreeCWD = { link = 'ConcoctisGreen' },
    NERDTreeHelp = { link = 'ConcoctisFg1' },
    NERDTreeToggleOn = { link = 'ConcoctisGreen' },
    NERDTreeToggleOff = { link = 'ConcoctisRed' },
    -- coc.nvim
    CocErrorSign = { link = 'ConcoctisRedSign' },
    CocWarningSign = { link = 'ConcoctisOrangeSign' },
    CocInfoSign = { link = 'ConcoctisBlueSign' },
    CocHintSign = { link = 'ConcoctisAquaSign' },
    CocErrorFloat = { link = 'ConcoctisRed' },
    CocWarningFloat = { link = 'ConcoctisOrange' },
    CocInfoFloat = { link = 'ConcoctisBlue' },
    CocHintFloat = { link = 'ConcoctisAqua' },
    CocDiagnosticsError = { link = 'ConcoctisRed' },
    CocDiagnosticsWarning = { link = 'ConcoctisOrange' },
    CocDiagnosticsInfo = { link = 'ConcoctisBlue' },
    CocDiagnosticsHint = { link = 'ConcoctisAqua' },
    CocSelectedText = { link = 'ConcoctisRed' },
    CocMenuSel = { link = 'PmenuSel' },
    CocCodeLens = { link = 'ConcoctisGray' },
    CocErrorHighlight = { link = 'ConcoctisRedUnderline' },
    CocWarningHighlight = { link = 'ConcoctisOrangeUnderline' },
    CocInfoHighlight = { link = 'ConcoctisBlueUnderline' },
    CocHintHighlight = { link = 'ConcoctisAquaUnderline' },
    -- telescope.nvim
    TelescopeNormal = { link = 'ConcoctisFg1' },
    TelescopeSelection = { link = 'ConcoctisOrangeBoldLine' },
    TelescopeSelectionCaret = { link = 'ConcoctisRed' },
    TelescopeMultiSelection = { link = 'ConcoctisGray' },
    TelescopeBorder = { link = 'TelescopeNormal' },
    TelescopePromptBorder = { link = 'TelescopeNormal' },
    TelescopeResultsBorder = { link = 'TelescopeNormal' },
    TelescopePreviewBorder = { link = 'TelescopeNormal' },
    TelescopeMatching = { link = 'ConcoctisBlue' },
    TelescopePromptPrefix = { link = 'ConcoctisRed' },
    TelescopePrompt = { link = 'TelescopeNormal' },
    -- Snacks
    SnacksPicker = { link = 'TelescopeNormal' },
    SnacksPickerBorder = { link = 'TelescopeBorder' },
    SnacksPickerTitle = { link = 'Title' },
    SnacksPickerFooter = { link = 'SnacksPickerTitle' },
    SnacksPickerPrompt = { link = 'TelescopePrompt' },
    SnacksPickerInputCursorLine = { link = 'TelescopeNormal' },
    SnacksPickerListCursorLine = { link = 'DiffText' },
    SnacksPickerMatch = { link = 'CursorLine' },
    SnacksPickerToggle = { link = 'CursorLine' },
    SnacksPickerDir = { link = 'Comment' },
    SnacksPickerBufFlags = { link = 'ConcoctisGray' },
    SnacksPickerSelected = { link = ' TelescopeSelection' },
    SnacksPickerKeymapRhs = { link = 'ConcoctisGray' },

    -- nvim-cmp
    CmpItemAbbr = { link = 'ConcoctisFg0' },
    CmpItemAbbrDeprecated = { link = 'ConcoctisFg1' },
    CmpItemAbbrMatch = { link = 'ConcoctisBlueBold' },
    CmpItemAbbrMatchFuzzy = { link = 'ConcoctisBlueUnderline' },
    CmpItemMenu = { link = 'ConcoctisGray' },
    CmpItemKindText = { link = 'ConcoctisOrange' },
    CmpItemKindMethod = { link = 'ConcoctisBlue' },
    CmpItemKindFunction = { link = 'ConcoctisBlue' },
    CmpItemKindConstructor = { link = 'ConcoctisYellow' },
    CmpItemKindField = { link = 'ConcoctisBlue' },
    CmpItemKindClass = { link = 'ConcoctisYellow' },
    CmpItemKindInterface = { link = 'ConcoctisYellow' },
    CmpItemKindModule = { link = 'ConcoctisBlue' },
    CmpItemKindProperty = { link = 'ConcoctisBlue' },
    CmpItemKindValue = { link = 'ConcoctisOrange' },
    CmpItemKindEnum = { link = 'ConcoctisYellow' },
    CmpItemKindKeyword = { link = 'ConcoctisPurple' },
    CmpItemKindSnippet = { link = 'ConcoctisGreen' },
    CmpItemKindFile = { link = 'ConcoctisBlue' },
    CmpItemKindEnumMember = { link = 'ConcoctisAqua' },
    CmpItemKindConstant = { link = 'ConcoctisOrange' },
    CmpItemKindStruct = { link = 'ConcoctisYellow' },
    CmpItemKindTypeParameter = { link = 'ConcoctisYellow' },
    diffAdded = { link = 'ConcoctisGreen' },
    diffRemoved = { link = 'ConcoctisRed' },
    diffChanged = { link = 'ConcoctisAqua' },
    diffFile = { link = 'ConcoctisOrange' },
    diffNewFile = { link = 'ConcoctisYellow' },
    diffLine = { link = 'ConcoctisBlue' },
    -- navic (highlight icons)
    NavicIconsFile = { link = 'ConcoctisBlue' },
    NavicIconsModule = { link = 'ConcoctisOrange' },
    NavicIconsNamespace = { link = 'ConcoctisBlue' },
    NavicIconsPackage = { link = 'ConcoctisAqua' },
    NavicIconsClass = { link = 'ConcoctisYellow' },
    NavicIconsMethod = { link = 'ConcoctisBlue' },
    NavicIconsProperty = { link = 'ConcoctisAqua' },
    NavicIconsField = { link = 'ConcoctisPurple' },
    NavicIconsConstructor = { link = 'ConcoctisBlue' },
    NavicIconsEnum = { link = 'ConcoctisPurple' },
    NavicIconsInterface = { link = 'ConcoctisGreen' },
    NavicIconsFunction = { link = 'ConcoctisBlue' },
    NavicIconsVariable = { link = 'ConcoctisPurple' },
    NavicIconsConstant = { link = 'ConcoctisOrange' },
    NavicIconsString = { link = 'ConcoctisGreen' },
    NavicIconsNumber = { link = 'ConcoctisOrange' },
    NavicIconsBoolean = { link = 'ConcoctisOrange' },
    NavicIconsArray = { link = 'ConcoctisOrange' },
    NavicIconsObject = { link = 'ConcoctisOrange' },
    NavicIconsKey = { link = 'ConcoctisAqua' },
    NavicIconsNull = { link = 'ConcoctisOrange' },
    NavicIconsEnumMember = { link = 'ConcoctisYellow' },
    NavicIconsStruct = { link = 'ConcoctisPurple' },
    NavicIconsEvent = { link = 'ConcoctisYellow' },
    NavicIconsOperator = { link = 'ConcoctisRed' },
    NavicIconsTypeParameter = { link = 'ConcoctisRed' },
    NavicText = { link = 'ConcoctisWhite' },
    NavicSeparator = { link = 'ConcoctisWhite' },
    -- html
    htmlTag = { link = 'ConcoctisAquaBold' },
    htmlEndTag = { link = 'ConcoctisAquaBold' },
    htmlTagName = { link = 'ConcoctisBlue' },
    htmlArg = { link = 'ConcoctisOrange' },
    htmlTagN = { link = 'ConcoctisFg1' },
    htmlSpecialTagName = { link = 'ConcoctisBlue' },
    htmlLink = { fg = C.fg4, style = 'underline' },
    htmlSpecialChar = { link = 'ConcoctisRed' },
    htmlBold = { fg = C.fg0, bg = C.bg2, style = 'bold' },
    htmlBoldUnderline = { fg = C.fg0, bg = C.bg2, style = { 'bold', 'underline' } },
    htmlBoldItalic = { fg = C.fg0, bg = C.bg2, style = { 'bold', 'italic' } },
    htmlBoldUnderlineItalic = {
      fg = C.fg0,
      bg = C.bg2,
      style = {
        'bold',
        'italic',
        'underline',
      },
    },
    htmlUnderline = { fg = C.fg0, bg = C.bg2, style = { 'underline' } },
    htmlUnderlineItalic = {
      fg = C.fg0,
      bg = C.bg2,
      style = { 'underline', 'italic' },
    },
    htmlItalic = { fg = C.fg0, bg = C.bg2, style = 'italic' },
    -- xml
    xmlTag = { link = 'ConcoctisAquaBold' },
    xmlEndTag = { link = 'ConcoctisAquaBold' },
    xmlTagName = { link = 'ConcoctisBlue' },
    xmlEqual = { link = 'ConcoctisBlue' },
    docbkKeyword = { link = 'ConcoctisAquaBold' },
    xmlDocTypeDecl = { link = 'ConcoctisGray' },
    xmlDocTypeKeyword = { link = 'ConcoctisPurple' },
    xmlCdataStart = { link = 'ConcoctisGray' },
    xmlCdataCdata = { link = 'ConcoctisPurple' },
    dtdFunction = { link = 'ConcoctisGray' },
    dtdTagName = { link = 'ConcoctisPurple' },
    xmlAttrib = { link = 'ConcoctisOrange' },
    xmlProcessingDelim = { link = 'ConcoctisGray' },
    dtdParamEntityPunct = { link = 'ConcoctisGray' },
    dtdParamEntityDPunct = { link = 'ConcoctisGray' },
    xmlAttribPunct = { link = 'ConcoctisGray' },
    xmlEntity = { link = 'ConcoctisRed' },
    xmlEntityPunct = { link = 'ConcoctisRed' },
    -- clojure
    clojureKeyword = { link = 'ConcoctisBlue' },
    clojureCond = { link = 'ConcoctisOrange' },
    clojureSpecial = { link = 'ConcoctisOrange' },
    clojureDefine = { link = 'ConcoctisOrange' },
    clojureFunc = { link = 'ConcoctisYellow' },
    clojureRepeat = { link = 'ConcoctisYellow' },
    clojureCharacter = { link = 'ConcoctisAqua' },
    clojureStringEscape = { link = 'ConcoctisAqua' },
    clojureException = { link = 'ConcoctisRed' },
    clojureRegexp = { link = 'ConcoctisAqua' },
    clojureRegexpEscape = { link = 'ConcoctisAqua' },
    clojureRegexpCharClass = { fg = C.fg3, style = 'bold' },
    clojureRegexpMod = { link = 'clojureRegexpCharClass' },
    clojureRegexpQuantifier = { link = 'clojureRegexpCharClass' },
    clojureParen = { link = 'concoctisFg1' },
    clojureAnonArg = { link = 'ConcoctisYellow' },
    clojureVariable = { link = 'ConcoctisBlue' },
    clojureMacro = { link = 'ConcoctisOrange' },
    clojureMeta = { link = 'ConcoctisYellow' },
    clojureDeref = { link = 'ConcoctisYellow' },
    clojureQuote = { link = 'ConcoctisYellow' },
    clojureUnquote = { link = 'ConcoctisYellow' },
    -- C
    cOperator = { link = 'ConcoctisPurple' },
    cppOperator = { link = 'ConcoctisPurple' },
    cStructure = { link = 'ConcoctisOrange' },
    -- python
    pythonBuiltin = { link = 'ConcoctisOrange' },
    pythonBuiltinObj = { link = 'ConcoctisOrange' },
    pythonBuiltinFunc = { link = 'ConcoctisOrange' },
    pythonFunction = { link = 'ConcoctisAqua' },
    pythonDecorator = { link = 'ConcoctisRed' },
    pythonInclude = { link = 'ConcoctisBlue' },
    pythonImport = { link = 'ConcoctisBlue' },
    pythonRun = { link = 'ConcoctisBlue' },
    pythonCoding = { link = 'ConcoctisBlue' },
    pythonOperator = { link = 'ConcoctisRed' },
    pythonException = { link = 'ConcoctisRed' },
    pythonExceptions = { link = 'ConcoctisPurple' },
    pythonBoolean = { link = 'ConcoctisPurple' },
    pythonDot = { link = 'concoctisFg1' },
    pythonConditional = { link = 'ConcoctisRed' },
    pythonRepeat = { link = 'ConcoctisRed' },
    pythonDottedName = { link = 'ConcoctisGreenBold' },
    -- CSS
    cssBraces = { link = 'ConcoctisBlue' },
    cssFunctionName = { link = 'ConcoctisYellow' },
    cssIdentifier = { link = 'ConcoctisOrange' },
    cssClassName = { link = 'ConcoctisGreen' },
    cssColor = { link = 'ConcoctisBlue' },
    cssSelectorOp = { link = 'ConcoctisBlue' },
    cssSelectorOp2 = { link = 'ConcoctisBlue' },
    cssImportant = { link = 'ConcoctisGreen' },
    cssVendor = { link = 'ConcoctisFg1' },
    cssTextProp = { link = 'ConcoctisAqua' },
    cssAnimationProp = { link = 'ConcoctisAqua' },
    cssUIProp = { link = 'ConcoctisYellow' },
    cssTransformProp = { link = 'ConcoctisAqua' },
    cssTransitionProp = { link = 'ConcoctisAqua' },
    cssPrintProp = { link = 'ConcoctisAqua' },
    cssPositioningProp = { link = 'ConcoctisYellow' },
    cssBoxProp = { link = 'ConcoctisAqua' },
    cssFontDescriptorProp = { link = 'ConcoctisAqua' },
    cssFlexibleBoxProp = { link = 'ConcoctisAqua' },
    cssBorderOutlineProp = { link = 'ConcoctisAqua' },
    cssBackgroundProp = { link = 'ConcoctisAqua' },
    cssMarginProp = { link = 'ConcoctisAqua' },
    cssListProp = { link = 'ConcoctisAqua' },
    cssTableProp = { link = 'ConcoctisAqua' },
    cssFontProp = { link = 'ConcoctisAqua' },
    cssPaddingProp = { link = 'ConcoctisAqua' },
    cssDimensionProp = { link = 'ConcoctisAqua' },
    cssRenderProp = { link = 'ConcoctisAqua' },
    cssColorProp = { link = 'ConcoctisAqua' },
    cssGeneratedContentProp = { link = 'ConcoctisAqua' },
    -- javascript
    javaScriptBraces = { link = 'ConcoctisFg1' },
    javaScriptFunction = { link = 'ConcoctisAqua' },
    javaScriptIdentifier = { link = 'ConcoctisRed' },
    javaScriptMember = { link = 'ConcoctisBlue' },
    javaScriptNumber = { link = 'ConcoctisPurple' },
    javaScriptNull = { link = 'ConcoctisPurple' },
    javaScriptParens = { link = 'concoctisFg1' },
    -- typescript
    typescriptReserved = { link = 'ConcoctisAqua' },
    typescriptLabel = { link = 'ConcoctisAqua' },
    typescriptFuncKeyword = { link = 'ConcoctisAqua' },
    typescriptIdentifier = { link = 'ConcoctisOrange' },
    typescriptBraces = { link = 'ConcoctisFg1' },
    typescriptEndColons = { link = 'ConcoctisFg1' },
    typescriptDOMObjects = { link = 'ConcoctisFg1' },
    typescriptAjaxMethods = { link = 'ConcoctisFg1' },
    typescriptLogicSymbols = { link = 'ConcoctisFg1' },
    typescriptDocSeeTag = { link = 'Comment' },
    typescriptDocParam = { link = 'Comment' },
    typescriptDocTags = { link = 'vimCommentTitle' },
    typescriptGlobalObjects = { link = 'ConcoctisFg1' },
    typescriptParens = { link = 'concoctisFg1' },
    typescriptOpSymbols = { link = 'concoctisFg1' },
    typescriptHtmlElemProperties = { link = 'ConcoctisFg1' },
    typescriptNull = { link = 'ConcoctisPurple' },
    typescriptInterpolationDelimiter = { link = 'ConcoctisAqua' },
    -- purescript
    purescriptModuleKeyword = { link = 'ConcoctisAqua' },
    purescriptModuleName = { link = 'ConcoctisFg1' },
    purescriptWhere = { link = 'ConcoctisAqua' },
    purescriptDelimiter = { link = 'concoctisFg1' },
    purescriptType = { link = 'ConcoctisFg1' },
    purescriptImportKeyword = { link = 'ConcoctisAqua' },
    purescriptHidingKeyword = { link = 'ConcoctisAqua' },
    purescriptAsKeyword = { link = 'ConcoctisAqua' },
    purescriptStructure = { link = 'ConcoctisAqua' },
    purescriptOperator = { link = 'ConcoctisBlue' },
    purescriptTypeVar = { link = 'ConcoctisFg1' },
    purescriptConstructor = { link = 'ConcoctisFg1' },
    purescriptFunction = { link = 'ConcoctisFg1' },
    purescriptConditional = { link = 'ConcoctisOrange' },
    purescriptBacktick = { link = 'ConcoctisOrange' },
    -- coffescript
    coffeeExtendedOp = { link = 'concoctisFg1' },
    coffeeSpecialOp = { link = 'concoctisFg1' },
    coffeeCurly = { link = 'ConcoctisOrange' },
    coffeeParen = { link = 'concoctisFg1' },
    coffeeBracket = { link = 'ConcoctisOrange' },
    -- ruby
    rubyStringDelimiter = { link = 'ConcoctisGreen' },
    rubyInterpolationDelimiter = { link = 'ConcoctisAqua' },
    rubyDefinedOperator = { link = 'rubyKeyword' },
    -- objc
    objcTypeModifier = { link = 'ConcoctisRed' },
    objcDirective = { link = 'ConcoctisBlue' },
    -- go
    goDirective = { link = 'ConcoctisAqua' },
    goConstants = { link = 'ConcoctisPurple' },
    goDeclaration = { link = 'ConcoctisRed' },
    goDeclType = { link = 'ConcoctisBlue' },
    goBuiltins = { link = 'ConcoctisOrange' },
    -- lua
    luaIn = { link = 'ConcoctisRed' },
    luaFunction = { link = 'ConcoctisAqua' },
    luaTable = { link = 'ConcoctisOrange' },
    -- moonscript
    moonSpecialOp = { link = 'concoctisFg1' },
    moonExtendedOp = { link = 'concoctisFg1' },
    moonFunction = { link = 'concoctisFg1' },
    moonObject = { link = 'ConcoctisYellow' },
    -- java
    javaAnnotation = { link = 'ConcoctisBlue' },
    javaDocTags = { link = 'ConcoctisAqua' },
    javaCommentTitle = { link = 'vimCommentTitle' },
    javaParen = { link = 'concoctisFg1' },
    javaParen1 = { link = 'concoctisFg1' },
    javaParen2 = { link = 'concoctisFg1' },
    javaParen3 = { link = 'concoctisFg1' },
    javaParen4 = { link = 'concoctisFg1' },
    javaParen5 = { link = 'concoctisFg1' },
    javaOperator = { link = 'ConcoctisOrange' },
    javaVarArg = { link = 'ConcoctisGreen' },
    -- elixir
    elixirDocString = { link = 'Comment' },
    elixirStringDelimiter = { link = 'ConcoctisGreen' },
    elixirInterpolationDelimiter = { link = 'ConcoctisAqua' },
    elixirModuleDeclaration = { link = 'ConcoctisYellow' },
    -- scala
    scalaNameDefinition = { link = 'ConcoctisFg1' },
    scalaCaseFollowing = { link = 'ConcoctisFg1' },
    scalaCapitalWord = { link = 'ConcoctisFg1' },
    scalaTypeExtension = { link = 'ConcoctisFg1' },
    scalaKeyword = { link = 'ConcoctisRed' },
    scalaKeywordModifier = { link = 'ConcoctisRed' },
    scalaSpecial = { link = 'ConcoctisAqua' },
    scalaOperator = { link = 'ConcoctisFg1' },
    scalaTypeDeclaration = { link = 'ConcoctisYellow' },
    scalaTypeTypePostDeclaration = { link = 'ConcoctisYellow' },
    scalaInstanceDeclaration = { link = 'ConcoctisFg1' },
    scalaInterpolation = { link = 'ConcoctisAqua' },
    -- markdown
    markdownItalic = { fg = C.fg3, style = 'italic' },
    markdownBold = { fg = C.fg3, style = 'bold' },
    markdownBoldItalic = { fg = C.fg3, style = { 'bold', 'italic' } },
    markdownH1 = { link = 'ConcoctisGreenBold' },
    markdownH2 = { link = 'ConcoctisGreenBold' },
    markdownH3 = { link = 'ConcoctisYellowBold' },
    markdownH4 = { link = 'ConcoctisYellowBold' },
    markdownH5 = { link = 'ConcoctisYellow' },
    markdownH6 = { link = 'ConcoctisYellow' },
    markdownCode = { link = 'ConcoctisAqua' },
    markdownCodeBlock = { link = 'ConcoctisAqua' },
    markdownCodeDelimiter = { link = 'ConcoctisAqua' },
    markdownBlockquote = { link = 'ConcoctisGray' },
    markdownListMarker = { link = 'ConcoctisGray' },
    markdownOrderedListMarker = { link = 'ConcoctisGray' },
    markdownRule = { link = 'ConcoctisGray' },
    markdownHeadingRule = { link = 'ConcoctisGray' },
    markdownUrlDelimiter = { link = 'concoctisFg1' },
    markdownLinkDelimiter = { link = 'concoctisFg1' },
    markdownLinkTextDelimiter = { link = 'concoctisFg1' },
    markdownHeadingDelimiter = { link = 'ConcoctisOrange' },
    markdownUrl = { link = 'ConcoctisPurple' },
    markdownUrlTitleDelimiter = { link = 'ConcoctisGreen' },
    markdownLinkText = { fg = C.gray, style = 'underline' },
    markdownIdDeclaration = { link = 'markdownLinkText' },
    -- haskell
    haskellType = { link = 'ConcoctisBlue' },
    haskellIdentifier = { link = 'ConcoctisAqua' },
    haskellSeparator = { link = 'concoctisFg1' },
    haskellDelimiter = { link = 'ConcoctisOrange' },
    haskellOperators = { link = 'ConcoctisPurple' },
    haskellBacktick = { link = 'ConcoctisOrange' },
    haskellStatement = { link = 'ConcoctisPurple' },
    haskellConditional = { link = 'ConcoctisPurple' },
    haskellLet = { link = 'ConcoctisRed' },
    haskellDefault = { link = 'ConcoctisRed' },
    haskellWhere = { link = 'ConcoctisRed' },
    haskellBottom = { link = 'ConcoctisRedBold' },
    haskellImportKeywords = { link = 'ConcoctisPurpleBold' },
    haskellDeclKeyword = { link = 'ConcoctisOrange' },
    haskellDecl = { link = 'ConcoctisOrange' },
    haskellDeriving = { link = 'ConcoctisPurple' },
    haskellAssocType = { link = 'ConcoctisAqua' },
    haskellNumber = { link = 'ConcoctisAqua' },
    haskellPragma = { link = 'ConcoctisRedBold' },
    haskellTH = { link = 'ConcoctisAquaBold' },
    haskellForeignKeywords = { link = 'ConcoctisGreen' },
    haskellKeyword = { link = 'ConcoctisRed' },
    haskellFloat = { link = 'ConcoctisAqua' },
    haskellInfix = { link = 'ConcoctisPurple' },
    haskellQuote = { link = 'ConcoctisGreenBold' },
    haskellShebang = { link = 'ConcoctisYellowBold' },
    haskellLiquid = { link = 'ConcoctisPurpleBold' },
    haskellQuasiQuoted = { link = 'ConcoctisBlueBold' },
    haskellRecursiveDo = { link = 'ConcoctisPurple' },
    haskellQuotedType = { link = 'ConcoctisRed' },
    haskellPreProc = { link = 'concoctisFg1' },
    haskellTypeRoles = { link = 'ConcoctisRedBold' },
    haskellTypeForall = { link = 'ConcoctisRed' },
    haskellPatternKeyword = { link = 'ConcoctisBlue' },
    -- json
    jsonKeyword = { link = 'ConcoctisGreen' },
    jsonQuote = { link = 'ConcoctisGreen' },
    jsonBraces = { link = 'ConcoctisFg1' },
    jsonString = { link = 'ConcoctisFg1' },
    -- mail
    mailQuoted1 = { link = 'ConcoctisAqua' },
    mailQuoted2 = { link = 'ConcoctisPurple' },
    mailQuoted3 = { link = 'ConcoctisYellow' },
    mailQuoted4 = { link = 'ConcoctisGreen' },
    mailQuoted5 = { link = 'ConcoctisRed' },
    mailQuoted6 = { link = 'ConcoctisOrange' },
    mailSignature = { link = 'Comment' },
    -- c#
    csBraces = { link = 'ConcoctisFg1' },
    csEndColon = { link = 'ConcoctisFg1' },
    csLogicSymbols = { link = 'ConcoctisFg1' },
    csParens = { link = 'concoctisFg1' },
    csOpSymbols = { link = 'concoctisFg1' },
    csInterpolationDelimiter = { link = 'concoctisFg1' },
    csInterpolationAlignDel = { link = 'ConcoctisAquaBold' },
    csInterpolationFormat = { link = 'ConcoctisAqua' },
    csInterpolationFormatDel = { link = 'ConcoctisAquaBold' },
    -- rust btw
    rustSigil = { link = 'ConcoctisOrange' },
    rustEscape = { link = 'ConcoctisAqua' },
    rustStringContinuation = { link = 'ConcoctisAqua' },
    rustEnum = { link = 'ConcoctisAqua' },
    rustStructure = { link = 'ConcoctisAqua' },
    rustModPathSep = { link = 'concoctisFg1' },
    rustCommentLineDoc = { link = 'Comment' },
    rustDefault = { link = 'ConcoctisAqua' },
    -- ocaml
    ocamlOperator = { link = 'ConcoctisFg1' },
    ocamlKeyChar = { link = 'ConcoctisOrange' },
    ocamlArrow = { link = 'ConcoctisOrange' },
    ocamlInfixOpKeyword = { link = 'ConcoctisRed' },
    ocamlConstructor = { link = 'ConcoctisOrange' },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = 'Title' },
    LspSagaCodeActionBorder = { link = 'ConcoctisFg1' },
    LspSagaCodeActionContent = { fg = C.green, style = 'bold' },
    LspSagaLspFinderBorder = { link = 'ConcoctisFg1' },
    LspSagaAutoPreview = { link = 'ConcoctisOrange' },
    TargetWord = { fg = C.blue, style = 'bold' },
    FinderSeparator = { link = 'ConcoctisAqua' },
    LspSagaDefPreviewBorder = { link = 'ConcoctisBlue' },
    LspSagaHoverBorder = { link = 'ConcoctisOrange' },
    LspSagaRenameBorder = { link = 'ConcoctisBlue' },
    LspSagaDiagnosticSource = { link = 'ConcoctisOrange' },
    LspSagaDiagnosticBorder = { link = 'ConcoctisPurple' },
    LspSagaDiagnosticHeader = { link = 'ConcoctisGreen' },
    LspSagaSignatureHelpBorder = { link = 'ConcoctisGreen' },
    SagaShadow = { link = 'Concoctisbg2' },

    -- dashboard-nvim
    DashboardShortCut = { link = 'ConcoctisOrange' },
    DashboardHeader = { link = 'ConcoctisAqua' },
    DashboardCenter = { link = 'ConcoctisYellow' },
    DashboardFooter = { fg = C.purple, style = 'italic' },
    -- mason
    MasonHighlight = { fg = C.darkBlue },
    MasonHighlightBlock = { fg = C.bg7, bg = C.darkBlue },
    MasonHighlightBlockBold = { fg = C.bg7, bg = C.darkBlue, style = 'bold' },
    MasonHighlightSecondary = { fg = C.darkYellow },
    MasonHighlightBlockSecondary = { fg = C.bg7, bg = C.darkYellow },
    MasonHighlightBlockBoldSecondary = { fg = C.bg7, bg = C.darkYellow, style = 'bold' },
    MasonHeader = { link = 'MasonHighlightBlockBoldSecondary' },
    MasonHeaderSecondary = { link = 'MasonHighlightBlockBold' },
    MasonMuted = { fg = C.light4 },
    MasonMutedBlock = { fg = C.bg7, bg = C.light4 },
    MasonMutedBlockBold = { fg = C.bg7, bg = C.light4, style = 'bold' },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = 'comment' },
    -- carbon.nvim
    CarbonFile = { link = 'ConcoctisFg1' },
    CarbonExe = { link = 'ConcoctisYellow' },
    CarbonSymlink = { link = 'ConcoctisAqua' },
    CarbonBrokenSymlink = { link = 'ConcoctisRed' },
    CarbonIndicator = { link = 'ConcoctisGray' },
    CarbonDanger = { link = 'ConcoctisRed' },
    CarbonPending = { link = 'ConcoctisYellow' },

    BlinkCmpGhostText = { fg = '#666666' },

    RenderMarkdownCodeInline = { bg = C.bg2 },
    -- RenderMarkdownBullet = { fg = C.sky },
    RenderMarkdownTableHead = { fg = C.darkBlue },
    -- RenderMarkdownTableRow = { fg = C.darkGreen },
    RenderMarkdownSuccess = { fg = C.green },
    RenderMarkdownInfo = { fg = C.darkAqua },
    RenderMarkdownHint = { fg = C.darkBlue },
    RenderMarkdownWarn = { fg = C.yellow },
    RenderMarkdownError = { fg = C.red },
    RenderMarkdownCode = { bg = C.bg2 },
    -- The 'highlight_inline' attribute for the 'code' block defaults to 'RenderMarkdownCode'.
    -- If setting 'fg = gruvbox_bright_green' for 'RenderMarkdownCode', everything inside a code block gets
    -- highlighted bright_green. If using the default value for 'highlight_inline', inline code in headings
    -- become black boxes. To fix this, define a new highlight group and assign it to 'highlight_inline'.
    -- _InlineCode = { fg = C.green, bg = C.bg2 },
    RenderMarkdownH1Bg = { fg = C.bg0, bg = C.darkGreen, bold = true },
    RenderMarkdownH2Bg = { fg = C.bg0, bg = C.darkBlue, bold = true },
    RenderMarkdownH3Bg = { fg = C.bg0, bg = C.darkAqua, bold = true },
    RenderMarkdownH4Bg = { fg = C.bg0, bg = C.darkPurple, bold = true },
    RenderMarkdownH5Bg = { fg = C.bg0, bg = C.darkYellow, bold = true },
    RenderMarkdownH6Bg = { fg = C.bg0, bg = C.darkRed, bold = true },
  }

  for group, hl in pairs(config.override_highlights) do
    if groups[group] and not vim.tbl_isempty(hl) then
      groups[group].link = nil
    end
    groups[group] = vim.tbl_extend('force', groups[group] or {}, hl)
  end

  return groups
end

return M
