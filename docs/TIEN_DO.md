# Tiến độ đề 29 — Website công thức nấu ăn

MSSV **dtc245200793**. Bài thực hành cá nhân.
Repository: https://github.com/namkhanh2003-pvp/dtc245200793

Đối chiếu yêu cầu và bảng chấm ở trang 1–2 của đề. Cập nhật ngày **03/10/2026, giờ Việt Nam**, sau khi kiểm tra ảnh Compose, Prometheus và toàn bộ dashboard Grafana trên máy Windows của sinh viên.

| Tiêu chí | Điểm | Tiến độ có minh chứng | Còn cần làm |
| --- | ---: | --- | --- |
| GitHub, toàn bộ source/config, README, ít nhất 3 commit có ý nghĩa | 1,5 | Repo Public theo MSSV; commit 1 **3284f30** đã push; cấu hình giám sát và tài liệu cập nhật đã chuẩn bị cho commit 2 | Tạo/push commit 2 và 3. Username **namkhanh2003-pvp** khác MSSV, chưa hoàn tất đối chiếu yêu cầu tên tài khoản |
| Web + MySQL + phpMyAdmin | 1,5 | Website và dữ liệu hoạt động; phpMyAdmin đã khôi phục, đăng nhập recipe_user và xem recipe_db; db/web healthy | Giữ ảnh, kiểm tra lại sau bổ sung giám sát/log; xác nhận giao diện/phông trên Windows |
| Nginx reverse proxy, HTTPS hoặc headers | 1,5 | nginx -t thành công, HTTP 200 qua Nginx, đủ 4 headers, Nginx healthy; đã lưu trong commit 1 | Giữ minh chứng và giải thích đường đi request |
| Prometheus/Grafana: container/web/DB | 1,5 | Đã chạy trên Docker Desktop: 10 dịch vụ, 6 target bằng 1; Website/MySQL/Nginx UP; đủ biểu đồ CPU/RAM/mạng, request/kết nối Nginx, phản hồi web, kết nối/truy vấn MySQL | Giữ ảnh làm minh chứng báo cáo; tạo/push commit 2 |
| Loki/Promtail và 2–3 query LogQL | 1,5 | Chưa triển khai | Log tập trung, chạy truy vấn và giữ kết quả; commit 3 |
| Ít nhất 3–4 biện pháp hardening | 1,5 | Có minh chứng www-data và headers; Compose xác nhận các cổng host chỉ bind loopback, DB/exporter không published port; cấu hình mạng riêng, hạn chế capabilities và mount chỉ đọc | Giữ minh chứng mạng/quyền DB thực tế; giải thích ngoại lệ privileged của cAdvisor |
| Tổng thể, báo cáo và demo | 1,0 | Web/DB/proxy/monitoring chạy được trong Compose; có source GitHub cho commit 1 | Báo cáo ≥10 trang, bìa thông tin sinh viên/đề tài, kiến trúc/cách hoạt động/kết quả 6 bước, ảnh và demo đủ hệ thống |

Chưa quy đổi thành phần trăm hoặc điểm dự kiến; giảng viên chấm dựa trên kết quả chạy và demo.

## Việc đang làm

1. Chép tài liệu cập nhật sau kiểm chứng vào dự án.
2. Kiểm tra danh sách file Git, bảo đảm `.env` không được theo dõi.
3. Tạo và push commit 2 theo docs/BUOC_2_GIAM_SAT.md.
4. Chuyển sang Loki/Promtail, kiểm chứng LogQL và commit 3.
5. Hoàn thiện minh chứng hardening, báo cáo và demo.

Không coi target cAdvisor UP là đủ nếu không có số liệu CPU/RAM theo nhãn service. Không coi dashboard trống là hoàn thành.

## Kết quả giám sát đã đối chiếu

- Script thiết lập hoàn tất; 10 container đang chạy.
- Truy vấn Prometheus `up` có 6 dòng, tất cả bằng 1.
- Grafana hiển thị 10 container, ba trạng thái Website/MySQL/Nginx UP và biểu đồ CPU/RAM theo service.
- Biểu đồ web có request Nginx và thời gian phản hồi trang chủ; biểu đồ DB có kết nối và tốc độ truy vấn MySQL; có mạng nhận theo container và kết nối hoạt động Nginx.
- Ảnh kiểm tra dashboard: `image(20261002-180446).png`, `image(20261002-180455).png`, `image(20261002-180500).png`. Đây là tên ảnh đã đối chiếu, chưa phải các tệp được thêm vào repository.

Các số liệu phản ánh hệ thống đang chạy cùng lưu lượng giám sát nền, chưa phải kết quả kiểm thử tải. Chưa xác nhận commit 2 đã tạo/push.

## Minh chứng cần giữ

- Website trang chủ, tìm kiếm/lọc và chi tiết món.
- phpMyAdmin có DB/bảng/dữ liệu.
- Compose, nginx -t, headers, web id.
- Prometheus targets và dashboard có đủ container/web/DB.
- Log tập trung và 2–3 kết quả LogQL.
- Mạng Docker, quyền DB và ít nhất 3–4 biện pháp hardening.
- GitHub, README và lịch sử 3 commit có nội dung tương ứng.

Không đưa mật khẩu vào GitHub, báo cáo hoặc ảnh minh chứng.
