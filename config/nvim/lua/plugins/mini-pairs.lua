return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {
    modes = { insert = true, command = false, terminal = false },
    mappings = {
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      ["["] = {
        action = "open",
        pair = "[]",
        neigh_pattern = ".[%s%z%)}%]]",
        register = { cr = false },
        -- foo|bar -> press "[" -> foo[bar
        -- foobar| -> press "[" -> foobar[]
        -- |foobar -> press "[" -> [foobar
        -- | foobar -> press "[" -> [] foobar
        -- foobar | -> press "[" -> foobar []
        -- {|} -> press "[" -> {[]}
        -- (|) -> press "[" -> ([])
        -- [|] -> press "[" -> [[]]
      },
      ["{"] = {
        action = "open",
        pair = "{}",
        -- neigh_pattern = ".[%s%z%)}]",
        neigh_pattern = ".[%s%z%)}%]]",
        register = { cr = false },
        -- foo|bar -> press "{" -> foo{bar
        -- foobar| -> press "{" -> foobar{}
        -- |foobar -> press "{" -> {foobar
        -- | foobar -> press "{" -> {} foobar
        -- foobar | -> press "{" -> foobar {}
        -- (|) -> press "{" -> ({})
        -- {|} -> press "{" -> {{}}
      },
      ["("] = {
        action = "open",
        pair = "()",
        -- neigh_pattern = ".[%s%z]",
        neigh_pattern = ".[%s%z%)]",
        register = { cr = false },
        -- foo|bar -> press "(" -> foo(bar
        -- foobar| -> press "(" -> foobar()
        -- |foobar -> press "(" -> (foobar
        -- | foobar -> press "(" -> () foobar
        -- foobar | -> press "(" -> foobar ()
      },
      -- Double quote: Prevent pairing if either side is a letter
      ['"'] = {
        action = "closeopen",
        pair = '""',
        neigh_pattern = "[^%w\\][^%w]",
        register = { cr = false },
      },
      -- Single quote: Prevent pairing if either side is a letter
      ["'"] = {
        action = "closeopen",
        pair = "''",
        neigh_pattern = "[^%w\\][^%w]",
        register = { cr = false },
      },
      -- Backtick: Prevent pairing if either side is a letter
      ["`"] = {
        action = "closeopen",
        pair = "``",
        neigh_pattern = "[^%w\\][^%w]",
        register = { cr = false },
      },
    },
    -- -- skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- -- skip autopair when the cursor is inside these treesitter nodes
    skip_ts = { "string" },
    -- -- skip autopair when next character is closing pair
    -- -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
    -- -- better deal with markdown code blocks
    markdown = true,
  },
  config = function(_, opts)
    LazyVim.mini.pairs(opts)
  end,
}
