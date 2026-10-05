# Kiểm tra bản 100 món

Áp dụng HUONG_DAN_100_MON.txt trên bản 60 món hiện có. Ảnh Windows gửi ngày 04/10/2026 xác nhận web đang có 60 món; các thay đổi lên 100 cần được chép và nhập SQL trên máy sinh viên.

| Kiểm tra | Thao tác trên Windows | Kết quả mong đợi |
| --- | --- | --- |
| Dữ liệu | recipe_db > Import riêng 06_hundred_recipes.sql | Thông báo thành công |
| Tổng món | Xóa từ khóa và các bộ lọc | 100 công thức, 9 trang; trang cuối 4 món |
| Nền bếp | Mở rộng cửa sổ trên máy tính | Căn bếp ở cả hai bên trang chủ và trang chi tiết |
| Ảnh | Mở món mới và món cũ | Có ảnh món tương ứng, không hiện ảnh lỗi |
| Nguyên liệu | Mở Bánh cuốn chảo hoặc Bánh flan hấp | Đủ định lượng, đơn vị và chú thích |
| Hướng dẫn | Mở món mới | 6 bước có tiêu đề, thao tác và thời gian, 2 mẹo riêng |
| Thời gian phụ | Mở Xôi gấc, Chè đậu đỏ, Bánh flan hấp | Ghi rõ thời gian ngâm hoặc làm lạnh thêm |
| Đúng 60 | Chọn Đúng 60 phút | Tất cả kết quả ghi 60 phút; gồm cả món cũ và mới |
| Danh mục | Chọn Canh + Đúng 60 phút | Canh sườn hầm củ sen; các canh 20/25/30 phút không xuất hiện |
| Phân trang | Chuyển trang 2 rồi trang 9 | Nội dung đổi, không mất lựa chọn bộ lọc |
| Tải PDF | Mở món > Tải PDF; Ctrl + J nếu cần | File cong-thuc-ID.pdf tải được và mở được |
| Nội dung PDF | Mở file của món mới | Tiếng Việt rõ, đủ nguyên liệu, bước và mẹo, có số trang |
| Bản in | In công thức > Mở hộp thoại in | Bản in sáng, không có nền căn bếp |
| Màn hình nhỏ | Thu hẹp cửa sổ hoặc chế độ mobile | Chữ/nút đọc được, 9 nút phân trang xuống dòng, không tràn ngang |
| Món cũ | Mở Trứng chiên hành lá, món rựa mận | Món còn nguyên; nguyên liệu rựa mận ghi Cơm mẻ và có chú thích |

Với bộ mẫu chuẩn, tab SQL có thể chạy:

```sql
SELECT COUNT(*) AS tong_mon FROM recipes;
SELECT COUNT(*) AS cong_thuc_chi_tiet FROM recipe_details;
SELECT COUNT(*) AS lien_ket_nguyen_lieu FROM recipe_ingredients;
SELECT title, prep_time_minutes FROM recipes
WHERE prep_time_minutes = 60 ORDER BY title;
```

Kết quả bộ mẫu: 100 món, 100 hàng recipe_details, 964 liên kết nguyên liệu, 626 bước hướng dẫn và 8 danh mục. Có món riêng trước đó thì số đếm có thể cao hơn. Danh mục nguyên liệu giữ các tên cũ chưa dùng, nên không lấy số tên nguyên liệu làm tiêu chí hoàn tất nâng cấp.

## Kiểm chứng khi chuẩn bị gói

- SQLite fixture từ bộ dữ liệu trước, nhập 06 hai lần: giữ nguyên ID và hàng recipes của 60 món, giữ nội dung/nguyên liệu cũ ngoài sửa Cơm mẻ ở 2 món. Một món riêng ngoài bộ mẫu cũng được giữ.
- Kiểm tra thêm collation tên không phân biệt dấu để mô phỏng va chạm Me/Mẻ của MySQL utf8mb4_unicode_ci. Tên Cơm mẻ tách riêng; lượng, đơn vị và ghi chú khớp danh mục cho cả 100 món.
- Chạy chính PHP 8.4: 100 trang chi tiết, 100 bản in, 100 endpoint PDF thật, 9 trang danh sách; tìm kiếm, 404, escape và tham số không hợp lệ.
- Đối chiếu 11 bộ lọc thời gian cùng cận 15/16/30/31/45/46/60/61/90/91. Bộ lọc dựa trên giá trị thời gian trong DB.
- Chromium kiểm tra tất cả ảnh/trang chi tiết ở máy tính và 390 px, bố cục thêm ở 320/768/1366/1920 px, nền hai bên, trang cuối và phân trang.
- Thử tải file đính kèm từ trang chi tiết, trang bản in và khi JavaScript tắt, với CSP cùng nguồn. PDF món mới được so byte với phản hồi endpoint. Checkbox và nút in thủ công hoạt động.
- Đối chiếu toàn bộ nội dung 100 PDF: mô tả, tên/ghi chú nguyên liệu, từng bước, mẹo, thời gian phụ và lề trang; render 7 PDF đại diện để xem trực quan. Tắt các hàm mbstring gốc để kiểm tra polyfill đi kèm.

Đây là kiểm tra PHP/SQLite và trình duyệt trong môi trường biệt lập, chưa phải kết quả chạy bản 06 trên MySQL/Windows của sinh viên. Công thức chưa nấu thử; ảnh là minh họa AI. Prompt và tên ảnh trong ANH_40_MON_MOI.md.

## Minh chứng báo cáo

Dùng ảnh thật sau khi áp dụng trên Windows: thông báo nhập SQL, tổng 100, nền bếp, công thức chi tiết, lọc đúng thời gian và PDF đã mở. Các ảnh này bổ sung phần chức năng; minh chứng Docker, giám sát và logging của đề 29 vẫn dùng phần đã thực hiện trước.
