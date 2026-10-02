# Bước 1 theo đề: kiểm chứng Nginx và chuẩn bị commit 1

Thực hiện sau khi cập nhật giao diện và bản sửa phông chữ. Trang web đã có ảnh và bố cục mới trên Windows, nhưng cần minh chứng Nginx/headers trước khi đánh dấu hoàn thành tiêu chí.

## 1. Sửa hiển thị chữ tiếng Việt

1. Giải nén `bep-nha-sua-chu.zip`.
2. Sao chép các mục bên trong thư mục đã giải nén vào `C:\Users\basiu\recipe-website`.
3. Chọn **Replace the files in the destination** khi Windows hỏi tệp trùng tên. Giữ file `.env` hiện có.
4. Mở trang chủ và món cơm chiên, nhấn Ctrl + F5:
   - `http://localhost:18080/index.php`
   - `http://localhost:18080/recipe.php?id=3`
5. Kiểm tra “Ấm lòng mỗi bữa.” và “Cơm chiên trứng cà rốt” liền chữ, dấu đúng vị trí.

Gói chỉ sửa PHP/CSS, thêm phông local và cập nhật tài liệu. Compose đang bind-mount `app`, nên không cần build lại container cho bản sửa chữ này.

## 2. Kiểm chứng Nginx

Mở CMD, nhập từng dòng:

```bat
cd /d C:\Users\basiu\recipe-website
docker compose ps
docker compose exec nginx nginx -t
curl.exe -I http://localhost:18080
docker compose exec web id
```

Kết quả cần thấy:

- `db`, `phpmyadmin`, `web`, `nginx` hoạt động; dịch vụ có healthcheck ở trạng thái healthy.
- Nginx báo `syntax is ok` và `test is successful`.
- Website trả `HTTP/1.1 200 OK`; response có `Server: nginx`, `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY`, `Referrer-Policy` và `Content-Security-Policy`.
- Web chạy với `www-data`, không phải root.

Nginx config test chứng minh cú pháp đúng. HTTP response và headers xác nhận truy cập thực tế đi qua Nginx. Kết hợp hai minh chứng này trong báo cáo. Nếu lệnh có lỗi, gửi kết quả trước khi làm bước GitHub.

## 3. Thu thập minh chứng hardening

Các biện pháp có sẵn để kiểm tra và giải thích:

- Non-root web: `docker compose exec web id`.
- Cách ly mạng: backend `internal: true`; Nginx chỉ ở frontend, DB chỉ ở backend.
- Giới hạn cổng: DB không có host port; web không công bố cổng trực tiếp; Nginx/phpMyAdmin chỉ bind loopback.
- Giới hạn quyền: web `cap_drop: ALL`, `no-new-privileges`; source và config mount chỉ đọc.
- Security headers của Nginx: xem kết quả `curl.exe -I`.
- DB dùng tài khoản `recipe_user`, không dùng root từ website. Mật khẩu do người thực hiện tự đặt; cần kiểm tra độ mạnh và quyền DB.

Lưu ảnh website, phpMyAdmin, kết quả Nginx/headers/non-root vào `docs/screenshots/` để dùng trong báo cáo tối thiểu 10 trang. Không chụp giá trị mật khẩu.

## 4. Chuẩn bị GitHub và commit 1

Đề yêu cầu tài khoản/repository đặt theo mã số sinh viên, source + cấu hình đầy đủ và README. Cần mã số sinh viên để hướng dẫn tên tài khoản/repository chính xác; tài khoản GitHub và email dùng làm tác giả Git do người thực hiện chọn.

Kiểm tra thay đổi và việc loại file mật khẩu tại CMD trong thư mục dự án:

```bat
git status --short
git check-ignore .env
git ls-files -- .env
```

`.env` cần được ignore và không xuất hiện trong danh sách tệp Git đã theo dõi. Nếu nó đã được theo dõi, cần gỡ khỏi Git index nhưng giữ file trên máy trước khi commit. Không đẩy mật khẩu lên GitHub.

Sau khi Nginx chạy đúng, cấu hình tác giả Git, tạo repository theo MSSV, commit các thay đổi với nội dung rõ ràng, ví dụ `Deploy recipe website with Nginx reverse proxy and security headers`, rồi đẩy lên GitHub. Hướng dẫn thao tác sẽ thực hiện từng bước cùng người thực hiện sau khi có kết quả kiểm tra; chưa có commit nào được thực hiện bằng tài liệu này.

## 5. Sau commit 1

- Commit 2: thêm Prometheus/Grafana và exporter, kiểm tra metrics của container, web và DB, tạo dashboard.
- Commit 3: thêm Loki/Promtail, gom log và chạy ít nhất 2–3 truy vấn LogQL.
- Hoàn thiện minh chứng ít nhất 3–4 biện pháp hardening, báo cáo cá nhân và demo toàn hệ thống chạy bằng Docker Compose.
