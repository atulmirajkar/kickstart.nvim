-- Fix for incorrect line endings
-- when copying from windows /browser and pasting in neovim, we used to get incorrect line endings
-- now when pasting in neovim we paste with the correct line endings
-- https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard
-- install win32yank.exe and add a symlink to the exe
-- sudo ln -s /c/sourcecode/bin/win32yank.exe /usr/local/bin/win32yank
vim.cmd [[
    set clipboard+=unnamedplus
    let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank -i --crlf',
          \      '*': 'win32yank -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank -o --lf',
          \      '*': 'win32yank -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
]]
