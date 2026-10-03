# Bước 3 — Loki, Promtail và ba truy vấn LogQL

Đề 29: Website công thức nấu ăn. MSSV **dtc245200793**.
Repository: https://github.com/namkhanh2003-pvp/dtc245200793

Commit 1 **3284f30** và commit 2 **3d76553** đã được push lên main. Ngày **03/10/2026, giờ Việt Nam**, Loki/Promtail đã nhận log thật và cả ba truy vấn bên dưới đã chạy thành công trong Grafana Explore trên máy Windows. Phần logging đang chờ tạo/push commit 3; kiểm tra Git lúc 20:23 vẫn có HEAD/main và origin/main ở commit 2.

## Kết quả đã kiểm chứng trên Windows

- Compose có 12 dịch vụ chạy; Loki `/ready` trả `ready`.
- Dashboard log có log thật Nginx/web và request 404 demo.
- Query 1 trả 958 dòng trong khoảng đang xem lúc chụp, không phải tổng số log của toàn hệ thống.
- Query 2 tìm được một request `__recipe_demo_missing__` status 404 lúc 19:46:57 sau khi tạo request mới.
- Query 3 có hai chuỗi `nginx`/`web`, khoảng 49–51 dòng trong cửa sổ trượt 5 phút tại các điểm hiển thị.
- `.env` chưa được Git theo dõi. Tên ảnh và các việc còn cần kiểm tra được ghi ở [TIEN_DO.md](TIEN_DO.md).

Chưa đối chiếu riêng ảnh log DB/phpMyAdmin hoặc panel đếm trên dashboard log. Chưa kiểm tra khôi phục dữ liệu sau sự cố. Các bước dưới đây vẫn được giữ để tái hiện trên máy khác và chuẩn bị demo.

## Cách hoạt động

Nginx, PHP/Apache, MySQL và phpMyAdmin ghi log vào stdout/stderr của container. Promtail dùng Docker API để tìm các container thuộc project `recipe-website`, gắn nhãn `project`, `service`, `container`, `stream`, `student_id` rồi gửi về Loki. Loki lưu dữ liệu trong volume riêng; Grafana dùng datasource Loki để truy vấn và hiển thị.

Chỉ thu log bốn dịch vụ `nginx`, `web`, `db`, `phpmyadmin`. Cấu hình vừa lọc project ở Docker discovery vừa dùng relabel để lọc project/service. Không thu log project khác hoặc tự thu log Loki/Promtail. Không mount thư mục mã nguồn hay `.env` vào hai dịch vụ mới.

| Thành phần | Cấu hình |
| --- | --- |
| Loki | `grafana/loki:3.7.8`, TSDB/schema v13, filesystem, retention 7 ngày, volume `loki_data` |
| Promtail | `grafana/promtail:3.6.11`, Docker service discovery, volume `promtail_positions` |
| Loki readiness | http://localhost:18084/ready, cổng host chỉ bind loopback |
| Grafana datasource | Loki, UID `recipe-loki`, URL nội bộ `http://loki:3100` |
| Dashboard log | http://localhost:18083/d/bep-nha-logs/ |

Loki là bản một nút dành cho bài thực hành. Retention được compactor thực hiện định kỳ, có độ trễ xóa; không có nghĩa mọi log vừa đủ 7 ngày đều biến mất ngay. Volume vị trí đọc giúp Promtail tiếp tục theo từng container sau khi khởi động lại, nhưng không bảo đảm chính xác một lần khi có sự cố hoặc container đã bị xóa.

**Vòng đời phần mềm:** tài liệu Grafana công bố Promtail EOL ngày 02/03/2026 và chuyển phát triển sang Alloy. Bài thực hành vẫn dùng Promtail vì đề yêu cầu đích danh. Đây không phải lựa chọn cho một hệ thống production mới. Bản pin 3.6.11 được xác nhận có binary và Docker image; không coi việc image còn tồn tại là còn được hỗ trợ.

## 1. Chép gói cập nhật — File Explorer

1. Giải nén **bep-nha-log-tap-trung.zip** vào một thư mục riêng.
2. Sao chép **các mục bên trong** vào `C:\Users\basiu\recipe-website`.
3. Chọn **Replace the files in the destination**. Các thư mục được gộp; file `docker-compose.override.yml` nằm cạnh file Compose cơ bản.

Gói giữ sáu dịch vụ giám sát đã có và thêm Loki/Promtail; không chứa `.env`, dữ liệu DB hay file Compose cơ bản. Mật khẩu Grafana/MySQL đã thiết lập vẫn sử dụng như hiện tại.

## 2. Chạy — CMD

Docker Desktop phải đang chạy. Nhập từng lệnh; chỉ tiếp tục khi lệnh trước thành công:

```bat
cd /d C:\Users\basiu\recipe-website
```

```bat
docker compose config --quiet
```

```bat
docker compose up -d
```

```bat
docker compose restart grafana
```

```bat
docker compose ps
```

Khởi động lại Grafana để đọc provisioning datasource Loki. Có **12 dịch vụ** chạy sau bước này. Hai dịch vụ mới không đặt healthcheck trong Compose; trạng thái Up chưa chứng minh Loki/Promtail hoạt động đủ. Image Loki là distroless, không có shell/wget để chạy healthcheck kiểu Alpine.

Kiểm tra Loki sau khoảng 20–30 giây:

```bat
curl.exe http://localhost:18084/ready
```

Phải hiện **ready**. Nếu báo ingester chưa ready, đợi thêm rồi chạy lại. Nếu container Restarting/Exited hoặc không kết nối được, kiểm tra:

```bat
docker compose logs --tail=40 loki promtail
```

Không dùng `docker compose down -v`. Không chạy lại seed hoặc thay mật khẩu để xử lý lỗi log.

## 3. Tạo log demo — CMD

Truy cập trang chủ và một đường dẫn không tồn tại:

```bat
curl.exe -s -o NUL -w "Trang chu: HTTP %{http_code}\n" http://localhost:18080/index.php
```

```bat
curl.exe -s -o NUL -w "Demo loi: HTTP %{http_code}\n" http://localhost:18080/__recipe_demo_missing__
```

Kết quả mong đợi lần lượt **200** và **404**. Lỗi 404 được tạo có chủ đích để minh họa LogQL; không phải lỗi cần sửa trên trang chủ. Đây là lệnh nhập trực tiếp ở CMD; nếu viết vào file `.bat`, đổi `%{http_code}` thành `%%{http_code}`.

Mở phpMyAdmin, đăng nhập như trước, chọn `recipe_db` và xem một bảng để tạo access log. Promtail phát hiện container mỗi 5 giây và gửi log theo batch; đợi khoảng 10–15 giây trước khi truy vấn.

## 4. Mở dashboard — Trình duyệt

Mở http://localhost:18083/d/bep-nha-logs/ bằng phiên đăng nhập Grafana hiện có.
Dashboard **Bếp Nhà — Nhật ký hệ thống** được provision trong thư mục **Bếp Nhà** và dùng ba truy vấn bên dưới.

- Panel 1 có log của các dịch vụ đang phát sinh log.
- Panel 2 có dòng request `__recipe_demo_missing__` với status **404** sau khi tạo demo.
- Panel 3 hiển thị số dòng log trong cửa sổ trượt 5 phút theo service.

Khoảng thời gian mặc định 24 giờ để có thể xem log khởi động DB trước đó. Có thể chọn Last 15 minutes để demo log mới. MySQL không mặc định ghi mọi SELECT vào error log; DB không có dòng mới trong 15 phút không đồng nghĩa mất kết nối. Khi cần kiểm tra log DB, chọn service `db` trong Explore và khoảng thời gian chứa lúc DB khởi động.

Dashboard metrics cũ vẫn ở http://localhost:18083/d/bep-nha-monitoring/. Số container có thể tăng từ 10 lên 12 sau khi cAdvisor thu thập hai dịch vụ mới; Prometheus vẫn có 6 job như trước.

## 5. Chạy ba truy vấn LogQL — Grafana Explore

1. Bấm **Explore** ở thanh bên trái.
2. Chọn datasource **Loki** ở phía trên.
3. Chuyển trình soạn truy vấn sang **Code**.
4. Dán một truy vấn, chọn khoảng thời gian phù hợp, rồi bấm **Run query**; cũng có thể nhấn **Shift + Enter** khi con trỏ đang ở trong ô Code.
5. Chụp kết quả kèm nội dung truy vấn; thực hiện lần lượt cả ba.

### Truy vấn 1 — Log chung của bốn dịch vụ

```logql
{project="recipe-website", service=~"nginx|web|db|phpmyadmin"}
```

Mục đích: chứng minh các log được tập trung và lọc theo project/service. Mở chi tiết dòng log để xem các nhãn. Khi cần tìm riêng DB, thay selector service bằng `service="db"` và chọn Last 24 hours hoặc khoảng chứa lúc DB khởi động.

### Truy vấn 2 — Phản hồi HTTP 4xx/5xx từ Nginx

```logql
{project="recipe-website", service="nginx", stream="stdout"}
| pattern `<ip> - <user> [<time>] "<method> <path> <protocol>" <status> <bytes> <_>`
| status >= 400
| __error__=""
```

Mục đích: dùng pattern để đọc định dạng access log combined đang có, rồi lọc theo HTTP status. Bộ lọc `__error__` bỏ lỗi chuyển đổi kiểu từ dòng không phải access log. Phải thấy 404 demo, không đưa các request 200 vào kết quả. Không phải mọi dòng chứa chữ error đều là lỗi HTTP; truy vấn này lọc trường status đã phân tích.

Nếu hiện **No logs found** và không có lỗi cú pháp, kiểm tra khoảng thời gian. Request 404 cũ có thể đã nằm ngoài khoảng đang xem. Tạo lại request 404 bằng lệnh CMD ở bước 3, đợi 10–15 giây rồi chạy lại nguyên truy vấn; hoặc chọn khoảng thời gian chứa request cũ.

### Truy vấn 3 — Số dòng log trong 5 phút theo dịch vụ

```logql
sum by (service) (
  count_over_time(
    {project="recipe-website", service=~"nginx|web|db|phpmyadmin"}[5m]
  )
)
```

Mục đích: chuyển log thành số liệu và gom theo service. Bao gồm healthcheck/probe giám sát; đây không phải số người truy cập. Dịch vụ không phát sinh log trong cửa sổ có thể không xuất hiện; No data khác với 0.

## 6. Kiểm tra và tạo commit 3

- Loki `/ready` trả ready; Loki/Promtail chạy ổn định.
- Có log thật từ các dịch vụ chính, nhãn project/service đúng.
- Ba truy vấn chạy thành công; truy vấn 2 tìm được 404 đã tạo.
- Dashboard log có dữ liệu. Kiểm tra lại website/phpMyAdmin/dashboard metrics và các panel log khi chuẩn bị demo toàn hệ thống.
- Có ảnh Compose, readiness, dashboard và ba kết quả Explore để đưa vào báo cáo.

Sau khi logging và ba truy vấn có kết quả thật, cập nhật tài liệu rồi mở CMD trong thư mục dự án. Chỉ thêm các tệp cấu hình và tài liệu tương ứng:

```bat
cd /d C:\Users\basiu\recipe-website
```

```bat
git add README.md docker-compose.override.yml docs/BUOC_2_GIAM_SAT.md docs/BUOC_3_LOG.md docs/TIEN_DO.md logging/loki.yml logging/promtail.yml monitoring/grafana/dashboards/recipe-logs.json monitoring/grafana/provisioning/datasources/loki.yml
```

```bat
git diff --cached --name-only
```

```bat
git ls-files -- .env
```

Lệnh cuối không được hiện `.env`. Sau khi kiểm tra danh sách:

```bat
git commit -m "Add Loki and Promtail centralized logs with three LogQL queries"
```

```bat
git push
```

```bat
git log --oneline -3
```

## Hardening và phạm vi kiểm tra

- Loki chạy UID/GID 10001; cả Loki và Promtail có root filesystem chỉ đọc, config mount chỉ đọc, drop ALL capabilities và no-new-privileges.
- Loki bind loopback; Promtail không published port. Loki tắt multi-tenancy/auth cho mô hình local một người; không mở cổng này ra Internet.
- Promtail chạy root để đọc Docker socket. Socket mount `:ro` **không** biến Docker API thành chỉ đọc; lọc project/service cũng không phải biện pháp phân quyền cho API. Đây là ngoại lệ cần giải thích cùng với privileged của cAdvisor.
- Named volumes dùng cho log/vị trí đọc; không chép chúng vào GitHub. Log vẫn có thể chứa nội dung ứng dụng ghi ra; không in mật khẩu/token trong code hoặc gửi ảnh có bí mật.
- Promtail lấy qua Docker API, không phụ thuộc việc truy cập đường dẫn `/var/lib/docker` từ Windows. Docker socket của Linux VM vẫn phải mount và truy cập được.

Phần chuẩn bị được kiểm tra bằng binary Loki/Promtail và Docker Compose CLI; dùng Docker API giả lập để kiểm tra luồng stdout/stderr, nhãn project/service, bộ lọc và kết quả ba truy vấn. Các kiểm tra biệt lập không thay cho Docker Desktop thực tế. Sau đó, ảnh Windows ngày 03/10/2026 đã xác nhận Loki ready, log Nginx/web, dashboard log và cả ba truy vấn Explore có kết quả. Commit 3 chưa được tạo/push tại thời điểm cập nhật; các giới hạn kiểm chứng được ghi ở phần kết quả phía trên.

## Tài liệu chính thức

- Loki Docker: https://grafana.com/docs/loki/latest/setup/install/docker/
- Loki releases: https://github.com/grafana/loki/releases
- Promtail EOL: https://grafana.com/docs/loki/latest/send-data/promtail/
- Cấu hình Promtail ở bản pin: https://github.com/grafana/loki/blob/v3.6.11/docs/sources/send-data/promtail/configuration.md
- LogQL: https://grafana.com/docs/loki/latest/query/log_queries/
- Log retention: https://grafana.com/docs/loki/latest/operations/storage/retention/
