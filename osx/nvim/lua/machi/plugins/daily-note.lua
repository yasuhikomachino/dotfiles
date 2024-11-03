local function setup_daily_note()
  local file_utils = {}
  local date_utils = {}

  function file_utils.get_daily_note_path(date)
    local base_path = os.getenv("NOTE_PATH")
    if not base_path then
      return nil, "NOTE_PATH environment variable is not set. Please set it to your Obsidian vault path."
    end

    return string.format("%s/Daily/%s/%s/%s-%s-%s.md", base_path, date.year, date.month, date.year, date.month, date.day), nil
  end

  function file_utils.ensure_directory_exists(file_path)
    local dir_path = vim.fn.fnamemodify(file_path, ":h")
    os.execute("mkdir -p " .. dir_path)
  end

  function date_utils.get_current_date()
    local date = os.date("*t")
    return {
      year = date.year,
      month = string.format("%02d", date.month),
      day = string.format("%02d", date.day),
    }
  end

  local function open_or_create_daily_note()
    local file_path, error_msg = file_utils.get_daily_note_path(date_utils.get_current_date())

    if error_msg then
      vim.api.nvim_err_writeln(error_msg)
      return
    end

    file_utils.ensure_directory_exists(file_path)
    vim.cmd("edit " .. file_path)
  end

  vim.api.nvim_create_user_command("DailyNote", open_or_create_daily_note, {})

  vim.keymap.set("n", "<leader>dn", "<cmd>DailyNote<CR>", { desc = "Open Daily Note" })
end

return {
  "daily-note",
  dir = vim.fn.stdpath("config") .. "/lua/plugins",
  config = setup_daily_note,
}
