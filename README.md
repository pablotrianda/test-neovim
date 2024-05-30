# 🧪 Test Golang Neovim

Run the golang tests using [vim-go](https://github.com/fatih/vim-go) commands


![img](https://i.imgur.com/6sGNCU6.png)


## 📦 Installation

Install the plugin with your preferred package manager:

### [Lazy](https://github.com/folke/lazy.nvim)

```lua
-- Lua
{
	"pablotrianda/test-golang",
	dependencies = {
		"anuvyklack/hydra.nvim",
		"fatih/vim-go"
	},
	config = true,
	keys = { { "<leader>t", desc = "Open Test menu" } },
}
```

## 🚀 Usage
🖮 `<leader>t`

## Details
Show the following options:
* `GoTestFunc`
* `GoFuncFile`
* `GoTestCompile`
* `GoCoverage (Diff)`
* `go test ./... -coverprofile=cover.out && go tool cover -html=cover.out` (Open in browser)
