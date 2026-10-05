-- Bep Nha: 40 detailed recipes. Apply after 01, 02 and 03.

-- Preserves recipe IDs, existing categories, and recipes outside this collection.

-- Re-importing does not create duplicate recipes or ingredient links.

USE recipe_db;

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS recipe_details (
  recipe_id INT UNSIGNED NOT NULL PRIMARY KEY,
  ingredient_notes TEXT NOT NULL,
  tips TEXT NOT NULL,
  time_note VARCHAR(200) NOT NULL DEFAULT '',
  CONSTRAINT fk_recipe_details_recipe FOREIGN KEY (recipe_id)
    REFERENCES recipes (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

START TRANSACTION;

INSERT INTO categories (name,description) SELECT 'Món mặn','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');

INSERT INTO categories (name,description) SELECT 'Canh','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Canh');

INSERT INTO categories (name,description) SELECT 'Cơm','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Cơm');

INSERT INTO categories (name,description) SELECT 'Rau & salad','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Rau & salad');

INSERT INTO categories (name,description) SELECT 'Món chay','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món chay');

INSERT INTO categories (name,description) SELECT 'Ăn sáng','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');

INSERT INTO categories (name,description) SELECT 'Tráng miệng','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Tráng miệng');

INSERT INTO categories (name,description) SELECT 'Đồ uống','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Đồ uống');

INSERT INTO ingredients (name) SELECT 'Bánh mì' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bánh mì');

INSERT INTO ingredients (name) SELECT 'Bánh tráng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bánh tráng');

INSERT INTO ingredients (name) SELECT 'Bí đỏ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bí đỏ');

INSERT INTO ingredients (name) SELECT 'Bông cải xanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bông cải xanh');

INSERT INTO ingredients (name) SELECT 'Bún gạo khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bún gạo khô');

INSERT INTO ingredients (name) SELECT 'Bún tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bún tươi');

INSERT INTO ingredients (name) SELECT 'Bơ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bơ');

INSERT INTO ingredients (name) SELECT 'Bắp hạt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp hạt');

INSERT INTO ingredients (name) SELECT 'Bắp ngọt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp ngọt');

INSERT INTO ingredients (name) SELECT 'Bột mì' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột mì');

INSERT INTO ingredients (name) SELECT 'Bột năng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột năng');

INSERT INTO ingredients (name) SELECT 'Bột nở' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột nở');

INSERT INTO ingredients (name) SELECT 'Chanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chanh');

INSERT INTO ingredients (name) SELECT 'Chuối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chuối');

INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');

INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');

INSERT INTO ingredients (name) SELECT 'Cà tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà tím');

INSERT INTO ingredients (name) SELECT 'Cá basa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá basa');

INSERT INTO ingredients (name) SELECT 'Cá hồi phi lê' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá hồi phi lê');

INSERT INTO ingredients (name) SELECT 'Cơm chín' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm chín');

INSERT INTO ingredients (name) SELECT 'Cơm nguội' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm nguội');

INSERT INTO ingredients (name) SELECT 'Cải xanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cải xanh');

INSERT INTO ingredients (name) SELECT 'Dưa chuột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dưa chuột');

INSERT INTO ingredients (name) SELECT 'Dầu hào' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu hào');

INSERT INTO ingredients (name) SELECT 'Dầu ô liu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ô liu');

INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');

INSERT INTO ingredients (name) SELECT 'Dứa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dứa');

INSERT INTO ingredients (name) SELECT 'Giá đỗ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Giá đỗ');

INSERT INTO ingredients (name) SELECT 'Giấm gạo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Giấm gạo');

INSERT INTO ingredients (name) SELECT 'Gạo tẻ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gạo tẻ');

INSERT INTO ingredients (name) SELECT 'Gừng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gừng');

INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành lá');

INSERT INTO ingredients (name) SELECT 'Hành tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tây');

INSERT INTO ingredients (name) SELECT 'Hành tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tím');

INSERT INTO ingredients (name) SELECT 'Khoai tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Khoai tây');

INSERT INTO ingredients (name) SELECT 'Me chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Me chua');

INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');

INSERT INTO ingredients (name) SELECT 'Mè rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mè rang');

INSERT INTO ingredients (name) SELECT 'Mì trứng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mì trứng');

INSERT INTO ingredients (name) SELECT 'Mướp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mướp');

INSERT INTO ingredients (name) SELECT 'Mật ong' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mật ong');

INSERT INTO ingredients (name) SELECT 'Nui khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nui khô');

INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');

INSERT INTO ingredients (name) SELECT 'Nước cốt chanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt chanh');

INSERT INTO ingredients (name) SELECT 'Nước cốt dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt dừa');

INSERT INTO ingredients (name) SELECT 'Nước dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước dừa');

INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');

INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');

INSERT INTO ingredients (name) SELECT 'Nấm hương tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm hương tươi');

INSERT INTO ingredients (name) SELECT 'Rau húng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau húng');

INSERT INTO ingredients (name) SELECT 'Rau muống' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau muống');

INSERT INTO ingredients (name) SELECT 'Rau ngót' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau ngót');

INSERT INTO ingredients (name) SELECT 'Rau ngổ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau ngổ');

INSERT INTO ingredients (name) SELECT 'Sườn heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sườn heo');

INSERT INTO ingredients (name) SELECT 'Sả' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sả');

INSERT INTO ingredients (name) SELECT 'Sữa chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa chua');

INSERT INTO ingredients (name) SELECT 'Sữa tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa tươi');

INSERT INTO ingredients (name) SELECT 'Thịt ba chỉ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt ba chỉ');

INSERT INTO ingredients (name) SELECT 'Thịt bò' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt bò');

INSERT INTO ingredients (name) SELECT 'Thịt gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt gà');

INSERT INTO ingredients (name) SELECT 'Thịt heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt heo');

INSERT INTO ingredients (name) SELECT 'Thịt heo xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt heo xay');

INSERT INTO ingredients (name) SELECT 'Thịt đùi gà không xương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt đùi gà không xương');

INSERT INTO ingredients (name) SELECT 'Tiêu xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tiêu xay');

INSERT INTO ingredients (name) SELECT 'Trà túi lọc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trà túi lọc');

INSERT INTO ingredients (name) SELECT 'Trứng gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trứng gà');

INSERT INTO ingredients (name) SELECT 'Tôm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tôm');

INSERT INTO ingredients (name) SELECT 'Tương cà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tương cà');

INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');

INSERT INTO ingredients (name) SELECT 'Xoài' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Xoài');

INSERT INTO ingredients (name) SELECT 'Xà lách' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Xà lách');

INSERT INTO ingredients (name) SELECT 'Đá viên' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đá viên');

INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');

INSERT INTO ingredients (name) SELECT 'Đậu Hà Lan' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu Hà Lan');

INSERT INTO ingredients (name) SELECT 'Đậu bắp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu bắp');

INSERT INTO ingredients (name) SELECT 'Đậu hũ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ');

INSERT INTO ingredients (name) SELECT 'Đậu phộng rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu phộng rang');

INSERT INTO ingredients (name) SELECT 'Đậu xanh cà vỏ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu xanh cà vỏ');

INSERT INTO ingredients (name) SELECT 'Ớt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ớt');

INSERT INTO ingredients (name) SELECT 'Ớt chuông' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ớt chuông');

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Trứng chiên hành lá','Trứng chiên vàng mềm, thơm hành lá; món ăn nhanh cho bữa cơm hai người.','1. Sơ chế hành | Bỏ rễ và lá héo, rửa hành dưới vòi nước rồi để ráo. Thái đầu trắng và lá xanh thành khoanh nhỏ khoảng 3 mm.
2. Đánh trứng | Cho 3 quả trứng vào bát, thêm nước mắm, nước và tiêu. Dùng đũa đánh khoảng 30–45 giây cho lòng đỏ, lòng trắng hòa đều; sau đó trộn hành vào.
3. Làm nóng chảo | Đặt chảo chống dính đường kính khoảng 20 cm trên lửa vừa. Thêm dầu, nghiêng chảo để dầu phủ đáy; chờ khoảng 30 giây, không để dầu bốc khói.
4. Chiên mặt đầu | Rót trứng vào, dàn thành lớp đều. Hạ lửa vừa nhỏ và chiên 2–3 phút đến khi mép trứng se lại, mặt dưới vàng; không đảo liên tục.
5. Lật và làm chín | Dùng xẻng lật hoặc gập đôi trứng, chiên thêm 1–2 phút. Trứng đạt khi phần giữa đông hoàn toàn, không còn lòng trứng lỏng.
6. Hoàn thành | Tắt bếp, chuyển ra đĩa rồi cắt miếng vừa ăn. Dùng nóng với cơm; nếu thích nhạt hơn, giảm nước mắm ở lần nấu sau.','assets/egg.png',15,2 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Trứng chiên hành lá');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Trứng chiên vàng mềm, thơm hành lá; món ăn nhanh cho bữa cơm hai người.',instructions='1. Sơ chế hành | Bỏ rễ và lá héo, rửa hành dưới vòi nước rồi để ráo. Thái đầu trắng và lá xanh thành khoanh nhỏ khoảng 3 mm.
2. Đánh trứng | Cho 3 quả trứng vào bát, thêm nước mắm, nước và tiêu. Dùng đũa đánh khoảng 30–45 giây cho lòng đỏ, lòng trắng hòa đều; sau đó trộn hành vào.
3. Làm nóng chảo | Đặt chảo chống dính đường kính khoảng 20 cm trên lửa vừa. Thêm dầu, nghiêng chảo để dầu phủ đáy; chờ khoảng 30 giây, không để dầu bốc khói.
4. Chiên mặt đầu | Rót trứng vào, dàn thành lớp đều. Hạ lửa vừa nhỏ và chiên 2–3 phút đến khi mép trứng se lại, mặt dưới vàng; không đảo liên tục.
5. Lật và làm chín | Dùng xẻng lật hoặc gập đôi trứng, chiên thêm 1–2 phút. Trứng đạt khi phần giữa đông hoàn toàn, không còn lòng trứng lỏng.
6. Hoàn thành | Tắt bếp, chuyển ra đĩa rồi cắt miếng vừa ăn. Dùng nóng với cơm; nếu thích nhạt hơn, giảm nước mắm ở lần nấu sau.',image_url='assets/egg.png',prep_time_minutes=15,servings=2 WHERE title='Trứng chiên hành lá';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh rau ngót thịt băm','Canh rau ngót xanh, nước thanh ngọt từ thịt băm; hướng dẫn nấu để rau mềm mà không nát.','1. Nhặt và rửa rau | Tuốt lá rau ngót, bỏ lá úa và cọng già. Rửa 2–3 lần bằng nước sạch, để ráo rồi vò nhẹ một lần; không bóp nát lá.
2. Ướp thịt | Trộn thịt với 1 muỗng cà phê nước mắm và tiêu. Dằm tơi thịt, để khoảng 5 phút trong lúc chuẩn bị nồi và nước.
3. Xào thịt | Làm nóng dầu trên lửa vừa, phi hành tím 30 giây. Cho thịt vào, dùng đũa tách nhỏ và đảo 2–3 phút đến khi thịt chuyển màu.
4. Nấu nước canh | Thêm 1 lít nước, đun sôi trên lửa vừa lớn. Hớt bọt, hạ lửa vừa và nấu 5 phút; thịt băm cần chín hoàn toàn, nhiệt độ tâm khoảng 71°C nếu kiểm tra bằng nhiệt kế.
5. Cho rau | Thả rau vào nước đang sôi nhẹ, đảo để rau ngập nước. Nấu không đậy kín nắp khoảng 3–4 phút đến khi lá mềm và vẫn xanh.
6. Nêm và dùng | Thêm nước mắm còn lại cùng muối, khuấy rồi nếm nước canh. Tắt bếp, múc ra bát và dùng nóng; không đun rau quá lâu sau khi đã mềm.','assets/soup.png',25,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh rau ngót thịt băm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh rau ngót xanh, nước thanh ngọt từ thịt băm; hướng dẫn nấu để rau mềm mà không nát.',instructions='1. Nhặt và rửa rau | Tuốt lá rau ngót, bỏ lá úa và cọng già. Rửa 2–3 lần bằng nước sạch, để ráo rồi vò nhẹ một lần; không bóp nát lá.
2. Ướp thịt | Trộn thịt với 1 muỗng cà phê nước mắm và tiêu. Dằm tơi thịt, để khoảng 5 phút trong lúc chuẩn bị nồi và nước.
3. Xào thịt | Làm nóng dầu trên lửa vừa, phi hành tím 30 giây. Cho thịt vào, dùng đũa tách nhỏ và đảo 2–3 phút đến khi thịt chuyển màu.
4. Nấu nước canh | Thêm 1 lít nước, đun sôi trên lửa vừa lớn. Hớt bọt, hạ lửa vừa và nấu 5 phút; thịt băm cần chín hoàn toàn, nhiệt độ tâm khoảng 71°C nếu kiểm tra bằng nhiệt kế.
5. Cho rau | Thả rau vào nước đang sôi nhẹ, đảo để rau ngập nước. Nấu không đậy kín nắp khoảng 3–4 phút đến khi lá mềm và vẫn xanh.
6. Nêm và dùng | Thêm nước mắm còn lại cùng muối, khuấy rồi nếm nước canh. Tắt bếp, múc ra bát và dùng nóng; không đun rau quá lâu sau khi đã mềm.',image_url='assets/soup.png',prep_time_minutes=25,servings=3 WHERE title='Canh rau ngót thịt băm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm chiên trứng cà rốt','Cơm chiên tơi hạt với trứng, cà rốt và hành lá, đủ lượng cho hai phần ăn.','1. Chuẩn bị cơm và rau | Bóp tơi cơm lạnh, không dùng cơm có mùi lạ. Gọt cà rốt, rửa rồi cắt hạt lựu; thái hành và băm tỏi.
2. Đánh trứng | Đập trứng vào bát, thêm muối và đánh đều khoảng 30 giây. Đặt các nguyên liệu cạnh bếp để thao tác nhanh.
3. Xào cà rốt | Làm nóng 1 muỗng canh dầu trên lửa vừa lớn, phi tỏi và đầu hành 20–30 giây. Cho cà rốt vào, đảo 3 phút cho hơi mềm.
4. Làm trứng | Gạt cà rốt sang một bên, thêm phần dầu còn lại rồi rót trứng. Chờ 15–20 giây và đảo thành miếng nhỏ, nấu đến khi trứng đông.
5. Chiên cơm | Cho cơm vào, dùng xẻng ép nhẹ để tách hạt rồi đảo đều 4–5 phút. Thêm nước tương dọc thành chảo, đảo tiếp 1–2 phút đến khi cơm nóng đều và ráo.
6. Hoàn thành | Rắc hành lá và tiêu, đảo thêm 30 giây. Nếm rồi tắt bếp, chia ra hai đĩa và dùng ngay khi cơm còn nóng.','assets/rice.png',20,2 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm chiên trứng cà rốt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Cơm chiên tơi hạt với trứng, cà rốt và hành lá, đủ lượng cho hai phần ăn.',instructions='1. Chuẩn bị cơm và rau | Bóp tơi cơm lạnh, không dùng cơm có mùi lạ. Gọt cà rốt, rửa rồi cắt hạt lựu; thái hành và băm tỏi.
2. Đánh trứng | Đập trứng vào bát, thêm muối và đánh đều khoảng 30 giây. Đặt các nguyên liệu cạnh bếp để thao tác nhanh.
3. Xào cà rốt | Làm nóng 1 muỗng canh dầu trên lửa vừa lớn, phi tỏi và đầu hành 20–30 giây. Cho cà rốt vào, đảo 3 phút cho hơi mềm.
4. Làm trứng | Gạt cà rốt sang một bên, thêm phần dầu còn lại rồi rót trứng. Chờ 15–20 giây và đảo thành miếng nhỏ, nấu đến khi trứng đông.
5. Chiên cơm | Cho cơm vào, dùng xẻng ép nhẹ để tách hạt rồi đảo đều 4–5 phút. Thêm nước tương dọc thành chảo, đảo tiếp 1–2 phút đến khi cơm nóng đều và ráo.
6. Hoàn thành | Rắc hành lá và tiêu, đảo thêm 30 giây. Nếm rồi tắt bếp, chia ra hai đĩa và dùng ngay khi cơm còn nóng.',image_url='assets/rice.png',prep_time_minutes=20,servings=2 WHERE title='Cơm chiên trứng cà rốt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt kho trứng','Thịt ba chỉ kho mềm với trứng và nước dừa, nước kho mặn ngọt vừa để ăn cùng cơm.','1. Chuẩn bị thịt | Thấm khô thịt bằng giấy bếp, cắt miếng 3–4 cm. Dùng riêng dao, thớt cho thịt sống; băm hành tím và tỏi.
2. Luộc trứng | Đặt trứng trong nồi nước ngập trứng, đun sôi rồi hạ lửa nấu khoảng 10 phút. Ngâm nước mát 3 phút, bóc vỏ và để riêng.
3. Ướp thịt | Trộn thịt với nước mắm, 0,5 muỗng canh đường, hành, tỏi và tiêu. Ướp 15 phút; nếu chuẩn bị lâu hơn, đặt bát thịt trong ngăn mát.
4. Tạo màu | Cho 1 muỗng canh đường và 1 muỗng cà phê dầu vào nồi, đun lửa nhỏ đến màu cánh gián. Tắt bếp, thêm từ từ 50 ml nước và khuấy; chú ý nước màu có thể bắn nóng.
5. Săn thịt và thêm nước | Cho thịt đã ướp vào nồi màu, bật lửa vừa và đảo 4–5 phút. Thêm nước dừa và 50 ml nước còn lại, đun sôi rồi hớt bọt.
6. Kho mềm | Hạ lửa nhỏ để nồi sôi lăn tăn, đậy hé nắp và kho khoảng 35–45 phút. Trở thịt một lần; nếu nước cạn trước khi thịt mềm, thêm ít nước nóng.
7. Kho trứng và nêm | Cho trứng đã bóc vào, kho thêm 15 phút. Thịt đạt khi xiên đũa dễ xuyên qua, trứng thấm màu và nước còn khoảng một phần ba; nếm nước kho trước khi tắt bếp.
8. Dọn món | Gắp thịt và trứng ra tô, chan một ít nước kho. Dùng với cơm và rau luộc; lượng nước kho còn lại có thể giữ riêng để tránh món quá mặn.','assets/photos/recipe-01.jpg',85,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt kho trứng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Thịt ba chỉ kho mềm với trứng và nước dừa, nước kho mặn ngọt vừa để ăn cùng cơm.',instructions='1. Chuẩn bị thịt | Thấm khô thịt bằng giấy bếp, cắt miếng 3–4 cm. Dùng riêng dao, thớt cho thịt sống; băm hành tím và tỏi.
2. Luộc trứng | Đặt trứng trong nồi nước ngập trứng, đun sôi rồi hạ lửa nấu khoảng 10 phút. Ngâm nước mát 3 phút, bóc vỏ và để riêng.
3. Ướp thịt | Trộn thịt với nước mắm, 0,5 muỗng canh đường, hành, tỏi và tiêu. Ướp 15 phút; nếu chuẩn bị lâu hơn, đặt bát thịt trong ngăn mát.
4. Tạo màu | Cho 1 muỗng canh đường và 1 muỗng cà phê dầu vào nồi, đun lửa nhỏ đến màu cánh gián. Tắt bếp, thêm từ từ 50 ml nước và khuấy; chú ý nước màu có thể bắn nóng.
5. Săn thịt và thêm nước | Cho thịt đã ướp vào nồi màu, bật lửa vừa và đảo 4–5 phút. Thêm nước dừa và 50 ml nước còn lại, đun sôi rồi hớt bọt.
6. Kho mềm | Hạ lửa nhỏ để nồi sôi lăn tăn, đậy hé nắp và kho khoảng 35–45 phút. Trở thịt một lần; nếu nước cạn trước khi thịt mềm, thêm ít nước nóng.
7. Kho trứng và nêm | Cho trứng đã bóc vào, kho thêm 15 phút. Thịt đạt khi xiên đũa dễ xuyên qua, trứng thấm màu và nước còn khoảng một phần ba; nếm nước kho trước khi tắt bếp.
8. Dọn món | Gắp thịt và trứng ra tô, chan một ít nước kho. Dùng với cơm và rau luộc; lượng nước kho còn lại có thể giữ riêng để tránh món quá mặn.',image_url='assets/photos/recipe-01.jpg',prep_time_minutes=85,servings=4 WHERE title='Thịt kho trứng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gà kho gừng','Gà kho thơm gừng, nước sốt sánh nhẹ; có tỷ lệ ướp và hướng dẫn kho từng giai đoạn.','1. Sơ chế | Thấm khô thịt gà, chặt miếng đều để chín cùng lúc. Gừng cạo vỏ, chia phần thái sợi và phần băm; hành tím bóc vỏ, băm.
2. Ướp gà | Trộn gà với nước mắm, nước tương, đường, tiêu, gừng băm và nửa hành tím. Để 10 phút trong ngăn mát.
3. Phi thơm | Làm nóng dầu trên lửa vừa, cho hành tím còn lại và gừng sợi vào. Đảo 30–45 giây đến khi dậy mùi, không để gừng cháy.
4. Săn thịt | Cho gà và nước ướp vào, đảo 4–5 phút đến khi mặt ngoài thịt săn và đổi màu. Trở các miếng có da xuống dưới một lúc để ra bớt mỡ.
5. Kho | Thêm 150 ml nước, đun sôi rồi hạ lửa nhỏ. Đậy hé nắp, kho 18–22 phút và trở miếng gà một lần; bổ sung ít nước nóng nếu nồi quá cạn.
6. Kiểm tra và cô sốt | Kiểm tra phần dày nhất của thịt gà đạt ít nhất 74°C bằng nhiệt kế. Mở nắp, tăng lửa vừa 2–3 phút cho nước sốt bám thịt rồi nếm điều chỉnh.
7. Hoàn thành | Tắt bếp, gắp ra đĩa và rưới nước kho. Dùng nóng; gừng sợi có thể ăn kèm hoặc gạt sang một bên tùy khẩu vị.','assets/photos/recipe-02.jpg',45,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gà kho gừng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Gà kho thơm gừng, nước sốt sánh nhẹ; có tỷ lệ ướp và hướng dẫn kho từng giai đoạn.',instructions='1. Sơ chế | Thấm khô thịt gà, chặt miếng đều để chín cùng lúc. Gừng cạo vỏ, chia phần thái sợi và phần băm; hành tím bóc vỏ, băm.
2. Ướp gà | Trộn gà với nước mắm, nước tương, đường, tiêu, gừng băm và nửa hành tím. Để 10 phút trong ngăn mát.
3. Phi thơm | Làm nóng dầu trên lửa vừa, cho hành tím còn lại và gừng sợi vào. Đảo 30–45 giây đến khi dậy mùi, không để gừng cháy.
4. Săn thịt | Cho gà và nước ướp vào, đảo 4–5 phút đến khi mặt ngoài thịt săn và đổi màu. Trở các miếng có da xuống dưới một lúc để ra bớt mỡ.
5. Kho | Thêm 150 ml nước, đun sôi rồi hạ lửa nhỏ. Đậy hé nắp, kho 18–22 phút và trở miếng gà một lần; bổ sung ít nước nóng nếu nồi quá cạn.
6. Kiểm tra và cô sốt | Kiểm tra phần dày nhất của thịt gà đạt ít nhất 74°C bằng nhiệt kế. Mở nắp, tăng lửa vừa 2–3 phút cho nước sốt bám thịt rồi nếm điều chỉnh.
7. Hoàn thành | Tắt bếp, gắp ra đĩa và rưới nước kho. Dùng nóng; gừng sợi có thể ăn kèm hoặc gạt sang một bên tùy khẩu vị.',image_url='assets/photos/recipe-02.jpg',prep_time_minutes=45,servings=3 WHERE title='Gà kho gừng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cá basa kho tiêu','Cá basa kho thấm vị, thơm tiêu; kho nhẹ để cá giữ nguyên miếng.','1. Sơ chế cá | Bỏ phần ruột, màng đen và vảy còn sót; làm sạch rồi thấm khô từng khúc. Băm hành tím, tỏi; thái hành lá và giữ cá lạnh trong lúc chuẩn bị.
2. Ướp | Xếp cá vào bát, thêm nước mắm, nửa đường, nửa tiêu và hành tỏi băm. Đảo nhẹ hoặc rưới gia vị lên hai mặt, ướp 15 phút trong ngăn mát.
3. Tạo màu | Làm nóng dầu và nửa đường còn lại trên lửa nhỏ. Khi đường chuyển nâu vàng, thêm nhẹ 30 ml nước, khuấy để nước màu tan đều.
4. Xếp cá | Đặt từng khúc cá vào nồi nước màu, thêm toàn bộ nước ướp. Đun lửa vừa 2 phút rồi thêm 150 ml nước còn lại, tránh đổ mạnh làm vỡ cá.
5. Kho nhẹ | Đun sôi, hạ lửa nhỏ và đậy hé nắp. Kho 15–20 phút, dùng thìa rưới nước lên mặt cá; hạn chế trở và không đảo bằng đũa.
6. Kiểm tra chín | Cá chín khi thịt trắng đục, tách thớ dễ; nếu dùng nhiệt kế, tâm phần dày đạt 63°C. Mở nắp nấu thêm vài phút để nước kho sánh, nếm lại gia vị.
7. Hoàn thành | Rắc tiêu còn lại và hành lá, tắt bếp. Dùng xẻng gắp nguyên khúc cá ra đĩa, chan nước kho và ăn cùng cơm.','assets/photos/recipe-03.jpg',45,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cá basa kho tiêu');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cá basa kho thấm vị, thơm tiêu; kho nhẹ để cá giữ nguyên miếng.',instructions='1. Sơ chế cá | Bỏ phần ruột, màng đen và vảy còn sót; làm sạch rồi thấm khô từng khúc. Băm hành tím, tỏi; thái hành lá và giữ cá lạnh trong lúc chuẩn bị.
2. Ướp | Xếp cá vào bát, thêm nước mắm, nửa đường, nửa tiêu và hành tỏi băm. Đảo nhẹ hoặc rưới gia vị lên hai mặt, ướp 15 phút trong ngăn mát.
3. Tạo màu | Làm nóng dầu và nửa đường còn lại trên lửa nhỏ. Khi đường chuyển nâu vàng, thêm nhẹ 30 ml nước, khuấy để nước màu tan đều.
4. Xếp cá | Đặt từng khúc cá vào nồi nước màu, thêm toàn bộ nước ướp. Đun lửa vừa 2 phút rồi thêm 150 ml nước còn lại, tránh đổ mạnh làm vỡ cá.
5. Kho nhẹ | Đun sôi, hạ lửa nhỏ và đậy hé nắp. Kho 15–20 phút, dùng thìa rưới nước lên mặt cá; hạn chế trở và không đảo bằng đũa.
6. Kiểm tra chín | Cá chín khi thịt trắng đục, tách thớ dễ; nếu dùng nhiệt kế, tâm phần dày đạt 63°C. Mở nắp nấu thêm vài phút để nước kho sánh, nếm lại gia vị.
7. Hoàn thành | Rắc tiêu còn lại và hành lá, tắt bếp. Dùng xẻng gắp nguyên khúc cá ra đĩa, chan nước kho và ăn cùng cơm.',image_url='assets/photos/recipe-03.jpg',prep_time_minutes=45,servings=3 WHERE title='Cá basa kho tiêu';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Tôm rim mặn ngọt','Tôm rim bóng nhẹ, vị mặn ngọt cân bằng; có hướng dẫn làm sạch và canh độ sánh của sốt.','1. Làm sạch tôm | Bóc đầu, vỏ và rút chỉ lưng; có thể giữ đuôi để món đẹp hơn. Rửa nhanh, thấm thật ráo; băm tỏi, hành tím và thái hành lá.
2. Pha sốt | Khuấy nước mắm, đường, nước và tiêu trong bát nhỏ đến khi đường gần tan. Nếm phần sốt trước khi tiếp xúc với tôm sống.
3. Phi thơm | Làm nóng dầu trên lửa vừa, cho hành tím và tỏi vào đảo 20–30 giây. Khi thơm và mới ngả vàng, cho tôm vào ngay.
4. Xào tôm | Tăng lửa vừa lớn, đảo tôm 2–3 phút đến khi hai mặt chuyển màu hồng. Dàn tôm đều để không chỉ chín lớp phía dưới.
5. Rim sốt | Rót sốt vào, hạ lửa vừa và đảo 3–4 phút đến khi sốt bám bóng quanh tôm. Thịt tôm cần trắng đục hoàn toàn; nếu sốt cạn quá sớm, thêm 1 muỗng nước.
6. Dọn món | Rắc hành lá, đảo vài giây rồi tắt bếp. Gắp ra đĩa và dùng ngay để tôm không tiếp tục co lại trong chảo nóng.','assets/photos/recipe-04.jpg',25,2 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Tôm rim mặn ngọt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Tôm rim bóng nhẹ, vị mặn ngọt cân bằng; có hướng dẫn làm sạch và canh độ sánh của sốt.',instructions='1. Làm sạch tôm | Bóc đầu, vỏ và rút chỉ lưng; có thể giữ đuôi để món đẹp hơn. Rửa nhanh, thấm thật ráo; băm tỏi, hành tím và thái hành lá.
2. Pha sốt | Khuấy nước mắm, đường, nước và tiêu trong bát nhỏ đến khi đường gần tan. Nếm phần sốt trước khi tiếp xúc với tôm sống.
3. Phi thơm | Làm nóng dầu trên lửa vừa, cho hành tím và tỏi vào đảo 20–30 giây. Khi thơm và mới ngả vàng, cho tôm vào ngay.
4. Xào tôm | Tăng lửa vừa lớn, đảo tôm 2–3 phút đến khi hai mặt chuyển màu hồng. Dàn tôm đều để không chỉ chín lớp phía dưới.
5. Rim sốt | Rót sốt vào, hạ lửa vừa và đảo 3–4 phút đến khi sốt bám bóng quanh tôm. Thịt tôm cần trắng đục hoàn toàn; nếu sốt cạn quá sớm, thêm 1 muỗng nước.
6. Dọn món | Rắc hành lá, đảo vài giây rồi tắt bếp. Gắp ra đĩa và dùng ngay để tôm không tiếp tục co lại trong chảo nóng.',image_url='assets/photos/recipe-04.jpg',prep_time_minutes=25,servings=2 WHERE title='Tôm rim mặn ngọt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bò xào hành tây','Thịt bò thái mỏng xào nhanh với hành tây còn giòn; chia hai lượt để thịt không bị dai.','1. Cắt nguyên liệu | Thấm khô thịt bò, thái ngang thớ thành lát 2 mm. Bóc hành tây, cắt múi rồi tách lớp; băm tỏi và cắt hành lá đoạn 3 cm.
2. Ướp bò | Trộn bò với nước tương, tiêu và 0,5 muỗng canh dầu. Ướp 10 phút trong ngăn mát; để riêng dầu hào dùng lúc xào.
3. Xào bò trước | Làm nóng chảo với 0,5 muỗng canh dầu trên lửa vừa lớn. Cho nửa tỏi rồi bò vào, dàn một lớp và đảo 2–3 phút đến khi các lát chín; chuyển ra đĩa sạch.
4. Xào hành tây | Cho dầu và tỏi còn lại vào chảo. Thêm hành tây, đảo 2–3 phút đến khi mép hành trong nhưng phần giữa vẫn giòn.
5. Trộn sốt | Thêm dầu hào, cho bò và nước thịt đã chín trở lại. Đảo 30–60 giây để sốt phủ đều, không nấu kéo dài.
6. Hoàn thành | Thêm hành lá, nếm rồi tắt bếp. Dọn ra đĩa ngay; nếu chảo nhỏ, xào bò hai mẻ để thịt không bị luộc trong nước tiết ra.','assets/photos/recipe-05.jpg',25,2 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bò xào hành tây');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Thịt bò thái mỏng xào nhanh với hành tây còn giòn; chia hai lượt để thịt không bị dai.',instructions='1. Cắt nguyên liệu | Thấm khô thịt bò, thái ngang thớ thành lát 2 mm. Bóc hành tây, cắt múi rồi tách lớp; băm tỏi và cắt hành lá đoạn 3 cm.
2. Ướp bò | Trộn bò với nước tương, tiêu và 0,5 muỗng canh dầu. Ướp 10 phút trong ngăn mát; để riêng dầu hào dùng lúc xào.
3. Xào bò trước | Làm nóng chảo với 0,5 muỗng canh dầu trên lửa vừa lớn. Cho nửa tỏi rồi bò vào, dàn một lớp và đảo 2–3 phút đến khi các lát chín; chuyển ra đĩa sạch.
4. Xào hành tây | Cho dầu và tỏi còn lại vào chảo. Thêm hành tây, đảo 2–3 phút đến khi mép hành trong nhưng phần giữa vẫn giòn.
5. Trộn sốt | Thêm dầu hào, cho bò và nước thịt đã chín trở lại. Đảo 30–60 giây để sốt phủ đều, không nấu kéo dài.
6. Hoàn thành | Thêm hành lá, nếm rồi tắt bếp. Dọn ra đĩa ngay; nếu chảo nhỏ, xào bò hai mẻ để thịt không bị luộc trong nước tiết ra.',image_url='assets/photos/recipe-05.jpg',prep_time_minutes=25,servings=2 WHERE title='Bò xào hành tây';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sườn xào chua ngọt','Sườn mềm phủ sốt chua ngọt với cà chua và ớt chuông; nấu mềm trước khi cô sốt.','1. Sơ chế | Làm sạch vụn xương ở sườn rồi để ráo. Rửa cà chua, cắt nhỏ; cắt ớt chuông và hành tây thành miếng vừa ăn, băm tỏi.
2. Nấu sườn mềm | Cho sườn với 400 ml nước vào nồi, đun sôi và hớt bọt. Hạ lửa, đậy hé nắp nấu 20–25 phút; sườn cần chín và bắt đầu mềm rồi mới vớt ra để ráo.
3. Pha sốt | Khuấy nước mắm, đường, giấm, tiêu và 100 ml nước. Để riêng bát sốt; nếu muốn vị chua nhẹ, dùng bớt giấm rồi bổ sung sau.
4. Áp chảo sườn | Làm nóng 1 muỗng canh dầu, chiên sườn trên lửa vừa 4–5 phút, trở đến khi các cạnh vàng. Chuyển ra đĩa, không chiên quá khô.
5. Nấu cà chua | Cho dầu còn lại và tỏi vào, phi thơm 20 giây. Thêm cà chua, đảo 3–4 phút; dùng xẻng dằm cho cà chua mềm thành sốt.
6. Om trong sốt | Cho sườn và bát sốt vào, đun sôi rồi hạ lửa vừa nhỏ. Om 8–10 phút, đảo nhẹ vài lần để sốt bám đều.
7. Thêm rau và dọn | Cho hành tây, ớt chuông vào, nấu thêm 3–4 phút. Khi sốt sánh vừa và rau còn giòn, nếm lại chua ngọt, tắt bếp và dùng nóng.','assets/photos/recipe-06.jpg',55,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sườn xào chua ngọt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Sườn mềm phủ sốt chua ngọt với cà chua và ớt chuông; nấu mềm trước khi cô sốt.',instructions='1. Sơ chế | Làm sạch vụn xương ở sườn rồi để ráo. Rửa cà chua, cắt nhỏ; cắt ớt chuông và hành tây thành miếng vừa ăn, băm tỏi.
2. Nấu sườn mềm | Cho sườn với 400 ml nước vào nồi, đun sôi và hớt bọt. Hạ lửa, đậy hé nắp nấu 20–25 phút; sườn cần chín và bắt đầu mềm rồi mới vớt ra để ráo.
3. Pha sốt | Khuấy nước mắm, đường, giấm, tiêu và 100 ml nước. Để riêng bát sốt; nếu muốn vị chua nhẹ, dùng bớt giấm rồi bổ sung sau.
4. Áp chảo sườn | Làm nóng 1 muỗng canh dầu, chiên sườn trên lửa vừa 4–5 phút, trở đến khi các cạnh vàng. Chuyển ra đĩa, không chiên quá khô.
5. Nấu cà chua | Cho dầu còn lại và tỏi vào, phi thơm 20 giây. Thêm cà chua, đảo 3–4 phút; dùng xẻng dằm cho cà chua mềm thành sốt.
6. Om trong sốt | Cho sườn và bát sốt vào, đun sôi rồi hạ lửa vừa nhỏ. Om 8–10 phút, đảo nhẹ vài lần để sốt bám đều.
7. Thêm rau và dọn | Cho hành tây, ớt chuông vào, nấu thêm 3–4 phút. Khi sốt sánh vừa và rau còn giòn, nếm lại chua ngọt, tắt bếp và dùng nóng.',image_url='assets/photos/recipe-06.jpg',prep_time_minutes=55,servings=3 WHERE title='Sườn xào chua ngọt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh bí đỏ thịt băm','Canh bí đỏ mềm ngọt với thịt băm; lượng nước và gia vị phù hợp cho ba bát canh.','1. Cắt bí | Gọt vỏ bí, bỏ hạt và phần xơ; rửa rồi cắt miếng 2 cm. Băm hành tím, thái hành lá.
2. Ướp thịt | Trộn thịt với 1 muỗng cà phê nước mắm và tiêu, dằm tơi rồi để 5 phút.
3. Xào thịt | Làm nóng dầu, phi hành tím trên lửa vừa 30 giây. Cho thịt vào đảo 2–3 phút, tách nhỏ các cục thịt.
4. Nấu canh | Thêm 1 lít nước và bí, đun sôi rồi hớt bọt. Hạ lửa vừa nhỏ, nấu 12–15 phút, không đảo mạnh làm bí vỡ.
5. Kiểm tra độ chín | Xiên đũa qua miếng bí: bí mềm nhưng vẫn giữ hình. Thịt băm phải chín hoàn toàn, tâm đạt khoảng 71°C nếu đo bằng nhiệt kế.
6. Nêm và dùng | Thêm phần nước mắm còn lại, muối và hành lá. Khuấy nhẹ, nếm rồi tắt bếp; múc ra bát và dùng nóng.','assets/photos/recipe-07.jpg',30,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh bí đỏ thịt băm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh bí đỏ mềm ngọt với thịt băm; lượng nước và gia vị phù hợp cho ba bát canh.',instructions='1. Cắt bí | Gọt vỏ bí, bỏ hạt và phần xơ; rửa rồi cắt miếng 2 cm. Băm hành tím, thái hành lá.
2. Ướp thịt | Trộn thịt với 1 muỗng cà phê nước mắm và tiêu, dằm tơi rồi để 5 phút.
3. Xào thịt | Làm nóng dầu, phi hành tím trên lửa vừa 30 giây. Cho thịt vào đảo 2–3 phút, tách nhỏ các cục thịt.
4. Nấu canh | Thêm 1 lít nước và bí, đun sôi rồi hớt bọt. Hạ lửa vừa nhỏ, nấu 12–15 phút, không đảo mạnh làm bí vỡ.
5. Kiểm tra độ chín | Xiên đũa qua miếng bí: bí mềm nhưng vẫn giữ hình. Thịt băm phải chín hoàn toàn, tâm đạt khoảng 71°C nếu đo bằng nhiệt kế.
6. Nêm và dùng | Thêm phần nước mắm còn lại, muối và hành lá. Khuấy nhẹ, nếm rồi tắt bếp; múc ra bát và dùng nóng.',image_url='assets/photos/recipe-07.jpg',prep_time_minutes=30,servings=3 WHERE title='Canh bí đỏ thịt băm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh chua cá','Canh chua cá với dứa, cà chua, đậu bắp và giá; vị chua dịu, đủ rau cho bốn người.','1. Chuẩn bị rau cá | Làm sạch cá, để riêng. Rửa dứa, cà chua, đậu bắp, giá và rau ngổ; cắt dứa miếng mỏng, cà chua múi, đậu bắp lát chéo 2 cm.
2. Lấy nước me | Dầm me trong 100 ml nước nóng khoảng 5 phút. Lọc qua rây để lấy nước chua, bỏ hạt và xơ; băm tỏi.
3. Xào nền canh | Phi tỏi trong dầu trên lửa vừa 30 giây. Cho một nửa cà chua và dứa vào, đảo 2 phút để dậy mùi.
4. Nấu cá | Thêm 1200 ml nước, đun sôi rồi thả cá nhẹ nhàng. Hạ lửa vừa, hớt bọt và nấu 8–12 phút tùy khúc; cá chín có thịt đục, tách thớ, tâm đạt 63°C nếu đo.
5. Nêm vị chua | Thêm nước me từng phần, nước mắm, đường và muối. Khuấy nhẹ vùng không có cá, nếm để cân bằng chua, mặn, ngọt.
6. Cho rau | Thêm cà chua còn lại và đậu bắp, nấu 3 phút. Cho giá vào, nấu thêm 1 phút; không đảo mạnh quanh cá.
7. Hoàn thành | Tắt bếp, rắc rau ngổ rồi múc ra tô. Gắp cá bằng xẻng để giữ nguyên khúc, dùng nóng cùng cơm.','assets/photos/recipe-08.jpg',40,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh chua cá');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh chua cá với dứa, cà chua, đậu bắp và giá; vị chua dịu, đủ rau cho bốn người.',instructions='1. Chuẩn bị rau cá | Làm sạch cá, để riêng. Rửa dứa, cà chua, đậu bắp, giá và rau ngổ; cắt dứa miếng mỏng, cà chua múi, đậu bắp lát chéo 2 cm.
2. Lấy nước me | Dầm me trong 100 ml nước nóng khoảng 5 phút. Lọc qua rây để lấy nước chua, bỏ hạt và xơ; băm tỏi.
3. Xào nền canh | Phi tỏi trong dầu trên lửa vừa 30 giây. Cho một nửa cà chua và dứa vào, đảo 2 phút để dậy mùi.
4. Nấu cá | Thêm 1200 ml nước, đun sôi rồi thả cá nhẹ nhàng. Hạ lửa vừa, hớt bọt và nấu 8–12 phút tùy khúc; cá chín có thịt đục, tách thớ, tâm đạt 63°C nếu đo.
5. Nêm vị chua | Thêm nước me từng phần, nước mắm, đường và muối. Khuấy nhẹ vùng không có cá, nếm để cân bằng chua, mặn, ngọt.
6. Cho rau | Thêm cà chua còn lại và đậu bắp, nấu 3 phút. Cho giá vào, nấu thêm 1 phút; không đảo mạnh quanh cá.
7. Hoàn thành | Tắt bếp, rắc rau ngổ rồi múc ra tô. Gắp cá bằng xẻng để giữ nguyên khúc, dùng nóng cùng cơm.',image_url='assets/photos/recipe-08.jpg',prep_time_minutes=40,servings=4 WHERE title='Canh chua cá';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh cải đậu hũ','Canh cải xanh với đậu hũ, gừng và nấm; nhẹ vị, phù hợp bữa ăn chay.','1. Sơ chế rau | Cắt bỏ gốc cải, rửa từng lá rồi cắt đoạn 4 cm; để cọng riêng vì lâu chín hơn. Nấm cắt gốc, rửa nhanh và thái đôi.
2. Cắt đậu | Để đậu ráo nước, cắt miếng 2 cm bằng dao sạch. Thái gừng mỏng, đặt đậu riêng để không vỡ khi trộn nguyên liệu.
3. Nấu nước canh | Đun 800 ml nước với gừng, dầu ăn và muối. Khi sôi, cho nấm vào, hạ lửa vừa và nấu 3 phút.
4. Nấu cọng và đậu | Cho cọng cải vào nấu 2 phút rồi nhẹ nhàng thêm đậu. Để canh sôi lăn tăn thêm 2 phút, không khuấy mạnh.
5. Cho lá cải | Thêm lá cải, nhấn nhẹ cho ngập nước và nấu 1–2 phút đến khi lá mềm. Thêm nước tương, nếm nước canh rồi điều chỉnh lượng muối nếu cần.
6. Dọn món | Tắt bếp khi cải còn xanh và đậu nóng xuyên tâm. Múc ra bát bằng vá lớn, dùng nóng.','assets/photos/recipe-09.jpg',20,2 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh cải đậu hũ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh cải xanh với đậu hũ, gừng và nấm; nhẹ vị, phù hợp bữa ăn chay.',instructions='1. Sơ chế rau | Cắt bỏ gốc cải, rửa từng lá rồi cắt đoạn 4 cm; để cọng riêng vì lâu chín hơn. Nấm cắt gốc, rửa nhanh và thái đôi.
2. Cắt đậu | Để đậu ráo nước, cắt miếng 2 cm bằng dao sạch. Thái gừng mỏng, đặt đậu riêng để không vỡ khi trộn nguyên liệu.
3. Nấu nước canh | Đun 800 ml nước với gừng, dầu ăn và muối. Khi sôi, cho nấm vào, hạ lửa vừa và nấu 3 phút.
4. Nấu cọng và đậu | Cho cọng cải vào nấu 2 phút rồi nhẹ nhàng thêm đậu. Để canh sôi lăn tăn thêm 2 phút, không khuấy mạnh.
5. Cho lá cải | Thêm lá cải, nhấn nhẹ cho ngập nước và nấu 1–2 phút đến khi lá mềm. Thêm nước tương, nếm nước canh rồi điều chỉnh lượng muối nếu cần.
6. Dọn món | Tắt bếp khi cải còn xanh và đậu nóng xuyên tâm. Múc ra bát bằng vá lớn, dùng nóng.',image_url='assets/photos/recipe-09.jpg',prep_time_minutes=20,servings=2 WHERE title='Canh cải đậu hũ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh nấm rau củ','Canh nấm với cà rốt, bắp và đậu hũ; nấu rau cứng trước để nước ngọt và rau chín đều.','1. Chuẩn bị rau | Gọt cà rốt, rửa rồi cắt miếng 1 cm. Bắp bỏ vỏ và râu, cắt khoanh; nấm cắt gốc, rửa nhanh, bổ đôi nếu lớn.
2. Chuẩn bị đậu | Cắt đậu hũ miếng 2 cm, để ráo. Hành lá rửa rồi thái nhỏ; giữ riêng để cho cuối cùng.
3. Nấu bắp | Cho bắp, nước và muối vào nồi, đun sôi. Hạ lửa vừa nhỏ, nấu 8–10 phút để bắp tiết vị ngọt.
4. Nấu cà rốt | Thêm cà rốt, nấu 5–7 phút đến khi xiên đũa qua được nhưng miếng còn chắc.
5. Thêm nấm và đậu | Cho nấm vào nấu 3 phút, sau đó thêm đậu và dầu ăn. Nấu nhẹ 2–3 phút cho đậu nóng đều.
6. Nêm và dùng | Thêm nước tương, nếm nước canh rồi rắc hành. Tắt bếp, múc cả rau, nấm, đậu và nước ra bát.','assets/photos/recipe-10.jpg',30,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh nấm rau củ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh nấm với cà rốt, bắp và đậu hũ; nấu rau cứng trước để nước ngọt và rau chín đều.',instructions='1. Chuẩn bị rau | Gọt cà rốt, rửa rồi cắt miếng 1 cm. Bắp bỏ vỏ và râu, cắt khoanh; nấm cắt gốc, rửa nhanh, bổ đôi nếu lớn.
2. Chuẩn bị đậu | Cắt đậu hũ miếng 2 cm, để ráo. Hành lá rửa rồi thái nhỏ; giữ riêng để cho cuối cùng.
3. Nấu bắp | Cho bắp, nước và muối vào nồi, đun sôi. Hạ lửa vừa nhỏ, nấu 8–10 phút để bắp tiết vị ngọt.
4. Nấu cà rốt | Thêm cà rốt, nấu 5–7 phút đến khi xiên đũa qua được nhưng miếng còn chắc.
5. Thêm nấm và đậu | Cho nấm vào nấu 3 phút, sau đó thêm đậu và dầu ăn. Nấu nhẹ 2–3 phút cho đậu nóng đều.
6. Nêm và dùng | Thêm nước tương, nếm nước canh rồi rắc hành. Tắt bếp, múc cả rau, nấm, đậu và nước ra bát.',image_url='assets/photos/recipe-10.jpg',prep_time_minutes=30,servings=3 WHERE title='Canh nấm rau củ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Rau muống xào tỏi','Rau muống xào xanh, giòn với tỏi; có bước chần và xào nhanh bằng chảo nóng.','1. Nhặt rau | Bỏ gốc già và lá hỏng, cắt đoạn 6–8 cm. Rửa rau 2–3 lần, để ráo; bóc tỏi, chia phần đập dập và băm.
2. Đun nước chần | Đun 1200 ml nước với muối đến sôi mạnh. Chuẩn bị rổ và một bát nước mát sạch bên cạnh.
3. Chần nhanh | Cho cọng rau vào trước 20 giây, sau đó thêm lá và chần khoảng 30 giây. Giữ lại 2 muỗng nước chần rồi vớt rau sang nước mát, để thật ráo.
4. Phi tỏi | Làm nóng chảo với dầu trên lửa vừa lớn. Cho tỏi đập dập vào trước, tiếp đến tỏi băm; đảo 20–30 giây đến khi thơm.
5. Xào rau | Cho rau đã ráo vào, đảo nhanh khoảng 1 phút. Thêm nước tương và nước chần đã giữ, xào thêm 30–60 giây đến khi rau nóng đều và cọng vừa mềm.
6. Hoàn thành | Nếm một cọng rau rồi tắt bếp, gắp ra đĩa ngay. Không để rau nằm lâu trong chảo nóng vì dễ mềm và sẫm màu.','assets/photos/recipe-11.jpg',20,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Rau muống xào tỏi');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Rau muống xào xanh, giòn với tỏi; có bước chần và xào nhanh bằng chảo nóng.',instructions='1. Nhặt rau | Bỏ gốc già và lá hỏng, cắt đoạn 6–8 cm. Rửa rau 2–3 lần, để ráo; bóc tỏi, chia phần đập dập và băm.
2. Đun nước chần | Đun 1200 ml nước với muối đến sôi mạnh. Chuẩn bị rổ và một bát nước mát sạch bên cạnh.
3. Chần nhanh | Cho cọng rau vào trước 20 giây, sau đó thêm lá và chần khoảng 30 giây. Giữ lại 2 muỗng nước chần rồi vớt rau sang nước mát, để thật ráo.
4. Phi tỏi | Làm nóng chảo với dầu trên lửa vừa lớn. Cho tỏi đập dập vào trước, tiếp đến tỏi băm; đảo 20–30 giây đến khi thơm.
5. Xào rau | Cho rau đã ráo vào, đảo nhanh khoảng 1 phút. Thêm nước tương và nước chần đã giữ, xào thêm 30–60 giây đến khi rau nóng đều và cọng vừa mềm.
6. Hoàn thành | Nếm một cọng rau rồi tắt bếp, gắp ra đĩa ngay. Không để rau nằm lâu trong chảo nóng vì dễ mềm và sẫm màu.',image_url='assets/photos/recipe-11.jpg',prep_time_minutes=20,servings=2 WHERE title='Rau muống xào tỏi';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Salad dưa chuột cà chua','Salad giòn mát với sốt chanh nhẹ; trộn ngay trước khi ăn để rau không ra nước.','1. Rửa rau | Rửa dưa chuột, cà chua và từng lá xà lách dưới nước sạch. Để ráo kỹ hoặc thấm nhẹ bằng giấy bếp trước khi cắt.
2. Cắt nguyên liệu | Cắt dưa chuột lát 5 mm, cà chua miếng vừa ăn, xé xà lách. Hành tây thái mỏng, ngâm nước mát 5 phút rồi vớt để ráo.
3. Pha sốt | Khuấy nước cốt chanh, đường, muối và tiêu cho tan. Thêm dầu ô liu, đánh bằng nĩa 20–30 giây để sốt hòa đều.
4. Trộn nhẹ | Cho rau vào bát lớn, rưới trước hai phần ba sốt. Dùng hai thìa đảo từ dưới lên vài lượt để rau phủ sốt mà không bị dập.
5. Nếm và dùng | Nếm một miếng dưa chuột, thêm sốt còn lại nếu cần. Dọn ra đĩa và dùng ngay sau khi trộn.','assets/photos/recipe-12.jpg',15,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Salad dưa chuột cà chua');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Salad giòn mát với sốt chanh nhẹ; trộn ngay trước khi ăn để rau không ra nước.',instructions='1. Rửa rau | Rửa dưa chuột, cà chua và từng lá xà lách dưới nước sạch. Để ráo kỹ hoặc thấm nhẹ bằng giấy bếp trước khi cắt.
2. Cắt nguyên liệu | Cắt dưa chuột lát 5 mm, cà chua miếng vừa ăn, xé xà lách. Hành tây thái mỏng, ngâm nước mát 5 phút rồi vớt để ráo.
3. Pha sốt | Khuấy nước cốt chanh, đường, muối và tiêu cho tan. Thêm dầu ô liu, đánh bằng nĩa 20–30 giây để sốt hòa đều.
4. Trộn nhẹ | Cho rau vào bát lớn, rưới trước hai phần ba sốt. Dùng hai thìa đảo từ dưới lên vài lượt để rau phủ sốt mà không bị dập.
5. Nếm và dùng | Nếm một miếng dưa chuột, thêm sốt còn lại nếu cần. Dọn ra đĩa và dùng ngay sau khi trộn.',image_url='assets/photos/recipe-12.jpg',prep_time_minutes=15,servings=2 WHERE title='Salad dưa chuột cà chua';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bông cải xào nấm','Bông cải và nấm xào với nước tương, còn giòn và sốt bám nhẹ; món rau cho hai người.','1. Sơ chế | Rửa từng bông cải, cắt miếng đều. Nấm bỏ gốc, rửa nhanh và bổ đôi; băm tỏi.
2. Chần bông cải | Đun 1 lít nước với muối. Thả bông cải vào nước sôi, chần 1–2 phút đến xanh sáng; giữ lại 3 muỗng nước, vớt bông cải ra để ráo.
3. Pha sốt | Khuấy nước tương, đường, tiêu và phần nước chần đã giữ. Để sốt cạnh bếp.
4. Xào nấm | Phi tỏi trong dầu trên lửa vừa lớn 20 giây. Cho nấm vào, đảo 3–4 phút đến khi nấm mềm và bớt nước.
5. Trộn bông cải | Thêm bông cải và sốt, đảo 1–2 phút để nóng đều. Nếu chảo cạn, thêm từng muỗng nước; không đổ nhiều một lúc.
6. Dọn món | Nếm lại, tắt bếp khi cuống bông cải vừa mềm mà còn giòn. Dọn ngay ra đĩa để tránh hơi nóng làm rau tiếp tục chín.','assets/photos/recipe-13.jpg',25,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bông cải xào nấm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Bông cải và nấm xào với nước tương, còn giòn và sốt bám nhẹ; món rau cho hai người.',instructions='1. Sơ chế | Rửa từng bông cải, cắt miếng đều. Nấm bỏ gốc, rửa nhanh và bổ đôi; băm tỏi.
2. Chần bông cải | Đun 1 lít nước với muối. Thả bông cải vào nước sôi, chần 1–2 phút đến xanh sáng; giữ lại 3 muỗng nước, vớt bông cải ra để ráo.
3. Pha sốt | Khuấy nước tương, đường, tiêu và phần nước chần đã giữ. Để sốt cạnh bếp.
4. Xào nấm | Phi tỏi trong dầu trên lửa vừa lớn 20 giây. Cho nấm vào, đảo 3–4 phút đến khi nấm mềm và bớt nước.
5. Trộn bông cải | Thêm bông cải và sốt, đảo 1–2 phút để nóng đều. Nếu chảo cạn, thêm từng muỗng nước; không đổ nhiều một lúc.
6. Dọn món | Nếm lại, tắt bếp khi cuống bông cải vừa mềm mà còn giòn. Dọn ngay ra đĩa để tránh hơi nóng làm rau tiếp tục chín.',image_url='assets/photos/recipe-13.jpg',prep_time_minutes=25,servings=2 WHERE title='Bông cải xào nấm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Đậu hũ sốt cà chua','Đậu hũ vàng nhẹ trong sốt cà chua đậm vị; nêm nước tương để dùng cho bữa chay.','1. Chuẩn bị đậu | Để đậu ráo rồi thấm bề mặt bằng giấy bếp. Cắt miếng 3 cm; rửa cà chua, thái nhỏ, băm hành tím và thái hành lá.
2. Áp chảo đậu | Làm nóng 1,5 muỗng canh dầu trên lửa vừa. Xếp đậu một lớp, áp chảo 2–3 phút mỗi mặt đến vàng nhẹ rồi gắp ra.
3. Xào cà chua | Cho phần dầu còn lại và hành tím vào chảo, phi thơm. Thêm cà chua, muối, đảo 4–5 phút và dằm nhẹ để cà chua mềm.
4. Pha sốt | Thêm 120 ml nước, nước tương, đường và tiêu. Đun sôi nhẹ, khuấy đều rồi nếm sốt trước khi cho đậu.
5. Om đậu | Xếp đậu vào sốt, hạ lửa vừa nhỏ và nấu 5–7 phút. Lật từng miếng một lần hoặc rưới sốt lên mặt đậu, không đảo mạnh.
6. Hoàn thành | Khi sốt hơi sánh và bám quanh đậu, thêm hành lá rồi tắt bếp. Dùng với cơm nóng, chan sốt lên đậu lúc dọn.','assets/photos/recipe-14.jpg',30,2 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Đậu hũ sốt cà chua');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Đậu hũ vàng nhẹ trong sốt cà chua đậm vị; nêm nước tương để dùng cho bữa chay.',instructions='1. Chuẩn bị đậu | Để đậu ráo rồi thấm bề mặt bằng giấy bếp. Cắt miếng 3 cm; rửa cà chua, thái nhỏ, băm hành tím và thái hành lá.
2. Áp chảo đậu | Làm nóng 1,5 muỗng canh dầu trên lửa vừa. Xếp đậu một lớp, áp chảo 2–3 phút mỗi mặt đến vàng nhẹ rồi gắp ra.
3. Xào cà chua | Cho phần dầu còn lại và hành tím vào chảo, phi thơm. Thêm cà chua, muối, đảo 4–5 phút và dằm nhẹ để cà chua mềm.
4. Pha sốt | Thêm 120 ml nước, nước tương, đường và tiêu. Đun sôi nhẹ, khuấy đều rồi nếm sốt trước khi cho đậu.
5. Om đậu | Xếp đậu vào sốt, hạ lửa vừa nhỏ và nấu 5–7 phút. Lật từng miếng một lần hoặc rưới sốt lên mặt đậu, không đảo mạnh.
6. Hoàn thành | Khi sốt hơi sánh và bám quanh đậu, thêm hành lá rồi tắt bếp. Dùng với cơm nóng, chan sốt lên đậu lúc dọn.',image_url='assets/photos/recipe-14.jpg',prep_time_minutes=30,servings=2 WHERE title='Đậu hũ sốt cà chua';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Nấm kho tiêu','Nấm kho nước tương thơm tiêu, mềm mọng và có nước kho để ăn với cơm.','1. Sơ chế nấm | Cắt bỏ gốc cứng, rửa nấm nhanh rồi để ráo. Nấm lớn bổ đôi, nấm nhỏ giữ nguyên; băm hành, tỏi và thái hành lá.
2. Pha nước kho | Khuấy nước tương, đường, 150 ml nước và một nửa tiêu. Để riêng bát sốt.
3. Phi thơm | Làm nóng dầu trên lửa vừa, cho hành và tỏi vào đảo 30 giây. Không đợi tỏi chuyển nâu đậm.
4. Xào nấm | Cho nấm vào, đảo 3–4 phút để nấm săn và tiết bớt nước. Dàn nấm đều trong nồi hoặc chảo sâu.
5. Kho nhỏ lửa | Rót nước kho, đun sôi rồi hạ lửa nhỏ. Kho 10–12 phút, thỉnh thoảng đảo nhẹ; nấm cần mềm toàn bộ và ngấm màu sốt.
6. Cô sốt | Mở nắp, đun thêm 2–3 phút đến khi nước còn khoảng một phần ba. Nếm sốt; nếu quá đậm, thêm 1–2 muỗng nước nóng.
7. Dọn món | Rắc tiêu còn lại và hành lá, tắt bếp. Múc ra bát nhỏ, dùng nóng cùng cơm và rau luộc.','assets/photos/recipe-15.jpg',30,2 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Nấm kho tiêu');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Nấm kho nước tương thơm tiêu, mềm mọng và có nước kho để ăn với cơm.',instructions='1. Sơ chế nấm | Cắt bỏ gốc cứng, rửa nấm nhanh rồi để ráo. Nấm lớn bổ đôi, nấm nhỏ giữ nguyên; băm hành, tỏi và thái hành lá.
2. Pha nước kho | Khuấy nước tương, đường, 150 ml nước và một nửa tiêu. Để riêng bát sốt.
3. Phi thơm | Làm nóng dầu trên lửa vừa, cho hành và tỏi vào đảo 30 giây. Không đợi tỏi chuyển nâu đậm.
4. Xào nấm | Cho nấm vào, đảo 3–4 phút để nấm săn và tiết bớt nước. Dàn nấm đều trong nồi hoặc chảo sâu.
5. Kho nhỏ lửa | Rót nước kho, đun sôi rồi hạ lửa nhỏ. Kho 10–12 phút, thỉnh thoảng đảo nhẹ; nấm cần mềm toàn bộ và ngấm màu sốt.
6. Cô sốt | Mở nắp, đun thêm 2–3 phút đến khi nước còn khoảng một phần ba. Nếm sốt; nếu quá đậm, thêm 1–2 muỗng nước nóng.
7. Dọn món | Rắc tiêu còn lại và hành lá, tắt bếp. Múc ra bát nhỏ, dùng nóng cùng cơm và rau luộc.',image_url='assets/photos/recipe-15.jpg',prep_time_minutes=30,servings=2 WHERE title='Nấm kho tiêu';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cà tím áp chảo sốt tương','Cà tím mềm béo tự nhiên với sốt tương gừng; áp chảo rồi om ngắn để chín đều.','1. Cắt cà | Rửa cà tím, bỏ cuống, cắt lát chéo dày khoảng 1,5 cm. Băm tỏi, gừng và thái hành lá; chế biến cà ngay sau khi cắt.
2. Pha sốt | Khuấy nước tương, đường và 100 ml nước. Giữ riêng mè rang để rắc lúc dọn.
3. Làm nóng chảo | Cho dầu vào chảo chống dính, đun lửa vừa. Xếp cà một lớp; nếu không đủ chỗ, áp chảo hai mẻ.
4. Áp chảo | Nấu mỗi mặt 2–3 phút đến khi có vệt vàng và mặt cà hơi mềm. Gạt cà sang một bên, cho tỏi, gừng vào phần dầu còn trong chảo, đảo thơm 20 giây.
5. Om sốt | Rót sốt, đảo nhẹ rồi đậy nắp và om lửa vừa nhỏ 4–5 phút. Kiểm tra thịt cà mềm xuyên tâm, không còn phần trắng cứng.
6. Cô và dọn | Mở nắp, đun 1 phút cho sốt bám cà. Rắc hành lá, mè, tắt bếp và dùng nóng.','assets/photos/recipe-16.jpg',25,2 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cà tím áp chảo sốt tương');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Cà tím mềm béo tự nhiên với sốt tương gừng; áp chảo rồi om ngắn để chín đều.',instructions='1. Cắt cà | Rửa cà tím, bỏ cuống, cắt lát chéo dày khoảng 1,5 cm. Băm tỏi, gừng và thái hành lá; chế biến cà ngay sau khi cắt.
2. Pha sốt | Khuấy nước tương, đường và 100 ml nước. Giữ riêng mè rang để rắc lúc dọn.
3. Làm nóng chảo | Cho dầu vào chảo chống dính, đun lửa vừa. Xếp cà một lớp; nếu không đủ chỗ, áp chảo hai mẻ.
4. Áp chảo | Nấu mỗi mặt 2–3 phút đến khi có vệt vàng và mặt cà hơi mềm. Gạt cà sang một bên, cho tỏi, gừng vào phần dầu còn trong chảo, đảo thơm 20 giây.
5. Om sốt | Rót sốt, đảo nhẹ rồi đậy nắp và om lửa vừa nhỏ 4–5 phút. Kiểm tra thịt cà mềm xuyên tâm, không còn phần trắng cứng.
6. Cô và dọn | Mở nắp, đun 1 phút cho sốt bám cà. Rắc hành lá, mè, tắt bếp và dùng nóng.',image_url='assets/photos/recipe-16.jpg',prep_time_minutes=25,servings=2 WHERE title='Cà tím áp chảo sốt tương';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm chiên rau củ','Cơm chiên chay với cà rốt, bắp và đậu Hà Lan; hướng dẫn giữ hạt cơm tơi.','1. Chuẩn bị | Bóp tơi cơm nguội đã giữ lạnh. Gọt cà rốt, thái hạt lựu 5 mm; rửa, để ráo bắp và đậu Hà Lan, băm tỏi, thái hành.
2. Làm nóng chảo | Dùng chảo rộng, làm nóng dầu trên lửa vừa lớn. Phi tỏi và đầu hành 20–30 giây đến thơm.
3. Xào rau củ | Cho cà rốt vào trước, đảo 2 phút. Thêm bắp và đậu Hà Lan, đảo 3–4 phút đến khi hạt rau chín và bớt nước.
4. Cho cơm | Cho cơm vào, dùng xẻng tách các phần còn vón. Đảo từ đáy lên khoảng 4 phút để tất cả hạt cơm nóng đều.
5. Nêm | Rưới nước tương quanh thành chảo, thêm muối và tiêu. Chiên thêm 1–2 phút đến khi hạt cơm khô, tơi và không còn chỗ lạnh.
6. Dọn | Trộn hành lá rồi tắt bếp. Chia ra hai đĩa, dùng nóng; không ép chặt cơm trong đĩa để giữ cảm giác tơi.','assets/photos/recipe-17.jpg',25,2 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm chiên rau củ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Cơm chiên chay với cà rốt, bắp và đậu Hà Lan; hướng dẫn giữ hạt cơm tơi.',instructions='1. Chuẩn bị | Bóp tơi cơm nguội đã giữ lạnh. Gọt cà rốt, thái hạt lựu 5 mm; rửa, để ráo bắp và đậu Hà Lan, băm tỏi, thái hành.
2. Làm nóng chảo | Dùng chảo rộng, làm nóng dầu trên lửa vừa lớn. Phi tỏi và đầu hành 20–30 giây đến thơm.
3. Xào rau củ | Cho cà rốt vào trước, đảo 2 phút. Thêm bắp và đậu Hà Lan, đảo 3–4 phút đến khi hạt rau chín và bớt nước.
4. Cho cơm | Cho cơm vào, dùng xẻng tách các phần còn vón. Đảo từ đáy lên khoảng 4 phút để tất cả hạt cơm nóng đều.
5. Nêm | Rưới nước tương quanh thành chảo, thêm muối và tiêu. Chiên thêm 1–2 phút đến khi hạt cơm khô, tơi và không còn chỗ lạnh.
6. Dọn | Trộn hành lá rồi tắt bếp. Chia ra hai đĩa, dùng nóng; không ép chặt cơm trong đĩa để giữ cảm giác tơi.',image_url='assets/photos/recipe-17.jpg',prep_time_minutes=25,servings=2 WHERE title='Cơm chiên rau củ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm gà áp chảo','Cơm với đùi gà áp chảo, dưa chuột và cà chua; có tỷ lệ ướp và kiểm tra nhiệt độ tâm gà.','1. Chuẩn bị | Thấm khô gà, rạch nhẹ phần thịt quá dày để miếng có độ dày đều khoảng 2 cm. Băm tỏi; rửa dưa chuột, cà chua và thái lát trên thớt sạch riêng.
2. Ướp gà | Trộn nước tương, mật ong, tiêu và tỏi rồi thoa lên gà. Ướp 15 phút trong ngăn mát; giữ cả phần nước ướp để nấu chín cùng gà.
3. Áp chảo mặt đầu | Làm nóng dầu trên lửa vừa, đặt mặt da xuống trước. Nấu 5–6 phút đến vàng, không di chuyển miếng gà liên tục.
4. Nấu mặt còn lại | Lật gà, thêm nước và toàn bộ nước ướp. Đậy nắp, hạ lửa vừa nhỏ và nấu 6–8 phút; kiểm tra nước không cạn cháy.
5. Kiểm tra chín | Đo phần thịt dày nhất đạt ít nhất 74°C. Nếu chưa đạt, nấu tiếp và kiểm tra lại; mở nắp 1–2 phút cho nước sốt sánh.
6. Nghỉ và cắt | Chuyển gà ra đĩa sạch, để nghỉ khoảng 3 phút rồi cắt miếng bằng dao sạch. Phần sốt phải được đun sôi trong chảo trước khi rưới.
7. Dọn phần ăn | Chia cơm nóng ra hai đĩa, thêm gà, dưa chuột và cà chua. Rưới một ít sốt lên gà và dùng ngay.','assets/photos/recipe-18.jpg',45,2 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm gà áp chảo');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Cơm với đùi gà áp chảo, dưa chuột và cà chua; có tỷ lệ ướp và kiểm tra nhiệt độ tâm gà.',instructions='1. Chuẩn bị | Thấm khô gà, rạch nhẹ phần thịt quá dày để miếng có độ dày đều khoảng 2 cm. Băm tỏi; rửa dưa chuột, cà chua và thái lát trên thớt sạch riêng.
2. Ướp gà | Trộn nước tương, mật ong, tiêu và tỏi rồi thoa lên gà. Ướp 15 phút trong ngăn mát; giữ cả phần nước ướp để nấu chín cùng gà.
3. Áp chảo mặt đầu | Làm nóng dầu trên lửa vừa, đặt mặt da xuống trước. Nấu 5–6 phút đến vàng, không di chuyển miếng gà liên tục.
4. Nấu mặt còn lại | Lật gà, thêm nước và toàn bộ nước ướp. Đậy nắp, hạ lửa vừa nhỏ và nấu 6–8 phút; kiểm tra nước không cạn cháy.
5. Kiểm tra chín | Đo phần thịt dày nhất đạt ít nhất 74°C. Nếu chưa đạt, nấu tiếp và kiểm tra lại; mở nắp 1–2 phút cho nước sốt sánh.
6. Nghỉ và cắt | Chuyển gà ra đĩa sạch, để nghỉ khoảng 3 phút rồi cắt miếng bằng dao sạch. Phần sốt phải được đun sôi trong chảo trước khi rưới.
7. Dọn phần ăn | Chia cơm nóng ra hai đĩa, thêm gà, dưa chuột và cà chua. Rưới một ít sốt lên gà và dùng ngay.',image_url='assets/photos/recipe-18.jpg',prep_time_minutes=45,servings=2 WHERE title='Cơm gà áp chảo';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cháo gà cà rốt','Cháo gạo nở mềm với gà xé và cà rốt, có hướng dẫn nấu nước dùng và điều chỉnh độ đặc.','1. Chuẩn bị | Vo gạo hai lần, để ráo. Gọt cà rốt, cắt hạt lựu 5 mm; gừng thái lát, hành tím đập dập, hành lá thái nhỏ.
2. Nấu gà | Cho gà, gừng, hành tím và nước vào nồi. Đun sôi, hớt bọt rồi hạ lửa nhỏ nấu 15–20 phút; kiểm tra gà đạt 74°C ở phần dày nhất.
3. Lấy thịt | Vớt gà ra đĩa sạch, bỏ gừng và hành nếu muốn nước cháo trong. Khi gà bớt nóng, xé nhỏ bằng dụng cụ sạch.
4. Nấu gạo | Cho gạo vào nồi nước dùng đang sôi nhẹ. Nấu lửa nhỏ 25–30 phút, khuấy sát đáy mỗi 5 phút để không bén nồi.
5. Thêm cà rốt | Khi hạt gạo đã nở, thêm cà rốt và muối. Nấu 8–10 phút đến khi cà rốt mềm và cháo sánh; thêm nước nóng từng ít nếu quá đặc.
6. Cho gà và nêm | Cho gà xé trở lại, thêm nước mắm rồi nấu 2–3 phút để thịt nóng đều. Nếm phần nước cháo trước khi tắt bếp.
7. Dọn | Múc ra bát, rắc hành và tiêu. Để bớt nóng trước khi ăn; cháo đặc thêm khi nguội nên giữ hơi loãng lúc tắt bếp.','assets/photos/recipe-19.jpg',80,3 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cháo gà cà rốt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Cháo gạo nở mềm với gà xé và cà rốt, có hướng dẫn nấu nước dùng và điều chỉnh độ đặc.',instructions='1. Chuẩn bị | Vo gạo hai lần, để ráo. Gọt cà rốt, cắt hạt lựu 5 mm; gừng thái lát, hành tím đập dập, hành lá thái nhỏ.
2. Nấu gà | Cho gà, gừng, hành tím và nước vào nồi. Đun sôi, hớt bọt rồi hạ lửa nhỏ nấu 15–20 phút; kiểm tra gà đạt 74°C ở phần dày nhất.
3. Lấy thịt | Vớt gà ra đĩa sạch, bỏ gừng và hành nếu muốn nước cháo trong. Khi gà bớt nóng, xé nhỏ bằng dụng cụ sạch.
4. Nấu gạo | Cho gạo vào nồi nước dùng đang sôi nhẹ. Nấu lửa nhỏ 25–30 phút, khuấy sát đáy mỗi 5 phút để không bén nồi.
5. Thêm cà rốt | Khi hạt gạo đã nở, thêm cà rốt và muối. Nấu 8–10 phút đến khi cà rốt mềm và cháo sánh; thêm nước nóng từng ít nếu quá đặc.
6. Cho gà và nêm | Cho gà xé trở lại, thêm nước mắm rồi nấu 2–3 phút để thịt nóng đều. Nếm phần nước cháo trước khi tắt bếp.
7. Dọn | Múc ra bát, rắc hành và tiêu. Để bớt nóng trước khi ăn; cháo đặc thêm khi nguội nên giữ hơi loãng lúc tắt bếp.',image_url='assets/photos/recipe-19.jpg',prep_time_minutes=80,servings=3 WHERE title='Cháo gà cà rốt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh mì trứng','Một ổ bánh mì kẹp trứng chín, rau và dưa chuột; chuẩn bị nhanh cho bữa sáng.','1. Chuẩn bị rau | Rửa dưa chuột và xà lách dưới nước sạch, để ráo. Thái dưa chuột lát mỏng, xé xà lách vừa miệng.
2. Làm ấm bánh | Rạch bánh mì dọc một bên nhưng không cắt rời. Làm ấm trên chảo khô lửa nhỏ 1–2 phút mỗi mặt hoặc theo dụng cụ đang có.
3. Đánh trứng | Đập trứng vào bát, thêm muối và tiêu, đánh đều 30 giây. Làm nóng chảo chống dính với dầu trên lửa vừa nhỏ.
4. Chiên | Đổ trứng vào, dàn vừa kích thước bánh. Chiên khoảng 2 phút, gập hoặc lật rồi chiên 1–2 phút nữa đến khi trứng đông hoàn toàn, không còn phần lỏng.
5. Kẹp bánh | Phết tương cà vào trong bánh, xếp xà lách, dưa chuột rồi thêm trứng. Ép nhẹ để nhân ổn định, không nhồi quá chặt.
6. Dùng | Ăn ngay khi bánh còn ấm. Nếu chuẩn bị rau trước, giữ rau ráo và chỉ kẹp vào bánh lúc ăn để bánh không bị ỉu.','assets/photos/recipe-20.jpg',15,1 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh mì trứng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Một ổ bánh mì kẹp trứng chín, rau và dưa chuột; chuẩn bị nhanh cho bữa sáng.',instructions='1. Chuẩn bị rau | Rửa dưa chuột và xà lách dưới nước sạch, để ráo. Thái dưa chuột lát mỏng, xé xà lách vừa miệng.
2. Làm ấm bánh | Rạch bánh mì dọc một bên nhưng không cắt rời. Làm ấm trên chảo khô lửa nhỏ 1–2 phút mỗi mặt hoặc theo dụng cụ đang có.
3. Đánh trứng | Đập trứng vào bát, thêm muối và tiêu, đánh đều 30 giây. Làm nóng chảo chống dính với dầu trên lửa vừa nhỏ.
4. Chiên | Đổ trứng vào, dàn vừa kích thước bánh. Chiên khoảng 2 phút, gập hoặc lật rồi chiên 1–2 phút nữa đến khi trứng đông hoàn toàn, không còn phần lỏng.
5. Kẹp bánh | Phết tương cà vào trong bánh, xếp xà lách, dưa chuột rồi thêm trứng. Ép nhẹ để nhân ổn định, không nhồi quá chặt.
6. Dùng | Ăn ngay khi bánh còn ấm. Nếu chuẩn bị rau trước, giữ rau ráo và chỉ kẹp vào bánh lúc ăn để bánh không bị ỉu.',image_url='assets/photos/recipe-20.jpg',prep_time_minutes=15,servings=1 WHERE title='Bánh mì trứng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún xào rau củ','Bún gạo khô xào rau củ và đậu hũ; sốt pha sẵn giúp sợi bún thấm đều, ít đứt.','1. Chuẩn bị bún | Ngâm hoặc luộc bún đúng hướng dẫn trên bao bì đến khi sợi mềm nhưng còn đàn hồi. Xả nhanh nếu bao bì yêu cầu, để thật ráo và cắt ngắn sợi quá dài.
2. Sơ chế rau | Cà rốt gọt, thái sợi; cải rửa và cắt đoạn 4 cm, tách cọng. Rửa giá, để ráo; thấm đậu, cắt thanh; băm tỏi.
3. Pha sốt | Khuấy nước tương, đường, nước và tiêu trong bát nhỏ. Đặt cạnh chảo để rót đều lúc xào.
4. Áp chảo đậu | Làm nóng 1 muỗng canh dầu, áp chảo đậu trên lửa vừa 4–5 phút đến vàng hai mặt. Gắp ra đĩa.
5. Xào rau | Cho dầu còn lại và tỏi vào chảo, phi thơm. Thêm cà rốt, cọng cải, đảo 2–3 phút; thêm lá cải và giá, xào thêm 1 phút.
6. Trộn bún | Cho bún, đậu và sốt vào. Dùng hai đũa hoặc kẹp gắp nâng nhẹ từ dưới lên 2–3 phút để sợi nóng đều và thấm sốt, tránh đảo bằng xẻng mạnh.
7. Dọn | Nếm sợi bún, thêm từng muỗng nước nếu còn khô cứng rồi xào thêm ngắn. Tắt bếp, chia ra đĩa và dùng nóng.','assets/photos/recipe-21.jpg',30,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún xào rau củ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Bún gạo khô xào rau củ và đậu hũ; sốt pha sẵn giúp sợi bún thấm đều, ít đứt.',instructions='1. Chuẩn bị bún | Ngâm hoặc luộc bún đúng hướng dẫn trên bao bì đến khi sợi mềm nhưng còn đàn hồi. Xả nhanh nếu bao bì yêu cầu, để thật ráo và cắt ngắn sợi quá dài.
2. Sơ chế rau | Cà rốt gọt, thái sợi; cải rửa và cắt đoạn 4 cm, tách cọng. Rửa giá, để ráo; thấm đậu, cắt thanh; băm tỏi.
3. Pha sốt | Khuấy nước tương, đường, nước và tiêu trong bát nhỏ. Đặt cạnh chảo để rót đều lúc xào.
4. Áp chảo đậu | Làm nóng 1 muỗng canh dầu, áp chảo đậu trên lửa vừa 4–5 phút đến vàng hai mặt. Gắp ra đĩa.
5. Xào rau | Cho dầu còn lại và tỏi vào chảo, phi thơm. Thêm cà rốt, cọng cải, đảo 2–3 phút; thêm lá cải và giá, xào thêm 1 phút.
6. Trộn bún | Cho bún, đậu và sốt vào. Dùng hai đũa hoặc kẹp gắp nâng nhẹ từ dưới lên 2–3 phút để sợi nóng đều và thấm sốt, tránh đảo bằng xẻng mạnh.
7. Dọn | Nếm sợi bún, thêm từng muỗng nước nếu còn khô cứng rồi xào thêm ngắn. Tắt bếp, chia ra đĩa và dùng nóng.',image_url='assets/photos/recipe-21.jpg',prep_time_minutes=30,servings=2 WHERE title='Bún xào rau củ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Mì xào bò','Mì trứng xào bò, cải và cà rốt; xào thịt riêng để sợi mì và rau không bị quá chín.','1. Luộc mì | Đun nước và luộc mì theo bao bì, vớt khi sợi vừa chín còn đàn hồi. Để ráo, trộn với 0,5 muỗng canh dầu để sợi đỡ dính.
2. Sơ chế và ướp | Thái bò ngang thớ, trộn với nửa nước tương và tiêu, ướp 10 phút. Rửa cải, cắt đoạn, tách cọng; cà rốt thái sợi, tỏi băm.
3. Pha sốt | Khuấy nước tương còn lại, dầu hào và 3 muỗng canh nước. Đặt riêng để cho lúc trộn mì.
4. Xào bò | Làm nóng 0,5 muỗng canh dầu trên lửa vừa lớn, phi nửa tỏi rồi xào bò 2–3 phút đến khi lát thịt chín. Chuyển ra đĩa sạch.
5. Xào rau | Cho dầu và tỏi còn lại vào, thêm cà rốt, cọng cải xào 2 phút. Thêm lá cải, đảo 1 phút cho rau vừa mềm.
6. Trộn mì | Cho mì và sốt vào, dùng kẹp hoặc đũa nâng trộn 1–2 phút. Cho bò chín trở lại, đảo thêm 30–60 giây đến khi tất cả nóng đều.
7. Hoàn thành | Nếm, tắt bếp và dọn ngay. Nếu mì khô nhưng chưa mềm, thêm từng muỗng nước và đảo ngắn thay vì thêm nhiều dầu.','assets/photos/recipe-22.jpg',30,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Mì xào bò');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Mì trứng xào bò, cải và cà rốt; xào thịt riêng để sợi mì và rau không bị quá chín.',instructions='1. Luộc mì | Đun nước và luộc mì theo bao bì, vớt khi sợi vừa chín còn đàn hồi. Để ráo, trộn với 0,5 muỗng canh dầu để sợi đỡ dính.
2. Sơ chế và ướp | Thái bò ngang thớ, trộn với nửa nước tương và tiêu, ướp 10 phút. Rửa cải, cắt đoạn, tách cọng; cà rốt thái sợi, tỏi băm.
3. Pha sốt | Khuấy nước tương còn lại, dầu hào và 3 muỗng canh nước. Đặt riêng để cho lúc trộn mì.
4. Xào bò | Làm nóng 0,5 muỗng canh dầu trên lửa vừa lớn, phi nửa tỏi rồi xào bò 2–3 phút đến khi lát thịt chín. Chuyển ra đĩa sạch.
5. Xào rau | Cho dầu và tỏi còn lại vào, thêm cà rốt, cọng cải xào 2 phút. Thêm lá cải, đảo 1 phút cho rau vừa mềm.
6. Trộn mì | Cho mì và sốt vào, dùng kẹp hoặc đũa nâng trộn 1–2 phút. Cho bò chín trở lại, đảo thêm 30–60 giây đến khi tất cả nóng đều.
7. Hoàn thành | Nếm, tắt bếp và dọn ngay. Nếu mì khô nhưng chưa mềm, thêm từng muỗng nước và đảo ngắn thay vì thêm nhiều dầu.',image_url='assets/photos/recipe-22.jpg',prep_time_minutes=30,servings=2 WHERE title='Mì xào bò';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chè đậu xanh','Chè đậu xanh mềm bùi với nước cốt dừa; cho đường sau khi đậu mềm để dễ kiểm soát độ ngọt.','1. Ngâm và rửa | Vo đậu, bỏ hạt hỏng rồi ngâm trong nước sạch khoảng 2 giờ. Đổ bỏ nước ngâm, xả lại và để ráo; thời gian này chưa tính trong 45 phút nấu.
2. Đun đậu | Cho đậu và 900 ml nước vào nồi, đun sôi trên lửa vừa. Hớt bọt để mặt chè sạch.
3. Nấu mềm | Hạ lửa nhỏ, đậy hé nắp và nấu 20–25 phút. Khuấy nhẹ sát đáy vài lần; đậu đạt khi bóp bằng thìa dễ nát và không còn lõi cứng.
4. Thêm đường | Cho 60 g đường vào sau khi đậu mềm, khuấy tan rồi nấu 5 phút. Nếu chè quá đặc, thêm ít nước nóng và khuấy đều.
5. Nấu cốt dừa | Trong nồi nhỏ, trộn nước cốt dừa, 100 ml nước, 10 g đường và muối. Đun lửa nhỏ, khuấy 2–3 phút đến nóng và hơi sôi, không đun trào.
6. Dọn chè | Múc chè ra bốn bát, rưới cốt dừa lên trên. Dùng ấm hoặc để nguội rồi giữ ngăn mát; khuấy lại trước khi chia phần.','assets/photos/recipe-23.jpg',45,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chè đậu xanh');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Chè đậu xanh mềm bùi với nước cốt dừa; cho đường sau khi đậu mềm để dễ kiểm soát độ ngọt.',instructions='1. Ngâm và rửa | Vo đậu, bỏ hạt hỏng rồi ngâm trong nước sạch khoảng 2 giờ. Đổ bỏ nước ngâm, xả lại và để ráo; thời gian này chưa tính trong 45 phút nấu.
2. Đun đậu | Cho đậu và 900 ml nước vào nồi, đun sôi trên lửa vừa. Hớt bọt để mặt chè sạch.
3. Nấu mềm | Hạ lửa nhỏ, đậy hé nắp và nấu 20–25 phút. Khuấy nhẹ sát đáy vài lần; đậu đạt khi bóp bằng thìa dễ nát và không còn lõi cứng.
4. Thêm đường | Cho 60 g đường vào sau khi đậu mềm, khuấy tan rồi nấu 5 phút. Nếu chè quá đặc, thêm ít nước nóng và khuấy đều.
5. Nấu cốt dừa | Trong nồi nhỏ, trộn nước cốt dừa, 100 ml nước, 10 g đường và muối. Đun lửa nhỏ, khuấy 2–3 phút đến nóng và hơi sôi, không đun trào.
6. Dọn chè | Múc chè ra bốn bát, rưới cốt dừa lên trên. Dùng ấm hoặc để nguội rồi giữ ngăn mát; khuấy lại trước khi chia phần.',image_url='assets/photos/recipe-23.jpg',prep_time_minutes=45,servings=4 WHERE title='Chè đậu xanh';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sữa chua trái cây','Hai cốc sữa chua với xoài và chuối cắt vừa miệng; hướng dẫn chọn quả, chia lớp và điều chỉnh độ ngọt.','1. Chuẩn bị dụng cụ | Rửa sạch hai cốc khoảng 250 ml, dao, thớt và thìa; để khô. Lấy sữa chua ra ngay trước lúc làm để giữ mát.
2. Sơ chế xoài | Rửa và lau vỏ xoài trước khi gọt. Cắt hai má quả, bỏ vỏ và hạt rồi cân khoảng 200 g thịt; cắt hạt lựu 1 cm để dễ xúc ăn.
3. Sơ chế chuối | Bóc vỏ chuối, bỏ phần dập nếu có. Cân khoảng 100 g rồi cắt lát dày 5–7 mm; cắt gần lúc dùng để lát chuối không bị thâm nhiều.
4. Trộn nền sữa chua | Cho 200 g sữa chua vào bát sạch, khuấy 5–6 vòng cho mịn. Trộn trước 1 muỗng cà phê mật ong, nếm rồi quyết định có dùng muỗng còn lại hay không.
5. Chia lớp | Cho mỗi cốc một ít sữa chua, thêm một nửa lượng xoài và chuối. Chia phần sữa chua còn lại lên trên, dùng phần trái cây còn lại trang trí; rưới mật ong nếu cần.
6. Hoàn thành | Dùng ngay hoặc đậy cốc và đặt trong ngăn mát đến lúc ăn. Khi dùng, trộn nhẹ từ dưới lên 2–3 lượt, tránh nghiền nát trái cây.','assets/photos/recipe-24.jpg',15,2 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sữa chua trái cây');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Hai cốc sữa chua với xoài và chuối cắt vừa miệng; hướng dẫn chọn quả, chia lớp và điều chỉnh độ ngọt.',instructions='1. Chuẩn bị dụng cụ | Rửa sạch hai cốc khoảng 250 ml, dao, thớt và thìa; để khô. Lấy sữa chua ra ngay trước lúc làm để giữ mát.
2. Sơ chế xoài | Rửa và lau vỏ xoài trước khi gọt. Cắt hai má quả, bỏ vỏ và hạt rồi cân khoảng 200 g thịt; cắt hạt lựu 1 cm để dễ xúc ăn.
3. Sơ chế chuối | Bóc vỏ chuối, bỏ phần dập nếu có. Cân khoảng 100 g rồi cắt lát dày 5–7 mm; cắt gần lúc dùng để lát chuối không bị thâm nhiều.
4. Trộn nền sữa chua | Cho 200 g sữa chua vào bát sạch, khuấy 5–6 vòng cho mịn. Trộn trước 1 muỗng cà phê mật ong, nếm rồi quyết định có dùng muỗng còn lại hay không.
5. Chia lớp | Cho mỗi cốc một ít sữa chua, thêm một nửa lượng xoài và chuối. Chia phần sữa chua còn lại lên trên, dùng phần trái cây còn lại trang trí; rưới mật ong nếu cần.
6. Hoàn thành | Dùng ngay hoặc đậy cốc và đặt trong ngăn mát đến lúc ăn. Khi dùng, trộn nhẹ từ dưới lên 2–3 lượt, tránh nghiền nát trái cây.',image_url='assets/photos/recipe-24.jpg',prep_time_minutes=15,servings=2 WHERE title='Sữa chua trái cây';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chuối áp chảo mật ong','Chuối áp chảo vàng thơm với bơ, mật ong và mè rang; chọn chuối chín vừa để giữ hình.','1. Chuẩn bị chuối | Chọn chuối chín vàng nhưng còn chắc, bóc vỏ và bổ đôi theo chiều dọc. Không dùng chuối quá nhũn vì khó lật.
2. Làm nóng bơ | Đặt chảo chống dính trên lửa nhỏ vừa, cho bơ vào. Chờ bơ tan và nổi bọt nhẹ, chưa chuyển nâu đậm.
3. Áp chảo mặt cắt | Xếp chuối mặt cắt xuống, để yên khoảng 2 phút đến vàng. Dùng xẻng mỏng nhấc thử một đầu, không chọc bằng đũa.
4. Lật nhẹ | Lật từng nửa quả, áp chảo mặt còn lại 1–2 phút đến khi chuối mềm và nóng đều. Giữ lửa nhỏ nếu bơ có dấu hiệu sẫm.
5. Thêm mật ong | Tắt bếp rồi rưới mật ong lên chuối, nghiêng chảo hoặc dùng thìa rưới phần bơ lên mặt. Không đun mật ong kéo dài trên lửa lớn.
6. Dọn | Chuyển chuối ra hai đĩa, rắc mè rang và dùng ấm. Chờ bớt nóng một chút trước khi ăn vì phần sốt đường giữ nhiệt.','assets/photos/recipe-25.jpg',15,2 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chuối áp chảo mật ong');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Chuối áp chảo vàng thơm với bơ, mật ong và mè rang; chọn chuối chín vừa để giữ hình.',instructions='1. Chuẩn bị chuối | Chọn chuối chín vàng nhưng còn chắc, bóc vỏ và bổ đôi theo chiều dọc. Không dùng chuối quá nhũn vì khó lật.
2. Làm nóng bơ | Đặt chảo chống dính trên lửa nhỏ vừa, cho bơ vào. Chờ bơ tan và nổi bọt nhẹ, chưa chuyển nâu đậm.
3. Áp chảo mặt cắt | Xếp chuối mặt cắt xuống, để yên khoảng 2 phút đến vàng. Dùng xẻng mỏng nhấc thử một đầu, không chọc bằng đũa.
4. Lật nhẹ | Lật từng nửa quả, áp chảo mặt còn lại 1–2 phút đến khi chuối mềm và nóng đều. Giữ lửa nhỏ nếu bơ có dấu hiệu sẫm.
5. Thêm mật ong | Tắt bếp rồi rưới mật ong lên chuối, nghiêng chảo hoặc dùng thìa rưới phần bơ lên mặt. Không đun mật ong kéo dài trên lửa lớn.
6. Dọn | Chuyển chuối ra hai đĩa, rắc mè rang và dùng ấm. Chờ bớt nóng một chút trước khi ăn vì phần sốt đường giữ nhiệt.',image_url='assets/photos/recipe-25.jpg',prep_time_minutes=15,servings=2 WHERE title='Chuối áp chảo mật ong';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sinh tố xoài','Sinh tố xoài sánh mịn từ xoài chín, sữa tươi và sữa chua; lượng cho hai cốc.','1. Chuẩn bị máy | Rửa sạch cối xay, nắp và hai cốc rồi để ráo. Kiểm tra máy có thể xay đá; nếu không, bỏ đá và dùng nguyên liệu đã làm lạnh.
2. Cắt xoài | Rửa vỏ xoài, gọt vỏ, bỏ hạt và cắt thịt thành miếng 2 cm. Cân khoảng 400 g, bỏ phần xơ cứng để sinh tố mịn.
3. Cho nguyên liệu | Rót sữa tươi vào cối trước, thêm sữa chua rồi xoài. Cho đá sau cùng nếu máy hỗ trợ, đậy nắp chắc.
4. Xay | Xay tốc độ thấp 10 giây rồi tăng vừa hoặc cao 30–45 giây đến mịn. Nếu cần vét thành cối, tắt máy hoàn toàn trước khi dùng thìa.
5. Điều chỉnh | Kiểm tra độ sánh; nếu quá đặc, thêm từng ít sữa tươi rồi xay ngắn. Xoài chín đã ngọt, nên nếm sinh tố trước khi điều chỉnh thêm.
6. Dùng | Chia ra hai cốc và uống ngay khi lạnh. Không cho dụng cụ vào cối khi lưỡi dao đang quay.','assets/photos/recipe-26.jpg',15,2 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sinh tố xoài');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Đồ uống'),description='Sinh tố xoài sánh mịn từ xoài chín, sữa tươi và sữa chua; lượng cho hai cốc.',instructions='1. Chuẩn bị máy | Rửa sạch cối xay, nắp và hai cốc rồi để ráo. Kiểm tra máy có thể xay đá; nếu không, bỏ đá và dùng nguyên liệu đã làm lạnh.
2. Cắt xoài | Rửa vỏ xoài, gọt vỏ, bỏ hạt và cắt thịt thành miếng 2 cm. Cân khoảng 400 g, bỏ phần xơ cứng để sinh tố mịn.
3. Cho nguyên liệu | Rót sữa tươi vào cối trước, thêm sữa chua rồi xoài. Cho đá sau cùng nếu máy hỗ trợ, đậy nắp chắc.
4. Xay | Xay tốc độ thấp 10 giây rồi tăng vừa hoặc cao 30–45 giây đến mịn. Nếu cần vét thành cối, tắt máy hoàn toàn trước khi dùng thìa.
5. Điều chỉnh | Kiểm tra độ sánh; nếu quá đặc, thêm từng ít sữa tươi rồi xay ngắn. Xoài chín đã ngọt, nên nếm sinh tố trước khi điều chỉnh thêm.
6. Dùng | Chia ra hai cốc và uống ngay khi lạnh. Không cho dụng cụ vào cối khi lưỡi dao đang quay.',image_url='assets/photos/recipe-26.jpg',prep_time_minutes=15,servings=2 WHERE title='Sinh tố xoài';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Trà chanh mật ong','Trà chanh mát, thơm mật ong; pha trà riêng rồi thêm chanh để dễ điều chỉnh vị.','1. Chuẩn bị | Rửa cốc và chanh. Vắt riêng nước cốt, lọc hạt rồi đo 2 muỗng canh; thái nửa quả chanh còn lại thành lát mỏng.
2. Hãm trà | Đun 400 ml nước đến nhiệt độ phù hợp ghi trên hộp trà. Cho túi trà vào, hãm theo bao bì, thường khoảng 3–5 phút; không ngâm quá lâu nếu không muốn vị chát.
3. Lấy túi trà | Nhấc túi trà ra, không ép quá mạnh. Để trà bớt nóng khoảng 5 phút trong bình sạch.
4. Pha vị ngọt chua | Khuấy mật ong vào trà đến tan. Thêm trước 1,5 muỗng canh nước chanh, nếm rồi cho phần còn lại nếu thích chua hơn.
5. Chia cốc | Chia đá vào hai cốc, rót trà và thêm lát chanh. Khuấy vài vòng để trà lạnh đều.
6. Dùng | Uống ngay; nếu chuẩn bị trước, giữ phần trà pha trong ngăn mát và chỉ thêm đá lúc uống để không bị nhạt.','assets/photos/recipe-27.jpg',20,2 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Trà chanh mật ong');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Đồ uống'),description='Trà chanh mát, thơm mật ong; pha trà riêng rồi thêm chanh để dễ điều chỉnh vị.',instructions='1. Chuẩn bị | Rửa cốc và chanh. Vắt riêng nước cốt, lọc hạt rồi đo 2 muỗng canh; thái nửa quả chanh còn lại thành lát mỏng.
2. Hãm trà | Đun 400 ml nước đến nhiệt độ phù hợp ghi trên hộp trà. Cho túi trà vào, hãm theo bao bì, thường khoảng 3–5 phút; không ngâm quá lâu nếu không muốn vị chát.
3. Lấy túi trà | Nhấc túi trà ra, không ép quá mạnh. Để trà bớt nóng khoảng 5 phút trong bình sạch.
4. Pha vị ngọt chua | Khuấy mật ong vào trà đến tan. Thêm trước 1,5 muỗng canh nước chanh, nếm rồi cho phần còn lại nếu thích chua hơn.
5. Chia cốc | Chia đá vào hai cốc, rót trà và thêm lát chanh. Khuấy vài vòng để trà lạnh đều.
6. Dùng | Uống ngay; nếu chuẩn bị trước, giữ phần trà pha trong ngăn mát và chỉ thêm đá lúc uống để không bị nhạt.',image_url='assets/photos/recipe-27.jpg',prep_time_minutes=20,servings=2 WHERE title='Trà chanh mật ong';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gà xào sả ớt','Gà xào thơm sả với ớt chuông, vị cay có thể điều chỉnh; món mặn cho bữa cơm gia đình.','1. Sơ chế | Thấm khô gà, thái miếng dày khoảng 1 cm. Sả bỏ bẹ già, băm phần gốc non; băm hành tỏi, thái ớt, cắt ớt chuông miếng 2 cm.
2. Ướp gà | Trộn gà với nước mắm, đường, tiêu và một nửa sả. Ướp 10 phút trong ngăn mát.
3. Phi sả | Làm nóng dầu trên lửa vừa, thêm hành, tỏi và sả còn lại. Đảo 40–60 giây đến thơm và sả mới vàng nhẹ.
4. Xào gà | Cho gà vào, dàn một lớp rồi đảo trên lửa vừa lớn 4–5 phút để mặt ngoài săn. Nếu chảo nhỏ, xào thành hai mẻ.
5. Nấu xuyên tâm | Thêm nước, hạ lửa vừa và nấu 4–6 phút, đảo vài lần. Kiểm tra phần dày của gà đạt 74°C bằng nhiệt kế; nấu thêm nếu chưa đạt.
6. Thêm ớt | Cho ớt chuông và ớt cay vào, đảo 2–3 phút đến khi ớt chuông chín còn giòn. Nếm lại nước sốt, cô thêm ngắn nếu nhiều nước.
7. Dọn | Tắt bếp, chuyển ra đĩa và dùng nóng cùng cơm. Lần đầu nên dùng ít ớt cay, có thể thêm sau theo khẩu vị.','assets/photos/recipe-28.jpg',35,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gà xào sả ớt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Gà xào thơm sả với ớt chuông, vị cay có thể điều chỉnh; món mặn cho bữa cơm gia đình.',instructions='1. Sơ chế | Thấm khô gà, thái miếng dày khoảng 1 cm. Sả bỏ bẹ già, băm phần gốc non; băm hành tỏi, thái ớt, cắt ớt chuông miếng 2 cm.
2. Ướp gà | Trộn gà với nước mắm, đường, tiêu và một nửa sả. Ướp 10 phút trong ngăn mát.
3. Phi sả | Làm nóng dầu trên lửa vừa, thêm hành, tỏi và sả còn lại. Đảo 40–60 giây đến thơm và sả mới vàng nhẹ.
4. Xào gà | Cho gà vào, dàn một lớp rồi đảo trên lửa vừa lớn 4–5 phút để mặt ngoài săn. Nếu chảo nhỏ, xào thành hai mẻ.
5. Nấu xuyên tâm | Thêm nước, hạ lửa vừa và nấu 4–6 phút, đảo vài lần. Kiểm tra phần dày của gà đạt 74°C bằng nhiệt kế; nấu thêm nếu chưa đạt.
6. Thêm ớt | Cho ớt chuông và ớt cay vào, đảo 2–3 phút đến khi ớt chuông chín còn giòn. Nếm lại nước sốt, cô thêm ngắn nếu nhiều nước.
7. Dọn | Tắt bếp, chuyển ra đĩa và dùng nóng cùng cơm. Lần đầu nên dùng ít ớt cay, có thể thêm sau theo khẩu vị.',image_url='assets/photos/recipe-28.jpg',prep_time_minutes=35,servings=3 WHERE title='Gà xào sả ớt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cá hồi áp chảo sốt chanh','Cá hồi áp chảo với sốt bơ chanh và tỏi; có hướng dẫn canh mặt da và kiểm tra độ chín.','1. Chuẩn bị cá | Kiểm tra và nhổ xương nhỏ còn sót bằng nhíp sạch. Thấm thật khô hai mặt cá, rắc muối và tiêu đều; băm tỏi, lọc hạt nước chanh.
2. Làm nóng chảo | Cho dầu vào chảo chống dính trên lửa vừa. Khi dầu nóng, đặt mặt da xuống trước nếu cá có da, ép nhẹ bằng xẻng 10 giây để mặt da phẳng.
3. Áp chảo mặt đầu | Nấu 4–5 phút, không lật liên tục. Nếu da sẫm quá nhanh, hạ lửa; quan sát phần thịt sát chảo chuyển đục dần.
4. Lật và kiểm tra | Lật cá nhẹ, nấu mặt kia 2–4 phút tùy độ dày. Kiểm tra tâm cá đạt 63°C, thịt đục và tách thớ; chuyển cá ra đĩa sạch khi đạt.
5. Nấu sốt | Hạ lửa nhỏ, cho bơ và tỏi vào chảo, đảo 20–30 giây. Thêm nước, khuấy 30 giây rồi tắt bếp và cho nước chanh vào.
6. Dọn | Rưới sốt bơ chanh lên cá, dọn kèm lát chanh. Dùng ngay để cá không nguội và mặt da giữ giòn.','assets/photos/recipe-29.jpg',25,2 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cá hồi áp chảo sốt chanh');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cá hồi áp chảo với sốt bơ chanh và tỏi; có hướng dẫn canh mặt da và kiểm tra độ chín.',instructions='1. Chuẩn bị cá | Kiểm tra và nhổ xương nhỏ còn sót bằng nhíp sạch. Thấm thật khô hai mặt cá, rắc muối và tiêu đều; băm tỏi, lọc hạt nước chanh.
2. Làm nóng chảo | Cho dầu vào chảo chống dính trên lửa vừa. Khi dầu nóng, đặt mặt da xuống trước nếu cá có da, ép nhẹ bằng xẻng 10 giây để mặt da phẳng.
3. Áp chảo mặt đầu | Nấu 4–5 phút, không lật liên tục. Nếu da sẫm quá nhanh, hạ lửa; quan sát phần thịt sát chảo chuyển đục dần.
4. Lật và kiểm tra | Lật cá nhẹ, nấu mặt kia 2–4 phút tùy độ dày. Kiểm tra tâm cá đạt 63°C, thịt đục và tách thớ; chuyển cá ra đĩa sạch khi đạt.
5. Nấu sốt | Hạ lửa nhỏ, cho bơ và tỏi vào chảo, đảo 20–30 giây. Thêm nước, khuấy 30 giây rồi tắt bếp và cho nước chanh vào.
6. Dọn | Rưới sốt bơ chanh lên cá, dọn kèm lát chanh. Dùng ngay để cá không nguội và mặt da giữ giòn.',image_url='assets/photos/recipe-29.jpg',prep_time_minutes=25,servings=2 WHERE title='Cá hồi áp chảo sốt chanh';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh khoai tây cà rốt','Canh khoai tây, cà rốt và thịt băm mềm ngọt; cắt rau đều để nấu chín cùng lúc.','1. Sơ chế rau | Gọt khoai tây và cà rốt, rửa rồi cắt miếng 1,5–2 cm. Khoai đã cắt có thể ngâm nước sạch trong lúc chuẩn bị, sau đó để ráo.
2. Ướp thịt | Băm hành tím, thái hành lá. Trộn thịt với 1 muỗng cà phê nước mắm và tiêu, để 5 phút.
3. Xào thịt | Phi hành trong dầu trên lửa vừa, cho thịt vào đảo 2–3 phút. Tách thịt tơi để không có cục lớn.
4. Nấu rau | Thêm nước, khoai và cà rốt; đun sôi, hớt bọt rồi hạ lửa vừa nhỏ. Nấu 15–18 phút và thỉnh thoảng khuấy nhẹ đáy nồi.
5. Kiểm tra | Xiên đũa qua khoai và cà rốt: miếng rau cần mềm xuyên tâm. Thịt băm chín hoàn toàn, nhiệt độ tâm khoảng 71°C nếu đo.
6. Nêm | Cho nước mắm còn lại, muối, khuấy rồi nếm. Nếu khoai đã mềm, không để nồi sôi mạnh làm vỡ miếng.
7. Dọn | Thêm hành lá, tắt bếp và múc ra bát. Dùng nóng, chia đều rau và thịt cho từng phần.','assets/photos/recipe-30.jpg',35,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh khoai tây cà rốt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh khoai tây, cà rốt và thịt băm mềm ngọt; cắt rau đều để nấu chín cùng lúc.',instructions='1. Sơ chế rau | Gọt khoai tây và cà rốt, rửa rồi cắt miếng 1,5–2 cm. Khoai đã cắt có thể ngâm nước sạch trong lúc chuẩn bị, sau đó để ráo.
2. Ướp thịt | Băm hành tím, thái hành lá. Trộn thịt với 1 muỗng cà phê nước mắm và tiêu, để 5 phút.
3. Xào thịt | Phi hành trong dầu trên lửa vừa, cho thịt vào đảo 2–3 phút. Tách thịt tơi để không có cục lớn.
4. Nấu rau | Thêm nước, khoai và cà rốt; đun sôi, hớt bọt rồi hạ lửa vừa nhỏ. Nấu 15–18 phút và thỉnh thoảng khuấy nhẹ đáy nồi.
5. Kiểm tra | Xiên đũa qua khoai và cà rốt: miếng rau cần mềm xuyên tâm. Thịt băm chín hoàn toàn, nhiệt độ tâm khoảng 71°C nếu đo.
6. Nêm | Cho nước mắm còn lại, muối, khuấy rồi nếm. Nếu khoai đã mềm, không để nồi sôi mạnh làm vỡ miếng.
7. Dọn | Thêm hành lá, tắt bếp và múc ra bát. Dùng nóng, chia đều rau và thịt cho từng phần.',image_url='assets/photos/recipe-30.jpg',prep_time_minutes=35,servings=3 WHERE title='Canh khoai tây cà rốt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh mướp nấu tôm','Canh mướp hương ngọt nhẹ với tôm; cho mướp sau để vừa mềm và không nát.','1. Sơ chế mướp | Gọt lớp vỏ mỏng, rửa rồi cắt lát chéo dày khoảng 1 cm. Băm hành tím và thái hành lá.
2. Làm tôm | Bóc vỏ, rút chỉ, rửa nhanh và thấm ráo. Giữ vài con nguyên để dọn, phần còn lại băm thô; trộn với 1 muỗng cà phê nước mắm và tiêu.
3. Xào tôm | Phi hành tím với dầu trên lửa vừa 30 giây. Cho tôm vào, đảo 1–2 phút đến khi bắt đầu đổi màu.
4. Nấu nước canh | Thêm 1 lít nước, đun sôi và hớt bọt. Hạ lửa vừa, nấu 3–4 phút đến khi tôm trắng đục hoàn toàn.
5. Nấu mướp | Thêm mướp vào nước đang sôi nhẹ, nấu 2–3 phút. Mướp đạt khi vừa mềm, phần ruột chuyển hơi trong nhưng vẫn giữ miếng.
6. Nêm và dọn | Thêm nước mắm còn lại, muối và hành lá, nếm rồi tắt bếp. Múc ngay ra bát để mướp không tiếp tục mềm quá.','assets/photos/recipe-31.jpg',25,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh mướp nấu tôm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh mướp hương ngọt nhẹ với tôm; cho mướp sau để vừa mềm và không nát.',instructions='1. Sơ chế mướp | Gọt lớp vỏ mỏng, rửa rồi cắt lát chéo dày khoảng 1 cm. Băm hành tím và thái hành lá.
2. Làm tôm | Bóc vỏ, rút chỉ, rửa nhanh và thấm ráo. Giữ vài con nguyên để dọn, phần còn lại băm thô; trộn với 1 muỗng cà phê nước mắm và tiêu.
3. Xào tôm | Phi hành tím với dầu trên lửa vừa 30 giây. Cho tôm vào, đảo 1–2 phút đến khi bắt đầu đổi màu.
4. Nấu nước canh | Thêm 1 lít nước, đun sôi và hớt bọt. Hạ lửa vừa, nấu 3–4 phút đến khi tôm trắng đục hoàn toàn.
5. Nấu mướp | Thêm mướp vào nước đang sôi nhẹ, nấu 2–3 phút. Mướp đạt khi vừa mềm, phần ruột chuyển hơi trong nhưng vẫn giữ miếng.
6. Nêm và dọn | Thêm nước mắm còn lại, muối và hành lá, nếm rồi tắt bếp. Múc ngay ra bát để mướp không tiếp tục mềm quá.',image_url='assets/photos/recipe-31.jpg',prep_time_minutes=25,servings=3 WHERE title='Canh mướp nấu tôm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Đậu hũ kho nấm','Đậu hũ kho cùng nấm hương và nước tương; có sốt vừa đủ để chan cơm.','1. Sơ chế | Thấm ráo đậu, cắt miếng 3 cm. Nấm bỏ gốc, rửa nhanh và bổ đôi; băm hành tím, tỏi, thái hành lá.
2. Áp chảo đậu | Làm nóng 1 muỗng canh dầu, xếp đậu một lớp. Áp chảo lửa vừa 2–3 phút mỗi mặt đến vàng nhẹ rồi gắp ra.
3. Pha nước kho | Khuấy nước tương, đường, nước và một nửa tiêu. Để riêng bát nước kho.
4. Xào nấm | Phi hành, tỏi với dầu còn lại. Cho nấm vào xào 3 phút đến hơi mềm và thơm.
5. Kho chung | Xếp đậu trở lại, rót nước kho vào rồi đun sôi. Hạ lửa nhỏ, đậy hé nắp và kho 10–12 phút; lật nhẹ đậu một lần.
6. Cô và nêm | Mở nắp nấu 2–3 phút để sốt sánh nhẹ. Nếm nước kho, nếu đậm thêm một ít nước nóng; không để cạn cháy đáy.
7. Dọn | Rắc tiêu còn lại và hành lá, tắt bếp. Dùng vá múc cả đậu, nấm và sốt ra bát, ăn với cơm nóng.','assets/photos/recipe-32.jpg',35,3 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Đậu hũ kho nấm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Đậu hũ kho cùng nấm hương và nước tương; có sốt vừa đủ để chan cơm.',instructions='1. Sơ chế | Thấm ráo đậu, cắt miếng 3 cm. Nấm bỏ gốc, rửa nhanh và bổ đôi; băm hành tím, tỏi, thái hành lá.
2. Áp chảo đậu | Làm nóng 1 muỗng canh dầu, xếp đậu một lớp. Áp chảo lửa vừa 2–3 phút mỗi mặt đến vàng nhẹ rồi gắp ra.
3. Pha nước kho | Khuấy nước tương, đường, nước và một nửa tiêu. Để riêng bát nước kho.
4. Xào nấm | Phi hành, tỏi với dầu còn lại. Cho nấm vào xào 3 phút đến hơi mềm và thơm.
5. Kho chung | Xếp đậu trở lại, rót nước kho vào rồi đun sôi. Hạ lửa nhỏ, đậy hé nắp và kho 10–12 phút; lật nhẹ đậu một lần.
6. Cô và nêm | Mở nắp nấu 2–3 phút để sốt sánh nhẹ. Nếm nước kho, nếu đậm thêm một ít nước nóng; không để cạn cháy đáy.
7. Dọn | Rắc tiêu còn lại và hành lá, tắt bếp. Dùng vá múc cả đậu, nấm và sốt ra bát, ăn với cơm nóng.',image_url='assets/photos/recipe-32.jpg',prep_time_minutes=35,servings=3 WHERE title='Đậu hũ kho nấm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gỏi cuốn tôm','Tám cuốn tôm, bún và rau tươi với nước chấm chanh; chỉ rõ cách làm mềm bánh và cuốn chắc tay.','1. Chuẩn bị rau | Rửa từng lá xà lách, rau húng và dưa chuột, để ráo kỹ. Cắt dưa chuột thanh mảnh 8 cm, chia bún thành 8 phần.
2. Luộc tôm | Luộc tôm trong nước sôi nhẹ khoảng 3–5 phút tùy cỡ đến khi thịt trắng đục hoàn toàn. Vớt ra, để bớt nóng, bóc vỏ, rút chỉ và bổ dọc con tôm.
3. Pha nước chấm | Khuấy đường với 4 muỗng canh nước cho tan, thêm nước mắm và nước chanh. Nếm cân bằng rồi thêm tỏi và ớt băm; để riêng.
4. Làm mềm bánh | Chuẩn bị một đĩa rộng và bát nước sạch. Làm ướt nhanh hai mặt bánh tráng theo bao bì, đặt lên đĩa và chờ vài giây; bánh sẽ mềm thêm khi cuốn.
5. Xếp nhân | Ở một phần ba dưới bánh, xếp ít xà lách, rau húng, dưa chuột và một phần bún. Xếp các nửa tôm ở phía trên phần nhân, mặt màu hồng hướng xuống bánh.
6. Cuốn | Gập mép dưới phủ nhân, kéo nhẹ cho nhân gọn rồi gập hai mép bên vào. Cuộn tiếp đến hết bánh, giữ lực đều nhưng không kéo rách.
7. Dọn | Làm lần lượt 8 cuốn, xếp cách nhau một chút trên đĩa để không dính. Dùng ngay với nước chấm; giữ rau và tôm lạnh nếu chưa cuốn.','assets/photos/recipe-33.jpg',35,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gỏi cuốn tôm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Tám cuốn tôm, bún và rau tươi với nước chấm chanh; chỉ rõ cách làm mềm bánh và cuốn chắc tay.',instructions='1. Chuẩn bị rau | Rửa từng lá xà lách, rau húng và dưa chuột, để ráo kỹ. Cắt dưa chuột thanh mảnh 8 cm, chia bún thành 8 phần.
2. Luộc tôm | Luộc tôm trong nước sôi nhẹ khoảng 3–5 phút tùy cỡ đến khi thịt trắng đục hoàn toàn. Vớt ra, để bớt nóng, bóc vỏ, rút chỉ và bổ dọc con tôm.
3. Pha nước chấm | Khuấy đường với 4 muỗng canh nước cho tan, thêm nước mắm và nước chanh. Nếm cân bằng rồi thêm tỏi và ớt băm; để riêng.
4. Làm mềm bánh | Chuẩn bị một đĩa rộng và bát nước sạch. Làm ướt nhanh hai mặt bánh tráng theo bao bì, đặt lên đĩa và chờ vài giây; bánh sẽ mềm thêm khi cuốn.
5. Xếp nhân | Ở một phần ba dưới bánh, xếp ít xà lách, rau húng, dưa chuột và một phần bún. Xếp các nửa tôm ở phía trên phần nhân, mặt màu hồng hướng xuống bánh.
6. Cuốn | Gập mép dưới phủ nhân, kéo nhẹ cho nhân gọn rồi gập hai mép bên vào. Cuộn tiếp đến hết bánh, giữ lực đều nhưng không kéo rách.
7. Dọn | Làm lần lượt 8 cuốn, xếp cách nhau một chút trên đĩa để không dính. Dùng ngay với nước chấm; giữ rau và tôm lạnh nếu chưa cuốn.',image_url='assets/photos/recipe-33.jpg',prep_time_minutes=35,servings=2 WHERE title='Gỏi cuốn tôm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún thịt xào','Bún thịt heo xào sả với rau và nước mắm chanh; chia phần thịt, rau và nước chấm rõ ràng.','1. Ướp thịt | Thấm khô thịt, thái lát mỏng. Trộn với sả, 10 g tỏi băm, 0,5 muỗng nước mắm, 0,5 muỗng đường và tiêu; ướp 10 phút trong ngăn mát.
2. Chuẩn bị rau | Rửa, để ráo xà lách và dưa chuột; cắt vừa ăn. Cà rốt gọt, rửa, bào sợi. Chia bún ra hai tô sạch.
3. Pha nước chấm | Khuấy 1 muỗng canh đường trong nước, thêm 1,5 muỗng nước mắm và nước chanh. Cho 5 g tỏi băm còn lại vào, nếm cân bằng chua ngọt.
4. Làm nóng chảo | Cho dầu vào chảo trên lửa vừa lớn. Chia thịt thành hai mẻ nếu chảo nhỏ để thịt tiếp xúc đáy, không chất đống.
5. Xào thịt | Xào 4–6 phút tùy độ dày, đảo đều đến khi các lát chín hoàn toàn, không còn phần sống. Nấu thêm nước ướp trong chảo đến sôi, không dùng nước ướp sống để chan tô.
6. Xếp tô | Cho rau lên bún, thêm thịt chín và đậu phộng. Mỗi tô có một nửa lượng nguyên liệu để phần ăn cân đối.
7. Dùng | Rưới nước chấm từng ít, trộn nhẹ và nếm trước khi thêm. Dùng ngay khi thịt còn nóng và rau còn giòn.','assets/photos/recipe-34.jpg',35,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún thịt xào');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Bún thịt heo xào sả với rau và nước mắm chanh; chia phần thịt, rau và nước chấm rõ ràng.',instructions='1. Ướp thịt | Thấm khô thịt, thái lát mỏng. Trộn với sả, 10 g tỏi băm, 0,5 muỗng nước mắm, 0,5 muỗng đường và tiêu; ướp 10 phút trong ngăn mát.
2. Chuẩn bị rau | Rửa, để ráo xà lách và dưa chuột; cắt vừa ăn. Cà rốt gọt, rửa, bào sợi. Chia bún ra hai tô sạch.
3. Pha nước chấm | Khuấy 1 muỗng canh đường trong nước, thêm 1,5 muỗng nước mắm và nước chanh. Cho 5 g tỏi băm còn lại vào, nếm cân bằng chua ngọt.
4. Làm nóng chảo | Cho dầu vào chảo trên lửa vừa lớn. Chia thịt thành hai mẻ nếu chảo nhỏ để thịt tiếp xúc đáy, không chất đống.
5. Xào thịt | Xào 4–6 phút tùy độ dày, đảo đều đến khi các lát chín hoàn toàn, không còn phần sống. Nấu thêm nước ướp trong chảo đến sôi, không dùng nước ướp sống để chan tô.
6. Xếp tô | Cho rau lên bún, thêm thịt chín và đậu phộng. Mỗi tô có một nửa lượng nguyên liệu để phần ăn cân đối.
7. Dùng | Rưới nước chấm từng ít, trộn nhẹ và nếm trước khi thêm. Dùng ngay khi thịt còn nóng và rau còn giòn.',image_url='assets/photos/recipe-34.jpg',prep_time_minutes=35,servings=2 WHERE title='Bún thịt xào';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Nui xào trứng','Nui xào trứng với cà rốt và đậu Hà Lan; luộc nui vừa chín để không nát khi đảo.','1. Luộc nui | Đun nồi nước lớn, luộc nui theo thời gian trên bao bì đến vừa mềm còn đàn hồi. Vớt để ráo, trộn 0,5 muỗng canh dầu để giảm dính.
2. Sơ chế | Gọt cà rốt, cắt hạt lựu 5 mm; chuẩn bị đậu Hà Lan theo bao bì. Băm tỏi, thái hành; đánh trứng với muối và tiêu.
3. Xào rau | Làm nóng 0,5 muỗng canh dầu trên lửa vừa lớn, phi tỏi. Cho cà rốt xào 2 phút, thêm đậu Hà Lan xào 2–3 phút đến chín.
4. Làm trứng | Gạt rau sang một phía, cho dầu còn lại và trứng vào phía trống. Chờ 15–20 giây rồi đảo thành miếng nhỏ, nấu đến khi trứng đông hoàn toàn.
5. Trộn nui | Cho nui đã ráo vào, rưới nước tương và đảo từ dưới lên khoảng 2 phút để nui nóng đều. Không ép mạnh làm nui vỡ.
6. Nêm và dọn | Thêm hành lá, nếm một miếng nui rồi tắt bếp. Chia hai đĩa, dùng nóng khi nui còn mềm và trứng không bị khô.','assets/photos/recipe-35.jpg',30,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Nui xào trứng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Nui xào trứng với cà rốt và đậu Hà Lan; luộc nui vừa chín để không nát khi đảo.',instructions='1. Luộc nui | Đun nồi nước lớn, luộc nui theo thời gian trên bao bì đến vừa mềm còn đàn hồi. Vớt để ráo, trộn 0,5 muỗng canh dầu để giảm dính.
2. Sơ chế | Gọt cà rốt, cắt hạt lựu 5 mm; chuẩn bị đậu Hà Lan theo bao bì. Băm tỏi, thái hành; đánh trứng với muối và tiêu.
3. Xào rau | Làm nóng 0,5 muỗng canh dầu trên lửa vừa lớn, phi tỏi. Cho cà rốt xào 2 phút, thêm đậu Hà Lan xào 2–3 phút đến chín.
4. Làm trứng | Gạt rau sang một phía, cho dầu còn lại và trứng vào phía trống. Chờ 15–20 giây rồi đảo thành miếng nhỏ, nấu đến khi trứng đông hoàn toàn.
5. Trộn nui | Cho nui đã ráo vào, rưới nước tương và đảo từ dưới lên khoảng 2 phút để nui nóng đều. Không ép mạnh làm nui vỡ.
6. Nêm và dọn | Thêm hành lá, nếm một miếng nui rồi tắt bếp. Chia hai đĩa, dùng nóng khi nui còn mềm và trứng không bị khô.',image_url='assets/photos/recipe-35.jpg',prep_time_minutes=30,servings=2 WHERE title='Nui xào trứng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh pancake chuối','Khoảng sáu bánh pancake chuối nhỏ, mềm thơm; hướng dẫn trộn bột và nhận biết lúc lật bánh.','1. Trộn phần khô | Cho bột mì, bột nở, đường và muối vào bát, dùng phới trộn đều để bột nở phân bố đồng nhất.
2. Trộn phần ướt | Nghiền chuối bằng nĩa đến gần mịn. Thêm trứng, sữa và 0,5 muỗng canh dầu, khuấy cho hòa đều.
3. Hòa bột | Đổ phần ướt vào phần khô, trộn nhẹ khoảng 10–15 lượt vừa đủ hết bột khô. Bột còn vài cục nhỏ là bình thường; để nghỉ 5 phút.
4. Làm nóng chảo | Đặt chảo chống dính trên lửa nhỏ vừa, quét một lớp dầu rất mỏng. Múc khoảng 3 muỗng canh bột cho mỗi bánh, tạo vòng tròn 8–10 cm.
5. Nướng mặt đầu | Nấu 2–3 phút đến khi mặt bánh có nhiều bọt nhỏ và mép bắt đầu se. Nếu mặt dưới sẫm trước lúc có bọt, hạ lửa.
6. Lật và làm chín | Lật nhẹ bằng xẻng, nấu mặt kia 1–2 phút. Bánh đạt khi phần giữa không còn bột ướt; làm lần lượt đến hết bột, không ép bánh bằng xẻng.
7. Dọn | Xếp bánh ra hai đĩa, rưới mật ong sau khi bánh chín. Dùng ấm; chia bánh nhỏ giúp dễ canh chín xuyên tâm hơn bánh dày lớn.','assets/photos/recipe-36.jpg',30,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh pancake chuối');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Khoảng sáu bánh pancake chuối nhỏ, mềm thơm; hướng dẫn trộn bột và nhận biết lúc lật bánh.',instructions='1. Trộn phần khô | Cho bột mì, bột nở, đường và muối vào bát, dùng phới trộn đều để bột nở phân bố đồng nhất.
2. Trộn phần ướt | Nghiền chuối bằng nĩa đến gần mịn. Thêm trứng, sữa và 0,5 muỗng canh dầu, khuấy cho hòa đều.
3. Hòa bột | Đổ phần ướt vào phần khô, trộn nhẹ khoảng 10–15 lượt vừa đủ hết bột khô. Bột còn vài cục nhỏ là bình thường; để nghỉ 5 phút.
4. Làm nóng chảo | Đặt chảo chống dính trên lửa nhỏ vừa, quét một lớp dầu rất mỏng. Múc khoảng 3 muỗng canh bột cho mỗi bánh, tạo vòng tròn 8–10 cm.
5. Nướng mặt đầu | Nấu 2–3 phút đến khi mặt bánh có nhiều bọt nhỏ và mép bắt đầu se. Nếu mặt dưới sẫm trước lúc có bọt, hạ lửa.
6. Lật và làm chín | Lật nhẹ bằng xẻng, nấu mặt kia 1–2 phút. Bánh đạt khi phần giữa không còn bột ướt; làm lần lượt đến hết bột, không ép bánh bằng xẻng.
7. Dọn | Xếp bánh ra hai đĩa, rưới mật ong sau khi bánh chín. Dùng ấm; chia bánh nhỏ giúp dễ canh chín xuyên tâm hơn bánh dày lớn.',image_url='assets/photos/recipe-36.jpg',prep_time_minutes=30,servings=2 WHERE title='Bánh pancake chuối';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chè bắp','Chè bắp ngọt dịu với nước cốt dừa, sánh nhẹ bằng bột năng; có cách pha bột để tránh vón.','1. Chuẩn bị bắp | Bắp bỏ vỏ, râu và rửa sạch. Tách hoặc bào hạt bắp, cân khoảng 300 g; bỏ phần hạt cứng hoặc khô.
2. Nấu bắp | Cho hạt bắp và 900 ml nước vào nồi, đun sôi rồi hạ lửa vừa nhỏ. Nấu 12–15 phút đến khi hạt chín mềm, thỉnh thoảng khuấy sát đáy.
3. Thêm đường | Cho 50 g đường vào, khuấy tan và nấu thêm 2 phút. Nếm một ít nước chè, điều chỉnh theo độ ngọt tự nhiên của bắp.
4. Pha bột | Khuấy 20 g bột năng với 100 ml nước nguội cho tan hoàn toàn. Khuấy lại ngay trước khi rót vì bột lắng xuống đáy.
5. Tạo độ sánh | Rót bột từ từ vào nồi chè đang sôi nhẹ, vừa rót vừa khuấy. Nấu 2–3 phút đến khi nước chè trong, sánh và không còn mùi bột sống; không đổ cả bát một lúc.
6. Nấu cốt dừa | Trong nồi nhỏ, khuấy nước cốt dừa, 10 g đường và muối. Đun lửa nhỏ 2–3 phút đến nóng, hơi sôi rồi tắt.
7. Dọn | Chia chè ra bốn bát, rưới nước cốt dừa. Dùng ấm hoặc để nguội và giữ ngăn mát; chè đặc hơn sau khi nguội.','assets/photos/recipe-37.jpg',35,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chè bắp');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Chè bắp ngọt dịu với nước cốt dừa, sánh nhẹ bằng bột năng; có cách pha bột để tránh vón.',instructions='1. Chuẩn bị bắp | Bắp bỏ vỏ, râu và rửa sạch. Tách hoặc bào hạt bắp, cân khoảng 300 g; bỏ phần hạt cứng hoặc khô.
2. Nấu bắp | Cho hạt bắp và 900 ml nước vào nồi, đun sôi rồi hạ lửa vừa nhỏ. Nấu 12–15 phút đến khi hạt chín mềm, thỉnh thoảng khuấy sát đáy.
3. Thêm đường | Cho 50 g đường vào, khuấy tan và nấu thêm 2 phút. Nếm một ít nước chè, điều chỉnh theo độ ngọt tự nhiên của bắp.
4. Pha bột | Khuấy 20 g bột năng với 100 ml nước nguội cho tan hoàn toàn. Khuấy lại ngay trước khi rót vì bột lắng xuống đáy.
5. Tạo độ sánh | Rót bột từ từ vào nồi chè đang sôi nhẹ, vừa rót vừa khuấy. Nấu 2–3 phút đến khi nước chè trong, sánh và không còn mùi bột sống; không đổ cả bát một lúc.
6. Nấu cốt dừa | Trong nồi nhỏ, khuấy nước cốt dừa, 10 g đường và muối. Đun lửa nhỏ 2–3 phút đến nóng, hơi sôi rồi tắt.
7. Dọn | Chia chè ra bốn bát, rưới nước cốt dừa. Dùng ấm hoặc để nguội và giữ ngăn mát; chè đặc hơn sau khi nguội.',image_url='assets/photos/recipe-37.jpg',prep_time_minutes=35,servings=4 WHERE title='Chè bắp';

DELETE FROM recipe_ingredients WHERE recipe_id IN (SELECT id FROM recipes WHERE title IN ('Trứng chiên hành lá','Canh rau ngót thịt băm','Cơm chiên trứng cà rốt','Thịt kho trứng','Gà kho gừng','Cá basa kho tiêu','Tôm rim mặn ngọt','Bò xào hành tây','Sườn xào chua ngọt','Canh bí đỏ thịt băm','Canh chua cá','Canh cải đậu hũ','Canh nấm rau củ','Rau muống xào tỏi','Salad dưa chuột cà chua','Bông cải xào nấm','Đậu hũ sốt cà chua','Nấm kho tiêu','Cà tím áp chảo sốt tương','Cơm chiên rau củ','Cơm gà áp chảo','Cháo gà cà rốt','Bánh mì trứng','Bún xào rau củ','Mì xào bò','Chè đậu xanh','Sữa chua trái cây','Chuối áp chảo mật ong','Sinh tố xoài','Trà chanh mật ong','Gà xào sả ớt','Cá hồi áp chảo sốt chanh','Canh khoai tây cà rốt','Canh mướp nấu tôm','Đậu hũ kho nấm','Gỏi cuốn tôm','Bún thịt xào','Nui xào trứng','Bánh pancake chuối','Chè bắp'));

DELETE FROM recipe_details WHERE recipe_id IN (SELECT id FROM recipes WHERE title IN ('Trứng chiên hành lá','Canh rau ngót thịt băm','Cơm chiên trứng cà rốt','Thịt kho trứng','Gà kho gừng','Cá basa kho tiêu','Tôm rim mặn ngọt','Bò xào hành tây','Sườn xào chua ngọt','Canh bí đỏ thịt băm','Canh chua cá','Canh cải đậu hũ','Canh nấm rau củ','Rau muống xào tỏi','Salad dưa chuột cà chua','Bông cải xào nấm','Đậu hũ sốt cà chua','Nấm kho tiêu','Cà tím áp chảo sốt tương','Cơm chiên rau củ','Cơm gà áp chảo','Cháo gà cà rốt','Bánh mì trứng','Bún xào rau củ','Mì xào bò','Chè đậu xanh','Sữa chua trái cây','Chuối áp chảo mật ong','Sinh tố xoài','Trà chanh mật ong','Gà xào sả ớt','Cá hồi áp chảo sốt chanh','Canh khoai tây cà rốt','Canh mướp nấu tôm','Đậu hũ kho nấm','Gỏi cuốn tôm','Bún thịt xào','Nui xào trứng','Bánh pancake chuối','Chè bắp'));

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trứng chiên hành lá' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trứng chiên hành lá' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trứng chiên hành lá' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trứng chiên hành lá' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trứng chiên hành lá' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trứng chiên hành lá' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Trứng gà":"Trứng cỡ vừa; đập từng quả vào bát nhỏ để kiểm tra trước khi trộn.","Hành lá":"Khoảng 3 nhánh, dùng cả đầu trắng và lá xanh.","Nước":"Giúp trứng mềm; không thêm quá nhiều."}','Dùng lửa vừa nhỏ sau khi rót trứng để mặt ngoài không cháy trước khi bên trong chín.
Nếu khó lật cả tấm, chia trứng thành hai phần bằng xẻng rồi lật từng phần.','' FROM recipes r WHERE r.title='Trứng chiên hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Rau ngót';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Thịt heo xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rau ngót thịt băm' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Rau ngót":"Khối lượng lá đã nhặt; bỏ cọng già.","Thịt heo xay":"Chọn thịt có một ít mỡ để nước canh ngọt.","Hành tím":"Khoảng 2 củ nhỏ, bóc vỏ và băm."}','Vò nhẹ rau trước khi nấu giúp rau nhanh mềm hơn.
Cho rau vào sau khi thịt đã chín để tránh rau bị thâm và nát.','' FROM recipes r WHERE r.title='Canh rau ngót thịt băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Cơm nguội';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên trứng cà rốt' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cơm nguội":"Cơm đã bảo quản lạnh, bóp tơi trước khi chiên.","Cà rốt":"Khối lượng đã gọt, cắt hạt lựu 5 mm.","Hành lá":"Thái nhỏ, tách đầu trắng và lá xanh.","Tỏi":"Khoảng 2 tép, băm nhỏ."}','Chảo rộng giúp cơm thoát hơi và tơi; nếu chảo nhỏ, chiên thành hai mẻ.
Cơm quá ướt dễ vón; dàn cơm lạnh cho tơi trước khi cho vào chảo.','' FROM recipes r WHERE r.title='Cơm chiên trứng cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Nước dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt ba chỉ":"Cắt miếng 3–4 cm, chọn miếng có nạc và mỡ xen kẽ.","Nước dừa":"Nước dừa tươi hoặc loại không thêm đường.","Nước":"50 ml tạo màu, 50 ml bổ sung lúc kho.","Hành tím":"Khoảng 3 củ, băm.","Tỏi":"Băm nhỏ.","Đường":"1 muỗng để thắng màu, 0,5 muỗng để ướp."}','Thắng đường tới màu nâu nhạt; nếu đường đã đen và đắng, làm lại phần nước màu.
Thời gian kho phụ thuộc miếng thịt; ưu tiên kiểm tra độ mềm thay vì chỉ nhìn đồng hồ.','' FROM recipes r WHERE r.title='Thịt kho trứng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Thịt gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt gà":"Thịt đùi chặt miếng khoảng 4 cm.","Gừng":"20 g thái sợi, 10 g băm để ướp.","Hành tím":"Băm nhỏ."}','Miếng gà có xương thường cần lâu hơn miếng không xương.
Đừng cô nước sốt quá khô: nước mắm có thể làm món mặn hơn khi nước bay hơi.','' FROM recipes r WHERE r.title='Gà kho gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Cá basa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,180,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cá basa":"3–4 khúc dày 2–3 cm, làm sạch và thấm khô.","Đường":"Chia một nửa tạo màu, một nửa ướp."}','Xếp cá một lớp nếu nồi đủ rộng để gia vị thấm đều.
Kho sôi mạnh dễ làm thịt cá nát; giữ nồi sôi lăn tăn.','' FROM recipes r WHERE r.title='Cá basa kho tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Tôm":"Tôm cỡ vừa, khối lượng trước khi bóc vỏ."}','Thấm ráo tôm giúp tôm săn và không ra nhiều nước.
Không rim quá lâu sau khi tôm đã chín vì thịt dễ dai.','' FROM recipes r WHERE r.title='Tôm rim mặn ngọt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Thịt bò';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Dầu hào';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt bò":"Thịt thăn, thái ngang thớ dày khoảng 2 mm.","Hành tây":"Khoảng 1 củ, thái múi 1 cm."}','Thái ngang thớ giúp bò dễ nhai hơn.
Tách lượt xào bò và hành giúp cả hai nguyên liệu giữ đúng độ chín.','' FROM recipes r WHERE r.title='Bò xào hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Sườn heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Ớt chuông';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Giấm gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Sườn heo":"Chặt khúc 4 cm.","Ớt chuông":"Bỏ hạt, cắt miếng 2 cm.","Nước":"400 ml nấu sườn, 100 ml pha sốt."}','Không thay toàn bộ nước sốt bằng nước luộc sườn nếu nước luộc nhiều mỡ.
Sốt sẽ đặc thêm khi nguội; tắt bếp khi vẫn còn một ít nước trong chảo.','' FROM recipes r WHERE r.title='Sườn xào chua ngọt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Bí đỏ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Thịt heo xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bí đỏ":"Khối lượng đã bỏ vỏ, hạt."}','Miếng bí cùng kích thước giúp chín đều.
Không nấu quá lâu sau khi bí mềm, nếu muốn canh trong và còn nguyên miếng.','' FROM recipes r WHERE r.title='Canh bí đỏ thịt băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Cá basa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Dứa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Đậu bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Giá đỗ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Me chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1300,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Rau ngổ';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cá basa":"Cắt khúc 2–3 cm, làm sạch và thấm ráo.","Dứa":"Khối lượng đã gọt, bỏ mắt.","Me chua":"Me vắt không hạt hoặc lọc bỏ hạt sau khi dầm.","Nước":"100 ml ngâm me, 1200 ml nấu canh.","Rau ngổ":"Nhặt và rửa kỹ, thái nhỏ."}','Me có độ chua khác nhau: cho từ từ và nếm thay vì đổ hết ngay.
Đậu bắp và giá cho sau để không quá mềm.','' FROM recipes r WHERE r.title='Canh chua cá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Cải xanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Nấm hương tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Dầu ăn';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cải xanh":"Nhặt sạch, tách cọng và lá.","Đậu hũ":"Đậu trắng, cắt miếng 2 cm.","Gừng":"Thái 3–4 lát mỏng."}','Đậu mềm dễ vỡ nên cho vào nồi sau nấm và không đảo liên tục.
Nếu thích cải bớt vị hăng, cắt nhỏ hơn và nấu thêm khoảng một phút.','' FROM recipes r WHERE r.title='Canh cải đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Nấm hương tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Bắp ngọt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1200,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Dầu ăn';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bắp ngọt":"Bắp tươi cắt khoanh dày 3 cm."}','Nấm không ngâm lâu trong nước vì dễ mất mùi và hút nước.
Chia thời điểm cho nguyên liệu để đậu không nát trong khi bắp còn cứng.','' FROM recipes r WHERE r.title='Canh nấm rau củ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Rau muống';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1200,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Nước';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Rau muống":"Khối lượng sau khi nhặt; chọn cọng non.","Tỏi":"Một nửa đập dập, một nửa băm.","Nước":"Dùng chần rau; giữ lại 2 muỗng canh cho lúc xào."}','Để rau thật ráo sau khi chần giúp chảo không bị nhiều nước.
Nếu chảo nhỏ, xào hai mẻ để giữ độ nóng.','' FROM recipes r WHERE r.title='Rau muống xào tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Xà lách';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Dầu ô liu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cà chua":"Chọn cà chua chín nhưng còn chắc.","Hành tây":"Thái thật mỏng; ngâm nước mát rồi để ráo."}','Có thể chuẩn bị rau và sốt riêng trong ngăn mát rồi trộn lúc ăn.
Không ngâm rau đã cắt trong sốt quá lâu vì muối làm rau ra nước.','' FROM recipes r WHERE r.title='Salad dưa chuột cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Bông cải xanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Nấm hương tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Muối';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bông cải xanh":"Cắt bông cỡ 3 cm; phần cuống non gọt và thái lát.","Nước":"Giữ lại 3 muỗng canh nước chần để pha sốt."}','Bông cải chần trước giúp nấm và rau đạt độ chín cùng lúc.
Không xào quá lâu sau khi cho sốt để rau giữ màu.','' FROM recipes r WHERE r.title='Bông cải xào nấm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu hũ":"Đậu cứng, thấm ráo và cắt miếng 3 cm.","Cà chua":"Cà chua chín, cắt nhỏ."}','Đậu còn ướt dễ bắn dầu; thấm ráo trước khi áp chảo.
Nếu dùng đậu đã chiên sẵn, bỏ qua bước áp chảo và giảm dầu còn 0,5 muỗng canh.','' FROM recipes r WHERE r.title='Đậu hũ sốt cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Nấm hương tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{}','Công thức dùng nấm tươi; nấm khô cần ngâm và có tỷ lệ khối lượng khác.
Nước tương càng cô lâu càng đậm, nên nếm gần cuối.','' FROM recipes r WHERE r.title='Nấm kho tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Cà tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Mè rang';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{}','Không thêm dầu liên tục khi cà hút dầu; phần nước om sẽ giúp cà chín mềm.
Lát quá dày cần thêm thời gian om.','' FROM recipes r WHERE r.title='Cà tím áp chảo sốt tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Cơm nguội';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Bắp hạt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Đậu Hà Lan';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cơm nguội":"Cơm bảo quản lạnh và bóp tơi.","Đậu Hà Lan":"Hạt đông lạnh rã đông theo hướng dẫn bao bì."}','Rau củ phải ráo nước trước khi vào chảo.
Có thể giảm muối nếu nước tương đang dùng đậm vị.','' FROM recipes r WHERE r.title='Cơm chiên rau củ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Thịt đùi gà không xương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Cơm chín';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Mật ong';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Nước';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt đùi gà không xương":"2 miếng dày đều, giữ da hoặc bỏ da theo khẩu vị.","Cơm chín":"Cơm nóng chuẩn bị sẵn; thời gian công thức không tính nấu cơm."}','Mật ong dễ cháy trên lửa lớn; giữ lửa vừa khi áp chảo.
Thời gian phụ thuộc độ dày, nên dùng nhiệt kế kiểm tra tâm gà.','45 phút, dùng cơm chín chuẩn bị sẵn; chưa gồm thời gian nấu cơm.' FROM recipes r WHERE r.title='Cơm gà áp chảo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Gạo tẻ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Thịt đùi gà không xương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1700,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{}','Khuấy sát đáy giúp phát hiện gạo đang bám nồi.
Có thể cắt cà rốt nhỏ hơn nếu muốn cháo có kết cấu mềm hơn.','' FROM recipes r WHERE r.title='Cháo gà cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'ổ' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Bánh mì';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Xà lách';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.125,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.125,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Tương cà';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bánh mì":"Ổ khoảng 100 g, rạch một bên."}','Trứng nên chín hoàn toàn trước khi kẹp.
Bánh nhỏ có thể chia phần trứng thành hai lớp để dễ ăn.','' FROM recipes r WHERE r.title='Bánh mì trứng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Bún gạo khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Cải xanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Giá đỗ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bún gạo khô":"Ngâm hoặc luộc theo bao bì, để ráo; khoảng 350–400 g sau ngâm.","Đậu hũ":"Đậu cứng cắt thanh nhỏ."}','Loại bún có thời gian ngâm khác nhau; ưu tiên hướng dẫn của hãng.
Bún đã mềm chỉ cần đảo ngắn để không nát.','' FROM recipes r WHERE r.title='Bún xào rau củ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,180,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Mì trứng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Thịt bò';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Cải xanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Dầu hào';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Mì trứng":"Khối lượng mì khô; luộc theo bao bì.","Thịt bò":"Thái ngang thớ mỏng 2 mm."}','Để mì ráo trước khi xào để sốt không bị loãng.
Xào bò hai mẻ nếu chảo nhỏ, tránh thịt tiết nhiều nước.','' FROM recipes r WHERE r.title='Mì xào bò';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Đậu xanh cà vỏ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,70,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.125,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Muối';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu xanh cà vỏ":"Ngâm 2 giờ, xả sạch; khối lượng đậu khô.","Nước":"900 ml nấu đậu, 100 ml nấu cốt dừa.","Đường":"60 g cho chè, 10 g cho nước cốt dừa."}','Cho đường khi đậu đã mềm để dễ đánh giá đúng kết cấu hạt.
Chè đặc lên khi nguội; để hơi loãng hơn mức mong muốn lúc tắt bếp.','45 phút chuẩn bị và nấu, chưa gồm 2 giờ ngâm đậu.' FROM recipes r WHERE r.title='Chè đậu xanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Sữa chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Xoài';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Chuối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Mật ong';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Sữa chua":"2 hộp loại không đường, giữ lạnh đến lúc trộn.","Xoài":"Thịt xoài chín sau bỏ vỏ, hạt; khoảng 1 quả nhỏ.","Chuối":"Phần ăn được, khoảng 1 quả nhỏ; chín vừa, không dập.","Mật ong":"Có thể dùng ít hơn nếu trái cây đã ngọt."}','Khối lượng xoài và chuối trong công thức là phần đã bỏ vỏ, hạt để lượng hai cốc ổn định.
Nếu dùng sữa chua có đường, nếm trước khi thêm mật ong.','' FROM recipes r WHERE r.title='Sữa chua trái cây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Chuối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Bơ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Mật ong';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Mè rang';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Chuối":"Phần đã bóc vỏ, khoảng 3 quả nhỏ chín vừa.","Bơ":"Bơ lạt."}','Mặt cắt cần khô để lên màu đẹp.
Chuối càng ngọt, càng có thể giảm mật ong.','' FROM recipes r WHERE r.title='Chuối áp chảo mật ong';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Xoài';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Sữa tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Sữa chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Đá viên';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Xoài":"Thịt xoài sau bỏ vỏ, hạt; khoảng 2 quả nhỏ.","Sữa tươi":"Loại không đường, để lạnh.","Sữa chua":"Loại không đường.","Đá viên":"Dùng đá sạch phù hợp với máy xay."}','Cho chất lỏng trước giúp máy xay đều hơn.
Đá làm sinh tố loãng dần, nên dùng ngay sau khi xay.','' FROM recipes r WHERE r.title='Sinh tố xoài';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'túi' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Trà túi lọc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Mật ong';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Đá viên';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Chanh';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Trà túi lọc":"Trà đen hoặc trà xanh; theo thời gian hãm ghi trên bao bì.","Nước cốt chanh":"Lọc hạt; lượng thực tế tùy độ chua của chanh.","Đá viên":"Đá sạch, chia hai cốc.","Chanh":"Rửa vỏ, thái lát mỏng để trang trí."}','Mỗi loại trà có nhiệt độ và thời gian hãm khác nhau; ưu tiên bao bì.
Đừng chà hoặc ép vỏ chanh mạnh vào nước nếu không thích vị đắng.','' FROM recipes r WHERE r.title='Trà chanh mật ong';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Thịt đùi gà không xương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Ớt chuông';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà xào sả ớt' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt đùi gà không xương":"Thái miếng mỏng 1 cm.","Sả":"Dùng phần gốc non, băm mịn.","Ớt":"Ớt nhỏ, bỏ hạt nếu muốn bớt cay."}','Băm sả thật mịn để ăn không bị xơ.
Thịt gà phải chín xuyên tâm, dù mặt ngoài đã vàng.','' FROM recipes r WHERE r.title='Gà xào sả ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,360,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Cá hồi phi lê';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Bơ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá hồi áp chảo sốt chanh' AND i.name='Chanh';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cá hồi phi lê":"2 miếng khoảng 180 g, dày khoảng 2–3 cm.","Bơ":"Bơ lạt.","Chanh":"Thái lát để dọn kèm."}','Thấm khô cá trước khi áp chảo giúp mặt cá vàng và ít bắn dầu.
Tỏi và bơ dễ cháy, nên nấu sốt trên lửa nhỏ sau khi đã lấy cá ra.','' FROM recipes r WHERE r.title='Cá hồi áp chảo sốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Khoai tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Thịt heo xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1100,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khoai tây cà rốt' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Khoai tây":"Khối lượng sau gọt; bỏ củ xanh hoặc mọc mầm."}','Khoai và cà rốt nên cắt kích thước gần nhau.
Khoai nở làm canh sánh; thêm chút nước nóng nếu muốn canh loãng hơn.','' FROM recipes r WHERE r.title='Canh khoai tây cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Mướp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh mướp nấu tôm' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Mướp":"Khối lượng sau gọt, bỏ đầu cuống.","Tôm":"Bóc vỏ, bỏ đầu và rút chỉ lưng."}','Mướp non thơm và ít xơ hơn quả già.
Tôm băm thô giúp nước canh ngọt mà vẫn có miếng để ăn.','' FROM recipes r WHERE r.title='Canh mướp nấu tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Nấm hương tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ kho nấm' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu hũ":"Đậu cứng cắt miếng 3 cm."}','Nấm tươi tiết nước nên bắt đầu với đúng lượng nước kho, rồi điều chỉnh gần cuối.
Đảo nhẹ để đậu giữ nguyên miếng.','' FROM recipes r WHERE r.title='Đậu hũ kho nấm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,8,'cái' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Bánh tráng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Bún tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Xà lách';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Rau húng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi cuốn tôm' AND i.name='Ớt';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bánh tráng":"Loại cuốn gỏi đường kính khoảng 22 cm.","Tôm":"Khoảng 16 con vừa; bóc vỏ sau khi luộc.","Nước":"Nước uống được, để pha nước chấm; nước luộc tôm và làm ướt bánh dùng riêng.","Ớt":"Có thể giảm nếu không thích cay."}','Bánh quá ướt dễ rách; chỉ làm ướt nhanh rồi chờ mềm.
Cuốn ít nhân trước để làm quen, sau đó tăng lượng vừa tay.','' FROM recipes r WHERE r.title='Gỏi cuốn tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Bún tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Thịt heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Xà lách';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Đậu phộng rang';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún thịt xào' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt heo":"Thịt nạc vai thái mỏng 3 mm.","Sả":"Băm phần gốc non.","Tỏi":"10 g ướp, 5 g pha nước chấm.","Nước mắm":"0,5 muỗng ướp thịt, 1,5 muỗng pha chấm.","Đường":"0,5 muỗng ướp, 1 muỗng pha chấm.","Đậu phộng rang":"Giã thô, bỏ vỏ lụa."}','Thịt nạc vai có chút mỡ nên ít khô hơn thịt nạc hoàn toàn.
Nếu không dùng đậu phộng, bỏ phần rắc; món vẫn đủ phần thịt và rau.','' FROM recipes r WHERE r.title='Bún thịt xào';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,180,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Nui khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Đậu Hà Lan';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nui xào trứng' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{}','Nui chỉ cần vừa chín lúc luộc vì sẽ được làm nóng thêm trong chảo.
Để ráo nước luộc trước khi xào để gia vị bám nui.','' FROM recipes r WHERE r.title='Nui xào trứng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Bột mì';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Chuối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Sữa tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Bột nở';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.125,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh pancake chuối' AND i.name='Mật ong';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bột mì":"Bột mì đa dụng.","Chuối":"Chuối chín, phần đã bóc vỏ.","Sữa tươi":"Không đường.","Bột nở":"Baking powder, gạt ngang; không thay bằng baking soda cùng lượng.","Dầu ăn":"Chia một nửa vào bột, một nửa quét chảo.","Mật ong":"Rưới bánh sau khi chín."}','Trộn bột quá kỹ làm bánh dai.
Bột nở phải còn hạn và được bảo quản kín để bánh nở tốt.','' FROM recipes r WHERE r.title='Bánh pancake chuối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè bắp' AND i.name='Bắp hạt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè bắp' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè bắp' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè bắp' AND i.name='Bột năng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè bắp' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.125,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè bắp' AND i.name='Muối';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bắp hạt":"Hạt bắp ngọt tươi, khoảng 2 trái nhỏ.","Nước":"900 ml nấu bắp, 100 ml pha bột năng.","Đường":"50 g cho chè, 10 g cho cốt dừa."}','Pha bột năng bằng nước nguội để tránh vón trước khi cho vào chè.
Rót bột từng ít và dừng khi đạt độ sánh mong muốn.','' FROM recipes r WHERE r.title='Chè bắp';

COMMIT;

SELECT COUNT(*) AS tong_cong_thuc FROM recipes;

SELECT COUNT(*) AS cong_thuc_chi_tiet FROM recipe_details;
