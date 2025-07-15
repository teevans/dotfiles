local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function laravel_routes()
  -- Run php artisan route:list and capture output
  local handle = io.popen("php artisan route:list --json 2>/dev/null")
  if not handle then
    vim.notify("Failed to run php artisan route:list", vim.log.levels.ERROR)
    return
  end
  
  local result = handle:read("*a")
  handle:close()
  
  -- Parse JSON response
  local ok, routes = pcall(vim.json.decode, result)
  if not ok or not routes then
    vim.notify("Failed to parse route list", vim.log.levels.ERROR)
    return
  end
  
  -- Format routes for display
  local route_list = {}
  for _, route in ipairs(routes) do
    local method = route.method or "ANY"
    local uri = route.uri or ""
    local name = route.name or ""
    local action = route.action or ""
    
    -- Create display string
    local display = string.format("%-8s %-40s %-25s %s", method, uri, name, action)
    
    table.insert(route_list, {
      display = display,
      method = method,
      uri = uri,
      name = name,
      action = action,
      -- Store original route data for potential use in actions
      data = route
    })
  end
  
  pickers.new({}, {
    prompt_title = "Laravel Routes",
    finder = finders.new_table {
      results = route_list,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          ordinal = entry.display,
        }
      end
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          local route = selection.value
          -- Copy route URI to clipboard
          vim.fn.setreg('+', route.uri)
          vim.notify("Route URI copied: " .. route.uri)
          
          -- If action contains a controller, try to open it
          if route.action and route.action:match("@") then
            local controller, method = route.action:match("([^@]+)@(.+)")
            if controller then
              -- Try to find and open the controller file
              local search_cmd = string.format("find app/Http/Controllers -name '%s.php' -type f 2>/dev/null | head -1", controller:match("([^\\]+)$"))
              local file_handle = io.popen(search_cmd)
              if file_handle then
                local file_path = file_handle:read("*l")
                file_handle:close()
                if file_path and file_path ~= "" then
                  vim.cmd("edit " .. file_path)
                  -- Try to jump to the method
                  vim.cmd("silent! /function " .. method .. "\\>/")
                end
              end
            end
          end
        end
      end)
      return true
    end,
  }):find()
end

-- Create command
vim.api.nvim_create_user_command('LaravelRoutes', laravel_routes, {})

-- Optional: create a keymap
vim.keymap.set('n', '<leader>lr', laravel_routes, { desc = 'Laravel Routes' })

return {
  laravel_routes = laravel_routes
}
