-- Bep Nha: 40 additional detailed recipes, bringing the collection to 100. Apply after 05.

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

INSERT INTO categories (name,description) SELECT 'Rau & salad','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Rau & salad');

INSERT INTO categories (name,description) SELECT 'Món chay','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món chay');

INSERT INTO categories (name,description) SELECT 'Cơm','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Cơm');

INSERT INTO categories (name,description) SELECT 'Ăn sáng','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');

INSERT INTO categories (name,description) SELECT 'Tráng miệng','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Tráng miệng');

INSERT INTO categories (name,description) SELECT 'Đồ uống','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Đồ uống');

INSERT INTO ingredients (name) SELECT 'Bánh mì' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bánh mì');

INSERT INTO ingredients (name) SELECT 'Bí đỏ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bí đỏ');

INSERT INTO ingredients (name) SELECT 'Bún tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bún tươi');

INSERT INTO ingredients (name) SELECT 'Bơ lạt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bơ lạt');

INSERT INTO ingredients (name) SELECT 'Bầu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bầu');

INSERT INTO ingredients (name) SELECT 'Bắp ngọt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp ngọt');

INSERT INTO ingredients (name) SELECT 'Bột báng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột báng');

INSERT INTO ingredients (name) SELECT 'Bột bắp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột bắp');

INSERT INTO ingredients (name) SELECT 'Bột cà ri' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột cà ri');

INSERT INTO ingredients (name) SELECT 'Bột gạo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột gạo');

INSERT INTO ingredients (name) SELECT 'Bột nghệ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột nghệ');

INSERT INTO ingredients (name) SELECT 'Bột năng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột năng');

INSERT INTO ingredients (name) SELECT 'Chanh vàng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chanh vàng');

INSERT INTO ingredients (name) SELECT 'Chuối sứ chín' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chuối sứ chín');

INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');

INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');

INSERT INTO ingredients (name) SELECT 'Cá diêu hồng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá diêu hồng');

INSERT INTO ingredients (name) SELECT 'Cá thu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá thu');

INSERT INTO ingredients (name) SELECT 'Cơm chín' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm chín');

INSERT INTO ingredients (name) SELECT 'Cải thìa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cải thìa');

INSERT INTO ingredients (name) SELECT 'Cải thảo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cải thảo');

INSERT INTO ingredients (name) SELECT 'Cần tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cần tây');

INSERT INTO ingredients (name) SELECT 'Củ sắn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Củ sắn');

INSERT INTO ingredients (name) SELECT 'Dưa chuột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dưa chuột');

INSERT INTO ingredients (name) SELECT 'Dầu hào' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu hào');

INSERT INTO ingredients (name) SELECT 'Dầu mè' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu mè');

INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');

INSERT INTO ingredients (name) SELECT 'Dứa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dứa');

INSERT INTO ingredients (name) SELECT 'Giá đỗ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Giá đỗ');

INSERT INTO ingredients (name) SELECT 'Giấm gạo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Giấm gạo');

INSERT INTO ingredients (name) SELECT 'Gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gà');

INSERT INTO ingredients (name) SELECT 'Gạo nếp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gạo nếp');

INSERT INTO ingredients (name) SELECT 'Gạo tẻ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gạo tẻ');

INSERT INTO ingredients (name) SELECT 'Gừng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gừng');

INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành lá');

INSERT INTO ingredients (name) SELECT 'Hành tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tây');

INSERT INTO ingredients (name) SELECT 'Hành tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tím');

INSERT INTO ingredients (name) SELECT 'Khoai lang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Khoai lang');

INSERT INTO ingredients (name) SELECT 'Khoai tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Khoai tây');

INSERT INTO ingredients (name) SELECT 'Khổ qua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Khổ qua');

INSERT INTO ingredients (name) SELECT 'Lá lốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Lá lốt');

INSERT INTO ingredients (name) SELECT 'Lòng đỏ trứng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Lòng đỏ trứng');

INSERT INTO ingredients (name) SELECT 'Mayonnaise' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mayonnaise');

INSERT INTO ingredients (name) SELECT 'Me chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Me chua');

INSERT INTO ingredients (name) SELECT 'Miến khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Miến khô');

INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');

INSERT INTO ingredients (name) SELECT 'Mè rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mè rang');

INSERT INTO ingredients (name) SELECT 'Mật ong' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mật ong');

INSERT INTO ingredients (name) SELECT 'Mực' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mực');

INSERT INTO ingredients (name) SELECT 'Mực ống' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mực ống');

INSERT INTO ingredients (name) SELECT 'Nghêu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nghêu');

INSERT INTO ingredients (name) SELECT 'Ngò gai' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ngò gai');

INSERT INTO ingredients (name) SELECT 'Ngò rí' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ngò rí');

INSERT INTO ingredients (name) SELECT 'Nước cam' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cam');

INSERT INTO ingredients (name) SELECT 'Nước cốt chanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt chanh');

INSERT INTO ingredients (name) SELECT 'Nước cốt dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt dừa');

INSERT INTO ingredients (name) SELECT 'Nước dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước dừa');

INSERT INTO ingredients (name) SELECT 'Nước lọc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước lọc');

INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');

INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');

INSERT INTO ingredients (name) SELECT 'Nấm hương tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm hương tươi');

INSERT INTO ingredients (name) SELECT 'Nấm mèo khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm mèo khô');

INSERT INTO ingredients (name) SELECT 'Nấm tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm tươi');

INSERT INTO ingredients (name) SELECT 'Rau ngổ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau ngổ');

INSERT INTO ingredients (name) SELECT 'Rau sống' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau sống');

INSERT INTO ingredients (name) SELECT 'Rau thơm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau thơm');

INSERT INTO ingredients (name) SELECT 'Rong biển nori' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rong biển nori');

INSERT INTO ingredients (name) SELECT 'Rong biển wakame khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rong biển wakame khô');

INSERT INTO ingredients (name) SELECT 'Su su' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Su su');

INSERT INTO ingredients (name) SELECT 'Sườn heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sườn heo');

INSERT INTO ingredients (name) SELECT 'Sả' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sả');

INSERT INTO ingredients (name) SELECT 'Sữa chua không đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa chua không đường');

INSERT INTO ingredients (name) SELECT 'Sữa tươi không đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa tươi không đường');

INSERT INTO ingredients (name) SELECT 'Thanh cua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thanh cua');

INSERT INTO ingredients (name) SELECT 'Thịt ba chỉ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt ba chỉ');

INSERT INTO ingredients (name) SELECT 'Thịt bò băm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt bò băm');

INSERT INTO ingredients (name) SELECT 'Thịt bò thăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt bò thăn');

INSERT INTO ingredients (name) SELECT 'Thịt gấc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt gấc');

INSERT INTO ingredients (name) SELECT 'Thịt heo băm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt heo băm');

INSERT INTO ingredients (name) SELECT 'Thịt thăn heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt thăn heo');

INSERT INTO ingredients (name) SELECT 'Thịt vịt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt vịt');

INSERT INTO ingredients (name) SELECT 'Thịt đùi gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt đùi gà');

INSERT INTO ingredients (name) SELECT 'Tiêu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tiêu');

INSERT INTO ingredients (name) SELECT 'Trứng gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trứng gà');

INSERT INTO ingredients (name) SELECT 'Tôm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tôm');

INSERT INTO ingredients (name) SELECT 'Tương cà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tương cà');

INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');

INSERT INTO ingredients (name) SELECT 'Tỏi tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi tây');

INSERT INTO ingredients (name) SELECT 'Vani' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Vani');

INSERT INTO ingredients (name) SELECT 'Vỏ cam' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Vỏ cam');

INSERT INTO ingredients (name) SELECT 'Đu đủ xanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đu đủ xanh');

INSERT INTO ingredients (name) SELECT 'Đá viên' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đá viên');

INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');

INSERT INTO ingredients (name) SELECT 'Đậu bắp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu bắp');

INSERT INTO ingredients (name) SELECT 'Đậu hũ non' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ non');

INSERT INTO ingredients (name) SELECT 'Đậu hũ trắng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ trắng');

INSERT INTO ingredients (name) SELECT 'Đậu phộng rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu phộng rang');

INSERT INTO ingredients (name) SELECT 'Đậu que' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu que');

INSERT INTO ingredients (name) SELECT 'Đậu xanh đã nấu chín' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu xanh đã nấu chín');

INSERT INTO ingredients (name) SELECT 'Đậu đỏ khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu đỏ khô');

INSERT INTO ingredients (name) SELECT 'Ớt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ớt');

INSERT INTO ingredients (name) SELECT 'Ớt chuông' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ớt chuông');

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt ba chỉ rang cháy cạnh','Ba chỉ xém vàng ở mép, thấm nước mắm và hành tím, dùng cùng cơm nóng và rau luộc.','1. Chuẩn bị thịt | Thấm khô ba chỉ bằng giấy bếp, thái lát ngang thớ dày khoảng 5 mm. Để thịt riêng với rau; rửa tay, dao và thớt sau khi sơ chế thịt sống.
2. Pha gia vị | Khuấy nước mắm, đường và 30 ml nước cho đường tan. Cắt hành tím, băm tỏi và rửa sạch hành lá trước khi bật bếp.
3. Rang ra mỡ | Cho thịt vào chảo chống dính nguội, dàn một lớp rồi bật lửa vừa. Rang 8–10 phút, trở mặt mỗi 2 phút để thịt ra mỡ và vàng đều.
4. Làm xém cạnh | Khi mép thịt vàng nâu, gạn bớt mỡ, giữ khoảng 1 muỗng canh trong chảo. Cho hành tím vào đảo 1 phút rồi thêm tỏi, đảo tiếp 30 giây.
5. Áo nước mắm | Hạ lửa vừa nhỏ, đổ hỗn hợp nước mắm vào. Đảo 3–5 phút đến khi sốt bám thịt và thịt chín; nếu đo được, phần dày đạt 63°C rồi nghỉ ít nhất 3 phút.
6. Hoàn thành | Tắt bếp, trộn hành lá và tiêu. Đợi thịt nghỉ đủ thời gian rồi dọn cùng cơm; phần sốt nên sánh nhẹ, không bị cháy đen hoặc khô cứng.','assets/photos/recipe-58.jpg',35,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt ba chỉ rang cháy cạnh');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Ba chỉ xém vàng ở mép, thấm nước mắm và hành tím, dùng cùng cơm nóng và rau luộc.',instructions='1. Chuẩn bị thịt | Thấm khô ba chỉ bằng giấy bếp, thái lát ngang thớ dày khoảng 5 mm. Để thịt riêng với rau; rửa tay, dao và thớt sau khi sơ chế thịt sống.
2. Pha gia vị | Khuấy nước mắm, đường và 30 ml nước cho đường tan. Cắt hành tím, băm tỏi và rửa sạch hành lá trước khi bật bếp.
3. Rang ra mỡ | Cho thịt vào chảo chống dính nguội, dàn một lớp rồi bật lửa vừa. Rang 8–10 phút, trở mặt mỗi 2 phút để thịt ra mỡ và vàng đều.
4. Làm xém cạnh | Khi mép thịt vàng nâu, gạn bớt mỡ, giữ khoảng 1 muỗng canh trong chảo. Cho hành tím vào đảo 1 phút rồi thêm tỏi, đảo tiếp 30 giây.
5. Áo nước mắm | Hạ lửa vừa nhỏ, đổ hỗn hợp nước mắm vào. Đảo 3–5 phút đến khi sốt bám thịt và thịt chín; nếu đo được, phần dày đạt 63°C rồi nghỉ ít nhất 3 phút.
6. Hoàn thành | Tắt bếp, trộn hành lá và tiêu. Đợi thịt nghỉ đủ thời gian rồi dọn cùng cơm; phần sốt nên sánh nhẹ, không bị cháy đen hoặc khô cứng.',image_url='assets/photos/recipe-58.jpg',prep_time_minutes=35,servings=4 WHERE title='Thịt ba chỉ rang cháy cạnh';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt heo xào chua ngọt','Thịt thăn mềm, ớt chuông và dứa giòn ngọt trong sốt chua ngọt nhẹ, không cần chiên ngập dầu.','1. Sơ chế | Thấm khô thịt, thái ngang thớ. Rửa ớt chuông, hành tây và dứa; cắt miếng vừa ăn, để ráo để rau không làm loãng sốt.
2. Ướp thịt | Trộn thịt với nước tương, 1 muỗng cà phê bột bắp và 1 muỗng cà phê dầu lấy từ lượng đã chuẩn bị. Để 10 phút trong ngăn mát.
3. Pha sốt | Khuấy tương cà, giấm, đường và 60 ml nước. Hòa riêng phần bột bắp còn lại với 20 ml nước, khuấy lại trước khi dùng.
4. Xào thịt | Làm nóng phần dầu còn lại ở lửa vừa lớn. Dàn thịt, áp 1 phút rồi đảo thêm 2–3 phút đến chín; gắp ra đĩa sạch, giữ nóng ít nhất 3 phút.
5. Xào rau củ | Trong chảo đó, phi tỏi 20 giây. Cho hành tây và ớt chuông xào 2 phút, thêm dứa và sốt, đun sôi nhẹ 1–2 phút.
6. Làm sánh | Cho thịt trở lại, đổ nước bột bắp từ từ và đảo 1 phút. Nếm sốt, tắt bếp khi rau còn giòn và sốt phủ đều; thịt cần chín hoàn toàn trước khi dọn.','assets/photos/recipe-59.jpg',35,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt heo xào chua ngọt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Thịt thăn mềm, ớt chuông và dứa giòn ngọt trong sốt chua ngọt nhẹ, không cần chiên ngập dầu.',instructions='1. Sơ chế | Thấm khô thịt, thái ngang thớ. Rửa ớt chuông, hành tây và dứa; cắt miếng vừa ăn, để ráo để rau không làm loãng sốt.
2. Ướp thịt | Trộn thịt với nước tương, 1 muỗng cà phê bột bắp và 1 muỗng cà phê dầu lấy từ lượng đã chuẩn bị. Để 10 phút trong ngăn mát.
3. Pha sốt | Khuấy tương cà, giấm, đường và 60 ml nước. Hòa riêng phần bột bắp còn lại với 20 ml nước, khuấy lại trước khi dùng.
4. Xào thịt | Làm nóng phần dầu còn lại ở lửa vừa lớn. Dàn thịt, áp 1 phút rồi đảo thêm 2–3 phút đến chín; gắp ra đĩa sạch, giữ nóng ít nhất 3 phút.
5. Xào rau củ | Trong chảo đó, phi tỏi 20 giây. Cho hành tây và ớt chuông xào 2 phút, thêm dứa và sốt, đun sôi nhẹ 1–2 phút.
6. Làm sánh | Cho thịt trở lại, đổ nước bột bắp từ từ và đảo 1 phút. Nếm sốt, tắt bếp khi rau còn giòn và sốt phủ đều; thịt cần chín hoàn toàn trước khi dọn.',image_url='assets/photos/recipe-59.jpg',prep_time_minutes=35,servings=4 WHERE title='Thịt heo xào chua ngọt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bò lúc lắc','Bò cắt khối áp chảo cùng ớt chuông và hành tây, thơm tiêu, dùng với cơm hoặc khoai tây.','1. Chuẩn bị | Thấm khô bò, cắt khối đều 2 cm. Bỏ hạt ớt chuông, cắt cùng hành tây thành miếng khoảng 2 cm; băm tỏi.
2. Ướp bò | Trộn bò với nước tương, nửa lượng dầu hào, đường và nửa lượng tiêu. Ướp 15 phút trong ngăn mát, lấy ra ngay trước khi xào.
3. Xào rau | Làm nóng 1 muỗng canh dầu, xào hành tây và ớt chuông 2–3 phút ở lửa vừa lớn. Rau vừa trong mép nhưng còn giòn thì trút ra đĩa.
4. Áp chảo bò | Thêm dầu còn lại, làm nóng chảo. Cho bò một lớp, để yên 1 phút rồi trở các mặt; chia hai mẻ nếu thịt che kín đáy chảo.
5. Đảo sốt | Thêm tỏi, bơ, dầu hào còn lại và 30 ml nước. Đảo đến khi phần giữa khối bò đạt ít nhất 63°C; thời gian thường thêm 3–5 phút tùy bếp.
6. Nghỉ và dọn | Trộn rau vào chảo khoảng 30 giây rồi tắt bếp. Để bò nghỉ ít nhất 3 phút, rắc tiêu còn lại và dùng nóng cùng cơm.','assets/photos/recipe-60.jpg',40,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bò lúc lắc');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Bò cắt khối áp chảo cùng ớt chuông và hành tây, thơm tiêu, dùng với cơm hoặc khoai tây.',instructions='1. Chuẩn bị | Thấm khô bò, cắt khối đều 2 cm. Bỏ hạt ớt chuông, cắt cùng hành tây thành miếng khoảng 2 cm; băm tỏi.
2. Ướp bò | Trộn bò với nước tương, nửa lượng dầu hào, đường và nửa lượng tiêu. Ướp 15 phút trong ngăn mát, lấy ra ngay trước khi xào.
3. Xào rau | Làm nóng 1 muỗng canh dầu, xào hành tây và ớt chuông 2–3 phút ở lửa vừa lớn. Rau vừa trong mép nhưng còn giòn thì trút ra đĩa.
4. Áp chảo bò | Thêm dầu còn lại, làm nóng chảo. Cho bò một lớp, để yên 1 phút rồi trở các mặt; chia hai mẻ nếu thịt che kín đáy chảo.
5. Đảo sốt | Thêm tỏi, bơ, dầu hào còn lại và 30 ml nước. Đảo đến khi phần giữa khối bò đạt ít nhất 63°C; thời gian thường thêm 3–5 phút tùy bếp.
6. Nghỉ và dọn | Trộn rau vào chảo khoảng 30 giây rồi tắt bếp. Để bò nghỉ ít nhất 3 phút, rắc tiêu còn lại và dùng nóng cùng cơm.',image_url='assets/photos/recipe-60.jpg',prep_time_minutes=40,servings=4 WHERE title='Bò lúc lắc';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bò cuốn lá lốt','Cuốn lá lốt nhân bò băm mềm, áp chảo thơm và dễ thực hiện bằng chảo gia đình.','1. Chuẩn bị lá | Rửa từng lá lốt nhẹ tay, để ráo và thấm khô. Chọn lá lớn để cuốn; thái nhỏ khoảng 5 lá nhỏ, bỏ phần cuống già.
2. Trộn nhân | Trộn bò băm, heo băm, hành tím, tỏi, lá thái nhỏ, nước mắm, đường và tiêu. Dùng muỗng đảo 2 phút để nhân kết dính, giữ lạnh 10 phút.
3. Cuốn đều | Đặt mặt bóng của lá xuống thớt sạch, cho khoảng 20 g nhân sát cuống. Gấp hai mép vào rồi cuộn vừa chặt; xếp mép cuốn xuống dưới.
4. Áp mặt đầu | Làm nóng dầu ở lửa vừa nhỏ. Xếp cuốn cách nhau, đặt mép cuốn xuống chảo trước và áp 3 phút để cuốn không bung.
5. Làm chín nhân | Trở nhẹ, đậy nắp 4–5 phút, sau đó mở nắp trở thêm các mặt. Nấu tiếp đến khi nhân giữa cuốn đạt 71°C, không chỉ dựa vào màu lá.
6. Hoàn thành | Gắp lên đĩa lót giấy bếp 1 phút rồi chuyển sang đĩa sạch. Dọn nóng với cơm và rau; cuốn chín có lá thơm, nhân mềm, không còn thịt sống.','assets/photos/recipe-61.jpg',45,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bò cuốn lá lốt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cuốn lá lốt nhân bò băm mềm, áp chảo thơm và dễ thực hiện bằng chảo gia đình.',instructions='1. Chuẩn bị lá | Rửa từng lá lốt nhẹ tay, để ráo và thấm khô. Chọn lá lớn để cuốn; thái nhỏ khoảng 5 lá nhỏ, bỏ phần cuống già.
2. Trộn nhân | Trộn bò băm, heo băm, hành tím, tỏi, lá thái nhỏ, nước mắm, đường và tiêu. Dùng muỗng đảo 2 phút để nhân kết dính, giữ lạnh 10 phút.
3. Cuốn đều | Đặt mặt bóng của lá xuống thớt sạch, cho khoảng 20 g nhân sát cuống. Gấp hai mép vào rồi cuộn vừa chặt; xếp mép cuốn xuống dưới.
4. Áp mặt đầu | Làm nóng dầu ở lửa vừa nhỏ. Xếp cuốn cách nhau, đặt mép cuốn xuống chảo trước và áp 3 phút để cuốn không bung.
5. Làm chín nhân | Trở nhẹ, đậy nắp 4–5 phút, sau đó mở nắp trở thêm các mặt. Nấu tiếp đến khi nhân giữa cuốn đạt 71°C, không chỉ dựa vào màu lá.
6. Hoàn thành | Gắp lên đĩa lót giấy bếp 1 phút rồi chuyển sang đĩa sạch. Dọn nóng với cơm và rau; cuốn chín có lá thơm, nhân mềm, không còn thịt sống.',image_url='assets/photos/recipe-61.jpg',prep_time_minutes=45,servings=4 WHERE title='Bò cuốn lá lốt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gà hấp hành','Gà hấp cùng hành lá và gừng, giữ nước ngọt tự nhiên, nước hấp dùng rưới lên thịt.','1. Chuẩn bị gà | Kiểm tra gà đã bỏ nội tạng, dùng giấy bếp thấm khô. Không rửa xối khiến nước thịt sống bắn ra bếp; rửa tay và dụng cụ sau khi xử lý.
2. Ướp | Xoa muối, tiêu và dầu đều bên ngoài và trong bụng gà. Đặt vào đĩa hấp sâu lòng, ướp 15 phút trong ngăn mát.
3. Xếp đĩa | Rửa hành lá, gừng và hành tím. Lót nửa hành lá cùng gừng lát dưới gà; đặt hành tím, phần hành còn lại và gừng sợi lên trên.
4. Hấp | Đun sôi nước trong xửng, đặt đĩa gà lên, đậy nắp. Hấp ở lửa vừa 35–45 phút; châm thêm nước sôi vào đáy nếu gần cạn, tránh nước chạm đĩa.
5. Kiểm tra | Cắm nhiệt kế vào phần dày của đùi và ức, tránh xương; cả hai phải đạt 74°C. Nếu chưa đạt, hấp thêm từng 5 phút rồi kiểm tra lại.
6. Dọn món | Để gà nghỉ 8–10 phút rồi chặt trên thớt sạch. Đun lại nước hấp với nước tương 1 phút, rưới một phần lên gà; dọn thịt cùng hành hấp.','assets/photos/recipe-62.jpg',70,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gà hấp hành');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Gà hấp cùng hành lá và gừng, giữ nước ngọt tự nhiên, nước hấp dùng rưới lên thịt.',instructions='1. Chuẩn bị gà | Kiểm tra gà đã bỏ nội tạng, dùng giấy bếp thấm khô. Không rửa xối khiến nước thịt sống bắn ra bếp; rửa tay và dụng cụ sau khi xử lý.
2. Ướp | Xoa muối, tiêu và dầu đều bên ngoài và trong bụng gà. Đặt vào đĩa hấp sâu lòng, ướp 15 phút trong ngăn mát.
3. Xếp đĩa | Rửa hành lá, gừng và hành tím. Lót nửa hành lá cùng gừng lát dưới gà; đặt hành tím, phần hành còn lại và gừng sợi lên trên.
4. Hấp | Đun sôi nước trong xửng, đặt đĩa gà lên, đậy nắp. Hấp ở lửa vừa 35–45 phút; châm thêm nước sôi vào đáy nếu gần cạn, tránh nước chạm đĩa.
5. Kiểm tra | Cắm nhiệt kế vào phần dày của đùi và ức, tránh xương; cả hai phải đạt 74°C. Nếu chưa đạt, hấp thêm từng 5 phút rồi kiểm tra lại.
6. Dọn món | Để gà nghỉ 8–10 phút rồi chặt trên thớt sạch. Đun lại nước hấp với nước tương 1 phút, rưới một phần lên gà; dọn thịt cùng hành hấp.',image_url='assets/photos/recipe-62.jpg',prep_time_minutes=70,servings=4 WHERE title='Gà hấp hành';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gà sốt cam','Đùi gà áp chảo áo sốt nước cam tươi, chua ngọt dịu, thơm gừng và tỏi.','1. Chuẩn bị | Thấm khô gà, cắt đều và ướp với nửa lượng nước tương 10 phút trong ngăn mát. Vắt cam, lọc hạt; bào vỏ trước khi vắt.
2. Pha sốt | Khuấy nước cam, mật ong và nước tương còn lại. Hòa bột bắp với 30 ml nước trong bát khác, để cạnh bếp.
3. Áp chảo | Làm nóng dầu ở lửa vừa. Cho gà một lớp, áp 4 phút mỗi mặt đến vàng; chia mẻ nếu cần, không dùng lại đĩa đựng gà sống.
4. Nấu sốt | Hạ lửa, thêm gừng và tỏi vào khoảng trống trong chảo, đảo 30 giây. Đổ sốt cam vào, đậy nắp và om nhẹ 5–7 phút.
5. Làm sánh | Kiểm tra gà đạt 74°C ở miếng dày nhất. Khuấy lại nước bột bắp, đổ từ từ vào chảo và đảo 1 phút đến khi sốt sánh, không đổ hết nếu đã đủ đặc.
6. Hoàn thiện | Tắt bếp, trộn vỏ cam và hành lá cắt nhỏ. Rưới sốt lên gà, dùng cùng cơm; nếu cam quá chua có thể điều chỉnh chút mật ong trước khi tắt.','assets/photos/recipe-63.jpg',45,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gà sốt cam');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Đùi gà áp chảo áo sốt nước cam tươi, chua ngọt dịu, thơm gừng và tỏi.',instructions='1. Chuẩn bị | Thấm khô gà, cắt đều và ướp với nửa lượng nước tương 10 phút trong ngăn mát. Vắt cam, lọc hạt; bào vỏ trước khi vắt.
2. Pha sốt | Khuấy nước cam, mật ong và nước tương còn lại. Hòa bột bắp với 30 ml nước trong bát khác, để cạnh bếp.
3. Áp chảo | Làm nóng dầu ở lửa vừa. Cho gà một lớp, áp 4 phút mỗi mặt đến vàng; chia mẻ nếu cần, không dùng lại đĩa đựng gà sống.
4. Nấu sốt | Hạ lửa, thêm gừng và tỏi vào khoảng trống trong chảo, đảo 30 giây. Đổ sốt cam vào, đậy nắp và om nhẹ 5–7 phút.
5. Làm sánh | Kiểm tra gà đạt 74°C ở miếng dày nhất. Khuấy lại nước bột bắp, đổ từ từ vào chảo và đảo 1 phút đến khi sốt sánh, không đổ hết nếu đã đủ đặc.
6. Hoàn thiện | Tắt bếp, trộn vỏ cam và hành lá cắt nhỏ. Rưới sốt lên gà, dùng cùng cơm; nếu cam quá chua có thể điều chỉnh chút mật ong trước khi tắt.',image_url='assets/photos/recipe-63.jpg',prep_time_minutes=45,servings=4 WHERE title='Gà sốt cam';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Vịt kho gừng','Vịt kho mềm với gừng sợi và nước dừa, sốt đậm vừa để ăn cùng cơm trắng.','1. Sơ chế | Thấm khô vịt, kiểm tra bỏ mảnh xương vụn. Cho vào nồi nước sôi cùng gừng lát, chần 2 phút rồi gắp ra; đổ nước chần và làm sạch nồi.
2. Ướp | Trộn vịt với nước mắm, nước tương, đường, tiêu và nửa hành tỏi. Ướp 10 phút trong ngăn mát khi chuẩn bị gừng sợi.
3. Xào săn | Làm nóng dầu, phi hành tỏi còn lại 30 giây. Thêm gừng sợi, đảo 1 phút rồi cho vịt và nước ướp vào, xào 5 phút đến thịt săn.
4. Kho mềm | Đổ nước dừa vào, đun sôi rồi hạ lửa nhỏ, đậy nắp. Kho 25–30 phút, trở miếng vịt giữa chừng; thêm nước nóng nếu sốt cạn trước khi mềm.
5. Thu sốt | Mở nắp, kiểm tra thịt đạt 74°C ở phần dày, tránh xương. Đun thêm 5–8 phút để sốt sánh vừa, nếm và điều chỉnh trước khi tắt.
6. Dọn | Để vịt nghỉ 5 phút, gắp ra đĩa sâu và rưới sốt gừng. Thịt chín mềm nhưng còn giữ miếng, dùng nóng cùng cơm và rau luộc.','assets/photos/recipe-64.jpg',60,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Vịt kho gừng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Vịt kho mềm với gừng sợi và nước dừa, sốt đậm vừa để ăn cùng cơm trắng.',instructions='1. Sơ chế | Thấm khô vịt, kiểm tra bỏ mảnh xương vụn. Cho vào nồi nước sôi cùng gừng lát, chần 2 phút rồi gắp ra; đổ nước chần và làm sạch nồi.
2. Ướp | Trộn vịt với nước mắm, nước tương, đường, tiêu và nửa hành tỏi. Ướp 10 phút trong ngăn mát khi chuẩn bị gừng sợi.
3. Xào săn | Làm nóng dầu, phi hành tỏi còn lại 30 giây. Thêm gừng sợi, đảo 1 phút rồi cho vịt và nước ướp vào, xào 5 phút đến thịt săn.
4. Kho mềm | Đổ nước dừa vào, đun sôi rồi hạ lửa nhỏ, đậy nắp. Kho 25–30 phút, trở miếng vịt giữa chừng; thêm nước nóng nếu sốt cạn trước khi mềm.
5. Thu sốt | Mở nắp, kiểm tra thịt đạt 74°C ở phần dày, tránh xương. Đun thêm 5–8 phút để sốt sánh vừa, nếm và điều chỉnh trước khi tắt.
6. Dọn | Để vịt nghỉ 5 phút, gắp ra đĩa sâu và rưới sốt gừng. Thịt chín mềm nhưng còn giữ miếng, dùng nóng cùng cơm và rau luộc.',image_url='assets/photos/recipe-64.jpg',prep_time_minutes=60,servings=4 WHERE title='Vịt kho gừng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Tôm chiên tỏi','Tôm áp chảo vàng, áo tỏi phi giòn, thơm nước mắm và tiêu.','1. Sơ chế tôm | Bóc vỏ, rút chỉ lưng, rửa nhanh dưới nước sạch và thấm thật khô. Giữ tôm trong ngăn mát khi băm tỏi và pha sốt.
2. Pha gia vị | Khuấy nước mắm, đường, tiêu và 20 ml nước. Chia tỏi thành hai phần: khoảng ba phần tư để phi và phần còn lại để xào thơm.
3. Phi tỏi | Đun dầu ở lửa nhỏ, cho phần tỏi phi vào đảo 2–3 phút. Khi vừa vàng nhạt, vớt ra rây; tỏi còn tiếp tục vàng sau khi rời chảo.
4. Áp tôm | Tăng lên lửa vừa lớn, xếp tôm vào dầu tỏi một lớp. Áp 2 phút mặt đầu, trở và nấu thêm 1–2 phút; chia mẻ nếu chảo nhỏ.
5. Áo sốt | Cho tỏi còn lại vào đảo 20 giây, thêm sốt. Đảo 1 phút đến khi tôm đục hoàn toàn, thịt chắc và sốt bám đều; tránh đun lâu làm dai.
6. Hoàn thành | Tắt bếp, trộn hành lá và phần tỏi phi. Dọn ngay để tỏi còn giòn, không rưới nhiều nước sốt loãng lên tỏi.','assets/photos/recipe-65.jpg',30,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Tôm chiên tỏi');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Tôm áp chảo vàng, áo tỏi phi giòn, thơm nước mắm và tiêu.',instructions='1. Sơ chế tôm | Bóc vỏ, rút chỉ lưng, rửa nhanh dưới nước sạch và thấm thật khô. Giữ tôm trong ngăn mát khi băm tỏi và pha sốt.
2. Pha gia vị | Khuấy nước mắm, đường, tiêu và 20 ml nước. Chia tỏi thành hai phần: khoảng ba phần tư để phi và phần còn lại để xào thơm.
3. Phi tỏi | Đun dầu ở lửa nhỏ, cho phần tỏi phi vào đảo 2–3 phút. Khi vừa vàng nhạt, vớt ra rây; tỏi còn tiếp tục vàng sau khi rời chảo.
4. Áp tôm | Tăng lên lửa vừa lớn, xếp tôm vào dầu tỏi một lớp. Áp 2 phút mặt đầu, trở và nấu thêm 1–2 phút; chia mẻ nếu chảo nhỏ.
5. Áo sốt | Cho tỏi còn lại vào đảo 20 giây, thêm sốt. Đảo 1 phút đến khi tôm đục hoàn toàn, thịt chắc và sốt bám đều; tránh đun lâu làm dai.
6. Hoàn thành | Tắt bếp, trộn hành lá và phần tỏi phi. Dọn ngay để tỏi còn giòn, không rưới nhiều nước sốt loãng lên tỏi.',image_url='assets/photos/recipe-65.jpg',prep_time_minutes=30,servings=4 WHERE title='Tôm chiên tỏi';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Tôm sốt bơ chanh','Tôm chín mọng trong sốt bơ, tỏi và chanh vàng, dùng với bánh mì hoặc cơm.','1. Chuẩn bị | Sơ chế tôm và thấm khô. Vắt chanh, lọc hạt; đo 20 ml nước cốt, thái vài lát mỏng từ phần còn lại để dọn cùng món.
2. Ướp ngắn | Trộn tôm với muối và tiêu, để 5 phút trong ngăn mát. Chưa cho chanh lúc này để giữ kết cấu tôm khi áp chảo.
3. Làm thơm | Làm nóng dầu và nửa lượng bơ ở lửa vừa. Khi bơ tan, cho tỏi vào đảo 20–30 giây, không để tỏi hoặc bơ chuyển nâu đậm.
4. Nấu tôm | Xếp tôm một lớp, nấu 2 phút rồi trở mặt 1–2 phút. Tôm chín khi toàn bộ thịt đục, chắc; nếu tôm lớn, tăng thời gian từng ít.
5. Pha sốt | Hạ lửa nhỏ, thêm 30 ml nước và phần bơ còn lại, khuấy cho tan. Tắt bếp rồi trộn nước cốt chanh; nếm vị trước khi thêm chanh nữa.
6. Dọn món | Rắc ngò, cho lát chanh lên trên và dọn ngay. Sốt nên bóng, hơi sánh và bao quanh tôm, dùng bánh mì chấm hoặc rưới lên cơm.','assets/photos/recipe-66.jpg',25,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Tôm sốt bơ chanh');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Tôm chín mọng trong sốt bơ, tỏi và chanh vàng, dùng với bánh mì hoặc cơm.',instructions='1. Chuẩn bị | Sơ chế tôm và thấm khô. Vắt chanh, lọc hạt; đo 20 ml nước cốt, thái vài lát mỏng từ phần còn lại để dọn cùng món.
2. Ướp ngắn | Trộn tôm với muối và tiêu, để 5 phút trong ngăn mát. Chưa cho chanh lúc này để giữ kết cấu tôm khi áp chảo.
3. Làm thơm | Làm nóng dầu và nửa lượng bơ ở lửa vừa. Khi bơ tan, cho tỏi vào đảo 20–30 giây, không để tỏi hoặc bơ chuyển nâu đậm.
4. Nấu tôm | Xếp tôm một lớp, nấu 2 phút rồi trở mặt 1–2 phút. Tôm chín khi toàn bộ thịt đục, chắc; nếu tôm lớn, tăng thời gian từng ít.
5. Pha sốt | Hạ lửa nhỏ, thêm 30 ml nước và phần bơ còn lại, khuấy cho tan. Tắt bếp rồi trộn nước cốt chanh; nếm vị trước khi thêm chanh nữa.
6. Dọn món | Rắc ngò, cho lát chanh lên trên và dọn ngay. Sốt nên bóng, hơi sánh và bao quanh tôm, dùng bánh mì chấm hoặc rưới lên cơm.',image_url='assets/photos/recipe-66.jpg',prep_time_minutes=25,servings=4 WHERE title='Tôm sốt bơ chanh';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Mực xào cần tỏi','Mực giòn mềm xào cần tây, tỏi tây và cà chua, nhiều màu sắc cho bữa cơm.','1. Sơ chế mực | Rửa mực nhanh, bỏ mắt và răng, thấm khô. Khứa nhẹ mặt trong hình ô vuông rồi cắt miếng 3 cm; không khứa đứt.
2. Chuẩn bị rau | Rửa cần tây và tỏi tây, chú ý đất giữa các bẹ. Cắt rau, hành tây và cà chua; để thân cần riêng với lá để nấu đúng thời điểm.
3. Pha sốt | Trộn nước mắm, dầu hào, tiêu và 30 ml nước. Chuẩn bị mọi nguyên liệu cạnh bếp vì phần xào chỉ diễn ra trong vài phút.
4. Xào mực | Đun nóng 1 muỗng canh dầu, phi nửa tỏi 20 giây. Cho mực vào xào 2–3 phút đến thịt đục và cuộn lại, trút ra đĩa sạch.
5. Xào rau | Thêm dầu và tỏi còn lại. Xào hành tây, thân cần và tỏi tây 2 phút, thêm cà chua và sốt, đảo thêm 1 phút.
6. Trộn cuối | Cho mực và lá cần vào, đảo 30–60 giây để mực chín đều và rau vừa chín. Tắt bếp, dọn ngay; sốt chỉ cần áo nhẹ chứ không ngập nguyên liệu.','assets/photos/recipe-67.jpg',30,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Mực xào cần tỏi');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Mực giòn mềm xào cần tây, tỏi tây và cà chua, nhiều màu sắc cho bữa cơm.',instructions='1. Sơ chế mực | Rửa mực nhanh, bỏ mắt và răng, thấm khô. Khứa nhẹ mặt trong hình ô vuông rồi cắt miếng 3 cm; không khứa đứt.
2. Chuẩn bị rau | Rửa cần tây và tỏi tây, chú ý đất giữa các bẹ. Cắt rau, hành tây và cà chua; để thân cần riêng với lá để nấu đúng thời điểm.
3. Pha sốt | Trộn nước mắm, dầu hào, tiêu và 30 ml nước. Chuẩn bị mọi nguyên liệu cạnh bếp vì phần xào chỉ diễn ra trong vài phút.
4. Xào mực | Đun nóng 1 muỗng canh dầu, phi nửa tỏi 20 giây. Cho mực vào xào 2–3 phút đến thịt đục và cuộn lại, trút ra đĩa sạch.
5. Xào rau | Thêm dầu và tỏi còn lại. Xào hành tây, thân cần và tỏi tây 2 phút, thêm cà chua và sốt, đảo thêm 1 phút.
6. Trộn cuối | Cho mực và lá cần vào, đảo 30–60 giây để mực chín đều và rau vừa chín. Tắt bếp, dọn ngay; sốt chỉ cần áo nhẹ chứ không ngập nguyên liệu.',image_url='assets/photos/recipe-67.jpg',prep_time_minutes=30,servings=4 WHERE title='Mực xào cần tỏi';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Mực nhồi thịt sốt cà chua','Mực nhồi thịt băm và nấm mèo, hấp chín rồi om trong sốt cà chua mềm thơm.','1. Sơ chế | Làm sạch mực, bỏ mai, túi mực, mắt và răng; giữ thân nguyên. Ngâm nấm mèo trong nước sạch 10–15 phút, rửa, bỏ gốc và băm cùng râu mực.
2. Trộn nhân | Trộn thịt, râu mực, nấm, nửa hành tím, hành lá, 1 muỗng canh nước mắm và tiêu. Đảo cho nhân kết dính; giữ lạnh đến lúc nhồi.
3. Nhồi | Dùng muỗng nhồi khoảng hai phần ba thân mực để chừa chỗ nhân nở. Dùng tăm ghim miệng; đặt lên đĩa chịu nhiệt sâu lòng.
4. Hấp chín | Hấp trên nước sôi ở lửa vừa 15–20 phút. Kiểm tra phần nhân giữa con lớn nhất đạt 71°C; hấp thêm nếu chưa đạt, giữ riêng nước hấp.
5. Nấu sốt | Phi hành còn lại với dầu 30 giây. Thêm cà chua, đường và phần nước mắm còn lại, đảo 3 phút; thêm 120 ml nước, om 5 phút cho cà chua mềm.
6. Om và dọn | Cho mực chín vào sốt, om nhẹ 4–5 phút, trở một lần. Rút hết tăm, để nghỉ 3 phút rồi cắt khoanh bằng dao sạch, rưới sốt và dọn.','assets/photos/recipe-68.jpg',50,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Mực nhồi thịt sốt cà chua');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Mực nhồi thịt băm và nấm mèo, hấp chín rồi om trong sốt cà chua mềm thơm.',instructions='1. Sơ chế | Làm sạch mực, bỏ mai, túi mực, mắt và răng; giữ thân nguyên. Ngâm nấm mèo trong nước sạch 10–15 phút, rửa, bỏ gốc và băm cùng râu mực.
2. Trộn nhân | Trộn thịt, râu mực, nấm, nửa hành tím, hành lá, 1 muỗng canh nước mắm và tiêu. Đảo cho nhân kết dính; giữ lạnh đến lúc nhồi.
3. Nhồi | Dùng muỗng nhồi khoảng hai phần ba thân mực để chừa chỗ nhân nở. Dùng tăm ghim miệng; đặt lên đĩa chịu nhiệt sâu lòng.
4. Hấp chín | Hấp trên nước sôi ở lửa vừa 15–20 phút. Kiểm tra phần nhân giữa con lớn nhất đạt 71°C; hấp thêm nếu chưa đạt, giữ riêng nước hấp.
5. Nấu sốt | Phi hành còn lại với dầu 30 giây. Thêm cà chua, đường và phần nước mắm còn lại, đảo 3 phút; thêm 120 ml nước, om 5 phút cho cà chua mềm.
6. Om và dọn | Cho mực chín vào sốt, om nhẹ 4–5 phút, trở một lần. Rút hết tăm, để nghỉ 3 phút rồi cắt khoanh bằng dao sạch, rưới sốt và dọn.',image_url='assets/photos/recipe-68.jpg',prep_time_minutes=50,servings=4 WHERE title='Mực nhồi thịt sốt cà chua';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Nghêu hấp sả','Nghêu hấp thơm sả và gừng, giữ nước ngọt tự nhiên trong phần nước hấp.','1. Chọn và kiểm tra | Dùng nghêu còn sống, bỏ con vỡ vỏ hoặc có mùi lạ. Con hé miệng phải khép khi gõ nhẹ; bỏ con không phản ứng.
2. Làm sạch | Chà vỏ dưới nước sạch. Nếu còn cát, làm sạch theo hướng dẫn nơi bán trong điều kiện mát, rồi rửa lại; không dùng nghêu đã chết để hấp.
3. Chuẩn bị nồi | Xếp sả và gừng vào nồi có nắp. Thêm 150 ml nước, đường và ớt; đun sôi 2 phút để nước thơm.
4. Hấp mở vỏ | Cho nghêu vào, đậy nắp và nấu lửa vừa lớn. Sau 3–4 phút, lắc nồi nhẹ bằng quai có găng; tránh mở nắp liên tục làm thoát hơi.
5. Nấu đủ | Khi nghêu mở vỏ, nấu tiếp khoảng 3 phút và kiểm tra thịt chắc, đục. Bỏ mọi con vẫn đóng vỏ sau khi nấu; không cố cạy để ăn.
6. Dọn nóng | Múc nghêu bằng muỗng sạch, rót nước hấp từ từ để giữ cặn dưới đáy. Dùng nóng ngay, nếm nước trước khi thêm bất kỳ gia vị mặn nào.','assets/photos/recipe-69.jpg',25,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Nghêu hấp sả');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Nghêu hấp thơm sả và gừng, giữ nước ngọt tự nhiên trong phần nước hấp.',instructions='1. Chọn và kiểm tra | Dùng nghêu còn sống, bỏ con vỡ vỏ hoặc có mùi lạ. Con hé miệng phải khép khi gõ nhẹ; bỏ con không phản ứng.
2. Làm sạch | Chà vỏ dưới nước sạch. Nếu còn cát, làm sạch theo hướng dẫn nơi bán trong điều kiện mát, rồi rửa lại; không dùng nghêu đã chết để hấp.
3. Chuẩn bị nồi | Xếp sả và gừng vào nồi có nắp. Thêm 150 ml nước, đường và ớt; đun sôi 2 phút để nước thơm.
4. Hấp mở vỏ | Cho nghêu vào, đậy nắp và nấu lửa vừa lớn. Sau 3–4 phút, lắc nồi nhẹ bằng quai có găng; tránh mở nắp liên tục làm thoát hơi.
5. Nấu đủ | Khi nghêu mở vỏ, nấu tiếp khoảng 3 phút và kiểm tra thịt chắc, đục. Bỏ mọi con vẫn đóng vỏ sau khi nấu; không cố cạy để ăn.
6. Dọn nóng | Múc nghêu bằng muỗng sạch, rót nước hấp từ từ để giữ cặn dưới đáy. Dùng nóng ngay, nếm nước trước khi thêm bất kỳ gia vị mặn nào.',image_url='assets/photos/recipe-69.jpg',prep_time_minutes=25,servings=4 WHERE title='Nghêu hấp sả';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cá diêu hồng hấp gừng','Cá nguyên con hấp gừng và hành, thịt mềm, nước tương pha nhẹ vừa ăn.','1. Sơ chế cá | Kiểm tra bụng và mang đã sạch, rửa nhanh, thấm khô. Khứa mỗi bên cá 2 đường nông ở phần dày để nhiệt vào đều.
2. Pha sốt | Khuấy nước tương, đường, tiêu và 60 ml nước. Rửa gừng, hành lá và hành tây, để ráo; chia gừng và hành lá thành hai phần.
3. Xếp đĩa | Lót hành tây, nửa gừng và hành lá vào đĩa sâu chịu nhiệt. Đặt cá lên, rưới sốt và dầu, cho một ít gừng vào bụng cá.
4. Hấp | Đặt đĩa vào xửng khi nước đã sôi, đậy nắp và hấp lửa vừa 18–22 phút. Cá dày hoặc lớn cần thời gian lâu hơn; không để xửng cạn nước.
5. Kiểm tra | Đo phần thịt dày sát sống lưng, tránh chạm xương, cần đạt 63°C. Thêm gừng và hành còn lại, hấp thêm 1 phút rồi tắt bếp.
6. Dọn cá | Nhấc đĩa bằng găng chịu nhiệt, rưới nước hấp lên cá. Dùng nóng, gỡ xương kỹ khi chia phần; thịt phải dễ tách thớ và không còn trong.','assets/photos/recipe-70.jpg',40,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cá diêu hồng hấp gừng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cá nguyên con hấp gừng và hành, thịt mềm, nước tương pha nhẹ vừa ăn.',instructions='1. Sơ chế cá | Kiểm tra bụng và mang đã sạch, rửa nhanh, thấm khô. Khứa mỗi bên cá 2 đường nông ở phần dày để nhiệt vào đều.
2. Pha sốt | Khuấy nước tương, đường, tiêu và 60 ml nước. Rửa gừng, hành lá và hành tây, để ráo; chia gừng và hành lá thành hai phần.
3. Xếp đĩa | Lót hành tây, nửa gừng và hành lá vào đĩa sâu chịu nhiệt. Đặt cá lên, rưới sốt và dầu, cho một ít gừng vào bụng cá.
4. Hấp | Đặt đĩa vào xửng khi nước đã sôi, đậy nắp và hấp lửa vừa 18–22 phút. Cá dày hoặc lớn cần thời gian lâu hơn; không để xửng cạn nước.
5. Kiểm tra | Đo phần thịt dày sát sống lưng, tránh chạm xương, cần đạt 63°C. Thêm gừng và hành còn lại, hấp thêm 1 phút rồi tắt bếp.
6. Dọn cá | Nhấc đĩa bằng găng chịu nhiệt, rưới nước hấp lên cá. Dùng nóng, gỡ xương kỹ khi chia phần; thịt phải dễ tách thớ và không còn trong.',image_url='assets/photos/recipe-70.jpg',prep_time_minutes=40,servings=4 WHERE title='Cá diêu hồng hấp gừng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cá thu sốt cà chua','Cá thu áp chảo rồi om sốt cà chua, phần thịt chắc và sốt hợp với cơm nóng.','1. Chuẩn bị | Thấm khô cá, kiểm tra bỏ mảnh xương vụn và ướp nửa nước mắm 5 phút trong ngăn mát. Cắt cà chua, băm hành tỏi.
2. Áp cá | Làm nóng dầu ở lửa vừa. Đặt cá vào chảo, áp mỗi mặt 3 phút cho hơi vàng, gắp ra đĩa sạch; bước này chưa cần cá chín hẳn.
3. Phi thơm | Giữ khoảng 1 muỗng canh dầu trong chảo. Cho hành tím và tỏi vào đảo 30 giây rồi thêm cà chua, đảo 3–4 phút cho mềm.
4. Pha sốt | Thêm 120 ml nước, đường, phần nước mắm còn lại và tiêu. Đun sôi nhẹ 2 phút, dùng muỗng dằm cà chua để sốt đều.
5. Om cá | Đặt cá vào sốt, đậy nắp và om lửa nhỏ 6–8 phút, trở nhẹ một lần. Phần dày của cá cần đạt 63°C, tăng thời gian nếu khoanh dày.
6. Hoàn thành | Mở nắp, đun thêm 1–2 phút nếu sốt còn loãng. Tắt bếp, thêm hành lá, chuyển cả cá và sốt ra đĩa; tránh đảo mạnh làm nát khoanh.','assets/photos/recipe-71.jpg',35,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cá thu sốt cà chua');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cá thu áp chảo rồi om sốt cà chua, phần thịt chắc và sốt hợp với cơm nóng.',instructions='1. Chuẩn bị | Thấm khô cá, kiểm tra bỏ mảnh xương vụn và ướp nửa nước mắm 5 phút trong ngăn mát. Cắt cà chua, băm hành tỏi.
2. Áp cá | Làm nóng dầu ở lửa vừa. Đặt cá vào chảo, áp mỗi mặt 3 phút cho hơi vàng, gắp ra đĩa sạch; bước này chưa cần cá chín hẳn.
3. Phi thơm | Giữ khoảng 1 muỗng canh dầu trong chảo. Cho hành tím và tỏi vào đảo 30 giây rồi thêm cà chua, đảo 3–4 phút cho mềm.
4. Pha sốt | Thêm 120 ml nước, đường, phần nước mắm còn lại và tiêu. Đun sôi nhẹ 2 phút, dùng muỗng dằm cà chua để sốt đều.
5. Om cá | Đặt cá vào sốt, đậy nắp và om lửa nhỏ 6–8 phút, trở nhẹ một lần. Phần dày của cá cần đạt 63°C, tăng thời gian nếu khoanh dày.
6. Hoàn thành | Mở nắp, đun thêm 1–2 phút nếu sốt còn loãng. Tắt bếp, thêm hành lá, chuyển cả cá và sốt ra đĩa; tránh đảo mạnh làm nát khoanh.',image_url='assets/photos/recipe-71.jpg',prep_time_minutes=35,servings=4 WHERE title='Cá thu sốt cà chua';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh khổ qua nhồi thịt','Khổ qua nhồi thịt và nấm mèo, nấu mềm trong nước dùng thanh, có vị đắng nhẹ đặc trưng.','1. Sơ chế khổ qua | Rửa khổ qua, cắt khúc 4–5 cm, dùng muỗng lấy sạch hạt và phần ruột trắng. Ngâm nước sạch 5 phút rồi để ráo.
2. Chuẩn bị nhân | Ngâm nấm mèo trong nước sạch 10–15 phút, rửa, bỏ gốc và băm. Trộn với thịt, hành tím, nửa hành lá, nửa nước mắm và nửa tiêu.
3. Nhồi | Dùng muỗng cho nhân vào từng khúc, nén vừa đủ, gạt hai đầu ngang mặt. Nhân dư có thể vo viên nhỏ để nấu cùng, không nhồi tràn.
4. Nấu nước canh | Đun 1,5 lít nước, thêm muối và nước mắm còn lại. Khi sôi, thả khổ qua nhẹ tay, chờ sôi trở lại rồi hạ lửa.
5. Ninh mềm | Nấu liu riu 25–30 phút, hé nắp, hớt bọt. Kiểm tra nhân ở khúc lớn nhất đạt 71°C và khổ qua mềm; chưa đạt thì nấu thêm.
6. Hoàn thành | Nếm nước canh, thêm hành lá và tiêu còn lại, tắt bếp. Múc nhẹ để nhân không rơi ra; dọn nóng cùng cơm và món mặn.','assets/photos/recipe-72.jpg',55,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh khổ qua nhồi thịt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Khổ qua nhồi thịt và nấm mèo, nấu mềm trong nước dùng thanh, có vị đắng nhẹ đặc trưng.',instructions='1. Sơ chế khổ qua | Rửa khổ qua, cắt khúc 4–5 cm, dùng muỗng lấy sạch hạt và phần ruột trắng. Ngâm nước sạch 5 phút rồi để ráo.
2. Chuẩn bị nhân | Ngâm nấm mèo trong nước sạch 10–15 phút, rửa, bỏ gốc và băm. Trộn với thịt, hành tím, nửa hành lá, nửa nước mắm và nửa tiêu.
3. Nhồi | Dùng muỗng cho nhân vào từng khúc, nén vừa đủ, gạt hai đầu ngang mặt. Nhân dư có thể vo viên nhỏ để nấu cùng, không nhồi tràn.
4. Nấu nước canh | Đun 1,5 lít nước, thêm muối và nước mắm còn lại. Khi sôi, thả khổ qua nhẹ tay, chờ sôi trở lại rồi hạ lửa.
5. Ninh mềm | Nấu liu riu 25–30 phút, hé nắp, hớt bọt. Kiểm tra nhân ở khúc lớn nhất đạt 71°C và khổ qua mềm; chưa đạt thì nấu thêm.
6. Hoàn thành | Nếm nước canh, thêm hành lá và tiêu còn lại, tắt bếp. Múc nhẹ để nhân không rơi ra; dọn nóng cùng cơm và món mặn.',image_url='assets/photos/recipe-72.jpg',prep_time_minutes=55,servings=4 WHERE title='Canh khổ qua nhồi thịt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh cải thảo viên thịt','Viên thịt mềm nấu cùng cải thảo và cà rốt, nước canh ngọt nhẹ cho bữa cơm gia đình.','1. Chuẩn bị rau | Tách lá cải thảo, rửa kỹ, cắt khúc và để phần bẹ riêng với lá. Gọt cà rốt, thái lát 3 mm; băm hành tím, cắt hành lá.
2. Trộn thịt | Trộn thịt với hành tím, bột bắp, 1 muỗng cà phê nước mắm lấy từ lượng chuẩn bị và tiêu. Đảo cùng chiều 1 phút rồi vo viên cỡ 2 cm.
3. Nấu cà rốt | Đun 1,4 lít nước với muối. Cho cà rốt vào nấu 3 phút ở lửa vừa; chuẩn bị muỗng sạch để thả viên thịt.
4. Nấu viên thịt | Cho từng viên vào nước đang sôi nhẹ, không đảo ngay. Nấu 6–8 phút và hớt bọt; kiểm tra viên lớn nhất chín giữa, đạt 71°C nếu dùng nhiệt kế.
5. Cho cải | Thêm bẹ cải, nấu 2 phút rồi cho phần lá và nước mắm còn lại. Nấu thêm 2–3 phút đến cải mềm vừa, nước canh sôi nhẹ trở lại.
6. Dọn canh | Nếm và điều chỉnh vị, thêm hành lá rồi tắt bếp. Múc canh cùng cả rau và viên thịt, dùng nóng; không nấu lâu sau khi lá cải đã mềm.','assets/photos/recipe-73.jpg',30,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh cải thảo viên thịt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Viên thịt mềm nấu cùng cải thảo và cà rốt, nước canh ngọt nhẹ cho bữa cơm gia đình.',instructions='1. Chuẩn bị rau | Tách lá cải thảo, rửa kỹ, cắt khúc và để phần bẹ riêng với lá. Gọt cà rốt, thái lát 3 mm; băm hành tím, cắt hành lá.
2. Trộn thịt | Trộn thịt với hành tím, bột bắp, 1 muỗng cà phê nước mắm lấy từ lượng chuẩn bị và tiêu. Đảo cùng chiều 1 phút rồi vo viên cỡ 2 cm.
3. Nấu cà rốt | Đun 1,4 lít nước với muối. Cho cà rốt vào nấu 3 phút ở lửa vừa; chuẩn bị muỗng sạch để thả viên thịt.
4. Nấu viên thịt | Cho từng viên vào nước đang sôi nhẹ, không đảo ngay. Nấu 6–8 phút và hớt bọt; kiểm tra viên lớn nhất chín giữa, đạt 71°C nếu dùng nhiệt kế.
5. Cho cải | Thêm bẹ cải, nấu 2 phút rồi cho phần lá và nước mắm còn lại. Nấu thêm 2–3 phút đến cải mềm vừa, nước canh sôi nhẹ trở lại.
6. Dọn canh | Nếm và điều chỉnh vị, thêm hành lá rồi tắt bếp. Múc canh cùng cả rau và viên thịt, dùng nóng; không nấu lâu sau khi lá cải đã mềm.',image_url='assets/photos/recipe-73.jpg',prep_time_minutes=30,servings=4 WHERE title='Canh cải thảo viên thịt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh rong biển đậu hũ','Canh rong biển mềm với đậu hũ non và nấm, nêm nước tương cho vị nhẹ nhàng.','1. Ngâm rong biển | Ngâm wakame trong nước sạch 5–10 phút theo bao bì, rửa lại và để ráo. Cắt nhỏ nếu lá dài; rong biển nở nhiều nên cân lúc khô.
2. Sơ chế | Lau hoặc rửa nhanh nấm, bỏ gốc cứng và thái mỏng. Rửa gừng, cắt sợi; lấy đậu hũ khỏi hộp nhẹ tay rồi cắt khối.
3. Nấu nền canh | Đun 1,3 lít nước với gừng. Khi sôi, cho nấm vào nấu 4–5 phút ở lửa vừa để nấm chín và nước canh thơm.
4. Cho đậu | Thêm đậu hũ, nước tương và muối. Hạ lửa cho canh sôi nhẹ 2 phút, dùng muỗng đẩy nhẹ thay vì đảo làm vỡ đậu.
5. Cho rong biển | Thêm rong biển đã ngâm, nấu 1–2 phút đến mềm. Nếm nước canh trước khi thêm muối vì độ mặn của rong biển mỗi loại khác nhau.
6. Hoàn thành | Tắt bếp, nhỏ dầu mè và đảo nhẹ một vòng. Múc vào bát sâu, dùng nóng; không đun tiếp lâu khiến rong biển nhũn và đậu vụn.','assets/photos/recipe-74.jpg',20,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh rong biển đậu hũ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh rong biển mềm với đậu hũ non và nấm, nêm nước tương cho vị nhẹ nhàng.',instructions='1. Ngâm rong biển | Ngâm wakame trong nước sạch 5–10 phút theo bao bì, rửa lại và để ráo. Cắt nhỏ nếu lá dài; rong biển nở nhiều nên cân lúc khô.
2. Sơ chế | Lau hoặc rửa nhanh nấm, bỏ gốc cứng và thái mỏng. Rửa gừng, cắt sợi; lấy đậu hũ khỏi hộp nhẹ tay rồi cắt khối.
3. Nấu nền canh | Đun 1,3 lít nước với gừng. Khi sôi, cho nấm vào nấu 4–5 phút ở lửa vừa để nấm chín và nước canh thơm.
4. Cho đậu | Thêm đậu hũ, nước tương và muối. Hạ lửa cho canh sôi nhẹ 2 phút, dùng muỗng đẩy nhẹ thay vì đảo làm vỡ đậu.
5. Cho rong biển | Thêm rong biển đã ngâm, nấu 1–2 phút đến mềm. Nếm nước canh trước khi thêm muối vì độ mặn của rong biển mỗi loại khác nhau.
6. Hoàn thành | Tắt bếp, nhỏ dầu mè và đảo nhẹ một vòng. Múc vào bát sâu, dùng nóng; không đun tiếp lâu khiến rong biển nhũn và đậu vụn.',image_url='assets/photos/recipe-74.jpg',prep_time_minutes=20,servings=4 WHERE title='Canh rong biển đậu hũ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh chua tôm','Canh tôm chua dịu với dứa, cà chua và đậu bắp, thơm rau ngổ và ngò gai.','1. Sơ chế | Làm sạch tôm, rút chỉ và để lạnh. Rửa rau, cà chua, dứa, đậu bắp và giá; cắt đậu bắp sau khi rửa để ít nhớt.
2. Lấy nước me | Dằm me trong 100 ml nước nóng lấy từ lượng chuẩn bị. Lọc qua rây, bỏ bã; giữ nước me riêng để điều chỉnh độ chua.
3. Nấu rau quả | Đun phần nước còn lại với muối. Cho dứa và cà chua vào nấu 4–5 phút, sau đó thêm đậu bắp, nấu 2 phút.
4. Nêm chua | Thêm nước mắm, đường và khoảng hai phần ba nước me. Khuấy, nếm nước canh rồi thêm nước me còn lại từng ít theo khẩu vị.
5. Nấu tôm | Cho tôm vào, nấu 3–4 phút đến thịt đục hoàn toàn. Thêm giá, chờ canh sôi lại khoảng 1 phút để giá chín mà vẫn giữ giòn.
6. Hoàn thiện | Tắt bếp, thêm rau ngổ và ngò gai, múc ra bát. Dùng nóng với cơm, không nấu tôm tiếp lâu sau khi đã chín.','assets/photos/recipe-75.jpg',35,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh chua tôm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Canh tôm chua dịu với dứa, cà chua và đậu bắp, thơm rau ngổ và ngò gai.',instructions='1. Sơ chế | Làm sạch tôm, rút chỉ và để lạnh. Rửa rau, cà chua, dứa, đậu bắp và giá; cắt đậu bắp sau khi rửa để ít nhớt.
2. Lấy nước me | Dằm me trong 100 ml nước nóng lấy từ lượng chuẩn bị. Lọc qua rây, bỏ bã; giữ nước me riêng để điều chỉnh độ chua.
3. Nấu rau quả | Đun phần nước còn lại với muối. Cho dứa và cà chua vào nấu 4–5 phút, sau đó thêm đậu bắp, nấu 2 phút.
4. Nêm chua | Thêm nước mắm, đường và khoảng hai phần ba nước me. Khuấy, nếm nước canh rồi thêm nước me còn lại từng ít theo khẩu vị.
5. Nấu tôm | Cho tôm vào, nấu 3–4 phút đến thịt đục hoàn toàn. Thêm giá, chờ canh sôi lại khoảng 1 phút để giá chín mà vẫn giữ giòn.
6. Hoàn thiện | Tắt bếp, thêm rau ngổ và ngò gai, múc ra bát. Dùng nóng với cơm, không nấu tôm tiếp lâu sau khi đã chín.',image_url='assets/photos/recipe-75.jpg',prep_time_minutes=35,servings=4 WHERE title='Canh chua tôm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh bầu nấu tôm','Bầu mềm ngọt nấu với tôm băm, nước canh trong và dễ kết hợp với món kho.','1. Sơ chế bầu | Gọt vỏ, rửa bầu và bỏ phần ruột có hạt già. Cắt miếng dày 5 mm, dài khoảng 3 cm; không thái quá mỏng vì bầu dễ nát.
2. Chuẩn bị tôm | Làm sạch tôm, thấm khô rồi băm hoặc đập dập vừa phải. Trộn với nửa nước mắm và tiêu, để 5 phút trong ngăn mát.
3. Xào tôm | Làm nóng dầu ở lửa vừa, phi hành tím 30 giây. Cho tôm vào đảo 1–2 phút đến đổi màu và tách thành các miếng nhỏ.
4. Nấu canh | Thêm 1,3 lít nước và muối, đun sôi, hớt bọt nếu có. Hạ lửa vừa, nấu 2 phút cho tôm chín và nước canh ngọt.
5. Cho bầu | Thêm bầu và nước mắm còn lại. Nấu 4–5 phút đến miếng bầu hơi trong, mềm nhưng còn giữ hình; tôm phải đục hoàn toàn.
6. Dọn | Nếm nước canh rồi tắt bếp, thêm hành lá. Múc ngay ra bát để bầu không tiếp tục nhũn trong nồi nóng, dùng cùng cơm.','assets/photos/recipe-76.jpg',25,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh bầu nấu tôm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Bầu mềm ngọt nấu với tôm băm, nước canh trong và dễ kết hợp với món kho.',instructions='1. Sơ chế bầu | Gọt vỏ, rửa bầu và bỏ phần ruột có hạt già. Cắt miếng dày 5 mm, dài khoảng 3 cm; không thái quá mỏng vì bầu dễ nát.
2. Chuẩn bị tôm | Làm sạch tôm, thấm khô rồi băm hoặc đập dập vừa phải. Trộn với nửa nước mắm và tiêu, để 5 phút trong ngăn mát.
3. Xào tôm | Làm nóng dầu ở lửa vừa, phi hành tím 30 giây. Cho tôm vào đảo 1–2 phút đến đổi màu và tách thành các miếng nhỏ.
4. Nấu canh | Thêm 1,3 lít nước và muối, đun sôi, hớt bọt nếu có. Hạ lửa vừa, nấu 2 phút cho tôm chín và nước canh ngọt.
5. Cho bầu | Thêm bầu và nước mắm còn lại. Nấu 4–5 phút đến miếng bầu hơi trong, mềm nhưng còn giữ hình; tôm phải đục hoàn toàn.
6. Dọn | Nếm nước canh rồi tắt bếp, thêm hành lá. Múc ngay ra bát để bầu không tiếp tục nhũn trong nồi nóng, dùng cùng cơm.',image_url='assets/photos/recipe-76.jpg',prep_time_minutes=25,servings=4 WHERE title='Canh bầu nấu tôm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Súp bí đỏ','Súp bí đỏ xay mịn với khoai tây và sữa, béo dịu, dùng nóng cùng bánh mì.','1. Sơ chế | Gọt bí và khoai, bỏ hạt bí, rửa sạch. Cắt cả hai thành khối khoảng 2 cm để chín cùng lúc; băm hành tây.
2. Xào hành | Cho bơ vào nồi ở lửa vừa nhỏ. Khi tan, thêm hành tây đảo 3 phút đến trong, không để hành hoặc bơ cháy nâu.
3. Ninh rau củ | Thêm bí, khoai và 650 ml nước, đun sôi. Hạ lửa nhỏ, đậy hé nắp và nấu 18–22 phút đến khi miếng khoai dễ nghiền bằng muỗng.
4. Xay mịn | Tắt bếp, đợi nguội bớt khoảng 5 phút. Dùng máy xay cầm tay ngay trong nồi; nếu dùng cối thường, làm nguội và tuân theo hướng dẫn xay chất lỏng của máy.
5. Thêm sữa | Cho súp về lửa nhỏ, thêm sữa, muối và tiêu, khuấy đều 3–4 phút. Chỉ đun nóng nhẹ, không để sôi trào; thêm chút nước nếu súp quá đặc.
6. Dọn súp | Nếm lại và tắt bếp. Múc vào bát, dùng nóng cùng bánh mì; súp đạt khi mịn và chảy chậm khỏi muỗng, không vón hoặc có miếng khoai cứng.','assets/photos/recipe-77.jpg',40,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Súp bí đỏ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Súp bí đỏ xay mịn với khoai tây và sữa, béo dịu, dùng nóng cùng bánh mì.',instructions='1. Sơ chế | Gọt bí và khoai, bỏ hạt bí, rửa sạch. Cắt cả hai thành khối khoảng 2 cm để chín cùng lúc; băm hành tây.
2. Xào hành | Cho bơ vào nồi ở lửa vừa nhỏ. Khi tan, thêm hành tây đảo 3 phút đến trong, không để hành hoặc bơ cháy nâu.
3. Ninh rau củ | Thêm bí, khoai và 650 ml nước, đun sôi. Hạ lửa nhỏ, đậy hé nắp và nấu 18–22 phút đến khi miếng khoai dễ nghiền bằng muỗng.
4. Xay mịn | Tắt bếp, đợi nguội bớt khoảng 5 phút. Dùng máy xay cầm tay ngay trong nồi; nếu dùng cối thường, làm nguội và tuân theo hướng dẫn xay chất lỏng của máy.
5. Thêm sữa | Cho súp về lửa nhỏ, thêm sữa, muối và tiêu, khuấy đều 3–4 phút. Chỉ đun nóng nhẹ, không để sôi trào; thêm chút nước nếu súp quá đặc.
6. Dọn súp | Nếm lại và tắt bếp. Múc vào bát, dùng nóng cùng bánh mì; súp đạt khi mịn và chảy chậm khỏi muỗng, không vón hoặc có miếng khoai cứng.',image_url='assets/photos/recipe-77.jpg',prep_time_minutes=40,servings=4 WHERE title='Súp bí đỏ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cải thìa xào nấm','Cải thìa xanh giòn và nấm tươi xào tỏi, sốt nước tương nhẹ cho bữa cơm.','1. Rửa cải | Cắt bỏ gốc già, tách hoặc chẻ đôi cải thìa. Rửa kỹ đất giữa các bẹ, để ráo; cây lớn nên để bẹ riêng với phần lá.
2. Chuẩn bị nấm | Bỏ chân cứng, rửa nhanh và thái lát dày 5 mm. Băm tỏi, pha nước tương với đường và 40 ml nước.
3. Phi tỏi | Làm nóng dầu ở lửa vừa lớn. Cho tỏi vào đảo 15–20 giây đến thơm, không để vàng đậm trước khi cho nấm.
4. Xào nấm | Thêm nấm, dàn đều và xào 3–4 phút cho nấm mềm, nước tiết ra gần cạn. Đảo nhẹ để nấm không dính đáy.
5. Xào cải | Cho bẹ cải vào trước, đảo 1 phút, thêm lá và sốt. Xào thêm 2–3 phút đến cải vừa mềm; có thể đậy nắp 30 giây nếu bẹ còn cứng.
6. Hoàn thành | Nếm sốt và tắt bếp khi cải vẫn xanh, nấm chín mềm. Trút ngay ra đĩa rộng, tránh để trong chảo nóng khiến cải nhũn.','assets/photos/recipe-78.jpg',20,4 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cải thìa xào nấm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Cải thìa xanh giòn và nấm tươi xào tỏi, sốt nước tương nhẹ cho bữa cơm.',instructions='1. Rửa cải | Cắt bỏ gốc già, tách hoặc chẻ đôi cải thìa. Rửa kỹ đất giữa các bẹ, để ráo; cây lớn nên để bẹ riêng với phần lá.
2. Chuẩn bị nấm | Bỏ chân cứng, rửa nhanh và thái lát dày 5 mm. Băm tỏi, pha nước tương với đường và 40 ml nước.
3. Phi tỏi | Làm nóng dầu ở lửa vừa lớn. Cho tỏi vào đảo 15–20 giây đến thơm, không để vàng đậm trước khi cho nấm.
4. Xào nấm | Thêm nấm, dàn đều và xào 3–4 phút cho nấm mềm, nước tiết ra gần cạn. Đảo nhẹ để nấm không dính đáy.
5. Xào cải | Cho bẹ cải vào trước, đảo 1 phút, thêm lá và sốt. Xào thêm 2–3 phút đến cải vừa mềm; có thể đậy nắp 30 giây nếu bẹ còn cứng.
6. Hoàn thành | Nếm sốt và tắt bếp khi cải vẫn xanh, nấm chín mềm. Trút ngay ra đĩa rộng, tránh để trong chảo nóng khiến cải nhũn.',image_url='assets/photos/recipe-78.jpg',prep_time_minutes=20,servings=4 WHERE title='Cải thìa xào nấm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Su su xào trứng','Su su thái sợi giòn nhẹ, xào cùng trứng mềm và hành lá, đơn giản cho bữa cơm.','1. Sơ chế su su | Gọt vỏ bằng găng nếu nhựa gây dính tay, bỏ hạt và rửa. Thái sợi dày 3 mm, để ráo; tránh sợi quá mỏng dễ mềm nhũn.
2. Đánh trứng | Đập từng trứng vào bát nhỏ để kiểm tra rồi gom chung. Thêm muối và tiêu, dùng đũa đánh tan, không cần tạo nhiều bọt.
3. Xào trứng | Làm nóng 1 muỗng canh dầu ở lửa vừa. Đổ trứng, đảo nhẹ thành miếng và nấu đến trứng đông hoàn toàn, không còn phần lỏng; trút ra đĩa sạch.
4. Xào su su | Cho dầu còn lại và tỏi vào chảo, phi 20 giây. Thêm su su, đảo 2 phút, đổ 40 ml nước và đậy nắp 2 phút.
5. Trộn | Mở nắp, thêm nước mắm, xào 1–2 phút cho su su vừa mềm. Cho trứng trở lại, đảo nhẹ 30–60 giây tránh nghiền trứng thành vụn.
6. Hoàn thành | Tắt bếp, thêm hành lá và dọn ngay. Su su còn chút giòn, trứng chín mềm; nếu chảo nhiều nước, thu cạn bớt trước khi trộn trứng.','assets/photos/recipe-79.jpg',25,4 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Su su xào trứng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Su su thái sợi giòn nhẹ, xào cùng trứng mềm và hành lá, đơn giản cho bữa cơm.',instructions='1. Sơ chế su su | Gọt vỏ bằng găng nếu nhựa gây dính tay, bỏ hạt và rửa. Thái sợi dày 3 mm, để ráo; tránh sợi quá mỏng dễ mềm nhũn.
2. Đánh trứng | Đập từng trứng vào bát nhỏ để kiểm tra rồi gom chung. Thêm muối và tiêu, dùng đũa đánh tan, không cần tạo nhiều bọt.
3. Xào trứng | Làm nóng 1 muỗng canh dầu ở lửa vừa. Đổ trứng, đảo nhẹ thành miếng và nấu đến trứng đông hoàn toàn, không còn phần lỏng; trút ra đĩa sạch.
4. Xào su su | Cho dầu còn lại và tỏi vào chảo, phi 20 giây. Thêm su su, đảo 2 phút, đổ 40 ml nước và đậy nắp 2 phút.
5. Trộn | Mở nắp, thêm nước mắm, xào 1–2 phút cho su su vừa mềm. Cho trứng trở lại, đảo nhẹ 30–60 giây tránh nghiền trứng thành vụn.
6. Hoàn thành | Tắt bếp, thêm hành lá và dọn ngay. Su su còn chút giòn, trứng chín mềm; nếu chảo nhiều nước, thu cạn bớt trước khi trộn trứng.',image_url='assets/photos/recipe-79.jpg',prep_time_minutes=25,servings=4 WHERE title='Su su xào trứng';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Đậu que xào tỏi','Đậu que chín kỹ mà vẫn giòn, áo dầu tỏi và nước tương thơm nhẹ.','1. Chuẩn bị | Nhặt hai đầu đậu, tước xơ nếu có, rửa và cắt khúc. Băm tỏi; chọn các khúc tương đối đều để không có phần còn sống.
2. Chần | Đun 970 ml nước với nửa muối. Cho đậu vào khi nước sôi, chần 4–5 phút đến bớt cứng; không chỉ nhúng vài giây.
3. Để ráo | Vớt đậu ra rổ, để ráo 1 phút. Pha nước tương, đường, muối còn lại và 30 ml nước chừa sẵn.
4. Phi tỏi | Làm nóng dầu ở lửa vừa, cho tỏi đảo 20–30 giây đến thơm. Không để tỏi sậm màu vì còn phải xào cùng đậu.
5. Xào chín | Cho đậu và sốt vào, xào 3–4 phút. Đậy 1 phút nếu đậu còn cứng; kiểm tra khúc dày đã chín, không còn vị hăng của đậu sống.
6. Dọn | Mở nắp thu bớt nước, đảo thêm 30 giây rồi tắt bếp. Dọn ngay ra đĩa, giữ đậu giòn vừa và phủ tỏi đều.','assets/photos/recipe-80.jpg',20,4 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Đậu que xào tỏi');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Đậu que chín kỹ mà vẫn giòn, áo dầu tỏi và nước tương thơm nhẹ.',instructions='1. Chuẩn bị | Nhặt hai đầu đậu, tước xơ nếu có, rửa và cắt khúc. Băm tỏi; chọn các khúc tương đối đều để không có phần còn sống.
2. Chần | Đun 970 ml nước với nửa muối. Cho đậu vào khi nước sôi, chần 4–5 phút đến bớt cứng; không chỉ nhúng vài giây.
3. Để ráo | Vớt đậu ra rổ, để ráo 1 phút. Pha nước tương, đường, muối còn lại và 30 ml nước chừa sẵn.
4. Phi tỏi | Làm nóng dầu ở lửa vừa, cho tỏi đảo 20–30 giây đến thơm. Không để tỏi sậm màu vì còn phải xào cùng đậu.
5. Xào chín | Cho đậu và sốt vào, xào 3–4 phút. Đậy 1 phút nếu đậu còn cứng; kiểm tra khúc dày đã chín, không còn vị hăng của đậu sống.
6. Dọn | Mở nắp thu bớt nước, đảo thêm 30 giây rồi tắt bếp. Dọn ngay ra đĩa, giữ đậu giòn vừa và phủ tỏi đều.',image_url='assets/photos/recipe-80.jpg',prep_time_minutes=20,servings=4 WHERE title='Đậu que xào tỏi';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Salad khoai tây','Khoai tây, cà rốt, dưa chuột và trứng trộn sốt mayonnaise nhẹ, dùng mát.','1. Chuẩn bị | Rửa rau củ, gọt và cắt đúng kích thước. Cho khoai vào nồi với 1 lít nước và nửa muối; phần nước còn lại dùng cho nồi trứng.
2. Luộc khoai và cà rốt | Đun khoai 12–15 phút từ lúc sôi nhẹ; cho cà rốt vào 6–7 phút cuối. Xiên khoai thấy vừa mềm thì vớt, để ráo và tản ra khay sạch cho nguội.
3. Luộc trứng | Cho trứng vào nồi nước còn lại, đun sôi nhẹ rồi nấu 10–12 phút để lòng đỏ chín chắc. Làm nguội, bóc vỏ và cắt miếng, giữ dụng cụ sạch.
4. Pha sốt | Khuấy mayonnaise, sữa chua, muối còn lại và tiêu. Để sốt trong ngăn mát trong lúc rau củ nguội, không trộn sốt vào khoai còn nóng.
5. Trộn | Khi khoai không còn nóng, trộn nhẹ với cà rốt, dưa chuột và sốt. Thêm trứng cuối cùng và đảo một vòng để miếng trứng không nát.
6. Dùng mát | Chuyển salad vào hộp sạch có nắp, dùng ngay hoặc để ngăn mát khoảng 15 phút. Không để salad có trứng và sốt lâu ngoài nhiệt độ phòng.','assets/photos/recipe-81.jpg',40,4 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Salad khoai tây');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Khoai tây, cà rốt, dưa chuột và trứng trộn sốt mayonnaise nhẹ, dùng mát.',instructions='1. Chuẩn bị | Rửa rau củ, gọt và cắt đúng kích thước. Cho khoai vào nồi với 1 lít nước và nửa muối; phần nước còn lại dùng cho nồi trứng.
2. Luộc khoai và cà rốt | Đun khoai 12–15 phút từ lúc sôi nhẹ; cho cà rốt vào 6–7 phút cuối. Xiên khoai thấy vừa mềm thì vớt, để ráo và tản ra khay sạch cho nguội.
3. Luộc trứng | Cho trứng vào nồi nước còn lại, đun sôi nhẹ rồi nấu 10–12 phút để lòng đỏ chín chắc. Làm nguội, bóc vỏ và cắt miếng, giữ dụng cụ sạch.
4. Pha sốt | Khuấy mayonnaise, sữa chua, muối còn lại và tiêu. Để sốt trong ngăn mát trong lúc rau củ nguội, không trộn sốt vào khoai còn nóng.
5. Trộn | Khi khoai không còn nóng, trộn nhẹ với cà rốt, dưa chuột và sốt. Thêm trứng cuối cùng và đảo một vòng để miếng trứng không nát.
6. Dùng mát | Chuyển salad vào hộp sạch có nắp, dùng ngay hoặc để ngăn mát khoảng 15 phút. Không để salad có trứng và sốt lâu ngoài nhiệt độ phòng.',image_url='assets/photos/recipe-81.jpg',prep_time_minutes=40,servings=4 WHERE title='Salad khoai tây';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Đậu hũ chiên sả','Đậu hũ vàng nhẹ, phủ sả và tỏi thơm giòn, dùng với cơm và rau.','1. Làm ráo đậu | Đặt đậu trên rổ khoảng 5 phút rồi thấm nhẹ bằng giấy bếp. Cắt khối đều, tránh ép quá mạnh làm đậu nứt.
2. Chuẩn bị sả | Bỏ lớp sả cứng, rửa phần gốc non và băm thật nhỏ. Băm tỏi, ớt; pha nước tương, đường, muối và 20 ml nước.
3. Chiên mặt đầu | Làm nóng dầu ở lửa vừa. Xếp đậu một lớp, để yên 3–4 phút đến vàng rồi trở nhẹ; không đảo liên tục khi vỏ chưa định hình.
4. Chiên đều | Trở thêm các mặt, chiên tổng khoảng 10–12 phút tùy kích thước. Gắp đậu ra đĩa, giữ lại khoảng 1 muỗng canh dầu trong chảo.
5. Xào sả | Hạ lửa vừa nhỏ, đảo sả 2 phút rồi thêm tỏi và ớt 30 giây. Đổ sốt vào, khuấy 20 giây, tránh để sả cháy khô.
6. Áo đậu | Cho đậu vào trở nhẹ 1–2 phút để bám sả và gia vị. Tắt bếp, dọn nóng; phần sả vàng thơm, không bị đen hoặc xơ cứng.','assets/photos/recipe-82.jpg',30,4 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Đậu hũ chiên sả');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Đậu hũ vàng nhẹ, phủ sả và tỏi thơm giòn, dùng với cơm và rau.',instructions='1. Làm ráo đậu | Đặt đậu trên rổ khoảng 5 phút rồi thấm nhẹ bằng giấy bếp. Cắt khối đều, tránh ép quá mạnh làm đậu nứt.
2. Chuẩn bị sả | Bỏ lớp sả cứng, rửa phần gốc non và băm thật nhỏ. Băm tỏi, ớt; pha nước tương, đường, muối và 20 ml nước.
3. Chiên mặt đầu | Làm nóng dầu ở lửa vừa. Xếp đậu một lớp, để yên 3–4 phút đến vàng rồi trở nhẹ; không đảo liên tục khi vỏ chưa định hình.
4. Chiên đều | Trở thêm các mặt, chiên tổng khoảng 10–12 phút tùy kích thước. Gắp đậu ra đĩa, giữ lại khoảng 1 muỗng canh dầu trong chảo.
5. Xào sả | Hạ lửa vừa nhỏ, đảo sả 2 phút rồi thêm tỏi và ớt 30 giây. Đổ sốt vào, khuấy 20 giây, tránh để sả cháy khô.
6. Áo đậu | Cho đậu vào trở nhẹ 1–2 phút để bám sả và gia vị. Tắt bếp, dọn nóng; phần sả vàng thơm, không bị đen hoặc xơ cứng.',image_url='assets/photos/recipe-82.jpg',prep_time_minutes=30,servings=4 WHERE title='Đậu hũ chiên sả';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Đậu hũ hấp nấm','Đậu hũ non hấp cùng nấm hương và sốt nước tương, mềm nhẹ và ít dầu.','1. Chuẩn bị | Lấy đậu ra hộp, để ráo rồi cắt nhẹ bằng dao sạch. Rửa nấm nhanh, bỏ chân cứng, thái lát; rửa gừng và hành.
2. Nấu nấm | Đun 80 ml nước với nước tương, đường và gừng. Cho nấm vào, nấu sôi nhẹ 4–5 phút đến mềm; nấm cần chín trước khi áo lên đậu.
3. Làm sốt | Hòa bột bắp với 20 ml nước còn lại, khuấy rồi rót vào nồi nấm. Nấu 1 phút đến sốt hơi sánh, tắt bếp và trộn dầu mè.
4. Xếp đĩa | Xếp đậu vào đĩa sâu chịu nhiệt một lớp. Rưới nấm và sốt lên, giữ miếng đậu tách nhẹ để hơi nóng vào đều.
5. Hấp | Đặt đĩa lên xửng nước đã sôi, đậy nắp và hấp lửa vừa 10–12 phút. Không để nước dưới đáy chạm đĩa hoặc xửng cạn.
6. Dọn | Nhấc đĩa bằng găng, rắc hành lá và dùng ngay. Dùng muỗng lớn lấy cả đậu với nấm, tránh đảo trong đĩa làm đậu vụn.','assets/photos/recipe-83.jpg',35,4 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Đậu hũ hấp nấm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Đậu hũ non hấp cùng nấm hương và sốt nước tương, mềm nhẹ và ít dầu.',instructions='1. Chuẩn bị | Lấy đậu ra hộp, để ráo rồi cắt nhẹ bằng dao sạch. Rửa nấm nhanh, bỏ chân cứng, thái lát; rửa gừng và hành.
2. Nấu nấm | Đun 80 ml nước với nước tương, đường và gừng. Cho nấm vào, nấu sôi nhẹ 4–5 phút đến mềm; nấm cần chín trước khi áo lên đậu.
3. Làm sốt | Hòa bột bắp với 20 ml nước còn lại, khuấy rồi rót vào nồi nấm. Nấu 1 phút đến sốt hơi sánh, tắt bếp và trộn dầu mè.
4. Xếp đĩa | Xếp đậu vào đĩa sâu chịu nhiệt một lớp. Rưới nấm và sốt lên, giữ miếng đậu tách nhẹ để hơi nóng vào đều.
5. Hấp | Đặt đĩa lên xửng nước đã sôi, đậy nắp và hấp lửa vừa 10–12 phút. Không để nước dưới đáy chạm đĩa hoặc xửng cạn.
6. Dọn | Nhấc đĩa bằng găng, rắc hành lá và dùng ngay. Dùng muỗng lớn lấy cả đậu với nấm, tránh đảo trong đĩa làm đậu vụn.',image_url='assets/photos/recipe-83.jpg',prep_time_minutes=35,servings=4 WHERE title='Đậu hũ hấp nấm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cà ri rau củ','Khoai, cà rốt, nấm và đậu hũ trong sốt cà ri nước cốt dừa, dùng cùng bánh mì hoặc cơm.','1. Sơ chế | Gọt khoai và cà rốt, rửa và cắt đều. Ngâm khoai trong nước sạch trong lúc chuẩn bị nấm, đậu và hành tây; để ráo trước khi nấu.
2. Xào thơm | Làm nóng dầu ở lửa vừa nhỏ, xào hành 2 phút, thêm sả và bột cà ri đảo 20 giây. Không rang bột khô lâu vì dễ cháy đắng.
3. Nấu củ cứng | Cho khoai tây, cà rốt và 700 ml nước vào, thêm muối. Đun sôi rồi nấu lửa vừa nhỏ 10 phút, đậy hé nắp.
4. Thêm khoai lang | Cho khoai lang, nấm và đậu vào, đảo nhẹ. Nấu thêm 10–12 phút đến các củ gần mềm; thêm nước nóng nếu nước cạn sớm.
5. Hoàn thiện sốt | Thêm nước cốt dừa, nước tương và đường, nấu sôi nhẹ 5 phút. Kiểm tra khoai mềm bằng đầu đũa, nấm chín; không đun sôi quá mạnh.
6. Dọn | Nếm và tắt bếp, lấy sả ra trước khi dùng. Múc rau củ cùng sốt, dọn với bánh mì; sốt sánh vừa và các miếng khoai còn nguyên.','assets/photos/recipe-84.jpg',50,4 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cà ri rau củ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Khoai, cà rốt, nấm và đậu hũ trong sốt cà ri nước cốt dừa, dùng cùng bánh mì hoặc cơm.',instructions='1. Sơ chế | Gọt khoai và cà rốt, rửa và cắt đều. Ngâm khoai trong nước sạch trong lúc chuẩn bị nấm, đậu và hành tây; để ráo trước khi nấu.
2. Xào thơm | Làm nóng dầu ở lửa vừa nhỏ, xào hành 2 phút, thêm sả và bột cà ri đảo 20 giây. Không rang bột khô lâu vì dễ cháy đắng.
3. Nấu củ cứng | Cho khoai tây, cà rốt và 700 ml nước vào, thêm muối. Đun sôi rồi nấu lửa vừa nhỏ 10 phút, đậy hé nắp.
4. Thêm khoai lang | Cho khoai lang, nấm và đậu vào, đảo nhẹ. Nấu thêm 10–12 phút đến các củ gần mềm; thêm nước nóng nếu nước cạn sớm.
5. Hoàn thiện sốt | Thêm nước cốt dừa, nước tương và đường, nấu sôi nhẹ 5 phút. Kiểm tra khoai mềm bằng đầu đũa, nấm chín; không đun sôi quá mạnh.
6. Dọn | Nếm và tắt bếp, lấy sả ra trước khi dùng. Múc rau củ cùng sốt, dọn với bánh mì; sốt sánh vừa và các miếng khoai còn nguyên.',image_url='assets/photos/recipe-84.jpg',prep_time_minutes=50,servings=4 WHERE title='Cà ri rau củ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Miến xào nấm','Miến tơi sợi xào nấm, cà rốt và cải thảo, vị nước tương nhẹ và thơm dầu mè.','1. Chuẩn bị miến | Ngâm miến theo thời gian trên bao bì đến mềm dẻo, không nhũn. Vớt ráo, cắt đoạn khoảng 15 cm; tránh ngâm quá lâu.
2. Sơ chế rau | Rửa nấm, cà rốt và cải, thái đều. Để bẹ cải riêng với lá; băm tỏi và pha nước tương, đường với 120 ml nước.
3. Xào nấm | Phi tỏi với dầu ở lửa vừa 20 giây. Cho nấm vào xào 3 phút đến chín, thêm cà rốt và bẹ cải, xào tiếp 2 phút.
4. Cho miến | Thêm miến, lá cải và khoảng hai phần ba sốt. Dùng hai đũa hoặc kẹp nâng và đảo nhẹ 2 phút để sốt thấm đều.
5. Điều chỉnh | Nếu miến còn cứng, thêm phần sốt còn lại từng ít và đậy nắp 1 phút. Mở nắp, xào đến miến chín mềm nhưng tơi, rau vừa chín.
6. Hoàn thành | Tắt bếp, trộn dầu mè và nếm lại. Dọn ngay; không để miến trong chảo lâu vì hơi nóng còn lại làm sợi dính và mềm quá.','assets/photos/recipe-85.jpg',30,4 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Miến xào nấm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món chay'),description='Miến tơi sợi xào nấm, cà rốt và cải thảo, vị nước tương nhẹ và thơm dầu mè.',instructions='1. Chuẩn bị miến | Ngâm miến theo thời gian trên bao bì đến mềm dẻo, không nhũn. Vớt ráo, cắt đoạn khoảng 15 cm; tránh ngâm quá lâu.
2. Sơ chế rau | Rửa nấm, cà rốt và cải, thái đều. Để bẹ cải riêng với lá; băm tỏi và pha nước tương, đường với 120 ml nước.
3. Xào nấm | Phi tỏi với dầu ở lửa vừa 20 giây. Cho nấm vào xào 3 phút đến chín, thêm cà rốt và bẹ cải, xào tiếp 2 phút.
4. Cho miến | Thêm miến, lá cải và khoảng hai phần ba sốt. Dùng hai đũa hoặc kẹp nâng và đảo nhẹ 2 phút để sốt thấm đều.
5. Điều chỉnh | Nếu miến còn cứng, thêm phần sốt còn lại từng ít và đậy nắp 1 phút. Mở nắp, xào đến miến chín mềm nhưng tơi, rau vừa chín.
6. Hoàn thành | Tắt bếp, trộn dầu mè và nếm lại. Dọn ngay; không để miến trong chảo lâu vì hơi nóng còn lại làm sợi dính và mềm quá.',image_url='assets/photos/recipe-85.jpg',prep_time_minutes=30,servings=4 WHERE title='Miến xào nấm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Xôi gấc','Xôi nếp đỏ cam từ gấc, dẻo thơm nước cốt dừa, nấu bằng xửng hấp.','1. Ngâm nếp | Vo nếp nhẹ tay, ngâm trong nước sạch 4–6 giờ ở nơi mát, ưu tiên ngăn mát. Xả lại, để rổ ráo 15 phút trước khi trộn.
2. Lấy màu gấc | Tách màng đỏ khỏi hạt bằng tay có găng hoặc muỗng. Trộn màng với nếp, muối và dầu đến màu đều; kiểm tra nhặt hết hạt gấc.
3. Chuẩn bị xửng | Đun nước sôi, lót xửng bằng tấm hấp thực phẩm. Rải nếp tơi, tạo vài lỗ nhỏ cho hơi lên; nước dưới đáy không chạm nếp.
4. Hấp lần một | Hấp lửa vừa 25 phút, đậy nắp, lau nước ngưng ở nắp khi mở. Xới nhẹ từ ngoài vào trong để nếp chín đều, kiểm tra nước đáy nồi.
5. Thêm cốt dừa | Khuấy đường vào nước cốt dừa, rưới từng ít lên nếp và trộn nhẹ. Hấp tiếp 10–15 phút đến hạt nếp mềm dẻo, không còn lõi cứng.
6. Ủ và dọn | Tắt bếp, giữ nắp 5 phút rồi xới tơi, dọn nóng. Nếu còn lõi cứng, rưới 1–2 muỗng nước nóng và hấp thêm trước khi dọn.','assets/photos/recipe-86.jpg',60,4 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Xôi gấc');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Xôi nếp đỏ cam từ gấc, dẻo thơm nước cốt dừa, nấu bằng xửng hấp.',instructions='1. Ngâm nếp | Vo nếp nhẹ tay, ngâm trong nước sạch 4–6 giờ ở nơi mát, ưu tiên ngăn mát. Xả lại, để rổ ráo 15 phút trước khi trộn.
2. Lấy màu gấc | Tách màng đỏ khỏi hạt bằng tay có găng hoặc muỗng. Trộn màng với nếp, muối và dầu đến màu đều; kiểm tra nhặt hết hạt gấc.
3. Chuẩn bị xửng | Đun nước sôi, lót xửng bằng tấm hấp thực phẩm. Rải nếp tơi, tạo vài lỗ nhỏ cho hơi lên; nước dưới đáy không chạm nếp.
4. Hấp lần một | Hấp lửa vừa 25 phút, đậy nắp, lau nước ngưng ở nắp khi mở. Xới nhẹ từ ngoài vào trong để nếp chín đều, kiểm tra nước đáy nồi.
5. Thêm cốt dừa | Khuấy đường vào nước cốt dừa, rưới từng ít lên nếp và trộn nhẹ. Hấp tiếp 10–15 phút đến hạt nếp mềm dẻo, không còn lõi cứng.
6. Ủ và dọn | Tắt bếp, giữ nắp 5 phút rồi xới tơi, dọn nóng. Nếu còn lõi cứng, rưới 1–2 muỗng nước nóng và hấp thêm trước khi dọn.',image_url='assets/photos/recipe-86.jpg',prep_time_minutes=60,servings=4 WHERE title='Xôi gấc';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm cuộn rong biển','Cơm cuộn với trứng chín, cà rốt, dưa chuột và thanh cua, dễ chia thành phần nhỏ.','1. Chuẩn bị cơm | Trộn cơm ấm với nửa muối, dầu mè và mè rang. Tản ra khay sạch cho bớt nóng, không để cơm ngoài nhiệt độ phòng lâu.
2. Sơ chế nhân | Rửa cà rốt và dưa chuột, thái sợi dài. Xào cà rốt với nửa dầu 2–3 phút; chuẩn bị thanh cua theo hướng dẫn bao bì, không dùng loại cần nấu mà còn sống.
3. Tráng trứng | Đánh trứng với muối còn lại. Làm nóng dầu còn lại, tráng thành lớp mỏng ở lửa vừa; nấu đến trứng đông hoàn toàn, lấy ra cắt thanh.
4. Xếp cuộn | Đặt nori lên mành sạch, mặt bóng xuống. Dàn khoảng 120 g cơm thành lớp mỏng, chừa mép cuối 2 cm; xếp nhân ngang ở một phần ba phía gần tay.
5. Cuộn | Nâng mành và cuộn ôm nhân, ép nhẹ từng đoạn. Thấm một chút nước lên mép nori để dính, rút mành ra, không cuộn mành vào trong cơm.
6. Cắt và dùng | Dùng dao sạch hơi ẩm cắt khoanh 2 cm, lau dao giữa các lần. Dùng ngay hoặc giữ trong ngăn mát và làm theo hướng dẫn bảo quản thanh cua.','assets/photos/recipe-87.jpg',45,4 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm cuộn rong biển');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Cơm cuộn với trứng chín, cà rốt, dưa chuột và thanh cua, dễ chia thành phần nhỏ.',instructions='1. Chuẩn bị cơm | Trộn cơm ấm với nửa muối, dầu mè và mè rang. Tản ra khay sạch cho bớt nóng, không để cơm ngoài nhiệt độ phòng lâu.
2. Sơ chế nhân | Rửa cà rốt và dưa chuột, thái sợi dài. Xào cà rốt với nửa dầu 2–3 phút; chuẩn bị thanh cua theo hướng dẫn bao bì, không dùng loại cần nấu mà còn sống.
3. Tráng trứng | Đánh trứng với muối còn lại. Làm nóng dầu còn lại, tráng thành lớp mỏng ở lửa vừa; nấu đến trứng đông hoàn toàn, lấy ra cắt thanh.
4. Xếp cuộn | Đặt nori lên mành sạch, mặt bóng xuống. Dàn khoảng 120 g cơm thành lớp mỏng, chừa mép cuối 2 cm; xếp nhân ngang ở một phần ba phía gần tay.
5. Cuộn | Nâng mành và cuộn ôm nhân, ép nhẹ từng đoạn. Thấm một chút nước lên mép nori để dính, rút mành ra, không cuộn mành vào trong cơm.
6. Cắt và dùng | Dùng dao sạch hơi ẩm cắt khoanh 2 cm, lau dao giữa các lần. Dùng ngay hoặc giữ trong ngăn mát và làm theo hướng dẫn bảo quản thanh cua.',image_url='assets/photos/recipe-87.jpg',prep_time_minutes=45,servings=4 WHERE title='Cơm cuộn rong biển';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cháo sườn','Cháo gạo sánh mềm ninh với sườn, dùng nóng cùng hành lá và tiêu.','1. Làm sạch sườn | Kiểm tra bỏ mảnh xương vụn, chần sườn trong nồi nước sôi 2 phút. Gắp ra, rửa nhanh và làm sạch nồi; nước chần không dùng nấu cháo.
2. Ninh sườn | Cho sườn, hành tím, muối và 2,3 lít nước vào nồi. Đun sôi, hớt bọt rồi ninh nhỏ lửa 35 phút, đậy hé nắp.
3. Chuẩn bị gạo | Trong lúc ninh, vo gạo tẻ và gạo nếp, để ráo. Muốn cháo nhuyễn hơn, giã hoặc xay gạo khô vỡ hạt trước khi vo, không cần xay thành bột.
4. Nấu cháo | Cho gạo vào nước sườn, khuấy để hạt không dính đáy. Nấu liu riu 40–50 phút, khuấy sát đáy mỗi 5–7 phút và châm nước nóng nếu quá đặc.
5. Kiểm tra | Gạo phải nở mềm, không còn lõi cứng; sườn mềm và thịt chín hoàn toàn. Thêm nước mắm, nấu thêm 2 phút; không nêm quá đậm khi cháo còn đang cạn.
6. Hoàn thành | Tắt bếp, múc ra bát, rắc hành và tiêu. Chia sườn cẩn thận, kiểm tra xương nhỏ; cháo đặc thêm khi nguội nên có thể pha chút nước nóng trước khi dọn.','assets/photos/recipe-88.jpg',110,4 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cháo sườn');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Cháo gạo sánh mềm ninh với sườn, dùng nóng cùng hành lá và tiêu.',instructions='1. Làm sạch sườn | Kiểm tra bỏ mảnh xương vụn, chần sườn trong nồi nước sôi 2 phút. Gắp ra, rửa nhanh và làm sạch nồi; nước chần không dùng nấu cháo.
2. Ninh sườn | Cho sườn, hành tím, muối và 2,3 lít nước vào nồi. Đun sôi, hớt bọt rồi ninh nhỏ lửa 35 phút, đậy hé nắp.
3. Chuẩn bị gạo | Trong lúc ninh, vo gạo tẻ và gạo nếp, để ráo. Muốn cháo nhuyễn hơn, giã hoặc xay gạo khô vỡ hạt trước khi vo, không cần xay thành bột.
4. Nấu cháo | Cho gạo vào nước sườn, khuấy để hạt không dính đáy. Nấu liu riu 40–50 phút, khuấy sát đáy mỗi 5–7 phút và châm nước nóng nếu quá đặc.
5. Kiểm tra | Gạo phải nở mềm, không còn lõi cứng; sườn mềm và thịt chín hoàn toàn. Thêm nước mắm, nấu thêm 2 phút; không nêm quá đậm khi cháo còn đang cạn.
6. Hoàn thành | Tắt bếp, múc ra bát, rắc hành và tiêu. Chia sườn cẩn thận, kiểm tra xương nhỏ; cháo đặc thêm khi nguội nên có thể pha chút nước nóng trước khi dọn.',image_url='assets/photos/recipe-88.jpg',prep_time_minutes=110,servings=4 WHERE title='Cháo sườn';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún chả','Bún chả phiên bản áp chảo tại nhà: chả viên, ba chỉ, nước mắm chua ngọt và rau thơm.','1. Ướp thịt | Trộn 1 muỗng canh nước mắm, 1 muỗng canh đường, hành tím, nửa tỏi và tiêu, chia cho thịt băm và ba chỉ. Ướp ngăn mát 20 phút, vo thịt băm thành viên dẹt dày 1 cm.
2. Chuẩn bị rau | Rửa rau thơm kỹ, để ráo. Gọt đu đủ và cà rốt, thái mỏng; trộn với 1 muỗng canh giấm lấy từ lượng chuẩn bị, để 10 phút rồi gạn nước.
3. Pha nước chấm | Đun 250 ml nước với đường và nước mắm còn lại 1 phút. Để ấm, thêm giấm còn lại và tỏi băm; nếm vị chua ngọt trước khi thêm rau củ.
4. Áp chả viên | Quét nửa dầu lên chảo, áp chả lửa vừa 4 phút mỗi mặt. Nấu thêm nếu cần để giữa viên đạt 71°C; gắp ra đĩa sạch.
5. Áp ba chỉ | Dùng phần dầu còn lại, áp ba chỉ thành từng mẻ 3–4 phút mỗi mặt. Thịt cần đạt 63°C và nghỉ ít nhất 3 phút; không để đường ướp cháy đen.
6. Dọn bún | Chuẩn bị bún theo hướng dẫn nơi bán, chia ra đĩa cùng rau. Cho chả và ba chỉ vào bát nước chấm ấm cùng đu đủ, cà rốt; dùng ngay.','assets/photos/recipe-89.jpg',60,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún chả');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Bún chả phiên bản áp chảo tại nhà: chả viên, ba chỉ, nước mắm chua ngọt và rau thơm.',instructions='1. Ướp thịt | Trộn 1 muỗng canh nước mắm, 1 muỗng canh đường, hành tím, nửa tỏi và tiêu, chia cho thịt băm và ba chỉ. Ướp ngăn mát 20 phút, vo thịt băm thành viên dẹt dày 1 cm.
2. Chuẩn bị rau | Rửa rau thơm kỹ, để ráo. Gọt đu đủ và cà rốt, thái mỏng; trộn với 1 muỗng canh giấm lấy từ lượng chuẩn bị, để 10 phút rồi gạn nước.
3. Pha nước chấm | Đun 250 ml nước với đường và nước mắm còn lại 1 phút. Để ấm, thêm giấm còn lại và tỏi băm; nếm vị chua ngọt trước khi thêm rau củ.
4. Áp chả viên | Quét nửa dầu lên chảo, áp chả lửa vừa 4 phút mỗi mặt. Nấu thêm nếu cần để giữa viên đạt 71°C; gắp ra đĩa sạch.
5. Áp ba chỉ | Dùng phần dầu còn lại, áp ba chỉ thành từng mẻ 3–4 phút mỗi mặt. Thịt cần đạt 63°C và nghỉ ít nhất 3 phút; không để đường ướp cháy đen.
6. Dọn bún | Chuẩn bị bún theo hướng dẫn nơi bán, chia ra đĩa cùng rau. Cho chả và ba chỉ vào bát nước chấm ấm cùng đu đủ, cà rốt; dùng ngay.',image_url='assets/photos/recipe-89.jpg',prep_time_minutes=60,servings=4 WHERE title='Bún chả';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh cuốn chảo','Bánh cuốn làm bằng chảo chống dính, nhân thịt nấm mèo và hành phi, không cần nồi tráng chuyên dụng.','1. Pha bột | Khuấy bột gạo, bột năng, muối, 600 ml nước và 1 muỗng canh dầu. Để nghỉ 15–20 phút trong lúc làm nhân, khuấy lại trước mỗi lần múc.
2. Làm nhân | Ngâm nấm mèo 10–15 phút, rửa và băm. Phi hành băm với 1 muỗng cà phê dầu lấy từ lượng còn lại, cho thịt và nấm xào 6–8 phút; nêm 1 muỗng canh nước mắm, tiêu, thịt băm cần đạt 71°C.
3. Phi hành, pha chấm | Phi hành thái với phần dầu còn lại ở lửa nhỏ đến vàng nhạt, vớt ráo. Đun 150 ml nước với đường và nước mắm còn lại, để ấm rồi thêm giấm.
4. Tráng thử | Làm nóng chảo chống dính 20–22 cm ở lửa vừa nhỏ, quét rất mỏng dầu phi hành. Múc khoảng 40–50 ml bột, nghiêng thành lớp mỏng và đậy nắp 45–60 giây đến bánh trong, chín đều.
5. Lấy bánh và cuốn | Úp bánh lên đĩa sạch quét chút dầu, chờ 10 giây, cho 1–2 muỗng nhân rồi gấp hai mép và cuộn. Bánh rách thì điều chỉnh lớp bột dày hơn chút hoặc giảm lửa.
6. Làm tiếp và dọn | Khuấy bột trước mỗi mẻ, tráng và cuốn đến hết. Rắc hành phi, dùng nóng với nước chấm; bánh phải chín hết, không còn bột trắng đục chưa chín.','assets/photos/recipe-90.jpg',60,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh cuốn chảo');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Bánh cuốn làm bằng chảo chống dính, nhân thịt nấm mèo và hành phi, không cần nồi tráng chuyên dụng.',instructions='1. Pha bột | Khuấy bột gạo, bột năng, muối, 600 ml nước và 1 muỗng canh dầu. Để nghỉ 15–20 phút trong lúc làm nhân, khuấy lại trước mỗi lần múc.
2. Làm nhân | Ngâm nấm mèo 10–15 phút, rửa và băm. Phi hành băm với 1 muỗng cà phê dầu lấy từ lượng còn lại, cho thịt và nấm xào 6–8 phút; nêm 1 muỗng canh nước mắm, tiêu, thịt băm cần đạt 71°C.
3. Phi hành, pha chấm | Phi hành thái với phần dầu còn lại ở lửa nhỏ đến vàng nhạt, vớt ráo. Đun 150 ml nước với đường và nước mắm còn lại, để ấm rồi thêm giấm.
4. Tráng thử | Làm nóng chảo chống dính 20–22 cm ở lửa vừa nhỏ, quét rất mỏng dầu phi hành. Múc khoảng 40–50 ml bột, nghiêng thành lớp mỏng và đậy nắp 45–60 giây đến bánh trong, chín đều.
5. Lấy bánh và cuốn | Úp bánh lên đĩa sạch quét chút dầu, chờ 10 giây, cho 1–2 muỗng nhân rồi gấp hai mép và cuộn. Bánh rách thì điều chỉnh lớp bột dày hơn chút hoặc giảm lửa.
6. Làm tiếp và dọn | Khuấy bột trước mỗi mẻ, tráng và cuốn đến hết. Rắc hành phi, dùng nóng với nước chấm; bánh phải chín hết, không còn bột trắng đục chưa chín.',image_url='assets/photos/recipe-90.jpg',prep_time_minutes=60,servings=4 WHERE title='Bánh cuốn chảo';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh xèo','Bánh xèo chảo nhỏ nhân tôm thịt, giá và đậu xanh, vỏ mỏng ăn cùng rau và nước chấm.','1. Pha bột | Khuấy bột gạo, nghệ, muối, 350 ml nước và nước cốt dừa. Thêm hành lá, để nghỉ 20 phút; khuấy lại trước từng lần đổ bánh.
2. Chuẩn bị nhân | Làm sạch tôm, thái thịt, rửa giá và rau. Xào thịt với 1 muỗng canh dầu 5–6 phút đến chín, thêm tôm và hành tây xào 3 phút đến tôm đục; để riêng.
3. Pha nước chấm | Đun 150 ml nước với đường và nước mắm 1 phút. Để ấm rồi thêm giấm, nếm và điều chỉnh vị; giữ rau sống tách khỏi dụng cụ thịt sống.
4. Đổ vỏ | Làm nóng chảo chống dính 22–24 cm ở lửa vừa lớn, quét dầu từ lượng còn lại. Cho ít nhân, múc 70–80 ml bột, nghiêng chảo nhanh cho lớp mỏng.
5. Làm chín | Rải ít đậu xanh và giá trên một nửa bánh, đậy nắp 2 phút. Mở nắp, hạ lửa vừa và rưới chút dầu quanh mép, nấu 3–4 phút để vỏ chín giòn và giá chín.
6. Gấp và dọn | Khi mép bánh nhấc dễ, gấp đôi, lấy ra giá hoặc đĩa thoáng. Làm tiếp đến hết, ăn ngay với rau và nước chấm; không xếp chồng bánh nóng làm mềm vỏ.','assets/photos/recipe-91.jpg',70,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh xèo');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Bánh xèo chảo nhỏ nhân tôm thịt, giá và đậu xanh, vỏ mỏng ăn cùng rau và nước chấm.',instructions='1. Pha bột | Khuấy bột gạo, nghệ, muối, 350 ml nước và nước cốt dừa. Thêm hành lá, để nghỉ 20 phút; khuấy lại trước từng lần đổ bánh.
2. Chuẩn bị nhân | Làm sạch tôm, thái thịt, rửa giá và rau. Xào thịt với 1 muỗng canh dầu 5–6 phút đến chín, thêm tôm và hành tây xào 3 phút đến tôm đục; để riêng.
3. Pha nước chấm | Đun 150 ml nước với đường và nước mắm 1 phút. Để ấm rồi thêm giấm, nếm và điều chỉnh vị; giữ rau sống tách khỏi dụng cụ thịt sống.
4. Đổ vỏ | Làm nóng chảo chống dính 22–24 cm ở lửa vừa lớn, quét dầu từ lượng còn lại. Cho ít nhân, múc 70–80 ml bột, nghiêng chảo nhanh cho lớp mỏng.
5. Làm chín | Rải ít đậu xanh và giá trên một nửa bánh, đậy nắp 2 phút. Mở nắp, hạ lửa vừa và rưới chút dầu quanh mép, nấu 3–4 phút để vỏ chín giòn và giá chín.
6. Gấp và dọn | Khi mép bánh nhấc dễ, gấp đôi, lấy ra giá hoặc đĩa thoáng. Làm tiếp đến hết, ăn ngay với rau và nước chấm; không xếp chồng bánh nóng làm mềm vỏ.',image_url='assets/photos/recipe-91.jpg',prep_time_minutes=70,servings=4 WHERE title='Bánh xèo';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh mì xíu mại','Viên xíu mại thịt heo mềm trong sốt cà chua, dùng cùng bánh mì nóng và rau thơm.','1. Chuẩn bị | Gọt củ sắn, rửa, băm và vắt nhẹ cho bớt nước. Băm cà chua, hành tím và tỏi; rửa hành lá, cắt nhỏ.
2. Trộn nhân | Trộn thịt với củ sắn, nửa hành tím, hành lá, 1 muỗng cà phê bột bắp, 1 muỗng canh nước mắm và tiêu. Đảo 2 phút, vo viên đường kính 3 cm.
3. Hấp viên | Xếp viên lên đĩa sâu, hấp trên nước sôi 12–15 phút. Nhân giữa viên lớn nhất cần đạt 71°C; giữ nước hấp sạch để thêm sốt nếu muốn.
4. Nấu cà chua | Phi hành tím còn lại và tỏi với dầu 30 giây. Thêm cà chua, đảo 4 phút rồi cho 230 ml nước, đường và nước mắm còn lại, nấu nhẹ 8 phút.
5. Om sốt | Cho viên chín vào sốt, om 5 phút. Hòa bột bắp còn lại với 20 ml nước, rót từ từ và khuấy 1 phút cho sốt hơi sánh.
6. Dọn bánh mì | Làm nóng bánh mì bằng lò hoặc chảo khô. Múc xíu mại và sốt vào bát, dùng để chấm hoặc kẹp bánh; kiểm tra không còn viên sống giữa trước khi dọn.','assets/photos/recipe-92.jpg',60,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh mì xíu mại');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Viên xíu mại thịt heo mềm trong sốt cà chua, dùng cùng bánh mì nóng và rau thơm.',instructions='1. Chuẩn bị | Gọt củ sắn, rửa, băm và vắt nhẹ cho bớt nước. Băm cà chua, hành tím và tỏi; rửa hành lá, cắt nhỏ.
2. Trộn nhân | Trộn thịt với củ sắn, nửa hành tím, hành lá, 1 muỗng cà phê bột bắp, 1 muỗng canh nước mắm và tiêu. Đảo 2 phút, vo viên đường kính 3 cm.
3. Hấp viên | Xếp viên lên đĩa sâu, hấp trên nước sôi 12–15 phút. Nhân giữa viên lớn nhất cần đạt 71°C; giữ nước hấp sạch để thêm sốt nếu muốn.
4. Nấu cà chua | Phi hành tím còn lại và tỏi với dầu 30 giây. Thêm cà chua, đảo 4 phút rồi cho 230 ml nước, đường và nước mắm còn lại, nấu nhẹ 8 phút.
5. Om sốt | Cho viên chín vào sốt, om 5 phút. Hòa bột bắp còn lại với 20 ml nước, rót từ từ và khuấy 1 phút cho sốt hơi sánh.
6. Dọn bánh mì | Làm nóng bánh mì bằng lò hoặc chảo khô. Múc xíu mại và sốt vào bát, dùng để chấm hoặc kẹp bánh; kiểm tra không còn viên sống giữa trước khi dọn.',image_url='assets/photos/recipe-92.jpg',prep_time_minutes=60,servings=4 WHERE title='Bánh mì xíu mại';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chè chuối','Chuối chín nấu cùng nước cốt dừa và bột báng, thơm mè và đậu phộng rang.','1. Chuẩn bị | Ngâm bột báng trong nước sạch 10 phút, xả lại. Bóc chuối, cắt khoanh dày 2 cm; trộn với 20 g đường lấy từ lượng chuẩn bị.
2. Luộc bột báng | Đun 600 ml nước, cho bột báng vào và khuấy. Nấu 10–15 phút theo bao bì đến hạt trong, không còn lõi trắng; thêm nước nếu cần.
3. Xả báng | Vớt báng qua rây, xả nhanh bằng nước sạch rồi để ráo. Nếu còn lõi cứng, tiếp tục nấu trước khi chuyển sang nồi chè.
4. Nấu nền chè | Cho 200 ml nước, nước cốt dừa, muối và đường còn lại vào nồi. Đun lửa nhỏ, khuấy đến đường tan và hỗn hợp sôi nhẹ.
5. Cho chuối | Thêm chuối, nấu 5–7 phút đến mềm nhưng còn giữ khoanh. Cho báng chín vào, đảo nhẹ và nấu thêm 2 phút, không để sôi mạnh.
6. Dọn | Tắt bếp, múc chè vào bát, rắc đậu phộng và mè ngay trước khi ăn. Nếu ăn mát, để nguội bớt rồi cất ngăn mát trong hộp sạch.','assets/photos/recipe-93.jpg',35,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chè chuối');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Chuối chín nấu cùng nước cốt dừa và bột báng, thơm mè và đậu phộng rang.',instructions='1. Chuẩn bị | Ngâm bột báng trong nước sạch 10 phút, xả lại. Bóc chuối, cắt khoanh dày 2 cm; trộn với 20 g đường lấy từ lượng chuẩn bị.
2. Luộc bột báng | Đun 600 ml nước, cho bột báng vào và khuấy. Nấu 10–15 phút theo bao bì đến hạt trong, không còn lõi trắng; thêm nước nếu cần.
3. Xả báng | Vớt báng qua rây, xả nhanh bằng nước sạch rồi để ráo. Nếu còn lõi cứng, tiếp tục nấu trước khi chuyển sang nồi chè.
4. Nấu nền chè | Cho 200 ml nước, nước cốt dừa, muối và đường còn lại vào nồi. Đun lửa nhỏ, khuấy đến đường tan và hỗn hợp sôi nhẹ.
5. Cho chuối | Thêm chuối, nấu 5–7 phút đến mềm nhưng còn giữ khoanh. Cho báng chín vào, đảo nhẹ và nấu thêm 2 phút, không để sôi mạnh.
6. Dọn | Tắt bếp, múc chè vào bát, rắc đậu phộng và mè ngay trước khi ăn. Nếu ăn mát, để nguội bớt rồi cất ngăn mát trong hộp sạch.',image_url='assets/photos/recipe-93.jpg',prep_time_minutes=35,servings=4 WHERE title='Chè chuối';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chè đậu đỏ','Đậu đỏ ninh mềm, thêm đường ở cuối, dùng với nước cốt dừa và có thể ăn nóng hoặc mát.','1. Ngâm đậu | Nhặt bỏ hạt hỏng và sạn, rửa đậu. Ngâm với nhiều nước sạch khoảng 8 giờ trong ngăn mát; đổ nước ngâm, rửa lại trước khi nấu.
2. Đun sôi | Cho đậu và 1.450 ml nước vào nồi đủ rộng. Đun sôi rõ, giữ sôi 10 phút, hớt bọt, sau đó hạ lửa nhỏ; không chỉ ủ nước ấm.
3. Ninh mềm | Đậy hé nắp, nấu 60–75 phút, kiểm tra mỗi 15 phút. Châm nước nóng nếu đậu lộ khỏi mặt nước; đậu cần mềm hoàn toàn, dễ nghiền giữa hai ngón sau khi làm nguội hạt thử.
4. Thêm đường | Khi đậu đã mềm, cho đường và nửa muối vào, khuấy nhẹ. Nấu thêm 8–10 phút để vị ngọt thấm, nếm trước khi tăng đường.
5. Làm cốt dừa | Hòa bột năng với 50 ml nước, đun cùng nước cốt dừa và muối còn lại. Khuấy lửa nhỏ 2–3 phút đến hơi sánh rồi tắt.
6. Dọn chè | Múc đậu cùng nước vào bát, rưới cốt dừa ngay trước khi dùng. Chè ăn mát cần làm nguội bớt và cất ngăn mát, không để nồi ngoài qua đêm.','assets/photos/recipe-94.jpg',100,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chè đậu đỏ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Đậu đỏ ninh mềm, thêm đường ở cuối, dùng với nước cốt dừa và có thể ăn nóng hoặc mát.',instructions='1. Ngâm đậu | Nhặt bỏ hạt hỏng và sạn, rửa đậu. Ngâm với nhiều nước sạch khoảng 8 giờ trong ngăn mát; đổ nước ngâm, rửa lại trước khi nấu.
2. Đun sôi | Cho đậu và 1.450 ml nước vào nồi đủ rộng. Đun sôi rõ, giữ sôi 10 phút, hớt bọt, sau đó hạ lửa nhỏ; không chỉ ủ nước ấm.
3. Ninh mềm | Đậy hé nắp, nấu 60–75 phút, kiểm tra mỗi 15 phút. Châm nước nóng nếu đậu lộ khỏi mặt nước; đậu cần mềm hoàn toàn, dễ nghiền giữa hai ngón sau khi làm nguội hạt thử.
4. Thêm đường | Khi đậu đã mềm, cho đường và nửa muối vào, khuấy nhẹ. Nấu thêm 8–10 phút để vị ngọt thấm, nếm trước khi tăng đường.
5. Làm cốt dừa | Hòa bột năng với 50 ml nước, đun cùng nước cốt dừa và muối còn lại. Khuấy lửa nhỏ 2–3 phút đến hơi sánh rồi tắt.
6. Dọn chè | Múc đậu cùng nước vào bát, rưới cốt dừa ngay trước khi dùng. Chè ăn mát cần làm nguội bớt và cất ngăn mát, không để nồi ngoài qua đêm.',image_url='assets/photos/recipe-94.jpg',prep_time_minutes=100,servings=4 WHERE title='Chè đậu đỏ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh flan hấp','Flan trứng sữa mềm với caramel, hấp lửa nhỏ trong khuôn chịu nhiệt và làm mát trước khi dùng.','1. Làm caramel | Cho 60 g đường và 40 ml nước vào nồi nhỏ, đun lửa vừa, không khuấy bằng muỗng. Khi chuyển màu hổ phách nhạt, tắt bếp và chia vào 6 khuôn chịu nhiệt; tránh chạm caramel nóng.
2. Hâm sữa | Hâm sữa với 70 g đường còn lại đến ấm khoảng 50–60°C, khuấy tan. Không đun sôi; chuẩn bị trứng trong lúc sữa giảm nóng.
3. Trộn trứng | Khuấy nhẹ 4 trứng và 2 lòng đỏ, không đánh bông. Rót sữa ấm thành dòng mỏng, vừa rót vừa khuấy, thêm vani và lọc qua rây.
4. Rót khuôn | Chia hỗn hợp vào khuôn caramel đã se mặt, bỏ bọt nổi. Đậy từng khuôn bằng nắp chịu nhiệt hoặc giấy bạc thực phẩm để nước ngưng không nhỏ vào bánh.
5. Hấp | Đặt khuôn lên xửng có nước sôi nhẹ, hấp lửa nhỏ 25–35 phút tùy độ sâu khuôn. Mặt bánh se, tâm rung nhẹ và nhiệt ở giữa đạt 71°C; hấp thêm nếu tâm còn lỏng.
6. Làm mát | Lấy khuôn bằng găng, để nguội bớt trên giá rồi đưa vào ngăn mát ít nhất 4 giờ. Luồn dao mỏng quanh thành, úp ra đĩa sạch khi bánh đã lạnh.','assets/photos/recipe-95.jpg',60,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh flan hấp');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Flan trứng sữa mềm với caramel, hấp lửa nhỏ trong khuôn chịu nhiệt và làm mát trước khi dùng.',instructions='1. Làm caramel | Cho 60 g đường và 40 ml nước vào nồi nhỏ, đun lửa vừa, không khuấy bằng muỗng. Khi chuyển màu hổ phách nhạt, tắt bếp và chia vào 6 khuôn chịu nhiệt; tránh chạm caramel nóng.
2. Hâm sữa | Hâm sữa với 70 g đường còn lại đến ấm khoảng 50–60°C, khuấy tan. Không đun sôi; chuẩn bị trứng trong lúc sữa giảm nóng.
3. Trộn trứng | Khuấy nhẹ 4 trứng và 2 lòng đỏ, không đánh bông. Rót sữa ấm thành dòng mỏng, vừa rót vừa khuấy, thêm vani và lọc qua rây.
4. Rót khuôn | Chia hỗn hợp vào khuôn caramel đã se mặt, bỏ bọt nổi. Đậy từng khuôn bằng nắp chịu nhiệt hoặc giấy bạc thực phẩm để nước ngưng không nhỏ vào bánh.
5. Hấp | Đặt khuôn lên xửng có nước sôi nhẹ, hấp lửa nhỏ 25–35 phút tùy độ sâu khuôn. Mặt bánh se, tâm rung nhẹ và nhiệt ở giữa đạt 71°C; hấp thêm nếu tâm còn lỏng.
6. Làm mát | Lấy khuôn bằng găng, để nguội bớt trên giá rồi đưa vào ngăn mát ít nhất 4 giờ. Luồn dao mỏng quanh thành, úp ra đĩa sạch khi bánh đã lạnh.',image_url='assets/photos/recipe-95.jpg',prep_time_minutes=60,servings=4 WHERE title='Bánh flan hấp';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sữa bắp','Sữa bắp nấu từ hạt bắp ngọt, xay lọc và thêm sữa tươi, uống nóng hoặc mát.','1. Chuẩn bị bắp | Bỏ vỏ và râu, rửa sạch rồi tách hạt, cân 400 g. Chỉ dùng phần hạt sạch; chuẩn bị rây mịn hoặc túi lọc thực phẩm sạch.
2. Nấu hạt | Cho bắp và 800 ml nước vào nồi, đun sôi. Hạ lửa vừa, nấu 10–12 phút đến hạt mềm, tắt bếp và để nguội bớt.
3. Xay | Dùng máy xay cầm tay hoặc chờ hỗn hợp nguội phù hợp hướng dẫn của máy. Xay từng mẻ với nước nấu bắp đến hạt nhỏ mịn; không xay nóng trong cối kín.
4. Lọc | Lọc qua rây, ép nhẹ bằng muỗng sạch để lấy sữa bắp. Nếu dùng túi lọc, đợi đủ nguội trước khi vắt; không để bã rơi trở lại.
5. Thêm sữa | Cho nước bắp lọc lại vào nồi, thêm sữa tươi, đường và muối. Đun lửa nhỏ, khuấy 5–7 phút đến nóng đều, không để dính đáy hoặc trào.
6. Bảo quản | Dùng nóng hoặc làm nguội bớt và chuyển vào chai sạch, cất ngăn mát. Lắc nhẹ trước khi uống vì sữa bắp có thể lắng; không để ngoài qua đêm.','assets/photos/recipe-96.jpg',40,4 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sữa bắp');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Đồ uống'),description='Sữa bắp nấu từ hạt bắp ngọt, xay lọc và thêm sữa tươi, uống nóng hoặc mát.',instructions='1. Chuẩn bị bắp | Bỏ vỏ và râu, rửa sạch rồi tách hạt, cân 400 g. Chỉ dùng phần hạt sạch; chuẩn bị rây mịn hoặc túi lọc thực phẩm sạch.
2. Nấu hạt | Cho bắp và 800 ml nước vào nồi, đun sôi. Hạ lửa vừa, nấu 10–12 phút đến hạt mềm, tắt bếp và để nguội bớt.
3. Xay | Dùng máy xay cầm tay hoặc chờ hỗn hợp nguội phù hợp hướng dẫn của máy. Xay từng mẻ với nước nấu bắp đến hạt nhỏ mịn; không xay nóng trong cối kín.
4. Lọc | Lọc qua rây, ép nhẹ bằng muỗng sạch để lấy sữa bắp. Nếu dùng túi lọc, đợi đủ nguội trước khi vắt; không để bã rơi trở lại.
5. Thêm sữa | Cho nước bắp lọc lại vào nồi, thêm sữa tươi, đường và muối. Đun lửa nhỏ, khuấy 5–7 phút đến nóng đều, không để dính đáy hoặc trào.
6. Bảo quản | Dùng nóng hoặc làm nguội bớt và chuyển vào chai sạch, cất ngăn mát. Lắc nhẹ trước khi uống vì sữa bắp có thể lắng; không để ngoài qua đêm.',image_url='assets/photos/recipe-96.jpg',prep_time_minutes=40,servings=4 WHERE title='Sữa bắp';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Nước ép dứa gừng','Dứa chín xay lọc cùng một ít gừng và chanh, vị chua ngọt tươi, dùng ngay.','1. Sơ chế | Rửa quả dứa trước khi gọt, bỏ vỏ, mắt và lõi cứng, cân phần thịt. Rửa và gọt gừng, thái lát mỏng; chuẩn bị máy xay và rây sạch.
2. Cắt nhỏ | Cắt dứa thành khối 2 cm, chia thành hai mẻ nếu cối nhỏ. Gừng chỉ dùng 8 g để không át mùi dứa.
3. Xay | Xay dứa, gừng và 300 ml nước 45–60 giây đến nhuyễn. Nếu dùng máy ép, ép dứa gừng rồi pha lượng nước theo vị mong muốn.
4. Lọc | Rót qua rây mịn, dùng muỗng ép nhẹ lấy nước; không cần vắt bã khô hoàn toàn. Có thể giữ chút thịt quả nếu thích đồ uống sánh.
5. Điều chỉnh vị | Thêm nước cốt chanh và đường từng ít, khuấy tan rồi nếm. Dứa rất ngọt có thể bỏ đường; gừng quá mạnh thì pha thêm chút nước sạch.
6. Dùng ngay | Chia vào ly, thêm đá ngay trước khi uống để không bị loãng sớm. Phần chưa dùng đậy kín và cất ngăn mát, ưu tiên dùng trong ngày.','assets/photos/recipe-97.jpg',15,4 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Nước ép dứa gừng');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Đồ uống'),description='Dứa chín xay lọc cùng một ít gừng và chanh, vị chua ngọt tươi, dùng ngay.',instructions='1. Sơ chế | Rửa quả dứa trước khi gọt, bỏ vỏ, mắt và lõi cứng, cân phần thịt. Rửa và gọt gừng, thái lát mỏng; chuẩn bị máy xay và rây sạch.
2. Cắt nhỏ | Cắt dứa thành khối 2 cm, chia thành hai mẻ nếu cối nhỏ. Gừng chỉ dùng 8 g để không át mùi dứa.
3. Xay | Xay dứa, gừng và 300 ml nước 45–60 giây đến nhuyễn. Nếu dùng máy ép, ép dứa gừng rồi pha lượng nước theo vị mong muốn.
4. Lọc | Rót qua rây mịn, dùng muỗng ép nhẹ lấy nước; không cần vắt bã khô hoàn toàn. Có thể giữ chút thịt quả nếu thích đồ uống sánh.
5. Điều chỉnh vị | Thêm nước cốt chanh và đường từng ít, khuấy tan rồi nếm. Dứa rất ngọt có thể bỏ đường; gừng quá mạnh thì pha thêm chút nước sạch.
6. Dùng ngay | Chia vào ly, thêm đá ngay trước khi uống để không bị loãng sớm. Phần chưa dùng đậy kín và cất ngăn mát, ưu tiên dùng trong ngày.',image_url='assets/photos/recipe-97.jpg',prep_time_minutes=15,servings=4 WHERE title='Nước ép dứa gừng';

DELETE FROM recipe_ingredients WHERE recipe_id IN (SELECT id FROM recipes WHERE title IN ('Thịt ba chỉ rang cháy cạnh','Thịt heo xào chua ngọt','Bò lúc lắc','Bò cuốn lá lốt','Gà hấp hành','Gà sốt cam','Vịt kho gừng','Tôm chiên tỏi','Tôm sốt bơ chanh','Mực xào cần tỏi','Mực nhồi thịt sốt cà chua','Nghêu hấp sả','Cá diêu hồng hấp gừng','Cá thu sốt cà chua','Canh khổ qua nhồi thịt','Canh cải thảo viên thịt','Canh rong biển đậu hũ','Canh chua tôm','Canh bầu nấu tôm','Súp bí đỏ','Cải thìa xào nấm','Su su xào trứng','Đậu que xào tỏi','Salad khoai tây','Đậu hũ chiên sả','Đậu hũ hấp nấm','Cà ri rau củ','Miến xào nấm','Xôi gấc','Cơm cuộn rong biển','Cháo sườn','Bún chả','Bánh cuốn chảo','Bánh xèo','Bánh mì xíu mại','Chè chuối','Chè đậu đỏ','Bánh flan hấp','Sữa bắp','Nước ép dứa gừng'));

DELETE FROM recipe_details WHERE recipe_id IN (SELECT id FROM recipes WHERE title IN ('Thịt ba chỉ rang cháy cạnh','Thịt heo xào chua ngọt','Bò lúc lắc','Bò cuốn lá lốt','Gà hấp hành','Gà sốt cam','Vịt kho gừng','Tôm chiên tỏi','Tôm sốt bơ chanh','Mực xào cần tỏi','Mực nhồi thịt sốt cà chua','Nghêu hấp sả','Cá diêu hồng hấp gừng','Cá thu sốt cà chua','Canh khổ qua nhồi thịt','Canh cải thảo viên thịt','Canh rong biển đậu hũ','Canh chua tôm','Canh bầu nấu tôm','Súp bí đỏ','Cải thìa xào nấm','Su su xào trứng','Đậu que xào tỏi','Salad khoai tây','Đậu hũ chiên sả','Đậu hũ hấp nấm','Cà ri rau củ','Miến xào nấm','Xôi gấc','Cơm cuộn rong biển','Cháo sườn','Bún chả','Bánh cuốn chảo','Bánh xèo','Bánh mì xíu mại','Chè chuối','Chè đậu đỏ','Bánh flan hấp','Sữa bắp','Nước ép dứa gừng'));

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt ba chỉ rang cháy cạnh' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt ba chỉ":"Thái lát dày 5 mm","Hành tím":"Bóc vỏ, thái mỏng","Tỏi":"Băm nhỏ","Hành lá":"Cắt khúc 2 cm"}','Không thêm dầu ngay từ đầu vì ba chỉ tự tiết mỡ; thịt quá nạc dễ khô khi rang lâu.
Cho nước mắm sau khi thịt đã vàng để đường không cháy trước khi thịt chín.','' FROM recipes r WHERE r.title='Thịt ba chỉ rang cháy cạnh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Thịt thăn heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Ớt chuông';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Dứa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Tương cà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Giấm gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Bột bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo xào chua ngọt' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt thăn heo":"Thái miếng mỏng 3 mm","Ớt chuông":"Bỏ hạt, cắt vuông","Dứa":"Phần thịt quả","Hành tây":"Cắt miếng","Tỏi":"Băm","Bột bắp":"Chia hai phần"}','Thái thịt ngang thớ và xào từng mẻ nếu chảo nhỏ để thịt không ra nước.
Dứa đã ngọt thì giảm đường khi pha; giấm thêm từng ít để dễ điều chỉnh.','' FROM recipes r WHERE r.title='Thịt heo xào chua ngọt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Thịt bò thăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Ớt chuông';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Dầu hào';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Bơ lạt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò lúc lắc' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt bò thăn":"Cắt khối 2 cm","Tỏi":"Băm"}','Chảo nóng và thịt khô tạo mặt xém; tránh đảo liên tục ngay khi cho thịt vào.
Dùng nhiệt kế cho khối bò dày để xác định độ chín, thay vì chỉ nhìn màu bên ngoài.','' FROM recipes r WHERE r.title='Bò lúc lắc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Thịt bò băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Lá lốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò cuốn lá lốt' AND i.name='Dầu ăn';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt heo băm":"Có chút mỡ để nhân mềm","Lá lốt":"Khoảng 25 lá lớn và vài lá nhỏ","Hành tím":"Băm","Tỏi":"Băm"}','Không cuốn nhân quá dày vì lá dễ cháy trước khi nhân chín.
Lá phải khô khi vào chảo để bớt bắn dầu và có mặt áp thơm.','' FROM recipes r WHERE r.title='Bò cuốn lá lốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hấp hành' AND i.name='Nước tương';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Gà":"Một con nhỏ đã làm sạch","Hành lá":"Cắt khúc dài","Gừng":"Một nửa lát, một nửa sợi","Hành tím":"Đập dập"}','Gà lớn hơn 1 kg cần tăng thời gian hấp và kiểm tra nhiệt độ ở phần dày.
Đĩa phải chịu nhiệt và sâu lòng để giữ nước ngọt, không để nước đáy nồi tràn vào.','' FROM recipes r WHERE r.title='Gà hấp hành';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Thịt đùi gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,180.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Nước cam';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Vỏ cam';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Mật ong';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Bột bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Nước lọc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà sốt cam' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt đùi gà":"Lọc xương, cắt miếng 3 cm","Nước cam":"Vắt tươi, bỏ hạt","Vỏ cam":"Bào mỏng, tránh cùi trắng","Tỏi":"Băm","Gừng":"Băm"}','Bào lớp vỏ màu cam thật mỏng; phần cùi trắng làm sốt đắng.
Nước cam có độ ngọt khác nhau, nếm trước khi pha và thêm mật ong từng ít.','' FROM recipes r WHERE r.title='Gà sốt cam';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Thịt vịt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Nước dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt kho gừng' AND i.name='Tiêu';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt vịt":"Miếng có xương, chặt 4 cm","Gừng":"20 g lát, 40 g sợi","Hành tím":"Băm","Tỏi":"Băm"}','Vịt già cần kho lâu hơn; tăng nước nóng từng ít và kiểm tra độ mềm.
Không thắng đường quá đậm vì nước dừa đã tạo màu khi kho; giữ lửa nhỏ sau khi sôi.','' FROM recipes r WHERE r.title='Vịt kho gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm chiên tỏi' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Tôm":"Bóc vỏ, chừa đuôi, bỏ chỉ lưng","Tỏi":"Băm đều, không nghiền nát","Hành lá":"Cắt nhỏ"}','Tôm phải khô trước khi áp chảo; nước đọng khiến tôm hấp thay vì vàng.
Vớt tỏi ở màu vàng nhạt để tránh tỏi cháy đắng khi nguội.','' FROM recipes r WHERE r.title='Tôm chiên tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Bơ lạt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Chanh vàng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Ngò rí';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm sốt bơ chanh' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Tôm":"Bóc vỏ, bỏ chỉ, thấm khô","Bơ lạt":"Chia đôi","Tỏi":"Băm","Chanh vàng":"Lấy 20 ml nước cốt, vài lát trang trí","Ngò rí":"Rửa, cắt nhỏ"}','Cho chanh sau khi tắt bếp giúp vị chua tươi và dễ điều chỉnh.
Dùng bơ lạt để kiểm soát muối; bơ mặn cần giảm muối ướp.','' FROM recipes r WHERE r.title='Tôm sốt bơ chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Mực';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Cần tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Tỏi tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Dầu hào';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực xào cần tỏi' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Mực":"Làm sạch, bỏ túi mực và mai","Cần tây":"Cắt khúc 3 cm","Tỏi tây":"Rửa kỹ kẽ lá, thái xéo","Cà chua":"Bổ múi","Hành tây":"Thái múi","Tỏi":"Băm"}','Xào riêng mực và rau để kiểm soát độ chín, tránh mực dai khi chờ rau mềm.
Mực đông lạnh cần rã đông trong ngăn mát và thấm khô trước khi xào.','' FROM recipes r WHERE r.title='Mực xào cần tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Mực ống';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Nấm mèo khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mực nhồi thịt sốt cà chua' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Mực ống":"Khoảng 4 con vừa, giữ thân nguyên","Nấm mèo khô":"Ngâm mềm, bỏ gốc, băm","Cà chua":"Băm nhỏ","Hành tím":"Băm","Hành lá":"Cắt nhỏ"}','Không nhồi kín thân vì nhân nở làm mực rách và khó chín đều.
Ghi nhớ số tăm đã dùng và rút đủ trước khi cắt hoặc dọn món.','' FROM recipes r WHERE r.title='Mực nhồi thịt sốt cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nghêu hấp sả' AND i.name='Nghêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nghêu hấp sả' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nghêu hấp sả' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nghêu hấp sả' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nghêu hấp sả' AND i.name='Nước lọc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nghêu hấp sả' AND i.name='Đường';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Nghêu":"Nghêu sống đã làm sạch cát","Sả":"Đập dập, cắt khúc","Gừng":"Thái lát","Ớt":"Thái lát, có thể bỏ"}','Nước nghêu thường mặn sẵn nên công thức không thêm muối hoặc nước mắm.
Nếu nghêu nhiều hơn đáy nồi hai lớp, chia mẻ để mở vỏ và chín đồng đều.','25 phút khi dùng nghêu đã sạch cát; chưa tính thời gian làm sạch cát nếu cần.' FROM recipes r WHERE r.title='Nghêu hấp sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Cá diêu hồng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá diêu hồng hấp gừng' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cá diêu hồng":"Một con đã bỏ mang, ruột và vảy","Gừng":"Thái sợi","Hành lá":"Cắt khúc","Hành tây":"Thái mỏng"}','Chọn đĩa vừa xửng và có vành cao để giữ nước hấp.
Thêm một phần hành gừng ở cuối để màu đẹp và mùi thơm tươi.','' FROM recipes r WHERE r.title='Cá diêu hồng hấp gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Cá thu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá thu sốt cà chua' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cá thu":"Khoanh dày khoảng 2 cm","Cà chua":"Băm hoặc cắt nhỏ","Hành tím":"Băm","Tỏi":"Băm","Hành lá":"Cắt nhỏ"}','Thấm thật khô cá giúp giảm bắn dầu và cá không dính chảo.
Cà chua chua nhiều thì điều chỉnh đường từng ít, không tăng nước mắm để cân vị chua.','' FROM recipes r WHERE r.title='Cá thu sốt cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Khổ qua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Nấm mèo khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1500.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh khổ qua nhồi thịt' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Khổ qua":"Khoảng 3 quả vừa","Nấm mèo khô":"Ngâm mềm, băm","Hành tím":"Băm","Hành lá":"Cắt nhỏ"}','Không đun sôi quá mạnh vì nhân dễ bung và nước canh đục.
Cạo ruột trắng giúp giảm đắng phần nào; món vẫn giữ vị đắng tự nhiên của khổ qua.','' FROM recipes r WHERE r.title='Canh khổ qua nhồi thịt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Cải thảo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Bột bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1400.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải thảo viên thịt' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cải thảo":"Rửa từng lá, cắt 3 cm","Cà rốt":"Thái lát mỏng","Hành tím":"Băm","Hành lá":"Cắt nhỏ"}','Vo viên đều cỡ giúp thịt chín cùng lúc, tránh viên lớn còn sống.
Cho bẹ cải trước phần lá để cả hai mềm vừa và không bị nát.','' FROM recipes r WHERE r.title='Canh cải thảo viên thịt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,8.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Rong biển wakame khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Đậu hũ non';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Nấm tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Dầu mè';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1300.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh rong biển đậu hũ' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Rong biển wakame khô":"Loại dùng nấu canh","Đậu hũ non":"Cắt khối 2 cm","Nấm tươi":"Nấm hương hoặc nấm đùi gà","Gừng":"Thái sợi"}','Dùng wakame chuyên nấu canh, không thay ngang lượng bằng rong biển cuộn cơm.
Muốn giữ món chay, chọn nước tương và đậu hũ không chứa thành phần thịt cá.','' FROM recipes r WHERE r.title='Canh rong biển đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Dứa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Đậu bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Giá đỗ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Me chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Rau ngổ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Ngò gai';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1400.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua tôm' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Tôm":"Bóc vỏ, bỏ chỉ","Cà chua":"Bổ múi","Dứa":"Cắt lát","Đậu bắp":"Cắt xéo","Giá đỗ":"Rửa, để ráo","Me chua":"Phần thịt me không hạt","Rau ngổ":"Cắt nhỏ","Ngò gai":"Cắt nhỏ"}','Độ chua của me khác nhau, thêm từ từ thay vì đổ hết ngay.
Chọn tôm đã bỏ chỉ và giữ lạnh đến trước khi nấu; chuẩn bị rau xong mới cho tôm vào canh.','' FROM recipes r WHERE r.title='Canh chua tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Bầu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1300.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bầu nấu tôm' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bầu":"Cân sau bỏ vỏ và ruột già","Tôm":"Bóc vỏ, bỏ chỉ","Hành tím":"Băm","Hành lá":"Cắt nhỏ"}','Bầu non có thể dùng cả ruột mềm; bầu già cần bỏ phần hạt cứng.
Nấu bầu ở cuối để giữ độ ngọt và tránh canh có nhiều bầu nát.','' FROM recipes r WHERE r.title='Canh bầu nấu tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Bí đỏ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Khoai tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Bơ lạt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Sữa tươi không đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.75,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,650.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Súp bí đỏ' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bí đỏ":"Cân sau bỏ vỏ và hạt","Khoai tây":"Gọt vỏ, cắt khối","Hành tây":"Băm"}','Không xay chất lỏng nóng trong cối kín vì hơi có thể làm bật nắp; ưu tiên máy xay cầm tay.
Bí nhiều nước làm súp loãng; giữ lại một phần nước ninh rồi thêm dần sau khi xay.','' FROM recipes r WHERE r.title='Súp bí đỏ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Cải thìa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Nấm tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cải thìa xào nấm' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cải thìa":"Chẻ đôi cây lớn, rửa kẽ lá","Nấm tươi":"Nấm đùi gà hoặc nấm hương","Tỏi":"Băm"}','Để rau ráo trước khi xào giúp sốt không bị loãng.
Dùng nước tương chay để món phù hợp bữa chay; không cần thêm dầu hào mặn.','' FROM recipes r WHERE r.title='Cải thìa xào nấm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Su su';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Su su xào trứng' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Su su":"Cân sau gọt vỏ, bỏ hạt","Tỏi":"Băm","Hành lá":"Cắt nhỏ"}','Xào trứng riêng giúp miếng trứng rõ, không bám thành lớp vụn trên rau.
Cắt sợi đều để su su chín cùng lúc; tăng thời gian nếu dùng miếng dày.','' FROM recipes r WHERE r.title='Su su xào trứng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Đậu que';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1000.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu que xào tỏi' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu que":"Tước xơ, cắt khúc 5 cm","Tỏi":"Băm","Muối":"Chia cho chần và xào","Nước lọc":"Dùng để chần, chừa 30 ml cho sốt"}','Thời gian tùy độ già của đậu; cần nấu chín kỹ, không phục vụ đậu que sống.
Tỏi băm đều chín đồng đều hơn tỏi nghiền lẫn miếng to.','' FROM recipes r WHERE r.title='Đậu que xào tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Khoai tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Mayonnaise';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Sữa chua không đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1500.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad khoai tây' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Khoai tây":"Gọt vỏ, cắt khối 2 cm","Cà rốt":"Cắt khối 1 cm","Dưa chuột":"Bỏ ruột nhiều nước, cắt khối","Mayonnaise":"Loại đóng chai bảo quản đúng nhãn"}','Khoai vừa mềm sẽ giữ miếng; luộc quá lâu làm salad thành dạng nghiền.
Để khoai thật ráo và bỏ ruột dưa chuột nhiều nước để sốt không loãng.','40 phút chuẩn bị và làm nguội sơ bộ; có thể làm mát thêm 15 phút trong ngăn mát.' FROM recipes r WHERE r.title='Salad khoai tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Đậu hũ trắng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ chiên sả' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu hũ trắng":"Loại chắc, cắt khối 3 cm","Sả":"Chỉ lấy phần gốc non, băm nhỏ","Tỏi":"Băm","Ớt":"Băm, có thể bỏ"}','Dùng đậu chắc để chiên; đậu non dễ vỡ và không phù hợp món này.
Băm sả thật nhỏ và chỉ dùng phần non giúp lớp áo dễ ăn.','' FROM recipes r WHERE r.title='Đậu hũ chiên sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Đậu hũ non';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,180.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Nấm hương tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Dầu mè';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Bột bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ hấp nấm' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu hũ non":"Hai hộp, chia miếng dày 2 cm","Nấm hương tươi":"Bỏ chân cứng, thái lát","Gừng":"Thái sợi","Hành lá":"Cắt nhỏ"}','Đĩa sâu giữ được sốt; kiểm tra khả năng chịu nhiệt trước khi hấp.
Nước tương đã mặn nên nếm sốt trước khi thêm gia vị khác.','' FROM recipes r WHERE r.title='Đậu hũ hấp nấm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Khoai tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Khoai lang';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Nấm tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Đậu hũ trắng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Bột cà ri';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,700.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà ri rau củ' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Khoai tây":"Cắt khối 3 cm","Khoai lang":"Cắt khối 3 cm","Cà rốt":"Cắt miếng","Nấm tươi":"Cắt vừa","Đậu hũ trắng":"Loại chắc, cắt khối","Hành tây":"Thái","Sả":"Đập dập","Bột cà ri":"Loại không chứa thịt cá"}','Khoai lang mềm nhanh hơn khoai tây nên cho sau để không nát.
Chọn bột cà ri và nước tương chay; nước cốt dừa chỉ thêm ở cuối để sốt mượt.','' FROM recipes r WHERE r.title='Cà ri rau củ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Miến khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Nấm tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Cải thảo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Dầu mè';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Miến xào nấm' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Miến khô":"Ngâm theo bao bì, cắt ngắn","Nấm tươi":"Thái lát","Cà rốt":"Thái sợi","Cải thảo":"Thái sợi","Tỏi":"Băm","Nước lọc":"Phần cho sốt, chưa gồm nước ngâm miến"}','Lượng nước cần tùy loại miến; cho từ từ để tránh thành món miến nước.
Dùng kẹp gắp đảo nhẹ thay vì muỗng nghiền làm đứt sợi.','' FROM recipes r WHERE r.title='Miến xào nấm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Xôi gấc' AND i.name='Gạo nếp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Xôi gấc' AND i.name='Thịt gấc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Xôi gấc' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Xôi gấc' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Xôi gấc' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Xôi gấc' AND i.name='Dầu ăn';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Gạo nếp":"Ngâm 4–6 giờ rồi để ráo","Thịt gấc":"Phần màng đỏ, bỏ hạt sau khi trộn"}','Chỉ dùng màng gấc đỏ, không cho vỏ hoặc cùi vàng vào xôi.
Tạo đường thoát hơi và không nén nếp giúp xôi chín đều từ đáy đến mặt.','60 phút từ lúc nếp đã ngâm; cần ngâm trước 4–6 giờ, chưa tính trong bộ lọc thời gian.' FROM recipes r WHERE r.title='Xôi gấc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Cơm chín';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5.0,'lá' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Rong biển nori';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Thanh cua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Dầu mè';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm cuộn rong biển' AND i.name='Mè rang';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cơm chín":"Gạo dẻo, mới nấu","Rong biển nori":"Loại cuộn cơm","Cà rốt":"Thái sợi","Dưa chuột":"Bỏ ruột nhiều nước, thái thanh","Thanh cua":"Loại chín, xử lý theo bao bì","Muối":"Chia cho cơm và trứng"}','Cơm quá nóng làm nori mềm; cơm chỉ cần ấm trước khi dàn.
Không xếp quá nhiều nhân, cuộn vừa chặt để cắt không bung.','45 phút khi đã có cơm chín; chưa tính thời gian nấu cơm.' FROM recipes r WHERE r.title='Cơm cuộn rong biển';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Sườn heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,180.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Gạo tẻ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Gạo nếp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.75,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2300.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo sườn' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Sườn heo":"Chặt miếng 4 cm","Hành tím":"Đập dập","Hành lá":"Cắt nhỏ","Nước lọc":"Cho cháo, thêm nước để chần riêng nếu cần"}','Nồi đáy dày giảm cháy; luôn khuấy chạm đáy khi cháo bắt đầu đặc.
Gạo nếp chỉ dùng ít để tạo độ sánh, cho quá nhiều khiến cháo dễ dính và nặng.','' FROM recipes r WHERE r.title='Cháo sườn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,700.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Bún tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Giấm gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Đu đủ xanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Rau thơm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún chả' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt heo băm":"Có chút mỡ","Thịt ba chỉ":"Thái lát 5 mm","Hành tím":"Băm","Tỏi":"Chia cho thịt và nước chấm","Nước mắm":"Chia 1 cho thịt, 3 cho nước chấm","Đường":"Chia 1 cho thịt, 2 cho nước chấm","Cà rốt":"Thái lát mỏng","Đu đủ xanh":"Gọt, bỏ hạt, thái lát","Rau thơm":"Rửa kỹ, để ráo"}','Dùng chảo chống dính hoặc chảo gang nóng vừa; không cần bếp than.
Chả viên dẹt chín đều hơn viên tròn lớn, kiểm tra nhiệt ở giữa viên.','' FROM recipes r WHERE r.title='Bún chả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Bột gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Bột năng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Nấm mèo khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Giấm gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,750.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh cuốn chảo' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Nấm mèo khô":"Ngâm mềm, băm","Hành tím":"30 g băm, 50 g thái để phi","Nước mắm":"1 cho nhân, 2 cho chấm","Nước lọc":"600 ml bột, 150 ml nước chấm"}','Tỉ lệ dành cho bột gạo và bột năng riêng; dùng bột bánh cuốn pha sẵn thì theo lượng nước trên gói.
Chảo cần chống dính tốt và có nắp vừa; thử một bánh để chỉnh lượng bột trước khi làm cả mẻ.','' FROM recipes r WHERE r.title='Bánh cuốn chảo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Bột gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Bột nghệ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Giá đỗ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Đậu xanh đã nấu chín';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Rau sống';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Giấm gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh xèo' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt ba chỉ":"Thái lát mỏng","Tôm":"Bóc vỏ, bỏ chỉ","Hành lá":"Cắt nhỏ","Hành tây":"Thái","Rau sống":"Rửa kỹ, để ráo","Nước lọc":"350 ml bột, 150 ml chấm"}','Thời gian áp dụng khi đậu xanh đã nấu chín; tự nấu đậu cần chuẩn bị trước.
Bột pha sẵn có tỉ lệ nước riêng, dùng hướng dẫn trên gói thay cho tỉ lệ bột gạo của công thức.','70 phút khi dùng đậu xanh đã nấu chín; chưa gồm thời gian ngâm và nấu đậu nếu tự chuẩn bị.' FROM recipes r WHERE r.title='Bánh xèo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Thịt heo băm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Củ sắn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Bột bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Tiêu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4.0,'ổ' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Bánh mì';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì xíu mại' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Củ sắn":"Gọt, băm nhỏ, vắt nhẹ","Cà chua":"Băm","Hành tím":"Băm","Tỏi":"Băm","Hành lá":"Cắt nhỏ","Bột bắp":"Chia cho nhân và sốt"}','Củ sắn phải gọt sạch vỏ, chỉ dùng phần củ ăn được; không dùng lá, hạt hoặc phần khác của cây.
Nhân trộn đủ dính và viên đều cỡ giúp xíu mại giữ hình, chín đều.','' FROM recipes r WHERE r.title='Bánh mì xíu mại';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Chuối sứ chín';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Bột báng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Đậu phộng rang';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Mè rang';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè chuối' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Chuối sứ chín":"Cân phần ruột, chín vừa","Bột báng":"Ngâm 10 phút","Đậu phộng rang":"Giã","Nước lọc":"600 ml luộc báng, 200 ml chè"}','Chuối sứ chín vừa giữ hình tốt hơn chuối quá mềm; chuối xanh dễ chát.
Bột báng phải chín trước khi thêm vào chè, tránh phải đun chuối quá lâu.','' FROM recipes r WHERE r.title='Chè chuối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu đỏ' AND i.name='Đậu đỏ khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu đỏ' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu đỏ' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu đỏ' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu đỏ' AND i.name='Bột năng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1500.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu đỏ' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Đậu đỏ khô":"Ngâm 8 giờ trong ngăn mát","Nước lọc":"1450 ml nấu đậu, 50 ml hòa bột"}','Cho đường sau khi đậu mềm để thời gian ninh dễ kiểm soát.
Đậu cũ có thể lâu mềm hơn; thời gian ước tính không thay thế việc thử độ mềm hạt.','100 phút nấu khi đậu đã ngâm; cần ngâm trước khoảng 8 giờ, chưa tính trong bộ lọc.' FROM recipes r WHERE r.title='Chè đậu đỏ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh flan hấp' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'cái' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh flan hấp' AND i.name='Lòng đỏ trứng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh flan hấp' AND i.name='Sữa tươi không đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,130.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh flan hấp' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh flan hấp' AND i.name='Vani';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh flan hấp' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Trứng gà":"Dùng cả lòng trắng và đỏ","Lòng đỏ trứng":"Bổ sung ngoài 4 trứng","Đường":"60 g caramel, 70 g hỗn hợp sữa","Nước lọc":"Dùng làm caramel"}','Sữa quá nóng làm trứng đông lợn cợn; thêm sữa từ từ và lọc trước khi hấp.
Hơi nhẹ và nắp khuôn giúp bánh mịn, bớt rỗ; không hấp với nước sôi cuộn mạnh.','60 phút chuẩn bị và hấp; cần làm lạnh thêm ít nhất 4 giờ trước khi dùng, chưa tính trong bộ lọc.' FROM recipes r WHERE r.title='Bánh flan hấp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa bắp' AND i.name='Bắp ngọt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa bắp' AND i.name='Sữa tươi không đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,35.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa bắp' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.125,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa bắp' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa bắp' AND i.name='Nước lọc';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bắp ngọt":"Phần hạt đã tách"}','Bắp ngọt đã có vị ngọt tự nhiên, nếm trước khi thêm hết đường.
Khuấy sát đáy khi nấu lại vì tinh bột bắp dễ bám và cháy.','' FROM recipes r WHERE r.title='Sữa bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,700.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nước ép dứa gừng' AND i.name='Dứa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,8.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nước ép dứa gừng' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nước ép dứa gừng' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nước ép dứa gừng' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nước ép dứa gừng' AND i.name='Nước lọc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nước ép dứa gừng' AND i.name='Đá viên';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Dứa":"Phần thịt sau gọt vỏ, bỏ mắt","Gừng":"Gọt vỏ, thái mỏng","Đường":"Có thể giảm theo độ ngọt dứa","Nước lọc":"Nước uống sạch","Đá viên":"Đá làm từ nước uống sạch"}','Nếm dứa trước khi pha để điều chỉnh đường và chanh cho phù hợp.
Rửa sạch máy và rây ngay sau khi dùng để bã dứa không bám khô.','' FROM recipes r WHERE r.title='Nước ép dứa gừng';

INSERT INTO ingredients (name) SELECT 'Cơm mẻ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm mẻ');

DELETE FROM recipe_ingredients WHERE recipe_id IN (SELECT id FROM recipes WHERE title='Thịt chó nấu rựa mận') AND ingredient_id IN (SELECT id FROM ingredients WHERE name IN ('Me','Mẻ','Cơm mẻ'));

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Cơm mẻ';

UPDATE recipe_details SET ingredient_notes='{"Thịt chó":"Thịt đã làm sạch, sơ chế sẵn, cắt miếng 3 cm; bảo quản lạnh.","Riềng":"Băm hoặc giã nhỏ.","Sả":"Phần non, băm nhỏ.","Cơm mẻ":"Lọc qua rây, bỏ phần hạt thô.","Mắm tôm":"Dùng loại đóng gói có nguồn gốc rõ ràng.","Nghệ":"Giã nhỏ, lấy phần nước.","Hành tím":"Băm nhỏ.","Nước mắm":"Nêm sau cùng nếu cần.","Lá mơ":"Rửa sạch, để ráo và thái nhỏ để nấu cùng."}' WHERE recipe_id IN (SELECT id FROM recipes WHERE title='Thịt chó nấu rựa mận');

INSERT INTO ingredients (name) SELECT 'Cơm mẻ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm mẻ');

DELETE FROM recipe_ingredients WHERE recipe_id IN (SELECT id FROM recipes WHERE title='Chân giò giả cầy') AND ingredient_id IN (SELECT id FROM ingredients WHERE name IN ('Me','Mẻ','Cơm mẻ'));

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Cơm mẻ';

UPDATE recipe_details SET ingredient_notes='{"Chân giò heo":"Đã thui và làm sạch sẵn, chặt khúc 3–4 cm.","Riềng":"Giã nhỏ.","Sả":"Băm phần non.","Cơm mẻ":"Lọc mịn.","Nghệ":"Giã, lọc nước.","Hành tím":"Băm.","Nước mắm":"Chỉ thêm sau khi nếm."}' WHERE recipe_id IN (SELECT id FROM recipes WHERE title='Chân giò giả cầy');

COMMIT;

SELECT COUNT(*) AS tong_cong_thuc FROM recipes;

SELECT COUNT(*) AS cong_thuc_chi_tiet FROM recipe_details;
