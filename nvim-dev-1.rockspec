package = "nvim"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["theprimeagen.cmp-use-rust"] = "lua/theprimeagen/cmp-use-rust.lua",
      ["theprimeagen.debugger.cpp"] = "lua/theprimeagen/debugger/cpp.lua",
      ["theprimeagen.debugger.init"] = "lua/theprimeagen/debugger/init.lua",
      ["theprimeagen.debugger.node"] = "lua/theprimeagen/debugger/node.lua",
      ["theprimeagen.init"] = "lua/theprimeagen/init.lua",
      ["theprimeagen.keymap"] = "lua/theprimeagen/keymap.lua",
      ["theprimeagen.neogit"] = "lua/theprimeagen/neogit.lua",
      ["theprimeagen.packer"] = "lua/theprimeagen/packer.lua",
      ["theprimeagen.set"] = "lua/theprimeagen/set.lua",
      ["theprimeagen.statusline"] = "lua/theprimeagen/statusline.lua",
      ["theprimeagen.telescope"] = "lua/theprimeagen/telescope.lua",
      ["theprimeagen.text-me-daddy.init"] = "lua/theprimeagen/text-me-daddy/init.lua"
   }
}
