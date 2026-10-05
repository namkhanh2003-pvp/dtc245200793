# Bếp Nhà — Đề 29: Website công thức nấu ăn

Bài thực hành **cá nhân** môn Triển khai và Quản trị Hệ thống Phần mềm.
MSSV: **dtc245200793**.
Repository: https://github.com/namkhanh2003-pvp/dtc245200793

Website PHP 8.4/Apache lưu công thức, nguyên liệu và danh mục trong MySQL 8.4; phpMyAdmin quản lý DB. Nginx làm reverse proxy có security headers. Prometheus/Grafana, các exporter và dashboard đã chạy trên Docker Desktop của sinh viên, có dữ liệu giám sát container/web/MySQL. Loki/Promtail đã nhận log thật trên Windows; Grafana hiển thị log tập trung và ba truy vấn LogQL đã chạy thành công. Phần logging đã push bằng commit 3 c2bf988. Đã kiểm tra giám sát, ba truy vấn log và Loki ready ngày 04/10/2026. Báo cáo chưa hoàn thành.

## Chức năng

- Xem danh sách món, tìm kiếm theo tên và lọc danh mục.
- Chi tiết thời gian, khẩu phần, nguyên liệu và các bước nấu; gợi ý món liên quan.
- Đánh dấu nguyên liệu đã chuẩn bị trong lần mở trang, không lưu trạng thái vào DB.
- Giao diện máy tính/điện thoại, ảnh món và phông tiếng Việt lưu cục bộ.
- Kho mẫu sau nhập đến `06_hundred_recipes.sql`: 100 công thức, 8 danh mục, 964 liên kết món–nguyên liệu; các tên nguyên liệu cũ được giữ.
- Lọc theo 6 khoảng thời gian không chồng nhau và đúng 15/30/45/60/90 phút, sắp xếp mới nhất/nhanh nhất/tên món; phân trang 12 món.
- Gợi ý món ngẫu nhiên, đánh dấu bước đã nấu và mở bản in và tải PDF trực tiếp qua máy chủ. Bản in có đủ lượng nguyên liệu, ghi chú sơ chế, các bước và mẹo nấu.
- 97 món bổ sung dùng ảnh minh họa AI dạng ảnh chụp, lưu JPEG cục bộ; giữ ba ảnh ban đầu. Tất cả 100 món mẫu có ảnh. Có nền ảnh căn bếp lớn phủ màn hình, hiện ở hai bên phần nội dung. Prompt: `docs/ANH_MON_AN.md`, `docs/ANH_10_MON_MOI.md`, `docs/ANH_20_MON_MOI.md`, `docs/ANH_40_MON_MOI.md`.
- 626 bước có tiêu đề: sơ chế, ướp, mức lửa, thời gian và nhận biết kết quả; nguyên liệu có định lượng, đơn vị và ghi chú; 2 mẹo riêng cho mỗi món.

Nội dung được quản lý bằng SQL/phpMyAdmin; chưa có tài khoản người đăng hoặc CRUD trên website. Đề 29 không liệt kê CRUD/đăng nhập bắt buộc; bổ sung khi cần mở rộng hoặc giảng viên yêu cầu.

## Cập nhật hiện tại: 100 món và nền căn bếp

Dùng tiếp từ bản 60 món. Xem **HUONG_DAN_100_MON.txt**: chép các mục bên trong gói vào `C:\Users\basiu\recipe-website`, nhập **riêng `database/06_hundred_recipes.sql`** trong phpMyAdmin rồi Ctrl + F5. Chép file không tự nhập dữ liệu. Không cần làm lại dự án hoặc build lại Docker cho thay đổi app này.

Bản 06 thêm 40 món, 374 mục nguyên liệu, 240 bước và 40 ảnh riêng. Tổng bộ mẫu là 100 món, 626 bước, 964 mục nguyên liệu, 100 hàng recipe_details và 8 danh mục. Có bò lúc lắc, gà hấp hành, cá hấp gừng, canh khổ qua, các món chay, xôi gấc, bánh cuốn chảo, bánh xèo, bánh flan, sữa bắp… Mỗi món mới có 6 giai đoạn, định lượng, chú thích nguyên liệu và 2 mẹo riêng. Công thức là phiên bản gia đình, chưa được nấu thử.

Giữ ID và nội dung recipes của 60 món cũ. Sửa tên nguyên liệu Mẻ thành **Cơm mẻ** ở rựa mận và giả cầy, cùng ghi chú liên quan, để không bị trùng Me trong collation không phân biệt dấu của MySQL. Giữ các nguyên liệu khác và món riêng ngoài bộ mẫu. Nhập lại 06 không tạo bản trùng; nếu đã có thêm món riêng thì tổng có thể cao hơn 100.

Ảnh căn bếp lưu tại `app/assets/backgrounds/kitchen.jpg`, phủ màn hình và giữ cố định khi cuộn. Phần nội dung có nền kem sáng và rộng tối đa 1280 px; ảnh hiện rõ ở hai bên màn hình lớn. Điện thoại có viền nền nhỏ, bố cục một cột. Phân trang 12 món, tổng 9 trang; nút phân trang xuống dòng khi hẹp. Nền được ẩn trong bản in HTML, PDF vẫn dùng trang giấy sáng. Không tải ảnh/phông từ dịch vụ ngoài.

Giữ bộ lọc 1–15, 16–30, 31–45, 46–60, 61–90 và trên 90 phút; thêm lựa chọn đúng 15/30/45/60/90. **Đúng 60 phút** chỉ trả giá trị 60, không trả món 20 phút. Từ khóa, danh mục, thời gian và sắp xếp được giữ khi chuyển trang. Thời gian là ước tính đã lưu; trang chi tiết ghi rõ thời gian ngâm/làm lạnh bổ sung với các món cần chuẩn bị trước.

**Tải PDF** là liên kết `download.php?id=...`, trả file đính kèm trực tiếp từ dữ liệu hiện tại. PDF A4 có tiếng Việt, đủ nguyên liệu, ghi chú, bước và mẹo; không cần JavaScript, máy in hoặc ghi file vào thư mục app. **In công thức** mở bản in HTML, chỉ gọi hộp thoại in khi bấm nút hoặc Ctrl + P. Thư viện/phông đi kèm trong `app/lib/` và `app/assets/fonts/`; không cần Composer hoặc sửa Dockerfile. Phiên bản/giấy phép: [docs/THU_VIEN_PDF.md](docs/THU_VIEN_PDF.md).

Kiểm chứng: SQL fixture nhập lặp, giữ món cũ/món riêng và mô phỏng collation tên không phân biệt dấu; chính PHP 8.4 chạy 100 chi tiết, 100 bản in và 100 endpoint PDF, 9 trang danh sách. Đối chiếu 11 bộ lọc và các giá trị cận. Chromium kiểm tra ảnh, tải file, checkbox, CSP, JavaScript tắt và bố cục 320/390/768/1366/1920 px. Đối chiếu đủ nội dung/lề của 100 PDF, render 7 PDF đại diện (11 trang). Các hàm mbstring gốc được tắt để kiểm tra polyfill. Đây là kiểm tra biệt lập, chưa phải MySQL/Windows của sinh viên.

Ảnh Windows mới xác nhận web đang có 60 món. Sau khi áp dụng 06, thực hiện [docs/KIEM_TRA_100_MON.md](docs/KIEM_TRA_100_MON.md) và chụp minh chứng thật. Hình giao diện mẫu trong docs được chụp từ môi trường kiểm tra, không dùng làm minh chứng hệ thống đã chạy trên Windows.

## Các lần nâng cấp trước

Xem `HUONG_DAN_NANG_CAP.txt`. Với MySQL đang có dữ liệu và chưa nhập bản mở rộng, sao lưu trước rồi nhập riêng `database/03_expand_recipes.sql` bằng phpMyAdmin. Tệp này thêm 27 công thức và các nguyên liệu/danh mục cần thiết trong một transaction, không xóa hoặc cập nhật món cũ; nhập lại không nhân đôi các mẫu này. Không xóa volume để chạy lại seed.

Bản cập nhật đã kiểm tra cú pháp bằng PHP 8.4 WASM, chạy truy vấn và nhập SQL hai lần trên SQLite fixture (30 công thức, 167 liên kết nguyên liệu). Đã kiểm tra tìm kiếm, lọc thời gian, phân trang, chi tiết, 404, gợi ý ngẫu nhiên, checkbox và giao diện 390px/1440px bằng Chromium. Đây là kiểm tra biệt lập. Ảnh Windows ngày 04/10/2026 sau đó xác nhận phpMyAdmin nhập 03_expand_recipes.sql thành công (365 truy vấn); trang chủ hiển thị 30 công thức, 8 danh mục, 59 nguyên liệu. Ảnh Windows mới xác nhận ảnh JPEG đã hiện ở món Sữa chua trái cây. Bản ảnh trước chỉ đổi app, không nhập thêm SQL. Bản 40 món bên dưới có một SQL mới, cần nhập để đổi nội dung.

## Cập nhật 40 món và công thức chi tiết

Áp dụng sau bản 30 món. Xem `HUONG_DAN_40_MON.txt`: chép các mục trong gói cập nhật vào dự án, nhập **riêng `database/04_detailed_recipes.sql`** bằng phpMyAdmin rồi Ctrl + F5. Không chạy lại 01/02/03 trên máy hiện tại.

04 viết lại nguyên liệu, mô tả và hướng dẫn cho 30 món mẫu hiện có, thêm 10 món và ảnh mới. Các ID món cũ được giữ, nên đường dẫn `recipe.php?id=...` vẫn dùng được. Dữ liệu ngoài bộ 40 tên món không bị thay đổi. Nhập lại 04 không tạo thêm bản trùng. Những nguyên liệu cũ không còn dùng được giữ lại thay vì xóa khỏi danh mục.

Bốn bảng chính giữ cấu trúc hiện tại. Bảng phụ **recipe_details** có khóa chính/khóa ngoại recipe_id, ingredient_notes (JSON lưu dạng TEXT), tips (TEXT) và time_note. Bảng phụ lưu chú thích sơ chế và mẹo riêng; instructions vẫn nằm trong recipes, quantity/unit vẫn ở recipe_ingredients. Vì có thêm bảng phụ, sơ đồ DB của bản này có **5 bảng**.

Bản 40 ban đầu dùng hộp thoại in để lưu PDF. Người dùng đã nhập SQL 04 thành công nhưng cho biết chưa lưu được file. Bản 60 đã thay thao tác lưu bằng nút tải PDF trực tiếp; bản 100 giữ chức năng này, như mô tả ở mục cập nhật hiện tại; nút in vẫn được giữ riêng.

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

Trên máy mới với volume MySQL trống, Docker tự nhập lần lượt `database/01_schema.sql` đến `database/06_hundred_recipes.sql` để tạo đủ 100 công thức. Nếu đang dùng database cũ, sao lưu rồi nhập các SQL nâng cấp còn thiếu theo thứ tự 03 → 04 → 05 → 06; máy đã có 60 món chỉ nhập 06.

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

Minh chứng trên máy Windows được đối chiếu ngày **03/10/2026, giờ Việt Nam**: script báo `Monitoring setup complete.`, Compose có 10 dịch vụ chạy và truy vấn `up` trả về 6 target bằng 1. Dashboard có Website/MySQL/Nginx UP, 10 container và các biểu đồ CPU, RAM, mạng, request/kết nối Nginx, thời gian phản hồi trang chủ, kết nối/tốc độ truy vấn MySQL. Commit 2 **3d76553** đã push lên main; ảnh lịch sử Git xác nhận HEAD/main và origin/main ở commit này. Đã đối chiếu SHOW GRANTS; xem kết quả cập nhật bên dưới.
Cấu hình logging dùng Loki 3.7.8 và Promtail 3.6.11. Ngày **03/10/2026, giờ Việt Nam**, ảnh Windows xác nhận Compose có 12 dịch vụ chạy và Loki `/ready` trả `ready`. Dashboard log hiển thị log Nginx/web và request 404 được tạo có chủ đích. Trong Explore với datasource Loki: truy vấn log chung trả 958 dòng trong khoảng đang xem; truy vấn HTTP lỗi tìm được một request `__recipe_demo_missing__` có status 404 lúc 19:46:57; truy vấn đếm log hiển thị hai chuỗi `nginx`/`web` trong cửa sổ trượt 5 phút. Số dòng phụ thuộc khoảng thời gian và lưu lượng giám sát nền, không phải số người truy cập.

Nhãn và truy vấn đã được kiểm chứng trên log thật của Nginx/web. Cấu hình thu cả DB/phpMyAdmin, nhưng chưa đối chiếu riêng ảnh log của hai dịch vụ này trên Windows; không suy diễn từ selector bốn dịch vụ rằng ảnh đã chứng minh cả bốn. Biểu đồ đếm đã được đối chiếu trong Explore; panel đếm trên dashboard log đã có dữ liệu khi kiểm tra ngày 04/10/2026. Named volumes đã được cấu hình, chưa kiểm tra khôi phục log/vị trí đọc sau sự cố.

Commit 3 c2bf988 đã push lên main, gồm Loki/Promtail và ba truy vấn LogQL. Ngày 04/10/2026 đã kiểm tra lại: 12 dịch vụ chạy, dashboard giám sát có dữ liệu, dashboard log có log mới, request demo 404 và biểu đồ đếm log; Loki trả ready. Đã có minh chứng SHOW GRANTS cho tài khoản ứng dụng và giám sát MySQL. Còn hoàn thiện báo cáo cá nhân tối thiểu 10 trang, chuẩn bị demo và cập nhật tài liệu. Tên tài khoản GitHub namkhanh2003-pvp khác MSSV; cần đối chiếu yêu cầu này với giảng viên.

## Ảnh và phông

Ba ảnh món ban đầu trong app/assets được tạo bằng công cụ imagegen tích hợp, chế độ tạo ảnh mới; đây là ảnh minh họa AI, không phải ảnh tự chụp của sinh viên. Ảnh mô tả đồ ăn Việt Nam, ánh sáng tự nhiên dịu, đồ gốm tông kem, bàn gỗ/vải linen, phong cách phù hợp giao diện xanh lá/kem. Logo và icon viết bằng SVG.

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
