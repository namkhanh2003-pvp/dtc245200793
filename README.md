# Bếp Nhà — Đề 29: Website công thức nấu ăn

Bài thực hành cá nhân môn Triển khai và Quản trị Hệ thống Phần mềm. Ứng dụng PHP lưu món ăn, nguyên liệu và danh mục trong MySQL, quản lý dữ liệu bằng phpMyAdmin. Bản này bổ sung giao diện và Nginx; giám sát, log tập trung, GitHub và báo cáo cần hoàn thiện ở các bước tiếp theo.

## Chức năng hiện có

- Danh sách công thức, tìm kiếm tên món và lọc theo danh mục.
- Trang chi tiết có thời gian, khẩu phần, nguyên liệu và các bước chế biến.
- Đánh dấu nguyên liệu đã chuẩn bị trong lần mở trang; trạng thái không lưu vào DB.
- Gợi ý công thức khác, giao diện thích ứng với máy tính và điện thoại.
- Ba món mẫu: trứng chiên hành lá, canh rau ngót thịt băm, cơm chiên trứng cà rốt.

Chưa có trang quản trị thêm/sửa/xóa hoặc tài khoản đăng bài trên website. Hiện nội dung được nhập qua SQL/phpMyAdmin. Có thể bổ sung quản trị nếu cần mở rộng chức năng chia sẻ công thức.

## Cấu trúc mã nguồn

```text
app/                       PHP, CSS và ảnh món ăn
database/                  Schema và dữ liệu mẫu
nginx/default.conf         Reverse proxy và security headers
docs/TIEN_DO.md             Đối chiếu tiến độ với đề bài
Dockerfile                 PHP 8.4 + Apache, chạy với www-data
docker-compose.yml         MySQL, phpMyAdmin, web và Nginx
.env.example               Mẫu biến môi trường, không có mật khẩu
```

## Cập nhật dự án Windows đang chạy

1. Giải nén `bep-nha-update.zip` ra một thư mục riêng.
2. Mở thư mục đã giải nén, sao chép toàn bộ nội dung bên trong vào `C:\Users\basiu\recipe-website`. Khi Windows hỏi trùng tệp, chọn **Replace the files in the destination**. Các thư mục `app`, `database`, `nginx`, `docs` sẽ được gộp với thư mục tương ứng.
3. Giữ nguyên file mật khẩu `.env` của dự án. Gói cập nhật chỉ có `.env.example` trống, không thay thế `.env`.
4. Bật Docker Desktop. Mở CMD và chạy:

```bat
cd /d C:\Users\basiu\recipe-website
docker compose config --quiet
```

Nếu lệnh kiểm tra không báo lỗi, chạy:

```bat
docker compose up -d --build
docker compose ps
```

5. Mở `http://localhost:18080` và nhấn **Ctrl + F5**. phpMyAdmin vẫn ở `http://localhost:18081`.

Bản cập nhật giữ tên volume `mysql_data` và tên thư mục dự án để sử dụng dữ liệu cũ. File SQL trong `database` chỉ tự chạy khi MySQL khởi tạo một volume trống; không cần nhập lại seed vào DB đã có dữ liệu. Không dùng `docker compose down -v` vì lệnh đó xóa volume của dự án.

## Chạy từ bản mã nguồn mới

Yêu cầu Docker Desktop có Docker Compose. Mở terminal tại thư mục chứa `docker-compose.yml`, sao chép mẫu môi trường:

```bat
copy .env.example .env
notepad .env
```

Điền hai mật khẩu mạnh, khác nhau, sau dấu `=`. Không đưa `.env` lên GitHub. Các giá trị phải theo cú pháp file môi trường của Docker Compose; nếu dùng ký tự đặc biệt, tham khảo tài liệu Docker được liên kết cuối README. Lưu rồi chạy `docker compose config --quiet`; khi hợp lệ, chạy `docker compose up -d --build`. MySQL tạo DB `recipe_db` và tài khoản `recipe_user` từ các biến môi trường. Đăng nhập phpMyAdmin bằng `recipe_user` và giá trị `MYSQL_PASSWORD` do bạn đặt.

## Kiểm tra Nginx và lấy minh chứng

Chạy tại thư mục dự án:

```bat
docker compose ps
docker compose exec nginx nginx -t
curl.exe -I http://localhost:18080
docker compose exec web id
docker compose logs --tail=50 nginx web
```

Kết quả cần quan sát:

- Bốn dịch vụ chạy; healthcheck của `db`, `web`, `nginx` thành công.
- `nginx -t` báo cấu hình hợp lệ.
- Website trả HTTP 200 và có `X-Content-Type-Options`, `X-Frame-Options`, `Referrer-Policy`, `Content-Security-Policy`.
- Lệnh `id` trong web hiển thị `www-data`, không phải root.
- Trang chủ tải ảnh/CSS, tìm kiếm và trang chi tiết hoạt động; phpMyAdmin xem được dữ liệu.

Chụp màn hình các kết quả này cho báo cáo. Nếu phát sinh lỗi, lấy `docker compose ps` và log ở trên; không gửi ảnh chứa mật khẩu.

## Kiến trúc và biện pháp bảo mật đã cấu hình

Trình duyệt vào cổng `18080` của Nginx. Nginx chuyển yêu cầu đến Apache/PHP tại `web:8080`. Web truy cập MySQL qua mạng backend; phpMyAdmin sử dụng backend để quản lý DB và mạng `admin` riêng để công bố giao diện ở `127.0.0.1:18081`.

- Web chạy với `USER www-data` và cổng không đặc quyền `8080`.
- Nginx chỉ ở mạng frontend; DB chỉ ở backend nội bộ và không công bố cổng MySQL ra máy chủ.
- Web không mở cổng host trực tiếp; website đi qua Nginx. Website và phpMyAdmin chỉ bind `127.0.0.1` trên máy đang chạy.
- Web bỏ toàn bộ Linux capabilities và bật `no-new-privileges`; Nginx cũng bật `no-new-privileges`.
- Mount mã nguồn và cấu hình ở chế độ chỉ đọc.
- Nginx có bốn security headers, ẩn phiên bản Nginx và header `X-Powered-By`.
- Web dùng `recipe_user` thay cho MySQL root; truy vấn có tham số và đầu ra HTML được escape.
- File mật khẩu được loại khỏi Git và Docker build context. Cần tự đặt mật khẩu mạnh và kiểm tra quyền DB thực tế.

Đề cho phép **HTTPS tự ký hoặc security headers cơ bản**; bản này chọn security headers. Các biện pháp trên phải được kiểm tra trên Docker của người thực hiện trước khi ghi là hoàn thành trong báo cáo.

## Phạm vi đã kiểm tra

Đã kiểm tra mã PHP và giao diện bằng PHP-WASM 8.4 với DB SQLite chứa dữ liệu mẫu tương đương. Kiểm tra trình duyệt gồm desktop 1440px, mobile 390px, CSS/ảnh, tìm kiếm, danh mục, kết quả rỗng, tham số truy vấn, escape HTML, trang chi tiết, checkbox nguyên liệu, món liên quan và HTTP 404. Chính sách CSP tương ứng cấu hình Nginx đã được áp dụng trong kiểm tra trình duyệt.

Môi trường kiểm tra tự động không chạy Docker/MySQL/Nginx thật. Người thực hiện đã xác nhận website/MySQL trên Windows; đã cung cấp minh chứng Nginx test thành công, HTTP 200 qua Nginx, đủ bốn security headers và `uid=33(www-data)` trong web. Sau đổi mạng, phpMyAdmin không truy cập được; bản sửa thêm mạng `admin` vẫn cần chạy và xác nhận trên máy người thực hiện.

## Sửa phpMyAdmin không truy cập được

Container phpMyAdmin đã chạy nhưng `docker compose ps` chỉ hiện `80/tcp`, không có ánh xạ `127.0.0.1:18081`. Trình duyệt báo `ERR_CONNECTION_REFUSED`. Cấu hình trước chỉ nối phpMyAdmin vào backend `internal: true`; tình huống này khớp báo cáo Docker bỏ qua published ports khi container chỉ thuộc mạng nội bộ.

Bản sửa nối phpMyAdmin vào cả backend và một mạng bridge `admin` riêng. MySQL giữ nguyên backend nội bộ, không công bố cổng; phpMyAdmin vẫn chỉ bind loopback `127.0.0.1:18081:80`. Volume `mysql_data`, tài khoản và mật khẩu giữ nguyên.

Áp dụng `bep-nha-sua-phpmyadmin.zip` bằng cách giải nén, sao chép các mục bên trong vào thư mục dự án và thay thế tệp trùng tên. Sau đó tại CMD trong thư mục dự án, chạy từng lệnh và đợi xong trước khi nhập lệnh tiếp:

```bat
docker compose config --quiet
```

Nếu không báo lỗi:

```bat
docker compose up -d --no-deps --force-recreate phpmyadmin
docker compose ps phpmyadmin
curl.exe -I http://127.0.0.1:18081
```

Lệnh `up` chỉ tạo lại phpMyAdmin để áp dụng mạng mới, dùng DB hiện đang chạy. Kết quả cần có `127.0.0.1:18081->80/tcp` và một HTTP response từ phpMyAdmin; sau đó mở `http://localhost:18081`, đăng nhập bằng `recipe_user` và mật khẩu DB đã đặt. Không nhập lại SQL seed và không xóa volume.

Nếu vẫn lỗi, lấy `docker compose logs --tail=50 phpmyadmin` và ảnh kết quả `docker compose ps phpmyadmin`. Chi tiết ở `docs/SUA_PHPMYADMIN.md`.

## Bản sửa chữ tiếng Việt

Ảnh chạy trên Windows cho thấy một số tiêu đề có chữ mang dấu bị giãn bất thường. Bản sửa dùng Noto Serif Regular/Italic được lưu ngay trong `app/assets/fonts/`, bỏ khoảng cách chữ âm ở tiêu đề và điều chỉnh cỡ chữ trên màn hình nhỏ. Hai trang PHP dùng `style.css?v=4` để tránh lấy CSS cũ từ bộ nhớ đệm.

Phông được lấy nguyên tệp từ kho chính thức https://github.com/notofonts/noto-fonts/tree/main/hinted/ttf/NotoSerif; giấy phép SIL Open Font License 1.1 được giữ ở `app/assets/fonts/OFL.txt`. Browser lấy phông từ chính website, phù hợp CSP `font-src 'self'`.

Đã kiểm tra trình duyệt thực sự dùng phông nhúng cho toàn bộ chữ trong “Ấm lòng mỗi bữa.”, “Trứng chiên hành lá” và “Cơm chiên trứng cà rốt”, không dùng xen phông dự phòng. Trang chi tiết cũng được kiểm tra không tràn ngang ở 320px và 390px. Người thực hiện cần áp dụng gói và xác nhận kết quả trên Windows.

Để áp dụng `bep-nha-sua-chu.zip`, giải nén, sao chép các mục bên trong vào thư mục dự án hiện có và thay thế tệp trùng tên, sau đó Ctrl + F5. Compose đang bind-mount thư mục `app`, nên bản sửa này không cần build lại container. Các bước kiểm chứng Nginx và chuẩn bị commit 1 nằm ở `docs/BUOC_1_NGINX.md`.

## Ảnh minh họa

Ba ảnh được tạo bằng công cụ imagegen tích hợp, chế độ tạo ảnh mới (built-in generate), rồi sao chép vào dự án dưới dạng PNG. Đây là ảnh minh họa AI, không phải ảnh chụp món do sinh viên tự nấu. Không có chữ, logo hoặc watermark.

Mô tả bộ ảnh: ảnh đồ ăn Việt Nam chân thực, ánh sáng tự nhiên dịu, đồ gốm tông kem, mặt bàn gỗ và vải linen màu be, bố cục ngang để dùng ở trang chủ và thẻ công thức. Ba chủ thể lần lượt là trứng chiên hành lá vàng nhẹ, canh rau ngót thịt băm trong bát gốm, và cơm chiên trứng cà rốt có hành lá. Bộ ảnh hướng tới cùng phong cách ấm áp, đơn giản và phù hợp giao diện màu kem/xanh lá.

Đường dẫn trong mã nguồn: `app/assets/egg.png`, `app/assets/soup.png`, `app/assets/rice.png`. Logo và icon được viết bằng SVG trong mã nguồn.

## Các bước tiếp theo theo đề

1. Xác nhận bản giao diện mới và Nginx chạy được.
2. Tạo GitHub theo mã số sinh viên, đưa mã nguồn/cấu hình/README lên và tạo commit 1 về Nginx.
3. Thêm Prometheus, Grafana và exporter cho container/web/DB; xây dashboard; commit 2.
4. Thêm Loki, Promtail; kiểm tra tập trung log và viết 2–3 truy vấn LogQL; commit 3.
5. Kiểm chứng ít nhất 3–4 biện pháp hardening và thu thập minh chứng.
6. Viết báo cáo cá nhân tối thiểu 10 trang, có bìa thông tin sinh viên, kiến trúc, cách hoạt động và kết quả; chuẩn bị demo toàn hệ thống.

## Tài liệu kỹ thuật

- Docker Compose: https://docs.docker.com/compose/
- Biến môi trường Compose: https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/
- Nginx proxy module: https://nginx.org/en/docs/http/ngx_http_proxy_module.html
- Nginx headers module: https://nginx.org/en/docs/http/ngx_http_headers_module.html
