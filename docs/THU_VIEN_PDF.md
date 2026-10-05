# Tải PDF trực tiếp

`app/download.php?id=...` đọc công thức và nguyên liệu hiện tại từ database, tạo PDF A4 trong bộ nhớ, trả `Content-Type: application/pdf` và `Content-Disposition: attachment`. Tên file là `cong-thuc-ID.pdf`; không lấy tên đường dẫn từ dữ liệu người dùng. Không cần JavaScript, hộp thoại in, máy in, CDN, Composer trên máy người dùng hoặc ghi file PDF vào volume. Công thức mới tự thêm qua database cũng có thể tải PDF. Giữ nút in thủ công tại bản in HTML.

Phông Noto Serif chứa tiếng Việt, được nhúng theo tập ký tự đã dùng để PDF nhỏ gọn. Nội dung gồm tiêu đề, danh mục, thời gian, khẩu phần, mô tả, lưu ý thời gian, lượng nguyên liệu và chú thích, các bước, mẹo. Mã hiện tại dùng UTF-8, truy vấn có tham số, kiểm tra ID và trả 404 cho công thức không tồn tại. Trạng thái đánh dấu nguyên liệu/bước không làm thiếu nội dung PDF.

## Thành phần đi kèm

| Thành phần | Bản | Nguồn | Giấy phép |
| --- | --- | --- | --- |
| tFPDF | 1.33 | https://www.fpdf.org/en/script/script92.php và https://github.com/Setasign/tFPDF | LGPL; giữ header, README và bản LGPL 2.1 đi kèm |
| TTFontFile | 1.06, nằm trong tFPDF | Cùng nguồn tFPDF | LGPL; giữ nguyên header tác giả |
| Symfony polyfill-mbstring | v1.33.0 | https://github.com/symfony/polyfill-mbstring/tree/v1.33.0 | MIT, giữ LICENSE |
| Noto Serif Regular/Italic | Tệp hiện có trong dự án | https://github.com/notofonts/noto-fonts/tree/main/hinted/ttf/NotoSerif | SIL OFL 1.1, giữ OFL.txt |

Tệp thư viện nằm trong `app/lib/`; mã nguồn PHP đi kèm để có thể xem và sửa. Không sửa mã của nhà cung cấp. `ttfonts.php` được require rõ ràng vì bản mirror dùng Composer autoload theo mặc định. Polyfill đi kèm thay các hàm mbstring còn thiếu; cần iconv, có trong image PHP đang dùng. Không cần sửa Dockerfile hoặc cài extension mbstring cho bản này. Có thể thay các thư viện cùng API bằng cách cập nhật tệp nguồn; không có chữ ký/khóa ngăn việc thay đổi.

tFPDF có cache thông số phông tùy chọn và chỉ tạo cache khi thư mục cho phép ghi. Cache không bắt buộc; PDF vẫn tạo trong bộ nhớ với thư mục app chỉ đọc của dự án. Không đưa cache phông từ môi trường kiểm tra vào gói cập nhật.

Kiểm chứng biệt lập: tạo đủ 60 PDF qua chính endpoint PHP 8.4, tắt các hàm mb_strlen, mb_substr và mb_convert_encoding gốc để kiểm tra polyfill. Trích xuất đủ nội dung tiếng Việt, đối chiếu nguyên liệu, chú thích, mọi bước và mẹo; kiểm tra download bằng Chromium với CSP của dự án và JavaScript tắt. Đây không phải kết quả chạy trên máy Windows của sinh viên; cần kiểm tra file tải thực tế sau khi áp dụng gói.

Kiểm tra bổ sung: endpoint vẫn tạo PDF khi tắt toàn bộ hàm mb_* gốc của runtime; xác nhận mb_strlen và mb_internal_encoding được định nghĩa từ polyfill.
