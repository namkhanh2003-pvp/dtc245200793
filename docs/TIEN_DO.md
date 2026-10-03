# Tiến độ đề 29 — Website công thức nấu ăn

MSSV **dtc245200793**. Bài thực hành cá nhân.
Repository: https://github.com/namkhanh2003-pvp/dtc245200793

Đối chiếu yêu cầu và bảng chấm ở trang 1–2 của đề. Cập nhật ngày **03/10/2026, giờ Việt Nam**, sau khi xác nhận Loki/Promtail nhận log thật, ba truy vấn LogQL thành công và kiểm tra Git lúc 20:23. Commit 2 đã push; commit 3 chưa tạo/push.

| Tiêu chí | Điểm | Tiến độ có minh chứng | Còn cần làm |
| --- | ---: | --- | --- |
| GitHub, toàn bộ source/config, README, ít nhất 3 commit có ý nghĩa | 1,5 | Repo Public theo MSSV; commit 1 **3284f30** và commit 2 **3d76553** đã push; kiểm tra Git xác nhận `.env` chưa được theo dõi | Tạo/push commit 3 cho logging. Username **namkhanh2003-pvp** khác MSSV, chưa hoàn tất đối chiếu yêu cầu tên tài khoản |
| Web + MySQL + phpMyAdmin | 1,5 | Website và dữ liệu hoạt động; phpMyAdmin đã khôi phục, đăng nhập recipe_user và xem recipe_db; db/web healthy | Giữ ảnh, kiểm tra lại sau bổ sung giám sát/log; xác nhận giao diện/phông trên Windows |
| Nginx reverse proxy, HTTPS hoặc headers | 1,5 | nginx -t thành công, HTTP 200 qua Nginx, đủ 4 headers, Nginx healthy; đã lưu trong commit 1 | Giữ minh chứng và giải thích đường đi request |
| Prometheus/Grafana: container/web/DB | 1,5 | Đã chạy trên Docker Desktop: 10 dịch vụ, 6 target bằng 1; Website/MySQL/Nginx UP; đủ biểu đồ CPU/RAM/mạng, request/kết nối Nginx, phản hồi web, kết nối/truy vấn MySQL; đã lưu trong commit 2 | Giữ ảnh làm minh chứng báo cáo; kiểm tra lại sau bổ sung logging |
| Loki/Promtail và 2–3 query LogQL | 1,5 | 12 dịch vụ chạy, Loki ready; dashboard có log thật Nginx/web và 404 demo; Explore chạy được cả ba query: log chung, lọc HTTP 4xx/5xx, đếm log theo service | Tạo/push commit 3; giữ ảnh; kiểm tra riêng log DB/phpMyAdmin và panel đếm trên dashboard khi demo |
| Ít nhất 3–4 biện pháp hardening | 1,5 | Có minh chứng www-data và headers; Compose xác nhận các cổng host chỉ bind loopback, DB/exporter không published port; cấu hình mạng riêng, hạn chế capabilities và mount chỉ đọc | Giữ minh chứng mạng/quyền DB thực tế; giải thích ngoại lệ privileged của cAdvisor |
| Tổng thể, báo cáo và demo | 1,0 | Web/DB/proxy/monitoring và logging đã có kết quả chạy; có source GitHub cho hai commit | Đẩy commit 3, kiểm tra lại toàn hệ thống; báo cáo ≥10 trang, bìa thông tin sinh viên/đề tài, kiến trúc/cách hoạt động/kết quả 6 bước, ảnh và demo đủ hệ thống |

Chưa quy đổi thành phần trăm hoặc điểm dự kiến; giảng viên chấm dựa trên kết quả chạy và demo.

## Việc đang làm

1. Cập nhật tài liệu theo các kết quả logging đã đối chiếu.
2. Thêm đúng các file cấu hình/tài liệu vào Git, kiểm tra danh sách và tạo/push commit 3.
3. Kiểm tra riêng log DB/phpMyAdmin và panel đếm trên dashboard log khi chuẩn bị demo.
4. Hoàn thiện minh chứng hardening và kiểm tra lại toàn hệ thống.
5. Hoàn thiện báo cáo cá nhân và demo.

Không coi target cAdvisor UP là đủ nếu không có số liệu CPU/RAM theo nhãn service. Không coi dashboard trống là hoàn thành.

## Kết quả giám sát đã đối chiếu

- Script thiết lập hoàn tất; 10 container đang chạy.
- Truy vấn Prometheus `up` có 6 dòng, tất cả bằng 1.
- Grafana hiển thị 10 container, ba trạng thái Website/MySQL/Nginx UP và biểu đồ CPU/RAM theo service.
- Biểu đồ web có request Nginx và thời gian phản hồi trang chủ; biểu đồ DB có kết nối và tốc độ truy vấn MySQL; có mạng nhận theo container và kết nối hoạt động Nginx.
- Ảnh kiểm tra dashboard: `image(20261002-180446).png`, `image(20261002-180455).png`, `image(20261002-180500).png`. Đây là tên ảnh đã đối chiếu, chưa phải các tệp được thêm vào repository.

Các số liệu phản ánh hệ thống đang chạy cùng lưu lượng giám sát nền, chưa phải kết quả kiểm thử tải. Commit 2 **3d76553** đã tạo/push, đối chiếu ảnh `image(20261002-182852).png`: HEAD/main và origin/main cùng ở commit này.

## Kết quả logging đã đối chiếu

| Nội dung | Kết quả thực tế | Ảnh đã đối chiếu |
| --- | --- | --- |
| Compose và Loki readiness | 12 dịch vụ chạy; Loki trả `ready` | `image(20261002-185024).png`, `image(20261002-185027).png`, `image(20261002-185350).png` |
| Dashboard log và tạo request demo | Có log Nginx/web và panel lọc lỗi; CMD nhận HTTP 200 trang chủ và HTTP 404 đường dẫn demo | `image(20261003-111927).png`, `image(20261003-111932).png` |
| Query 1 — log chung | Datasource Loki trả 958 dòng trong khoảng đang xem; có nhãn project/service và log thật | `image(20261003-120420).png`, `image(20261003-120427).png` |
| Query 2 — HTTP lỗi | Tìm được một dòng Nginx status 404 cho `__recipe_demo_missing__`, timestamp 19:46:57 | `image(20261003-124946).png`, `image(20261003-124955).png` |
| Query 3 — đếm log | Có hai chuỗi `service="nginx"` và `service="web"`, khoảng 49–51 dòng trong cửa sổ trượt 5 phút tại các điểm hiển thị | `image(20261003-125344).png`, `image(20261003-125348).png` |
| Git trước commit 3 | `.env` chưa được theo dõi; HEAD/main và origin/main vẫn ở commit 2; các file logging chưa commit | `image(20261003-132352).png` |

Các tên ảnh là những minh chứng đã đối chiếu, chưa phải tệp được thêm vào repository. Tổng số dòng chỉ phản ánh kết quả của từng truy vấn tại thời điểm chụp. Truy vấn 2 ban đầu không có kết quả vì không có request lỗi khớp trong khoảng đang xem; tạo 404 mới và chạy lại đã có kết quả.

Ảnh Explore chỉ chứng minh log Nginx/web đang phát sinh trong khoảng chọn. Cấu hình thu bốn dịch vụ không tự chứng minh ảnh đã có log DB/phpMyAdmin. Chưa kiểm tra khôi phục log/vị trí đọc sau sự cố; chưa đối chiếu panel đếm trên dashboard log, dù truy vấn đếm trong Explore đã thành công.

## Minh chứng cần giữ

- Website trang chủ, tìm kiếm/lọc và chi tiết món.
- phpMyAdmin có DB/bảng/dữ liệu.
- Compose, nginx -t, headers, web id.
- Prometheus targets và dashboard có đủ container/web/DB.
- Log tập trung và 2–3 kết quả LogQL.
- Mạng Docker, quyền DB và ít nhất 3–4 biện pháp hardening.
- GitHub, README và lịch sử 3 commit có nội dung tương ứng.

Không đưa mật khẩu vào GitHub, báo cáo hoặc ảnh minh chứng.
