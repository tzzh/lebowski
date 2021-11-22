local Job = require("plenary.job")

local M = {}

M.run = function()
	local results = {}
	local j = Job:new({
		command = "pipenv",
		args = { "run", "mypy", "." },
		on_stdout = function(_, data)
			local filename, lnum, msg = string.match(data, "(.*):(%d+): (.*)")
			table.insert(results, {
				filename = filename,
				lnum = lnum,
				text = msg,
			})
		end,
		on_exit = vim.schedule_wrap(function()
			print("Done!")
			vim.fn.setqflist(results)
			vim.cmd([[copen]])
		end),
	})

	print("Running mypy")
	j:start()
end

return M
