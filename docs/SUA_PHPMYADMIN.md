# Khôi phục truy cập phpMyAdmin ở cổng 18081

## Dấu hiệu và nguyên nhân suy luận

Trên Windows, phpMyAdmin báo đang chạy nhưng Compose chỉ hiển thị `80/tcp`, không có ánh xạ host `127.0.0.1:18081->80/tcp`; trình duyệt trả `ERR_CONNECTION_REFUSED`. Website qua Nginx, MySQL và non-root web đã được xác nhận hoạt động.

Trong bản cấu hình trước, phpMyAdmin chỉ gắn mạng backend `internal: true`. Tình trạng trên khớp báo cáo trên kho Moby về published ports bị bỏ qua khi container chỉ thuộc mạng nội bộ. Đây là nguyên nhân suy luận từ cấu hình, triệu chứng và báo cáo tái hiện; không có Docker runtime trong môi trường kiểm tra để tự tái hiện lỗi Windows.

## Bản sửa

- phpMyAdmin nối vào backend để truy cập MySQL, và một mạng bridge `admin` riêng để công bố cổng HTTP.
- Mapping vẫn là `127.0.0.1:18081:80`, chỉ truy cập từ máy đang chạy.
- MySQL vẫn chỉ ở backend nội bộ, không công bố cổng.
- Giữ nguyên volume `mysql_data`, mật khẩu và dữ liệu.

## Thao tác trên Windows

1. Tải và giải nén `bep-nha-sua-phpmyadmin.zip`.
2. Sao chép các mục bên trong thư mục đã giải nén vào `C:\Users\basiu\recipe-website`. Chọn **Replace the files in the destination** khi hỏi trùng tên. Giữ `.env` hiện có.
3. Bật Docker Desktop, mở CMD và chạy từng lệnh riêng; đợi dòng chờ nhập trở lại trước khi chạy lệnh tiếp:

```bat
cd /d C:\Users\basiu\recipe-website
docker compose config --quiet
```

Khi kiểm tra không báo lỗi:

```bat
docker compose up -d --no-deps --force-recreate phpmyadmin
docker compose ps phpmyadmin
curl.exe -I http://127.0.0.1:18081
```

4. Kết quả `ps` cần hiện `127.0.0.1:18081->80/tcp`. Lệnh curl cần trả HTTP response, chẳng hạn 200 hoặc 302.
5. Mở `http://localhost:18081`, đăng nhập `recipe_user` với mật khẩu `MYSQL_PASSWORD` do bạn đã đặt và kiểm tra DB `recipe_db`.

Lệnh `up` tạo lại riêng container phpMyAdmin để áp dụng mạng mới. Không cần nhập lại SQL seed hay xóa volume. Nếu Docker Desktop đang dừng hoặc MySQL chưa chạy, cần khởi động các dịch vụ hiện có trước; ảnh gần nhất cho thấy chúng đang chạy healthy.

Nếu vẫn lỗi, chạy `docker compose logs --tail=50 phpmyadmin` và gửi ảnh cùng `docker compose ps phpmyadmin`; không gửi mật khẩu. Bản sửa đã được kiểm tra cấu trúc YAML và các điều kiện mạng/cổng/volume, nhưng cần xác nhận HTTP và đăng nhập DB trên máy Windows.

## Minh chứng và bước tiếp theo

Giữ ảnh phpMyAdmin hiển thị `recipe_db` cùng các bảng, và ảnh Compose có cổng 18081. Kết hợp với ảnh Nginx test thành công, HTTP 200/security headers và `www-data` đã có. Sau khi khôi phục công cụ quản lý DB, tạo GitHub/commit 1 theo MSSV, rồi triển khai giám sát cho commit 2.

## Tài liệu đối chiếu

- Docker networking, phần Connecting to multiple networks: https://docs.docker.com/engine/network/
- Báo cáo tái hiện trên kho Moby: https://github.com/moby/moby/discussions/53256
