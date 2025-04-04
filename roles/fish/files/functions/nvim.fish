function nvim --wraps=io.neovim.nvim --description 'alias nvim=io.neovim.nvim'
  io.neovim.nvim $argv
end

function vim --wraps=io.neovim.nvim --description 'alias vim=io.neovim.nvim'
  io.neovim.nvim $argv
end
