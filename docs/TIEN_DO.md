# Tiến độ đề 29 — Website công thức nấu ăn

Cập nhật: 02/10/2026. Đối chiếu trang 1–2 và đề 29 ở trang 8 của file đề môn Triển khai và Quản trị Hệ thống Phần mềm. Trạng thái dựa trên lần chạy gần nhất người thực hiện đã xác nhận và bản mã nguồn chuẩn bị; không coi cấu hình chưa chạy trên máy Windows là hoàn tất.

| Tiêu chí chấm điểm | Điểm | Tiến độ thực tế | Điều kiện để xác nhận hoàn thành |
| --- | ---: | --- | --- |
| GitHub, source và cấu hình đầy đủ, README, 3 commit có ý nghĩa | 1,5 | Đã khởi tạo Git cục bộ; chưa có GitHub và 3 commit. README đã chuẩn bị trong gói cập nhật. | Tài khoản/repo theo MSSV, đẩy mã nguồn, commit 1 Nginx, commit 2 giám sát, commit 3 log. |
| Ứng dụng + Database + công cụ quản lý DB | 1,5 | Website và MySQL chạy được; giao diện mới và ảnh món đã hiển thị. phpMyAdmin từng chạy được, nhưng mất truy cập cổng 18081 sau đổi mạng; đã chuẩn bị bản sửa mạng admin. Bản sửa phông cần xác nhận lại trên Windows. | Xác nhận phpMyAdmin truy cập/đăng nhập lại và xem được dữ liệu; kiểm tra giao diện sau sửa phông. |
| Nginx reverse proxy, HTTPS hoặc security headers | 1,5 | Đã có minh chứng trên Windows: `nginx -t` thành công, HTTP 200, `Server: nginx` và đủ bốn security headers. Chưa lưu commit 1 trên GitHub. | Giữ screenshot, tạo GitHub và commit 1. |
| Prometheus + Grafana: container/web/DB | 1,5 | Chưa triển khai. | Metrics đủ ba lớp, targets hoạt động, dashboard Grafana và screenshot; commit 2. |
| Loki + Promtail, ít nhất 2–3 query LogQL | 1,5 | Chưa triển khai. | Log tập trung có dữ liệu, chạy được 2–3 truy vấn, screenshot; commit 3. |
| Ít nhất 3–4 biện pháp hardening | 1,5 | Đã kiểm chứng non-root web (`uid=33(www-data)`) và security headers. Có cấu hình mạng riêng, giới hạn cổng/quyền, mount chỉ đọc; độ mạnh mật khẩu và quyền DB cần kiểm chứng. | Chọn ít nhất 3–4 biện pháp, chạy kiểm tra và giải thích được từng biện pháp kèm minh chứng. |
| Tổng thể và trình bày | 1,0 | Compose chạy được hệ thống cơ bản; chưa có toàn bộ giám sát/log, báo cáo và demo hoàn chỉnh. | Tất cả dịch vụ bằng Compose, báo cáo cá nhân ≥10 trang, bìa thông tin sinh viên, kiến trúc/cách hoạt động/kết quả 6 bước và demo đầy đủ. |

Tổng điểm tiêu chí: 10. Chưa thể quy đổi tiến độ thành điểm dự kiến vì các phần đã cấu hình vẫn cần demo và được giảng viên đánh giá.

## Việc nên làm ngay

1. Áp dụng `bep-nha-sua-phpmyadmin.zip` và tạo lại riêng phpMyAdmin theo `docs/SUA_PHPMYADMIN.md`.
2. Xác nhận phpMyAdmin truy cập và đăng nhập DB thành công; kiểm tra giao diện sau sửa phông.
3. Giữ ảnh minh chứng Nginx/headers/non-root đã thành công.
4. Tạo GitHub/commit 1 theo mã số sinh viên, trước khi chuyển sang Prometheus/Grafana.

## Chức năng website đã có và chưa có

Có: xem danh sách món, tìm kiếm, lọc danh mục, chi tiết nguyên liệu/bước chế biến, giao diện responsive. Chưa có trang quản trị đăng/sửa/xóa công thức và tài khoản người đăng. Đề 29 mô tả website chia sẻ công thức nhưng không liệt kê CRUD/đăng nhập bắt buộc; có thể bổ sung phần quản trị sau khi các yêu cầu triển khai cốt lõi hoạt động hoặc khi giảng viên yêu cầu.

## Minh chứng cần giữ

- Website trang chủ, kết quả tìm kiếm và chi tiết món.
- phpMyAdmin hiển thị DB/bảng/dữ liệu.
- Compose services, Nginx config test và response headers.
- Prometheus targets và Grafana dashboard.
- Log tập trung và 2–3 kết quả LogQL.
- Non-root, mạng Docker, quyền DB và các biện pháp hardening đã chọn.
- GitHub source, README và lịch sử 3 commit theo đề.

Không đưa mật khẩu thật vào báo cáo, ảnh minh chứng hay GitHub.
