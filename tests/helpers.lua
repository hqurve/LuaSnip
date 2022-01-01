local helpers = require("test.functional.helpers")(after_each)

local M = {}

function M.session_setup_luasnip()
	helpers.exec("set rtp+=" .. os.getenv("LUASNIP_SOURCE"))
	helpers.exec(
		string.format(
			"source %s/plugin/luasnip.vim",
			os.getenv("LUASNIP_SOURCE")
		)
	)

	helpers.exec_lua([[
	ls = require("luasnip")
	ls.config.setup({})

	s = ls.s
	sn = ls.sn
	t = ls.t
	i = ls.i
	f = ls.f
	c = ls.c
	d = ls.d
	isn = require("luasnip.nodes.snippet").ISN
	l = require'luasnip.extras'.lambda
	dl = require'luasnip.extras'.dynamic_lambda
	rep = require'luasnip.extras'.rep
	r = ls.restore_node
	p = require("luasnip.extras").partial
	types = require("luasnip.util.types")
	events = require("luasnip.util.events")
	fmt = require("luasnip.extras.fmt").fmt
	fmta = require("luasnip.extras.fmt").fmta
	parse = ls.parser.parse_snippet
	n = require("luasnip.extras").nonempty
	m = require("luasnip.extras").match
	ai = require("luasnip.nodes.absolute_indexer")
	]])
end

return M