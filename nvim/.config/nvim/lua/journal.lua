local journal_folder = "~/journal/"
local filename_format = "%Y-%m-%d_%A_%d_%B_%Y"

local M = {}

local function list_days()
	local p = io.popen("find " .. journal_folder .. " -type f")
	local results = {}
	for file in p:lines() do
		table.insert(results, file)
	end
	return results
end

local function edit_file(filename)
	vim.cmd([[edit ]] .. filename)
end

M.edit_current_day = function()
	local filename = os.date(filename_format)
	edit_file(journal_folder .. filename .. [[.md]])
end

M.edit_last_day = function()
	local previous_file_days = list_days()
	table.sort(previous_file_days)
	local last_file_day = previous_file_days[#previous_file_days]
	edit_file(last_file_day)
end

return M
