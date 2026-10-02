# Bước 2 — Prometheus và Grafana

Đề 29: Website công thức nấu ăn. MSSV **dtc245200793**.
Repository: https://github.com/namkhanh2003-pvp/dtc245200793

## Mục tiêu của bước này

Theo tiêu chí đề, Prometheus phải thu thập metrics và Grafana phải có dashboard giám sát **container / web / database**. Đây là nội dung của commit 2. Chỉ tạo commit sau khi đã quan sát được số liệu trên máy thực hiện; cấu hình có sẵn chưa đồng nghĩa triển khai thành công.

| Thành phần | Công việc |
| --- | --- |
| cAdvisor | CPU, RAM và mạng của container trong dự án |
| Nginx exporter | Request, kết nối và trạng thái Nginx |
| Blackbox exporter | Gọi trang chủ qua Nginx/PHP/MySQL; kiểm tra HTTP 200 và nội dung Bếp Nhà |
| MySQL exporter | Trạng thái DB, kết nối, tốc độ truy vấn |
| Prometheus | Thu thập số liệu mỗi 15 giây; lưu 7 ngày |
| Grafana | Hiển thị dashboard có sẵn, dùng Prometheus làm datasource |

Website không cần sửa PHP. Nginx có thêm listener nội bộ 8081 cho stub_status; cổng này không công bố ra máy Windows. Các exporter cũng không công bố cổng host. Prometheus và Grafana chỉ mở ở địa chỉ loopback.

## 1. Chép gói cập nhật — File Explorer

1. Giải nén **bep-nha-giam-sat.zip** vào một thư mục riêng.
2. Mở thư mục đã giải nén. Sao chép **các mục bên trong** vào:
   `C:\Users\basiu\recipe-website`.
3. Chọn **Replace the files in the destination** khi Windows hỏi trùng tệp. Các thư mục nginx/monitoring/docs được gộp.
4. Tại thư mục dự án, phải nhìn thấy `docker-compose.override.yml` cạnh `docker-compose.yml`, không nằm trong một thư mục lồng thêm.

Gói không có file mật khẩu `.env`, không có dữ liệu MySQL, không thay thế `docker-compose.yml` cơ bản. Không xóa thư mục dự án, không chép đè `.env` bằng `.env.example`. Tệp mẫu chỉ dùng cho một lần cài mới.

## 2. Thiết lập tài khoản giám sát — CMD

Bật Docker Desktop; MySQL hiện tại phải đang chạy. Chạy từng lệnh và đợi xong trước khi nhập lệnh tiếp:

```bat
cd /d C:\Users\basiu\recipe-website
```

```bat
powershell -NoProfile -ExecutionPolicy Bypass -File .\monitoring\setup.ps1
```

Cách hoạt động:

- Script kiểm tra `.env` bị Git bỏ qua và chưa được theo dõi.
- Tạo hai mật khẩu ngẫu nhiên 64 ký tự hexadecimal, lưu vào `.env` tại máy thực hiện: `GRAFANA_ADMIN_PASSWORD` và `MYSQL_EXPORTER_PASSWORD`.
- Giữ hai mật khẩu MySQL hiện có và các dòng khác trong `.env`. Khi chạy lại, dùng lại mật khẩu giám sát đã tạo.
- Dùng root **chỉ ở bước thiết lập**, qua mysql bên trong container DB. Mật khẩu root được đọc từ môi trường của container; không đưa lên command line hay in ra.
- Tạo `recipe_exporter` với quyền `PROCESS, REPLICATION CLIENT, SELECT`, không có quyền ghi/DDL và tối đa 3 kết nối. Đây là bộ quyền đọc theo hướng dẫn chính thức của mysqld_exporter. Exporter đang chạy sử dụng tài khoản này, không sử dụng root.
- Không xóa/nhập lại schema hoặc dữ liệu món ăn.

Thành công sẽ hiện **Monitoring setup complete.** Nếu có lỗi, dừng ở đây và gửi ảnh thông báo; không gửi ảnh nội dung file `.env`.

Lựa chọn ExecutionPolicy chỉ có hiệu lực trong tiến trình PowerShell vừa mở, không thay đổi chính sách hệ thống lâu dài.

## 3. Kiểm tra và chạy — CMD

```bat
docker compose config --quiet
```

Không có thông báo nghĩa là cấu hình hợp lệ. Không dùng `docker compose config` không kèm `--quiet` trong ảnh minh chứng vì có thể hiện biến mật khẩu đã được thay thế.

Tiếp tục:

```bat
docker compose up -d
```

Compose tự đọc cả `docker-compose.yml` và `docker-compose.override.yml`. Lần đầu cần tải các image giám sát. Lệnh này áp dụng mạng/listener mới cho Nginx và thêm 6 dịch vụ giám sát; volume MySQL hiện có vẫn được sử dụng.

```bat
docker compose ps
```

Sau bước này có 10 dịch vụ: db, web, phpmyadmin, nginx, prometheus, grafana, cadvisor, nginx-exporter, mysqld-exporter, blackbox-exporter. Các exporter không đặt healthcheck riêng; trạng thái chạy của container chưa thay cho kiểm tra targets/metrics bên dưới.

Kiểm tra lại website và Nginx:

```bat
docker compose exec -T nginx nginx -t
```

```bat
curl.exe -I http://localhost:18080
```

Nếu tải image hoặc khởi động thất bại, gửi thông báo lỗi và log dịch vụ tương ứng. Không cần xóa volume hay chạy lại seed.

## 4. Kiểm tra Prometheus — Trình duyệt

Mở **http://localhost:18082/targets**. Sáu nhóm targets gồm:
`prometheus`, `cadvisor`, `nginx`, `mysql`, `blackbox`, `website`.

Các target phải báo **UP**. UP chỉ xác nhận scrape được exporter; tiếp tục kiểm tra số liệu thật ở trang Query của Prometheus:

```promql
probe_success{job="website"}
```

```promql
nginx_up{job="nginx"}
```

```promql
mysql_up{job="mysql"}
```

Ba giá trị trên phải bằng **1**. Sau đó kiểm tra các container chính có số liệu RAM:

```promql
count by (container_label_com_docker_compose_service) (
  container_memory_working_set_bytes{
    job="cadvisor",
    container_label_com_docker_compose_service=~"db|web|nginx|phpmyadmin"
  }
)
```

Phải có đủ db/web/nginx/phpmyadmin. Không đánh dấu tiêu chí container hoàn thành khi target cAdvisor UP nhưng truy vấn không có dữ liệu hoặc thiếu nhãn service.

Cấu hình lọc nhãn project **recipe-website**, tương ứng tên thư mục Windows hiện tại. Khi clone mới, đặt tên thư mục là recipe-website. Nếu đổi tên Compose project, cần sửa regex trong monitoring/prometheus.yml.

## 5. Mở dashboard Grafana — Trình duyệt

1. Mở **http://localhost:18083**.
2. Username: **admin**.
3. Password: giá trị sau `GRAFANA_ADMIN_PASSWORD=` trong `.env` trên máy của bạn. Mở bằng `notepad .env`, tự sao chép mật khẩu để đăng nhập, rồi đóng Notepad. Không gửi ảnh màn hình mật khẩu.
4. Vào Dashboards, thư mục **Bếp Nhà**, mở **Bếp Nhà — Container · Web · MySQL**.
5. Hoặc mở trực tiếp: http://localhost:18083/d/bep-nha-monitoring/
6. Đợi khoảng 2–3 phút để biểu đồ tốc độ có đủ mẫu. Mở website, tìm kiếm và xem vài món để tạo lưu lượng thật.

Dashboard có trạng thái website/MySQL/Nginx; số container; CPU/RAM/mạng theo service; request Nginx; thời gian probe HTTP; số kết nối và tốc độ truy vấn MySQL.

- CPU 100% tương ứng một lõi, có thể vượt 100% nếu container dùng nhiều lõi.
- Thời gian probe là một request từ exporter qua Nginx/PHP/MySQL, không phải thời gian trình duyệt tải tất cả ảnh và CSS.
- Truy vấn giám sát cũng tạo hoạt động MySQL; có số liệu nền khi chưa có khách truy cập là bình thường.
- CPU/mạng có thể rất thấp khi ứng dụng nhàn rỗi. **No data** khác với số 0.

Datasource và dashboard được provision từ mã nguồn, không cần nhập ID dashboard hay cài plugin ngoài.

## 6. Khi nào được tạo commit 2?

Cần đủ:

- Website và phpMyAdmin vẫn truy cập được.
- Prometheus targets UP; website/nginx/mysql có giá trị trạng thái 1.
- CPU và RAM của ít nhất 4 container ứng dụng xuất hiện theo tên service.
- Grafana có dữ liệu container/web/MySQL, không chỉ khung biểu đồ trống.
- Giữ ảnh Compose, Targets và dashboard làm minh chứng.

Chạy từng lệnh trong CMD sau khi kiểm tra thành công:

```bat
git add docker-compose.override.yml nginx/default.conf monitoring README.md docs .env.example
```

```bat
git diff --cached --name-only
```

```bat
git ls-files -- .env
```

Lệnh cuối không được hiện `.env`. Kiểm tra danh sách staging trước khi commit:

```bat
git commit -m "Add Prometheus and Grafana monitoring for containers web and MySQL"
```

```bat
git push
```

```bat
git log --oneline -3
```

Lúc này có 2 commit có ý nghĩa: Nginx và monitoring. Commit 3 sẽ dành cho Loki/Promtail, không tạo commit trống chỉ để đủ số lượng.

## Bảo mật và phạm vi kiểm tra

- Cấu hình core giữ MySQL ở backend nội bộ, không mở cổng 3306. Prometheus/Grafana dùng mạng monitoring có published ports bind loopback.
- mysqld-exporter nối cả backend và monitoring để đọc DB và phục vụ Prometheus; các exporter còn lại chỉ ở monitoring.
- Mật khẩu thật chỉ trong `.env`, bị loại khỏi Git. Grafana tắt đăng ký và đăng nhập ẩn danh.
- Grafana và Prometheus dùng volume riêng để lưu dữ liệu; cấu hình/dashboard mount chỉ đọc.
- **Ngoại lệ quyền:** cAdvisor chạy privileged và quan sát cgroups/Docker của Linux VM. Mount chỉ đọc không làm Docker socket trở thành API chỉ đọc. Không ghi trong báo cáo rằng mọi container đều non-root hoặc bỏ mọi quyền. Những biện pháp hardening đã xác nhận ở web vẫn được giữ.

Đã kiểm tra với Docker Compose CLI: file cơ bản + override hợp lệ, mạng/cổng/volume được merge đúng, các dịch vụ DB/web/phpMyAdmin không bị override. Promtool 3.13.4 kiểm tra cấu hình và toàn bộ 12 truy vấn dashboard. Script PowerShell đã qua kiểm tra cú pháp và kiểm thử biệt lập bằng dữ liệu giả: giữ mật khẩu cũ, chạy lại ổn định, xử lý CRLF, báo lỗi SQL và chặn .env đang được Git theo dõi.

Môi trường chuẩn bị **không có Docker Engine/MySQL đang chạy**; kiểm thử biệt lập dùng PowerShell 7 trên Linux. Sau đó đã kiểm chứng triển khai trên máy Windows của sinh viên như dưới đây. Việc đối chiếu toàn bộ quyền DB bằng `SHOW GRANTS` vẫn còn trong bước minh chứng hardening.

## Kết quả thực hiện trên Windows

Đối chiếu ảnh ngày **03/10/2026, giờ Việt Nam**:

- Script thiết lập báo `Monitoring setup complete.`.
- Sáu image giám sát đã tải thành công; Compose có 10 dịch vụ đang chạy.
- Prometheus trả về 6 dòng `up`, đều bằng 1.
- Grafana hiển thị Website/MySQL/Nginx UP, 10 container và dữ liệu CPU/RAM/mạng theo service.
- Các biểu đồ request/kết nối Nginx, thời gian phản hồi web, kết nối/tốc độ truy vấn MySQL đều có dữ liệu.

Đã đủ dữ liệu để tạo commit 2 theo bước 6. Chưa xác nhận commit 2 đã được tạo/push. Giữ ảnh cho báo cáo; số liệu hiện tại gồm lưu lượng giám sát nền, không phải phép kiểm thử tải.

## Tài liệu chính thức

- Compose merge: https://docs.docker.com/compose/how-tos/multiple-compose-files/merge/
- Prometheus: https://prometheus.io/docs/prometheus/latest/configuration/configuration/
- Prometheus versions: https://prometheus.io/download/
- cAdvisor: https://github.com/google/cadvisor
- cAdvisor release 0.60.6: https://github.com/google/cadvisor/releases/tag/v0.60.6
- Nginx exporter: https://github.com/nginx/nginx-prometheus-exporter
- MySQL exporter và grants: https://github.com/prometheus/mysqld_exporter
- Blackbox exporter: https://github.com/prometheus/blackbox_exporter
- Grafana provisioning: https://grafana.com/docs/grafana/latest/administration/provisioning/
