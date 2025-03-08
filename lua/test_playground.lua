
---@diagnostic disable-next-line: lowercase-global
function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

---@diagnostic disable-next-line: lowercase-global
playground = require("lua.playground")

playground.hello_world()

print(playground)

vim.cmd("echo 'Hello, worldzzzz!'")

vim.cmd("Telescope buffers")



---@diagnostic disable-next-line: lowercase-global
read_file = function(path)
  local file = io.open(path, "r")  -- Open the file in read mode
  if not file then
    return nil, "Could not open file: " ..path
  end
  local content = file:read("*a")  -- Read the entire file content
  return content
end

---@diagnostic disable-next-line: lowercase-global
function extract_time_points(input)
    local start_time, end_time = input:match("CLOCK:%s*%[([^%]]+)%]%s*%-%-%s*%[([^%]]+)%]")
    if not end_time then
        start_time, end_time = input:match("CLOCK:%s*%[([^%]]+)%]")
    end
    return start_time, end_time
end


---@diagnostic disable-next-line: lowercase-global
function parse_timers(content)
  local content_tbl = {}
  for line in string.gmatch(content, "[^\n]+") do
      table.insert(content_tbl, line)
  end
  local found_open_timer = false
  local task_text = ""
  local time_diff_str = ""
  for linum, line in ipairs(content_tbl) do
    local tp1, tp2 = extract_time_points(line)
    if tp1 and not tp2 then
      found_open_timer = true
      task_text = content_tbl[linum-2]
      local start_time_epoch = os.time({
        year = tonumber(tp1:sub(1, 4)),
        month = tonumber(tp1:sub(6, 7)),
        day = tonumber(tp1:sub(9, 10)),
        hour = tonumber(tp1:sub(16, 17)),
        min = tonumber(tp1:sub(19, 21))
      })
      local current_time = os.time()
      local time_diff = current_time - start_time_epoch
      if time_diff < 60 then
        time_diff_str = time_diff .. "s"
      else
        time_diff_str = math.floor(time_diff / 60) .. "min"
      end
      return found_open_timer, task_text, time_diff_str
    end
  end
  return found_open_timer, task_text, time_diff_str
end


---@diagnostic disable-next-line: lowercase-global
function locate_org_files(directories)
  local ret = {}
  local files = {}
  for _, dir in ipairs(directories) do
    files = vim.fn.globpath(dir, '*.org', false, true)
    if #files > 0 then
      for _, file in ipairs(files) do
        table.insert(ret, file)
      end
    end
  end
  return ret
end


---@diagnostic disable-next-line: lowercase-global
get_running_timer_text = function(folders)
  local org_files = locate_org_files(folders)
  for _, file in ipairs(org_files) do
    local content = read_file(file)
    if content then
      local found_timer, task_text, time_diff = parse_timers(content)
      if found_timer then
        return "Task: " .. task_text:sub(8,#task_text) .. " (" .. time_diff .. ")"
      end
    end
  end
  return "No running timer found"
end

get_running_timer_text({
  '~/orgfiles/**',
  '~/orgfiles/**/*',
  '~/dev/**/*',
  '~/.config/nvim-playground/**'
})


