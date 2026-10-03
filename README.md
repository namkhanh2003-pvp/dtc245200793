# Bếp Nhà — Đề 29: Website công thức nấu ăn

Bài thực hành **cá nhân** môn Triển khai và Quản trị Hệ thống Phần mềm.
MSSV: **dtc245200793**.
Repository: https://github.com/namkhanh2003-pvp/dtc245200793

Website PHP 8.4/Apache lưu công thức, nguyên liệu và danh mục trong MySQL 8.4; phpMyAdmin quản lý DB. Nginx làm reverse proxy có security headers. Prometheus/Grafana, các exporter và dashboard đã chạy trên Docker Desktop của sinh viên, có dữ liệu giám sát container/web/MySQL. Loki/Promtail đã nhận log thật trên Windows; Grafana hiển thị log tập trung và ba truy vấn LogQL đã chạy thành công. Phần logging đang chuẩn bị lưu bằng commit 3; báo cáo chưa hoàn thành.

## Chức năng

- Xem danh sách món, tìm kiếm theo tên và lọc danh mục.
- Chi tiết thời gian, khẩu phần, nguyên liệu và các bước nấu; gợi ý món liên quan.
- Đánh dấu nguyên liệu đã chuẩn bị trong lần mở trang, không lưu trạng thái vào DB.
- Giao diện máy tính/điện thoại, ảnh món và phông tiếng Việt lưu cục bộ.
- Dữ liệu mẫu: trứng chiên hành lá, canh rau ngót thịt băm, cơm chiên trứng cà rốt.

Nội dung được quản lý bằng SQL/phpMyAdmin; chưa có tài khoản người đăng hoặc CRUD trên website. Đề 29 không liệt kê CRUD/đăng nhập bắt buộc; bổ sung khi cần mở rộng hoặc giảng viên yêu cầu.

## Dịch vụ và đường dẫn

| Thành phần | Truy cập |
| --- | --- |
| Website qua Nginx | http://localhost:18080 |
| phpMyAdmin | http://localhost:18081 |
| Prometheus targets | http://localhost:18082/targets |
| Grafana | http://localhost:18083 |
| Dashboard | http://localhost:18083/d/bep-nha-monitoring/ |
| Dashboard log | http://localhost:18083/d/bep-nha-logs/ |
| Loki readiness | http://localhost:18084/ready |
| MySQL và các exporter | Chỉ qua mạng Docker, không công bố cổng host |

Các published ports bind `127.0.0.1`. Grafana username là `admin`; mật khẩu được script thiết lập tạo và lưu tại `.env` trên máy thực hiện. phpMyAdmin dùng `recipe_user` và `MYSQL_PASSWORD`.

## File cấu hình

| Đường dẫn | Nội dung |
| --- | --- |
| app/ | PHP, CSS, ảnh và phông |
| database/ | Schema và seed |
| nginx/default.conf | Reverse proxy, headers, listener stub_status nội bộ |
| docker-compose.yml | MySQL, phpMyAdmin, web, Nginx |
| docker-compose.override.yml | Thêm 6 dịch vụ giám sát, Loki/Promtail và mạng monitoring |
| monitoring/setup.ps1 | Tạo mật khẩu và tài khoản MySQL giám sát |
| monitoring/prometheus.yml | Scrape targets, lọc container theo project |
| monitoring/blackbox.yml | Probe HTTP/nội dung trang chủ |
| monitoring/grafana/ | Datasource và dashboard được provision |
| logging/ | Cấu hình Loki và Promtail, không chứa dữ liệu log |
| docs/BUOC_2_GIAM_SAT.md | Các bước Windows và điều kiện kiểm chứng commit 2 |
| docs/BUOC_3_LOG.md | Cách chạy logging, ba LogQL query và điều kiện commit 3 |
| docs/TIEN_DO.md | Đối chiếu tiến độ với tiêu chí đề |
| .env.example | Mẫu môi trường trống, không chứa mật khẩu |

Compose tự đọc file cơ bản và override. Có thể dùng `-f docker-compose.yml` để chỉ chạy phần cơ bản khi cần thiết lập ban đầu.

## Cập nhật máy Windows hiện tại

Web/DB/proxy và sáu dịch vụ giám sát đang chạy trong `C:\Users\basiu\recipe-website`.
Giải nén `bep-nha-log-tap-trung.zip`, chép **các mục bên trong** vào thư mục này và thay thế tệp trùng tên. Giữ nguyên `.env` và các volume hiện có.

Tại CMD, chạy từng lệnh:

```bat
cd /d C:\Users\basiu\recipe-website
docker compose config --quiet
docker compose up -d
docker compose restart grafana
docker compose ps
curl.exe http://localhost:18084/ready
```

Chỉ chạy lệnh tiếp khi lệnh trước thành công. Khởi động lại Grafana để đọc datasource Loki; có 12 dịch vụ sau cập nhật. Loki cần khoảng 20–30 giây để ready. Thực hiện tạo log demo và truy vấn theo [docs/BUOC_3_LOG.md](docs/BUOC_3_LOG.md).

## Cài từ GitHub trên máy mới

Yêu cầu Git và Docker Desktop chạy **Linux containers**.

```bat
git clone https://github.com/namkhanh2003-pvp/dtc245200793.git recipe-website
cd recipe-website
copy .env.example .env
notepad .env
```

Điền hai mật khẩu mạnh, khác nhau cho `MYSQL_ROOT_PASSWORD` và `MYSQL_PASSWORD`, lưu rồi đóng. Giữ trống hai biến giám sát để script tự tạo. Không đưa `.env` lên GitHub.

Chạy phần cơ bản trước:

```bat
docker compose -f docker-compose.yml config --quiet
docker compose -f docker-compose.yml up -d --build
docker compose -f docker-compose.yml ps
```

Sau khi DB/web/Nginx healthy, chạy bước thiết lập và toàn hệ thống:

```bat
powershell -NoProfile -ExecutionPolicy Bypass -File .\monitoring\setup.ps1
docker compose config --quiet
docker compose up -d
docker compose ps
```

Seed chỉ tự chạy khi MySQL khởi tạo volume trống. Không dùng `docker compose down -v` trên dự án có dữ liệu cần giữ.

## Kiểm chứng và demo

Hướng dẫn đầy đủ ở [docs/BUOC_2_GIAM_SAT.md](docs/BUOC_2_GIAM_SAT.md).

1. Kiểm tra website, tìm kiếm, chi tiết món và phpMyAdmin.
2. Chạy `docker compose exec -T nginx nginx -t`, `curl.exe -I http://localhost:18080` và `docker compose exec -T web id`.
3. Sáu Prometheus targets UP. Các truy vấn `probe_success{job="website"}`, `nginx_up{job="nginx"}`, `mysql_up{job="mysql"}` phải bằng 1.
4. cAdvisor phải có CPU/RAM gắn nhãn service cho db/web/nginx/phpMyAdmin, không chỉ target UP.
5. Đăng nhập Grafana, mở dashboard. Đợi 2–3 phút cho biểu đồ tốc độ; truy cập website để tạo lưu lượng.
6. Giữ ảnh Compose, targets và dashboard. Chỉ tạo commit 2 khi đủ dữ liệu thật.

CPU có thể vượt 100% khi dùng nhiều lõi. HTTP probe không đo thời gian tải toàn bộ trang trong trình duyệt. MySQL có truy vấn giám sát nền. Số 0 khác với No data.

Nếu lỗi, dùng `docker compose ps` và `docker compose logs --tail=60 TEN_DICH_VU`; không gửi file hoặc ảnh chứa mật khẩu. Cấu hình Prometheus giữ metrics container thuộc project `recipe-website`, do đó giữ tên thư mục clone như lệnh trên.

## Hardening

- Web chạy `www-data`, cổng 8080, bỏ Linux capabilities và bật no-new-privileges.
- DB chỉ nối backend internal và không công bố cổng 3306; web không có published port trực tiếp.
- Website, phpMyAdmin, Prometheus, Grafana bind loopback; exporter không công bố cổng host.
- Mã nguồn/cấu hình/dashboard mount chỉ đọc.
- Bốn security headers Nginx; ẩn phiên bản và X-Powered-By.
- PHP dùng recipe_user, prepared statements và escape đầu ra HTML.
- Tài khoản giám sát DB có quyền đọc/process/replication-client, không ghi/DDL và tối đa 3 kết nối. Mật khẩu root chỉ dùng khi thiết lập.
- Grafana tắt đăng ký và đăng nhập ẩn danh.
- .env được loại khỏi Git và Docker build context.
- Loki cấu hình chạy UID/GID 10001; Loki/Promtail có root filesystem chỉ đọc, drop ALL capabilities và no-new-privileges. Loki chỉ bind loopback; Promtail không published port.

**Ngoại lệ cần giải thích:** cAdvisor chạy privileged để quan sát cgroups/Docker của Linux VM; mount chỉ đọc không biến Docker socket thành API chỉ đọc. Không tuyên bố mọi container đều non-root hoặc đều bị loại mọi quyền.

Promtail chạy root và mount Docker socket để đọc log. Lọc project/service và mount socket `:ro` không hạn chế quyền của Docker API. Loki tắt auth/multi-tenancy cho mô hình local một người, không mở public. Promtail đã EOL theo tài liệu Grafana từ 02/03/2026; vẫn dùng trong bài vì đề yêu cầu Promtail, không coi đây là lựa chọn production mới.

Đề cho phép HTTPS tự ký **hoặc** security headers cơ bản; website chọn headers. Các biện pháp cần có minh chứng thực tế trước khi ghi hoàn tất.

## Tiến độ và phạm vi kiểm tra

Commit 1 `3284f30` đã được đẩy lên main ngày 02/10/2026: website + Nginx.
Ảnh Windows xác nhận Git sạch/đồng bộ; DB/web/Nginx healthy; phpMyAdmin chạy và đã đăng nhập thành công; nginx -t, HTTP 200, bốn headers và www-data đã được kiểm tra.

Đã kiểm tra giao diện bằng PHP-WASM 8.4/SQLite fixture và trình duyệt desktop/mobile; kiểm tra phông nhúng, tìm kiếm/lọc, escape, chi tiết và 404. Môi trường đó không thay cho MySQL/Docker thực tế.

Cấu hình giám sát đã qua Docker Compose CLI và promtool 3.13.4 (cấu hình + 12 truy vấn dashboard). Script đã qua parser PowerShell và kiểm thử biệt lập bằng dữ liệu giả.

Minh chứng trên máy Windows được đối chiếu ngày **03/10/2026, giờ Việt Nam**: script báo `Monitoring setup complete.`, Compose có 10 dịch vụ chạy và truy vấn `up` trả về 6 target bằng 1. Dashboard có Website/MySQL/Nginx UP, 10 container và các biểu đồ CPU, RAM, mạng, request/kết nối Nginx, thời gian phản hồi trang chủ, kết nối/tốc độ truy vấn MySQL. Commit 2 **3d76553** đã push lên main; ảnh lịch sử Git xác nhận HEAD/main và origin/main ở commit này. Chưa đối chiếu `SHOW GRANTS` để chứng minh toàn bộ quyền tài khoản DB.

Cấu hình logging dùng Loki 3.7.8 và Promtail 3.6.11. Ngày **03/10/2026, giờ Việt Nam**, ảnh Windows xác nhận Compose có 12 dịch vụ chạy và Loki `/ready` trả `ready`. Dashboard log hiển thị log Nginx/web và request 404 được tạo có chủ đích. Trong Explore với datasource Loki: truy vấn log chung trả 958 dòng trong khoảng đang xem; truy vấn HTTP lỗi tìm được một request `__recipe_demo_missing__` có status 404 lúc 19:46:57; truy vấn đếm log hiển thị hai chuỗi `nginx`/`web` trong cửa sổ trượt 5 phút. Số dòng phụ thuộc khoảng thời gian và lưu lượng giám sát nền, không phải số người truy cập.

Nhãn và truy vấn đã được kiểm chứng trên log thật của Nginx/web. Cấu hình thu cả DB/phpMyAdmin, nhưng chưa đối chiếu riêng ảnh log của hai dịch vụ này trên Windows; không suy diễn từ selector bốn dịch vụ rằng ảnh đã chứng minh cả bốn. Biểu đồ đếm đã được đối chiếu trong Explore; panel đếm trên dashboard log cần kiểm tra lại khi demo. Named volumes đã được cấu hình, chưa kiểm tra khôi phục log/vị trí đọc sau sự cố.

Ảnh Git lúc 20:23 ngày 03/10/2026 xác nhận `.env` chưa được Git theo dõi, HEAD/main và origin/main vẫn ở commit 2 **3d76553**, các file logging đang chờ commit. Còn lại: tạo/push commit 3; bổ sung minh chứng hardening; kiểm tra toàn hệ thống, báo cáo cá nhân tối thiểu 10 trang và demo. Tên tài khoản GitHub hiện tại là namkhanh2003-pvp, khác MSSV; yêu cầu đặt tên tài khoản theo MSSV vẫn cần đối chiếu với giảng viên.

## Ảnh và phông

Ba ảnh món trong app/assets được tạo bằng công cụ imagegen tích hợp, chế độ tạo ảnh mới; đây là ảnh minh họa AI, không phải ảnh tự chụp của sinh viên. Ảnh mô tả đồ ăn Việt Nam, ánh sáng tự nhiên dịu, đồ gốm tông kem, bàn gỗ/vải linen, phong cách phù hợp giao diện xanh lá/kem. Logo và icon viết bằng SVG.

Noto Serif Regular/Italic được lấy nguyên tệp từ kho chính thức https://github.com/notofonts/noto-fonts/tree/main/hinted/ttf/NotoSerif. Giữ SIL OFL 1.1 tại app/assets/fonts/OFL.txt; phông/ảnh được phục vụ cùng website, phù hợp CSP.

## Tài liệu chính thức

- Docker Compose: https://docs.docker.com/compose/
- Compose merge: https://docs.docker.com/compose/how-tos/multiple-compose-files/merge/
- Biến môi trường: https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/
- Nginx: https://nginx.org/en/docs/http/ngx_http_proxy_module.html
- Prometheus: https://prometheus.io/docs/prometheus/latest/configuration/configuration/
- MySQL exporter: https://github.com/prometheus/mysqld_exporter
- cAdvisor: https://github.com/google/cadvisor
- Grafana provisioning: https://grafana.com/docs/grafana/latest/administration/provisioning/
- Loki/Promtail và LogQL: xem tài liệu chính thức trong [docs/BUOC_3_LOG.md](docs/BUOC_3_LOG.md).
