local neogit_status_ok, neogit = pcall(require, "neogit")
if not neogit_status_ok then
    return
end

neogit = require('neogit')

neogit.setup {
    kind = 'replace'
}
