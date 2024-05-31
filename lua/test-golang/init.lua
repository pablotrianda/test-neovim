local hydra = require "hydra"

local hint = [[
   _f_: Test File     _x_: Compile test
   _c_: Current Test  _t_: Test Coverage report (diff) 
   _o_: Open coverage report 
 ^
 _<Esc>_
]]


local M = {}
M.setup = function()

   -- Process only is a golang file
   if vim.bo.filetype ~= "go" then
      return
   end

   hydra{
      name = 'Test',
      hint = hint,
      config = {
         color = 'teal',
         invoke_on_body = true,
         hint = {
            position = 'middle',
            border = 'rounded',
         },
      },
      mode = 'n',
      body = '<leader>t',
      heads = {
         { 'f', ':GoTestFile<CR>' },
         { 'c', ':GoTestFunc<CR>' },
         { 'x', ':GoTestCompile<CR>'},
         { 't', ':GoCoverage<CR>'},
         { 'o', ':! go test ./... -coverprofile=cover.out && go tool cover -html=cover.out && go tool cover -func=cover.out  <CR>'},
         { '<Esc>', nil, { exit = true, nowait = true } },
      }
   }
end

return M
