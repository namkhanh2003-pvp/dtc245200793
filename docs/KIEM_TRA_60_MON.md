# Kiểm tra bản 60 món trên Windows

Áp dụng hướng dẫn HUONG_DAN_60_MON.txt trước. Các kết quả bên dưới cần kiểm tra trên máy sinh viên; không mặc định đã hoàn thành chỉ vì gói được thử ở môi trường biệt lập.

| Việc kiểm tra | Cách làm | Kết quả cần có |
| --- | --- | --- |
| Nhập dữ liệu | Chọn recipe_db, Import riêng 05_more_recipes.sql | Thông báo thành công, không lỗi SQL |
| Tổng món | Xóa từ khóa và bộ lọc, chọn mọi danh mục/thời gian | 60 công thức, 5 trang nếu trước có đúng bộ 40 món |
| Khoảng 60 phút | Chọn 46–60 phút, bấm Tìm công thức | Chỉ món ghi 46 đến 60; không có 20/30/35/45 phút |
| Chính xác 60 | Chọn Đúng 60 phút, mọi danh mục, tìm | 5 món mẫu đều ghi 60 phút: Cá kho tộ, Canh sườn hầm củ sen, Cơm tấm sườn áp chảo, Nem rán, Chè khoai dẻo |
| Kết hợp danh mục | Canh + Đúng 60 phút | Canh sườn hầm củ sen; không thấy canh 20/25/30 phút |
| Khoảng khác | Thử 1–15, 16–30, 31–45, 61–90, trên 90 | Mọi món có thời gian nằm đúng khoảng |
| Món yêu cầu | Tìm thịt chó, rồi mắm tôm | Có các món tương ứng; mở chi tiết có ảnh và công thức |
| Nội dung mới | Mở Bún đậu mắm tôm hoặc Nem rán | Đủ lượng nguyên liệu, chú thích, 6–7 bước có tiêu đề và mẹo |
| Tải file | Mở một món, bấm Tải PDF | Trình duyệt tải cong-thuc-ID.pdf, tìm trong Ctrl + J nếu không hỏi vị trí |
| PDF mở được | Mở file đã tải | Tên đúng món, tiếng Việt rõ, nguyên liệu và mọi bước không bị cắt; có số trang |
| Trang bản in | Bấm In công thức | Bản in HTML có nút Tải PDF và Mở hộp thoại in |
| In ra giấy | Bấm Mở hộp thoại in hoặc Ctrl + P | Chọn được máy in; PDF tải trực tiếp không cần thao tác này |
| Món cũ | Mở lại Trứng chiên hành lá, Đậu hũ kho nấm | Nội dung cũ còn nguyên; nút tải PDF mới hoạt động |
| Điện thoại | Thu hẹp cửa sổ hoặc mở DevTools chế độ mobile | Không tràn ngang, bộ lọc và nút tải đọc/bấm được |

Có thể kiểm tra số lượng bằng tab SQL của phpMyAdmin:

```sql
SELECT COUNT(*) AS tong_mon FROM recipes;
SELECT COUNT(*) AS cong_thuc_chi_tiet FROM recipe_details;
SELECT r.title, r.prep_time_minutes
FROM recipes r
WHERE r.prep_time_minutes = 60
ORDER BY r.title;
```

Với bộ 60 mẫu: tổng món và công thức chi tiết đều 60; recipe_ingredients có 590 liên kết, ingredients có 132 tên kể cả các tên cũ được giữ lại. Số lượng có thể cao hơn nếu có món/nguyên liệu riêng. Bản 05 giữ nguyên 40 món cũ và ID; không xóa dữ liệu ngoài bộ mẫu. Nhập lại không nhân đôi các mẫu.

## Minh chứng báo cáo

Chụp ảnh thật trên Windows: tổng 60 món; bộ lọc Đúng 60 phút và kết quả; chi tiết một món mới; danh sách tải xuống và PDF đã mở. Có thể thêm thông báo SQL nhập thành công. Không dùng ảnh kiểm thử biệt lập làm bằng chứng Docker/MySQL đã chạy trên Windows. Nội dung này bổ sung tính năng; báo cáo đề 29 vẫn cần các minh chứng hạ tầng, giám sát và logging đã làm trước.

## Kiểm chứng đã thực hiện khi chuẩn bị gói

- SQL được chuyển cú pháp fixture để chạy SQLite; nhập lặp không trùng, giữ nguyên toàn bộ hàng dữ liệu của 40 món cũ và giữ một món riêng ngoài bộ mẫu.
- Chính mã PHP 8.4 chạy đủ 60 chi tiết, 60 bản in và 60 endpoint PDF, 5 trang danh sách. Kiểm tra tìm kiếm, 404, escape và tham số bộ lọc không hợp lệ.
- So sánh kết quả 11 lựa chọn thời gian với kho mẫu và các giá trị cận độc lập, gồm 46/60/61.
- Chromium với CSP cùng nguồn, ảnh đủ 60, desktop/390px, submit Đúng 60 phút, checkboxes, tải file đính kèm từ cả hai trang và khi JavaScript tắt; gọi in thủ công.
- PDF có nội dung đầy đủ cho tất cả 60 món, chữ tiếng Việt và lề hợp lệ. Xem trực quan 6 PDF đại diện (Đậu hũ kho nấm, rựa mận, bún bò Huế, canh sườn củ sen, nem rán, cà phê sữa đá), tổng 11 trang.
- Tắt các hàm mbstring gốc khi chạy endpoint để kiểm tra thư viện thay thế đi kèm; font nhúng lấy cục bộ, không cần tải mạng.

Chưa chạy bản 05 trên MySQL 8.4 và trình duyệt Windows của sinh viên. Công thức chưa được nấu thử; thời gian ước tính có thể thay đổi theo nguyên liệu và bếp. Ảnh minh họa AI; nguồn và prompt ở ANH_20_MON_MOI.md.
