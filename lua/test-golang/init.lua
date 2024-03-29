local hydra = require "hydra"

local hint = [[
   _f_: Test File     _x_: Compile test
   _c_: Current Test  _t_: Test Coverage report  
  
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
         { '<Esc>', nil, { exit = true, nowait = true } },
      }
   }
end

return M
