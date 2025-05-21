return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.comment').setup()
        require('mini.move').setup()
        require('mini.pairs').setup()
        require('mini.git').setup()
        require('mini.notify').setup()
        require('mini.basics').setup()
    end
}
