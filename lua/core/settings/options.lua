local opt = vim.opt
local g = vim.g

-- Hiển thị số dòng và số dòng tương đối
opt.number = true -- Hiển thị số dòng thực tế bên cạnh số dòng tương đối

-- Tabs và thụt lề
opt.tabstop = 4       -- Số khoảng trắng khi nhấn phím Tab là 4
opt.shiftwidth = 4    -- Số khoảng trắng khi tự động thụt lề hoặc dùng lệnh >>, << là 4
opt.expandtab = true  -- Chuyển đổi phím Tab thành khoảng trắng thay vì ký tự Tab
opt.autoindent = true -- Tự động thụt lề theo dòng trước đó

opt.wrap = true       -- Xuống dòng tự động khi nội dung vượt quá chiều rộng cửa sổ

-- Cài đặt tìm kiếm
opt.ignorecase = true -- Bỏ qua phân biệt chữ hoa và chữ thường khi tìm kiếm
opt.smartcase = true  -- Tự động phân biệt hoa/thường nếu chuỗi tìm kiếm chứa chữ hoa

opt.cursorline = true -- Nổi bật dòng hiện tại

-- Màu sắc và giao diện
opt.termguicolors = true -- Bật hỗ trợ màu 24-bit
opt.background = "dark"  -- Thiết lập giao diện tối để phù hợp với các theme tối
opt.signcolumn = "yes"   -- Hiển thị cột kí hiệu bên trái (dùng cho cảnh báo, breakpoint, v.v.)

-- Tắt file swap và backup
opt.swapfile = false    -- Tắt chế độ lưu file tạm (swap file)
opt.backup = false      -- Tắt tạo file backup khi lưu file
opt.writebackup = false -- Tắt backup file trước khi ghi đè file

opt.updatetime = 250    -- Giảm thời gian chờ khi Neovim nhận diện thay đổi (mặc định là 4000ms)
opt.timeoutlen = 10     -- Giảm thời gian chờ cho tổ hợp phím
opt.lazyredraw = true   -- Giúp vẽ màn hình mượt hơn khi chạy macro và plugin

-- backspace
opt.backspace = "indent,eol,start" -- Cho phép Backspace hoạt động trên cả thụt lề, ký tự xuống dòng và từ đầu dòng

-- clipboard
-- Tải xclip để sử dụng tính năng này 'sudo apt install xclip -y'
opt.clipboard:append("unnamedplus") -- Sử dụng clipboard hệ thống để copy/paste trong nvim

-- Chia cửa sổ
opt.splitright = true -- Mở cửa sổ dọc (vertical split) ở bên phải
opt.splitbelow = true -- Mở cửa sổ ngang (horizontal split) ở bên dưới
opt.cursorlineopt = "both"

opt.fillchars:append("eob: ")
------------------------------------------------------------------

-- Tắt plugin 'netrw' vì đã sử dụng 'nvim-tree' thay thế
g.loaded_netrw = 1       -- Ngăn không tải plugin netrw
g.loaded_netrwPlugin = 1 -- Ngăn không tải các chức năng mở rộng của netrw
