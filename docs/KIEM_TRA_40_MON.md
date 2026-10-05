# Kiểm tra bản 40 món trên Windows

## Kết quả đã kiểm tra trong môi trường biệt lập

- PHP-WASM 8.4 chạy code thật; DB fixture SQLite thay kết nối MySQL chỉ trong kiểm thử, không chép db.php kiểm thử vào dự án.
- Có 40 công thức, 257 bước có tiêu đề, 352 dòng liên kết nguyên liệu và 40 bản ghi recipe_details. Danh mục 8 và nguyên liệu 88 gồm các nguyên liệu cũ được giữ lại.
- Nhập SQL fixture hai lần không tạo bản trùng; ID 30 món cũ giữ nguyên. Món riêng, liên kết và mẹo riêng được giữ.
- Tìm tên món mới, lọc nhanh/danh mục, 4 trang 12/12/12/4 món, trường hợp rỗng, ID sai/404 và HTML escape đã qua.
- Cả 40 món có ảnh raster hiện có; ảnh ở danh sách và chi tiết đã tải đúng.
- Chromium: không lỗi JS dưới CSP chỉ cho nguồn cùng website, không tràn ngang desktop/390 px; gợi ý ngẫu nhiên và checkbox hoạt động.
- Liên kết in chuyển đúng trang, JS gọi hàm in khi trang tải xong và khi bấm nút mở lại. Khi JS tắt, trang bản in vẫn mở đủ nội dung, có hướng dẫn Ctrl + P.
- Xuất 3 PDF A4: Sữa chua trái cây (1 trang), Thịt kho trứng (2 trang), Bánh pancake chuối (2 trang). Đủ tên món, nguyên liệu, tiêu đề từng bước và mẹo; không có trang trắng hoặc thanh điều hướng. Từng trang đã render và xem trực quan.

Các kiểm thử trên chưa thay cho việc nhập MySQL 8.4 hoặc hộp thoại in thật ở máy Windows. Không khẳng định đã in giấy hay nấu thử toàn bộ công thức.

## Việc cần xác nhận sau khi áp dụng

1. phpMyAdmin nhập riêng 04_detailed_recipes.sql thành công.
2. Trang chủ hiển thị 40 món; cả bốn trang có ảnh.
3. Sữa chua trái cây: xoài 200 g, chuối 100 g, 6 bước có tiêu đề.
4. Món cũ như Thịt kho trứng còn mở được bằng đường dẫn cũ.
5. Món mới như Gà xào sả ớt và Bánh pancake chuối có đủ nguyên liệu/ảnh/cách nấu/mẹo.
6. Bấm In công thức / Lưu PDF, chọn Save as PDF, lưu và mở tệp được.
7. Kiểm tra trang nhỏ/điện thoại và tìm kiếm sau cập nhật.

Minh chứng phù hợp cho báo cáo: trang chủ 40 món, một công thức mới, nguyên liệu/cách làm chi tiết, hộp thoại in hoặc PDF đã lưu. Chụp sau khi áp dụng thực tế.

## Dữ liệu, nguồn và cấu trúc

Nội dung công thức là bản hướng dẫn mới biên soạn cho dự án; thời gian nấu là ước tính. Mốc nhiệt độ tâm gà, thịt xay và cá được đối chiếu với tài liệu USDA FSIS:

- [Safe internal temperature for meat and poultry](https://ask.fsis.usda.gov/article/What-is-a-safe-internal-temperature-for-cooking-meat-and-poultry)
- [Food Thermometers](https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/food-safety-basics/food-thermometers)

04 tạo bảng phụ recipe_details có khóa ngoại tới recipes. Bốn bảng chính vẫn giữ cấu trúc; bản này có tổng 5 bảng. Trong recipes.instructions, mỗi dòng có dạng `1. Tiêu đề | Hướng dẫn`; PHP vẫn đọc được dòng kiểu cũ không có dấu phân cách. Ghi chú nguyên liệu lưu JSON dạng TEXT, được escape trước khi hiển thị. Mẹo riêng lưu TEXT, mỗi dòng một mẹo.

## Lưu GitHub sau khi kiểm chứng

Trong CMD tại `C:\Users\basiu\recipe-website`, chạy từng lệnh:

```bat
git diff --check
git add app database/03_expand_recipes.sql database/04_detailed_recipes.sql README.md HUONG_DAN_40_MON.txt docs/ANH_MON_AN.md docs/ANH_10_MON_MOI.md docs/KIEM_TRA_40_MON.md
git diff --cached --stat
git commit -m "Expand to 40 detailed recipes and improve printing"
git push origin main
```

Nếu bản 30 món/ảnh đã commit, chỉ những tệp có thay đổi sẽ được thêm. Không thêm .env hoặc bản SQL xuất chứa dữ liệu ngoài bộ công thức mẫu.
