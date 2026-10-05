-- Bep Nha: 20 additional detailed recipes, bringing the collection to 60. Apply after 04.

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

INSERT INTO categories (name,description) SELECT 'Ăn sáng','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');

INSERT INTO categories (name,description) SELECT 'Canh','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Canh');

INSERT INTO categories (name,description) SELECT 'Cơm','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Cơm');

INSERT INTO categories (name,description) SELECT 'Rau & salad','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Rau & salad');

INSERT INTO categories (name,description) SELECT 'Tráng miệng','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Tráng miệng');

INSERT INTO categories (name,description) SELECT 'Đồ uống','Công thức cho bữa ăn gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Đồ uống');

INSERT INTO ingredients (name) SELECT 'Bánh phở tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bánh phở tươi');

INSERT INTO ingredients (name) SELECT 'Bánh đa nem' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bánh đa nem');

INSERT INTO ingredients (name) SELECT 'Bún tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bún tươi');

INSERT INTO ingredients (name) SELECT 'Bắp bò' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp bò');

INSERT INTO ingredients (name) SELECT 'Bắp cải' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp cải');

INSERT INTO ingredients (name) SELECT 'Bột bắp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột bắp');

INSERT INTO ingredients (name) SELECT 'Bột gia vị bò kho' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột gia vị bò kho');

INSERT INTO ingredients (name) SELECT 'Bột năng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bột năng');

INSERT INTO ingredients (name) SELECT 'Chân giò heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chân giò heo');

INSERT INTO ingredients (name) SELECT 'Cua đồng xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cua đồng xay');

INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');

INSERT INTO ingredients (name) SELECT 'Cà chua cô đặc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua cô đặc');

INSERT INTO ingredients (name) SELECT 'Cà phê xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà phê xay');

INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');

INSERT INTO ingredients (name) SELECT 'Cá lóc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá lóc');

INSERT INTO ingredients (name) SELECT 'Cánh gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cánh gà');

INSERT INTO ingredients (name) SELECT 'Cơm chín' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm chín');

INSERT INTO ingredients (name) SELECT 'Củ sen' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Củ sen');

INSERT INTO ingredients (name) SELECT 'Dưa chuột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dưa chuột');

INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');

INSERT INTO ingredients (name) SELECT 'Giấm gạo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Giấm gạo');

INSERT INTO ingredients (name) SELECT 'Gà nguyên con' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gà nguyên con');

INSERT INTO ingredients (name) SELECT 'Gừng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gừng');

INSERT INTO ingredients (name) SELECT 'Hoa hồi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hoa hồi');

INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành lá');

INSERT INTO ingredients (name) SELECT 'Hành tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tây');

INSERT INTO ingredients (name) SELECT 'Hành tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tím');

INSERT INTO ingredients (name) SELECT 'Húng quế' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Húng quế');

INSERT INTO ingredients (name) SELECT 'Hạt mùi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hạt mùi');

INSERT INTO ingredients (name) SELECT 'Khoai lang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Khoai lang');

INSERT INTO ingredients (name) SELECT 'Khoai sọ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Khoai sọ');

INSERT INTO ingredients (name) SELECT 'Lá dứa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Lá dứa');

INSERT INTO ingredients (name) SELECT 'Lá lốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Lá lốt');

INSERT INTO ingredients (name) SELECT 'Lá mơ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Lá mơ');

INSERT INTO ingredients (name) SELECT 'Miến khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Miến khô');

INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');

INSERT INTO ingredients (name) SELECT 'Mùi tàu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mùi tàu');

INSERT INTO ingredients (name) SELECT 'Mắm ruốc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mắm ruốc');

INSERT INTO ingredients (name) SELECT 'Mắm tôm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mắm tôm');

INSERT INTO ingredients (name) SELECT 'Mẻ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mẻ');

INSERT INTO ingredients (name) SELECT 'Mộc nhĩ khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mộc nhĩ khô');

INSERT INTO ingredients (name) SELECT 'Nghệ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nghệ');

INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');

INSERT INTO ingredients (name) SELECT 'Nước cốt chanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt chanh');

INSERT INTO ingredients (name) SELECT 'Nước cốt dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt dừa');

INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');

INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');

INSERT INTO ingredients (name) SELECT 'Nấm hương khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm hương khô');

INSERT INTO ingredients (name) SELECT 'Nấm đùi gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm đùi gà');

INSERT INTO ingredients (name) SELECT 'Quế' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Quế');

INSERT INTO ingredients (name) SELECT 'Rau mùi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau mùi');

INSERT INTO ingredients (name) SELECT 'Rau ngổ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau ngổ');

INSERT INTO ingredients (name) SELECT 'Rau răm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau răm');

INSERT INTO ingredients (name) SELECT 'Rau thơm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau thơm');

INSERT INTO ingredients (name) SELECT 'Riềng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Riềng');

INSERT INTO ingredients (name) SELECT 'Sườn cốt lết' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sườn cốt lết');

INSERT INTO ingredients (name) SELECT 'Sườn heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sườn heo');

INSERT INTO ingredients (name) SELECT 'Sả' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sả');

INSERT INTO ingredients (name) SELECT 'Sấu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sấu');

INSERT INTO ingredients (name) SELECT 'Sữa đặc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa đặc');

INSERT INTO ingredients (name) SELECT 'Thịt ba chỉ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt ba chỉ');

INSERT INTO ingredients (name) SELECT 'Thịt bò nạm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt bò nạm');

INSERT INTO ingredients (name) SELECT 'Thịt chó' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt chó');

INSERT INTO ingredients (name) SELECT 'Thịt gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt gà');

INSERT INTO ingredients (name) SELECT 'Thịt heo xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt heo xay');

INSERT INTO ingredients (name) SELECT 'Thịt vịt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt vịt');

INSERT INTO ingredients (name) SELECT 'Tiêu xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tiêu xay');

INSERT INTO ingredients (name) SELECT 'Trứng gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trứng gà');

INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');

INSERT INTO ingredients (name) SELECT 'Vừng rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Vừng rang');

INSERT INTO ingredients (name) SELECT 'Đá viên' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đá viên');

INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');

INSERT INTO ingredients (name) SELECT 'Đậu hũ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ');

INSERT INTO ingredients (name) SELECT 'Đậu phộng rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu phộng rang');

INSERT INTO ingredients (name) SELECT 'Ớt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ớt');

INSERT INTO ingredients (name) SELECT 'Ớt bột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Ớt bột');

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt chó nấu rựa mận','Phiên bản rựa mận nấu chín với riềng, sả, mẻ và mắm tôm, nước sốt sánh để ăn cùng cơm hoặc bún.','1. Sơ chế nguyên liệu | Dùng thịt đã được sơ chế sẵn, thấm khô và cắt miếng 3 cm. Dùng dao thớt riêng cho thịt sống; giã riềng, băm sả và hành, lọc mẻ qua rây.
2. Ướp thịt | Trộn thịt với riềng, sả, mẻ, mắm tôm, nước nghệ và đường. Để 15 phút trong ngăn mát; chưa thêm nước mắm vì mắm tôm đã có vị mặn.
3. Xào săn | Làm nóng dầu trong nồi đáy dày trên lửa vừa, phi hành 30 giây. Cho thịt cùng toàn bộ gia vị ướp vào, đảo 5–7 phút đến khi mặt ngoài thịt săn.
4. Thêm nước | Rót 350 ml nước nóng vào nồi, đảo nhẹ và đun sôi. Hớt bọt nếu có, hạ lửa để nồi sôi lăn tăn, đậy hé nắp.
5. Om mềm | Om 45–55 phút, đảo mỗi 10 phút. Thêm ít nước nóng nếu sốt cạn mà thịt còn dai. Thịt phải chín kỹ và mềm; dùng nhiệt kế kiểm tra phần dày đạt ít nhất 74°C.
6. Nêm và cô sốt | Khi thịt mềm, mở nắp nấu 5 phút cho sốt sánh. Nếm rồi mới thêm từng chút nước mắm nếu cần; nếu chua quá, thêm một ít nước nóng và điều chỉnh đường.
7. Hoàn thành | Cho lá mơ đã thái vào, đảo và nấu thêm 2 phút. Tắt bếp, múc ra tô, dùng nóng với cơm hoặc bún; công thức này không dùng tiết sống.','assets/photos/recipe-38.jpg',90,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt chó nấu rựa mận');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Phiên bản rựa mận nấu chín với riềng, sả, mẻ và mắm tôm, nước sốt sánh để ăn cùng cơm hoặc bún.',instructions='1. Sơ chế nguyên liệu | Dùng thịt đã được sơ chế sẵn, thấm khô và cắt miếng 3 cm. Dùng dao thớt riêng cho thịt sống; giã riềng, băm sả và hành, lọc mẻ qua rây.
2. Ướp thịt | Trộn thịt với riềng, sả, mẻ, mắm tôm, nước nghệ và đường. Để 15 phút trong ngăn mát; chưa thêm nước mắm vì mắm tôm đã có vị mặn.
3. Xào săn | Làm nóng dầu trong nồi đáy dày trên lửa vừa, phi hành 30 giây. Cho thịt cùng toàn bộ gia vị ướp vào, đảo 5–7 phút đến khi mặt ngoài thịt săn.
4. Thêm nước | Rót 350 ml nước nóng vào nồi, đảo nhẹ và đun sôi. Hớt bọt nếu có, hạ lửa để nồi sôi lăn tăn, đậy hé nắp.
5. Om mềm | Om 45–55 phút, đảo mỗi 10 phút. Thêm ít nước nóng nếu sốt cạn mà thịt còn dai. Thịt phải chín kỹ và mềm; dùng nhiệt kế kiểm tra phần dày đạt ít nhất 74°C.
6. Nêm và cô sốt | Khi thịt mềm, mở nắp nấu 5 phút cho sốt sánh. Nếm rồi mới thêm từng chút nước mắm nếu cần; nếu chua quá, thêm một ít nước nóng và điều chỉnh đường.
7. Hoàn thành | Cho lá mơ đã thái vào, đảo và nấu thêm 2 phút. Tắt bếp, múc ra tô, dùng nóng với cơm hoặc bún; công thức này không dùng tiết sống.',image_url='assets/photos/recipe-38.jpg',prep_time_minutes=90,servings=4 WHERE title='Thịt chó nấu rựa mận';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt chó xào sả ớt','Thịt thái mỏng xào riềng, sả và ớt, có một ít mắm tôm để tạo vị; xào đến khi chín kỹ.','1. Thái thịt và rau gia vị | Thấm khô thịt đã sơ chế, thái lát đều 3–4 mm ngang thớ. Băm riềng, tỏi, hành và thái sả thật mỏng; rửa ớt rồi thái nhỏ.
2. Ướp | Trộn thịt với mắm tôm, nước mắm, đường, riềng và nửa tỏi. Ướp 10 phút trong ngăn mát, không để thịt sống cạnh rau hoặc thực phẩm đã chín.
3. Phi sả | Làm nóng dầu trên lửa vừa. Cho sả, hành và phần tỏi còn lại vào, đảo 1–2 phút đến khi dậy mùi; không để sả cháy nâu đen.
4. Xào thịt | Tăng lửa vừa lớn, cho thịt vào dàn đều, đảo 3–4 phút. Nếu chảo nhỏ, chia hai mẻ để thịt xào nóng đều thay vì ra nhiều nước.
5. Nấu chín kỹ | Thêm 3 muỗng canh nước, hạ lửa vừa và nấu thêm 5–7 phút, đảo đều. Thịt phải chín hoàn toàn; kiểm tra phần dày đạt ít nhất 74°C, tăng thời gian nếu lát thịt dày.
6. Hoàn thành | Cho ớt vào, đảo thêm 1 phút cho nước sốt bám thịt. Nếm rồi tắt bếp, rắc vừng rang và dùng ngay với cơm nóng.','assets/photos/recipe-39.jpg',35,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt chó xào sả ớt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Thịt thái mỏng xào riềng, sả và ớt, có một ít mắm tôm để tạo vị; xào đến khi chín kỹ.',instructions='1. Thái thịt và rau gia vị | Thấm khô thịt đã sơ chế, thái lát đều 3–4 mm ngang thớ. Băm riềng, tỏi, hành và thái sả thật mỏng; rửa ớt rồi thái nhỏ.
2. Ướp | Trộn thịt với mắm tôm, nước mắm, đường, riềng và nửa tỏi. Ướp 10 phút trong ngăn mát, không để thịt sống cạnh rau hoặc thực phẩm đã chín.
3. Phi sả | Làm nóng dầu trên lửa vừa. Cho sả, hành và phần tỏi còn lại vào, đảo 1–2 phút đến khi dậy mùi; không để sả cháy nâu đen.
4. Xào thịt | Tăng lửa vừa lớn, cho thịt vào dàn đều, đảo 3–4 phút. Nếu chảo nhỏ, chia hai mẻ để thịt xào nóng đều thay vì ra nhiều nước.
5. Nấu chín kỹ | Thêm 3 muỗng canh nước, hạ lửa vừa và nấu thêm 5–7 phút, đảo đều. Thịt phải chín hoàn toàn; kiểm tra phần dày đạt ít nhất 74°C, tăng thời gian nếu lát thịt dày.
6. Hoàn thành | Cho ớt vào, đảo thêm 1 phút cho nước sốt bám thịt. Nếm rồi tắt bếp, rắc vừng rang và dùng ngay với cơm nóng.',image_url='assets/photos/recipe-39.jpg',prep_time_minutes=35,servings=3 WHERE title='Thịt chó xào sả ớt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún đậu mắm tôm','Mẹt bún đậu với đậu hũ chiên, thịt heo luộc và mắm tôm chưng, có rau ăn kèm và cách pha nước chấm.','1. Chuẩn bị | Rửa rau thơm và dưa chuột, để ráo riêng. Thấm khô đậu, cắt miếng 2–3 cm để hạn chế bắn dầu; chuẩn bị thớt riêng để thái thịt đã chín.
2. Luộc thịt | Cho thịt vào nồi, thêm nước đủ ngập, muối và nửa hành tím. Đun sôi, hớt bọt rồi hạ lửa luộc 25–30 phút tùy độ dày; phần dày đạt 63°C và nghỉ ít nhất 3 phút trước khi thái.
3. Chiên đậu | Trong lúc luộc thịt, đun dầu trên lửa vừa trong chảo nhỏ. Cho đậu vào từng mẻ, chiên 3–4 phút mỗi mặt đến vàng, gắp lên giấy thấm; giữ riêng phần dầu sạch để chưng mắm.
4. Chưng mắm tôm | Phi hành băm với 1 muỗng canh dầu trên lửa vừa nhỏ. Thêm mắm tôm và 3 muỗng canh nước, khuấy, đun sôi nhẹ 2–3 phút rồi tắt bếp.
5. Pha nước chấm | Để mắm nguội bớt rồi thêm đường, nước cốt chanh và ớt. Khuấy đều, nếm và thêm từng chút nước chín nếu mặn; chia vào bát nhỏ cho từng người.
6. Sắp mẹt | Thái thịt thành lát mỏng, cắt bún lá nếu dùng loại ép bánh. Xếp bún, đậu, thịt, dưa chuột và rau riêng từng góc, dùng ngay khi đậu còn giòn.','assets/photos/recipe-40.jpg',45,3 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún đậu mắm tôm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Mẹt bún đậu với đậu hũ chiên, thịt heo luộc và mắm tôm chưng, có rau ăn kèm và cách pha nước chấm.',instructions='1. Chuẩn bị | Rửa rau thơm và dưa chuột, để ráo riêng. Thấm khô đậu, cắt miếng 2–3 cm để hạn chế bắn dầu; chuẩn bị thớt riêng để thái thịt đã chín.
2. Luộc thịt | Cho thịt vào nồi, thêm nước đủ ngập, muối và nửa hành tím. Đun sôi, hớt bọt rồi hạ lửa luộc 25–30 phút tùy độ dày; phần dày đạt 63°C và nghỉ ít nhất 3 phút trước khi thái.
3. Chiên đậu | Trong lúc luộc thịt, đun dầu trên lửa vừa trong chảo nhỏ. Cho đậu vào từng mẻ, chiên 3–4 phút mỗi mặt đến vàng, gắp lên giấy thấm; giữ riêng phần dầu sạch để chưng mắm.
4. Chưng mắm tôm | Phi hành băm với 1 muỗng canh dầu trên lửa vừa nhỏ. Thêm mắm tôm và 3 muỗng canh nước, khuấy, đun sôi nhẹ 2–3 phút rồi tắt bếp.
5. Pha nước chấm | Để mắm nguội bớt rồi thêm đường, nước cốt chanh và ớt. Khuấy đều, nếm và thêm từng chút nước chín nếu mặn; chia vào bát nhỏ cho từng người.
6. Sắp mẹt | Thái thịt thành lát mỏng, cắt bún lá nếu dùng loại ép bánh. Xếp bún, đậu, thịt, dưa chuột và rau riêng từng góc, dùng ngay khi đậu còn giòn.',image_url='assets/photos/recipe-40.jpg',prep_time_minutes=45,servings=3 WHERE title='Bún đậu mắm tôm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt heo luộc chấm mắm tôm','Thịt heo luộc thái mỏng, ăn cùng rau và mắm tôm chưng pha chanh; có hướng dẫn luộc và thái thịt.','1. Chuẩn bị | Thấm khô thịt, buộc gọn nếu dùng chân giò rút xương. Rửa dưa chuột và rau, để ráo; đập gừng, bóc hành và tách phần hành để băm.
2. Đun nước luộc | Cho khoảng 1,45 lít nước, gừng, hành và muối vào nồi. Khi nước sôi, hạ nhẹ lửa rồi đặt thịt vào; nước cần phủ hết miếng thịt.
3. Luộc | Nấu sôi nhẹ 25–35 phút, hớt bọt và trở thịt giữa chừng. Kiểm tra phần dày đạt 63°C, để thịt nghỉ ít nhất 3 phút sau khi lấy ra; miếng dày hơn cần luộc lâu hơn.
4. Chưng mắm | Phi hành băm với dầu trên lửa vừa nhỏ. Thêm mắm tôm và 50 ml nước, khuấy rồi nấu sôi nhẹ 2–3 phút, tắt bếp.
5. Pha chấm | Khi mắm bớt nóng, thêm đường, nước cốt chanh và ớt thái lát. Nếm, thêm ít nước chín nếu quá mặn; không trộn nước luộc chưa chín vào bát chấm.
6. Thái và dọn | Sau khi thịt nghỉ, thái ngang thớ thành lát 3–4 mm bằng dao thớt sạch. Xếp cùng dưa chuột và rau, dọn với bát mắm tôm đã pha.','assets/photos/recipe-41.jpg',45,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt heo luộc chấm mắm tôm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Thịt heo luộc thái mỏng, ăn cùng rau và mắm tôm chưng pha chanh; có hướng dẫn luộc và thái thịt.',instructions='1. Chuẩn bị | Thấm khô thịt, buộc gọn nếu dùng chân giò rút xương. Rửa dưa chuột và rau, để ráo; đập gừng, bóc hành và tách phần hành để băm.
2. Đun nước luộc | Cho khoảng 1,45 lít nước, gừng, hành và muối vào nồi. Khi nước sôi, hạ nhẹ lửa rồi đặt thịt vào; nước cần phủ hết miếng thịt.
3. Luộc | Nấu sôi nhẹ 25–35 phút, hớt bọt và trở thịt giữa chừng. Kiểm tra phần dày đạt 63°C, để thịt nghỉ ít nhất 3 phút sau khi lấy ra; miếng dày hơn cần luộc lâu hơn.
4. Chưng mắm | Phi hành băm với dầu trên lửa vừa nhỏ. Thêm mắm tôm và 50 ml nước, khuấy rồi nấu sôi nhẹ 2–3 phút, tắt bếp.
5. Pha chấm | Khi mắm bớt nóng, thêm đường, nước cốt chanh và ớt thái lát. Nếm, thêm ít nước chín nếu quá mặn; không trộn nước luộc chưa chín vào bát chấm.
6. Thái và dọn | Sau khi thịt nghỉ, thái ngang thớ thành lát 3–4 mm bằng dao thớt sạch. Xếp cùng dưa chuột và rau, dọn với bát mắm tôm đã pha.',image_url='assets/photos/recipe-41.jpg',prep_time_minutes=45,servings=3 WHERE title='Thịt heo luộc chấm mắm tôm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chân giò giả cầy','Chân giò heo nấu riềng, mẻ và mắm tôm đến mềm, phiên bản dùng chân giò thui sơ chế sẵn.','1. Sơ chế | Dùng chân giò đã thui và làm sạch sẵn, kiểm tra không còn lông hoặc phần cháy đen. Thấm khô, chặt khúc đều; giã riềng, băm sả và hành, lọc mẻ.
2. Ướp | Trộn chân giò với riềng, sả, mẻ, mắm tôm, nước nghệ và đường. Ướp 20 phút trong ngăn mát để gia vị bám đều.
3. Xào | Làm nóng dầu, phi hành trên lửa vừa 30 giây. Cho chân giò cùng nước ướp vào, đảo 6–8 phút đến khi săn mặt ngoài.
4. Đun sôi | Thêm 650 ml nước nóng, khuấy phần gia vị dưới đáy. Đun sôi, hớt bọt rồi hạ lửa nhỏ, đậy hé nắp.
5. Hầm mềm | Hầm 65–80 phút, đảo nhẹ và kiểm tra nước mỗi 15 phút. Chân giò đạt khi thịt mềm, đũa dễ xuyên qua nhưng da chưa nát; nếu cần, thêm nước nóng và hầm lâu hơn.
6. Cô sốt | Mở nắp, nấu lửa vừa 5–8 phút để sốt sánh. Nếm độ chua mặn rồi mới thêm chút nước mắm hoặc nước nóng, tránh cô quá cạn.
7. Dọn món | Múc ra tô, rưới nước sốt và dùng nóng với cơm hoặc bún. Gỡ bỏ mảnh xương nhỏ khi chia phần ăn.','assets/photos/recipe-42.jpg',120,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chân giò giả cầy');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Chân giò heo nấu riềng, mẻ và mắm tôm đến mềm, phiên bản dùng chân giò thui sơ chế sẵn.',instructions='1. Sơ chế | Dùng chân giò đã thui và làm sạch sẵn, kiểm tra không còn lông hoặc phần cháy đen. Thấm khô, chặt khúc đều; giã riềng, băm sả và hành, lọc mẻ.
2. Ướp | Trộn chân giò với riềng, sả, mẻ, mắm tôm, nước nghệ và đường. Ướp 20 phút trong ngăn mát để gia vị bám đều.
3. Xào | Làm nóng dầu, phi hành trên lửa vừa 30 giây. Cho chân giò cùng nước ướp vào, đảo 6–8 phút đến khi săn mặt ngoài.
4. Đun sôi | Thêm 650 ml nước nóng, khuấy phần gia vị dưới đáy. Đun sôi, hớt bọt rồi hạ lửa nhỏ, đậy hé nắp.
5. Hầm mềm | Hầm 65–80 phút, đảo nhẹ và kiểm tra nước mỗi 15 phút. Chân giò đạt khi thịt mềm, đũa dễ xuyên qua nhưng da chưa nát; nếu cần, thêm nước nóng và hầm lâu hơn.
6. Cô sốt | Mở nắp, nấu lửa vừa 5–8 phút để sốt sánh. Nếm độ chua mặn rồi mới thêm chút nước mắm hoặc nước nóng, tránh cô quá cạn.
7. Dọn món | Múc ra tô, rưới nước sốt và dùng nóng với cơm hoặc bún. Gỡ bỏ mảnh xương nhỏ khi chia phần ăn.',image_url='assets/photos/recipe-42.jpg',prep_time_minutes=120,servings=4 WHERE title='Chân giò giả cầy';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bò kho','Bò nạm hầm cà rốt với sả, quế và hoa hồi; nước kho thơm, thịt mềm để ăn với bánh mì hoặc bún.','1. Chuẩn bị | Thấm khô thịt bò rồi cắt khối 3 cm ngang thớ. Gọt cà rốt, cắt khúc; đập sả, băm hành tỏi và thái gừng.
2. Ướp | Trộn bò với bột bò kho, nước mắm, đường và nửa hành tỏi. Ướp 20 phút trong ngăn mát; nếu bột gia vị đã mặn, giữ lại một phần nước mắm.
3. Rang gia vị | Rang quế và hoa hồi trong nồi khô trên lửa nhỏ 30–45 giây cho thơm, lấy ra. Thêm dầu, phi hành tỏi còn lại, sả và gừng 1 phút.
4. Xào bò | Cho cà chua cô đặc vào đảo 30 giây, thêm thịt cùng nước ướp. Xào lửa vừa lớn 5–6 phút đến khi mặt ngoài săn, không để đáy nồi cháy.
5. Hầm | Thêm 1,2 lít nước nóng, quế và hồi. Đun sôi, hớt bọt rồi đậy hé nắp, hầm sôi nhẹ khoảng 75–90 phút; thêm ít nước nóng nếu cạn.
6. Thêm cà rốt | Khi bò gần mềm, thêm cà rốt, hầm tiếp 15–20 phút. Thịt đạt khi đũa dễ xuyên qua, cà rốt mềm nhưng không nát; nếu bò còn dai, hầm thêm trước khi dọn.
7. Nêm và dọn | Vớt quế, hồi, sả và gừng; nếm nước kho, điều chỉnh bằng ít nước mắm hoặc nước nóng. Múc ra tô và thêm húng quế, ăn cùng bánh mì hoặc bún.','assets/photos/recipe-43.jpg',150,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bò kho');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Bò nạm hầm cà rốt với sả, quế và hoa hồi; nước kho thơm, thịt mềm để ăn với bánh mì hoặc bún.',instructions='1. Chuẩn bị | Thấm khô thịt bò rồi cắt khối 3 cm ngang thớ. Gọt cà rốt, cắt khúc; đập sả, băm hành tỏi và thái gừng.
2. Ướp | Trộn bò với bột bò kho, nước mắm, đường và nửa hành tỏi. Ướp 20 phút trong ngăn mát; nếu bột gia vị đã mặn, giữ lại một phần nước mắm.
3. Rang gia vị | Rang quế và hoa hồi trong nồi khô trên lửa nhỏ 30–45 giây cho thơm, lấy ra. Thêm dầu, phi hành tỏi còn lại, sả và gừng 1 phút.
4. Xào bò | Cho cà chua cô đặc vào đảo 30 giây, thêm thịt cùng nước ướp. Xào lửa vừa lớn 5–6 phút đến khi mặt ngoài săn, không để đáy nồi cháy.
5. Hầm | Thêm 1,2 lít nước nóng, quế và hồi. Đun sôi, hớt bọt rồi đậy hé nắp, hầm sôi nhẹ khoảng 75–90 phút; thêm ít nước nóng nếu cạn.
6. Thêm cà rốt | Khi bò gần mềm, thêm cà rốt, hầm tiếp 15–20 phút. Thịt đạt khi đũa dễ xuyên qua, cà rốt mềm nhưng không nát; nếu bò còn dai, hầm thêm trước khi dọn.
7. Nêm và dọn | Vớt quế, hồi, sả và gừng; nếm nước kho, điều chỉnh bằng ít nước mắm hoặc nước nóng. Múc ra tô và thêm húng quế, ăn cùng bánh mì hoặc bún.',image_url='assets/photos/recipe-43.jpg',prep_time_minutes=150,servings=4 WHERE title='Bò kho';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gà hầm nấm','Gà hầm với nấm hương và nấm đùi gà, nước dùng thanh và hướng dẫn làm mềm thịt bằng lửa nhỏ.','1. Ngâm nấm | Ngâm nấm hương trong nước ấm 20 phút đến mềm, rửa lại và bỏ chân. Cắt nấm đùi gà, gọt cà rốt; làm các việc còn lại trong lúc ngâm.
2. Sơ chế gà | Thấm khô gà, chặt đều 4–5 cm, loại mảnh xương vụn. Gừng thái lát, hành tím đập dập; giữ dao thớt thịt sống riêng.
3. Đun nước dùng | Cho gà, gừng, hành và 1,3 lít nước vào nồi. Đun sôi trên lửa vừa, hớt bọt, thêm muối rồi hạ lửa nhỏ.
4. Hầm gà | Đậy hé nắp, hầm sôi nhẹ 35–45 phút. Thỉnh thoảng hớt bọt và thêm nước nóng nếu nước xuống quá thấp; tránh khuấy làm vỡ thịt.
5. Thêm nấm và rau | Cho nấm hương, nấm đùi gà và cà rốt vào, hầm thêm 15 phút. Kiểm tra phần thịt gà dày nhất đạt ít nhất 74°C; gà già có thể cần hầm lâu hơn cho mềm.
6. Nêm | Thêm nước mắm, nếm rồi điều chỉnh từng chút muối hoặc nước nóng. Vớt gừng, hành tím nếu không muốn ăn; kiểm tra nấm và cà rốt đã mềm.
7. Hoàn thành | Tắt bếp, thêm hành lá và tiêu. Múc gà cùng nấm ra tô, chan nước hầm và dùng nóng.','assets/photos/recipe-44.jpg',90,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gà hầm nấm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Gà hầm với nấm hương và nấm đùi gà, nước dùng thanh và hướng dẫn làm mềm thịt bằng lửa nhỏ.',instructions='1. Ngâm nấm | Ngâm nấm hương trong nước ấm 20 phút đến mềm, rửa lại và bỏ chân. Cắt nấm đùi gà, gọt cà rốt; làm các việc còn lại trong lúc ngâm.
2. Sơ chế gà | Thấm khô gà, chặt đều 4–5 cm, loại mảnh xương vụn. Gừng thái lát, hành tím đập dập; giữ dao thớt thịt sống riêng.
3. Đun nước dùng | Cho gà, gừng, hành và 1,3 lít nước vào nồi. Đun sôi trên lửa vừa, hớt bọt, thêm muối rồi hạ lửa nhỏ.
4. Hầm gà | Đậy hé nắp, hầm sôi nhẹ 35–45 phút. Thỉnh thoảng hớt bọt và thêm nước nóng nếu nước xuống quá thấp; tránh khuấy làm vỡ thịt.
5. Thêm nấm và rau | Cho nấm hương, nấm đùi gà và cà rốt vào, hầm thêm 15 phút. Kiểm tra phần thịt gà dày nhất đạt ít nhất 74°C; gà già có thể cần hầm lâu hơn cho mềm.
6. Nêm | Thêm nước mắm, nếm rồi điều chỉnh từng chút muối hoặc nước nóng. Vớt gừng, hành tím nếu không muốn ăn; kiểm tra nấm và cà rốt đã mềm.
7. Hoàn thành | Tắt bếp, thêm hành lá và tiêu. Múc gà cùng nấm ra tô, chan nước hầm và dùng nóng.',image_url='assets/photos/recipe-44.jpg',prep_time_minutes=90,servings=4 WHERE title='Gà hầm nấm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Vịt om sấu','Vịt om khoai sọ và sấu chua dịu, thơm sả; có cách điều chỉnh độ chua và kiểm tra thịt chín.','1. Chuẩn bị | Thấm khô vịt, chặt miếng, cắt bỏ mỡ dư. Cạo vỏ và khía sấu. Đeo găng khi gọt khoai sọ, rửa và cắt miếng 3 cm; băm hành tỏi và một nửa sả.
2. Ướp vịt | Trộn vịt với nước mắm, muối, hành, tỏi và sả băm. Ướp 15 phút trong ngăn mát, trong lúc đó chuẩn bị rau ngổ và mùi tàu.
3. Xào săn | Làm nóng dầu trên lửa vừa, cho vịt và gia vị vào đảo 7–8 phút. Nếu vịt ra nhiều mỡ, dùng thìa gạn bớt, giữ một ít để món không ngấy.
4. Om | Thêm 1 lít nước nóng, gừng, sả đập dập và sấu. Đun sôi, hớt bọt rồi hạ lửa, om hé nắp 30–35 phút.
5. Thêm khoai | Cho khoai sọ vào, om thêm 15–20 phút đến khi khoai mềm. Thịt vịt phải chín kỹ, phần dày đạt ít nhất 74°C; vịt dai cần nấu thêm và bổ sung nước nóng.
6. Điều chỉnh chua | Vớt sấu ra bát, dầm một phần rồi cho nước sấu trở lại nồi từng ít một đến độ chua vừa. Không dầm tất cả ngay; nếm lại độ mặn.
7. Hoàn thành | Cho rau ngổ và mùi tàu vào, đun thêm 1 phút rồi tắt bếp. Múc ra tô, bỏ sả và gừng lớn, dùng với cơm hoặc bún.','assets/photos/recipe-45.jpg',90,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Vịt om sấu');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Vịt om khoai sọ và sấu chua dịu, thơm sả; có cách điều chỉnh độ chua và kiểm tra thịt chín.',instructions='1. Chuẩn bị | Thấm khô vịt, chặt miếng, cắt bỏ mỡ dư. Cạo vỏ và khía sấu. Đeo găng khi gọt khoai sọ, rửa và cắt miếng 3 cm; băm hành tỏi và một nửa sả.
2. Ướp vịt | Trộn vịt với nước mắm, muối, hành, tỏi và sả băm. Ướp 15 phút trong ngăn mát, trong lúc đó chuẩn bị rau ngổ và mùi tàu.
3. Xào săn | Làm nóng dầu trên lửa vừa, cho vịt và gia vị vào đảo 7–8 phút. Nếu vịt ra nhiều mỡ, dùng thìa gạn bớt, giữ một ít để món không ngấy.
4. Om | Thêm 1 lít nước nóng, gừng, sả đập dập và sấu. Đun sôi, hớt bọt rồi hạ lửa, om hé nắp 30–35 phút.
5. Thêm khoai | Cho khoai sọ vào, om thêm 15–20 phút đến khi khoai mềm. Thịt vịt phải chín kỹ, phần dày đạt ít nhất 74°C; vịt dai cần nấu thêm và bổ sung nước nóng.
6. Điều chỉnh chua | Vớt sấu ra bát, dầm một phần rồi cho nước sấu trở lại nồi từng ít một đến độ chua vừa. Không dầm tất cả ngay; nếm lại độ mặn.
7. Hoàn thành | Cho rau ngổ và mùi tàu vào, đun thêm 1 phút rồi tắt bếp. Múc ra tô, bỏ sả và gừng lớn, dùng với cơm hoặc bún.',image_url='assets/photos/recipe-45.jpg',prep_time_minutes=90,servings=4 WHERE title='Vịt om sấu';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cá kho tộ','Cá lóc kho trong nồi đáy dày với nước màu và tiêu, nước kho sánh, cá giữ nguyên khúc.','1. Sơ chế | Kiểm tra cá đã bỏ vảy, ruột và màng đen, thấm khô từng khúc. Thái ba chỉ, băm hành tỏi, cắt hành lá và để cá lạnh trong lúc chuẩn bị.
2. Ướp cá | Trộn nhẹ cá với nước mắm, 0,5 muỗng canh đường, nửa hành tỏi và nửa tiêu. Ướp 15 phút trong ngăn mát.
3. Tạo nước màu | Cho 1 muỗng canh đường và dầu vào nồi, đun nhỏ đến màu nâu vàng. Tắt lửa, thêm từ từ 50 ml nước nóng rồi khuấy; chú ý nước màu bắn nóng.
4. Xếp nồi | Bật lửa vừa, cho thịt ba chỉ và hành tỏi còn lại vào nước màu, đảo 3 phút. Xếp cá lên trên, thêm nước ướp, 200 ml nước nóng và ớt.
5. Kho | Đun sôi rồi hạ lửa nhỏ, đậy hé nắp, kho 25–30 phút. Rưới nước lên mặt cá vài lần, hạn chế trở; nếu cạn sớm, thêm nước nóng từng chút.
6. Kiểm tra và dọn | Cá đạt 63°C ở phần dày, thịt trắng đục và tách thớ; ba chỉ chín kỹ. Mở nắp cô sốt 3–5 phút, nếm, thêm tiêu còn lại và hành lá rồi tắt bếp.','assets/photos/recipe-46.jpg',60,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cá kho tộ');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cá lóc kho trong nồi đáy dày với nước màu và tiêu, nước kho sánh, cá giữ nguyên khúc.',instructions='1. Sơ chế | Kiểm tra cá đã bỏ vảy, ruột và màng đen, thấm khô từng khúc. Thái ba chỉ, băm hành tỏi, cắt hành lá và để cá lạnh trong lúc chuẩn bị.
2. Ướp cá | Trộn nhẹ cá với nước mắm, 0,5 muỗng canh đường, nửa hành tỏi và nửa tiêu. Ướp 15 phút trong ngăn mát.
3. Tạo nước màu | Cho 1 muỗng canh đường và dầu vào nồi, đun nhỏ đến màu nâu vàng. Tắt lửa, thêm từ từ 50 ml nước nóng rồi khuấy; chú ý nước màu bắn nóng.
4. Xếp nồi | Bật lửa vừa, cho thịt ba chỉ và hành tỏi còn lại vào nước màu, đảo 3 phút. Xếp cá lên trên, thêm nước ướp, 200 ml nước nóng và ớt.
5. Kho | Đun sôi rồi hạ lửa nhỏ, đậy hé nắp, kho 25–30 phút. Rưới nước lên mặt cá vài lần, hạn chế trở; nếu cạn sớm, thêm nước nóng từng chút.
6. Kiểm tra và dọn | Cá đạt 63°C ở phần dày, thịt trắng đục và tách thớ; ba chỉ chín kỹ. Mở nắp cô sốt 3–5 phút, nếm, thêm tiêu còn lại và hành lá rồi tắt bếp.',image_url='assets/photos/recipe-46.jpg',prep_time_minutes=60,servings=3 WHERE title='Cá kho tộ';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cánh gà chiên nước mắm','Cánh gà chiên vàng áo sốt mắm tỏi, có bước lau khô và kiểm tra phần thịt sát xương chín.','1. Chuẩn bị | Thấm thật khô cánh gà, cắt qua khớp thành miếng. Băm tỏi và ớt; dùng dao thớt riêng cho gà sống.
2. Áo bột | Rắc bột bắp và tiêu lên cánh, trộn để có lớp áo thật mỏng. Để 5 phút; gạt bớt bột rời để bột không làm dầu đục nhanh.
3. Pha sốt | Khuấy nước mắm, đường và 3 muỗng canh nước trong bát đến tan đường. Chuẩn bị giấy thấm dầu và kẹp gắp.
4. Chiên | Làm nóng dầu trên lửa vừa, chiên cánh thành từng mẻ khoảng 12–16 phút, trở vài lần. Kiểm tra phần dày sát xương đạt ít nhất 74°C; không chỉ dựa vào màu vàng của da.
5. Làm sốt | Gạn dầu sang dụng cụ chịu nhiệt, giữ 1 muỗng canh trong chảo. Phi tỏi trên lửa nhỏ 30 giây, đổ sốt vào, đun sôi nhẹ 1–2 phút đến hơi sánh.
6. Áo và dọn | Cho cánh đã chín và ớt vào, đảo lửa vừa 1–2 phút để sốt bám đều. Tắt bếp, dọn ngay; không đun quá lâu khiến sốt quá mặn.','assets/photos/recipe-47.jpg',45,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cánh gà chiên nước mắm');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Cánh gà chiên vàng áo sốt mắm tỏi, có bước lau khô và kiểm tra phần thịt sát xương chín.',instructions='1. Chuẩn bị | Thấm thật khô cánh gà, cắt qua khớp thành miếng. Băm tỏi và ớt; dùng dao thớt riêng cho gà sống.
2. Áo bột | Rắc bột bắp và tiêu lên cánh, trộn để có lớp áo thật mỏng. Để 5 phút; gạt bớt bột rời để bột không làm dầu đục nhanh.
3. Pha sốt | Khuấy nước mắm, đường và 3 muỗng canh nước trong bát đến tan đường. Chuẩn bị giấy thấm dầu và kẹp gắp.
4. Chiên | Làm nóng dầu trên lửa vừa, chiên cánh thành từng mẻ khoảng 12–16 phút, trở vài lần. Kiểm tra phần dày sát xương đạt ít nhất 74°C; không chỉ dựa vào màu vàng của da.
5. Làm sốt | Gạn dầu sang dụng cụ chịu nhiệt, giữ 1 muỗng canh trong chảo. Phi tỏi trên lửa nhỏ 30 giây, đổ sốt vào, đun sôi nhẹ 1–2 phút đến hơi sánh.
6. Áo và dọn | Cho cánh đã chín và ớt vào, đảo lửa vừa 1–2 phút để sốt bám đều. Tắt bếp, dọn ngay; không đun quá lâu khiến sốt quá mặn.',image_url='assets/photos/recipe-47.jpg',prep_time_minutes=45,servings=3 WHERE title='Cánh gà chiên nước mắm';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chả lá lốt','Thịt heo xay cuốn lá lốt chiên thơm, có cách trộn nhân, cuốn chặt và chiên để nhân chín hoàn toàn.','1. Chuẩn bị lá | Chọn lá lành cỡ gần nhau, rửa nhẹ và lau hoặc để ráo hoàn toàn. Thái nhỏ 3–4 lá nhỏ để trộn nhân; băm hành tím, tỏi và thái hành lá.
2. Trộn nhân | Trộn thịt xay với hành tím, tỏi, hành lá, lá lốt thái, nước mắm, đường và tiêu. Đảo 1 phút cho quyện, để 10 phút trong ngăn mát.
3. Cuốn | Đặt mặt bóng của lá xuống dưới, cho một phần nhân nhỏ dọc mép lá. Gấp hai bên nếu cần rồi cuốn gọn, đường kính khoảng 1,5–2 cm; không cuốn quá dày.
4. Làm nóng chảo | Cho dầu vào chảo chống dính, đun lửa vừa nhỏ. Xếp chả với mép cuốn úp xuống, chừa khoảng cách để dễ trở.
5. Chiên chín | Chiên 8–12 phút, trở đều các mặt. Nhân thịt xay ở giữa đạt ít nhất 71°C; nếu chả lớn, kéo dài thời gian và giữ lửa nhỏ để lá không cháy.
6. Dọn món | Gắp chả lên giấy thấm dầu 1 phút rồi xếp ra đĩa. Dùng nóng cùng cơm, bún hoặc rau; không dùng lại đĩa đã đựng nhân sống.','assets/photos/recipe-48.jpg',40,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chả lá lốt');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Thịt heo xay cuốn lá lốt chiên thơm, có cách trộn nhân, cuốn chặt và chiên để nhân chín hoàn toàn.',instructions='1. Chuẩn bị lá | Chọn lá lành cỡ gần nhau, rửa nhẹ và lau hoặc để ráo hoàn toàn. Thái nhỏ 3–4 lá nhỏ để trộn nhân; băm hành tím, tỏi và thái hành lá.
2. Trộn nhân | Trộn thịt xay với hành tím, tỏi, hành lá, lá lốt thái, nước mắm, đường và tiêu. Đảo 1 phút cho quyện, để 10 phút trong ngăn mát.
3. Cuốn | Đặt mặt bóng của lá xuống dưới, cho một phần nhân nhỏ dọc mép lá. Gấp hai bên nếu cần rồi cuốn gọn, đường kính khoảng 1,5–2 cm; không cuốn quá dày.
4. Làm nóng chảo | Cho dầu vào chảo chống dính, đun lửa vừa nhỏ. Xếp chả với mép cuốn úp xuống, chừa khoảng cách để dễ trở.
5. Chiên chín | Chiên 8–12 phút, trở đều các mặt. Nhân thịt xay ở giữa đạt ít nhất 71°C; nếu chả lớn, kéo dài thời gian và giữ lửa nhỏ để lá không cháy.
6. Dọn món | Gắp chả lên giấy thấm dầu 1 phút rồi xếp ra đĩa. Dùng nóng cùng cơm, bún hoặc rau; không dùng lại đĩa đã đựng nhân sống.',image_url='assets/photos/recipe-48.jpg',prep_time_minutes=40,servings=3 WHERE title='Chả lá lốt';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún riêu cua','Bún riêu cua đồng với cà chua, đậu hũ và nước dùng chua nhẹ, dùng cua xay làm sạch sẵn.','1. Lọc cua | Hòa cua xay với 2 lít nước, bóp nhẹ rồi lọc qua rây mịn 2 lần, bỏ hết vỏ cứng. Giữ nước cua lạnh nếu chưa nấu ngay, rửa dụng cụ sau khi xử lý cua sống.
2. Chuẩn bị đồ ăn kèm | Rửa và bổ cà chua, băm hành tím, thái hành lá. Thấm khô đậu, chiên từng mẻ đến vàng rồi để ráo dầu; rửa rau riêng.
3. Nấu riêu | Thêm muối vào nước cua, đun lửa vừa, khuấy nhẹ lúc đầu để không dính đáy. Khi riêu bắt đầu kết mảng thì ngừng khuấy, hạ lửa và nấu thêm 8–10 phút, không để trào.
4. Làm riêu chắc | Vớt riêu chín vào bát, để ráo, trộn với 1 quả trứng. Dàn trong bát chịu nhiệt và hấp 15–20 phút đến khi trứng đông hoàn toàn, giữ riêng.
5. Xào cà chua | Phi hành với 1 muỗng canh dầu, cho cà chua vào xào 4–5 phút đến mềm. Cho cà chua và mắm tôm vào nồi nước cua, đun sôi nhẹ 3–5 phút.
6. Nêm nước dùng | Thêm đậu chiên, nước mắm và giấm từng chút. Nấu thêm 5 phút, nếm độ chua mặn; giữ nồi nóng sôi nhẹ, thêm ít nước nóng nếu nước bay hơi nhiều.
7. Chia tô | Trụng bún nếu cần theo hướng dẫn bảo quản, chia vào tô. Xếp riêu, đậu, cà chua lên trên, chan nước dùng nóng và thêm hành lá; rau ăn kèm để riêng.','assets/photos/recipe-49.jpg',100,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún riêu cua');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Bún riêu cua đồng với cà chua, đậu hũ và nước dùng chua nhẹ, dùng cua xay làm sạch sẵn.',instructions='1. Lọc cua | Hòa cua xay với 2 lít nước, bóp nhẹ rồi lọc qua rây mịn 2 lần, bỏ hết vỏ cứng. Giữ nước cua lạnh nếu chưa nấu ngay, rửa dụng cụ sau khi xử lý cua sống.
2. Chuẩn bị đồ ăn kèm | Rửa và bổ cà chua, băm hành tím, thái hành lá. Thấm khô đậu, chiên từng mẻ đến vàng rồi để ráo dầu; rửa rau riêng.
3. Nấu riêu | Thêm muối vào nước cua, đun lửa vừa, khuấy nhẹ lúc đầu để không dính đáy. Khi riêu bắt đầu kết mảng thì ngừng khuấy, hạ lửa và nấu thêm 8–10 phút, không để trào.
4. Làm riêu chắc | Vớt riêu chín vào bát, để ráo, trộn với 1 quả trứng. Dàn trong bát chịu nhiệt và hấp 15–20 phút đến khi trứng đông hoàn toàn, giữ riêng.
5. Xào cà chua | Phi hành với 1 muỗng canh dầu, cho cà chua vào xào 4–5 phút đến mềm. Cho cà chua và mắm tôm vào nồi nước cua, đun sôi nhẹ 3–5 phút.
6. Nêm nước dùng | Thêm đậu chiên, nước mắm và giấm từng chút. Nấu thêm 5 phút, nếm độ chua mặn; giữ nồi nóng sôi nhẹ, thêm ít nước nóng nếu nước bay hơi nhiều.
7. Chia tô | Trụng bún nếu cần theo hướng dẫn bảo quản, chia vào tô. Xếp riêu, đậu, cà chua lên trên, chan nước dùng nóng và thêm hành lá; rau ăn kèm để riêng.',image_url='assets/photos/recipe-49.jpg',prep_time_minutes=100,servings=4 WHERE title='Bún riêu cua';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Phở gà','Phở gà với nước dùng tự nấu từ gà có xương, gừng và hành nướng, có hướng dẫn giữ nước dùng trong.','1. Chuẩn bị | Thấm khô gà đã làm sạch, bỏ mỡ thừa và mảnh xương vụn. Rửa rau, thái hành lá và rau mùi; giữ phần thịt sống riêng khỏi rau ăn kèm.
2. Làm thơm gia vị | Áp chảo hành tây, hành tím và gừng trên chảo khô 5–7 phút đến sém nhẹ, bỏ phần cháy đen. Rang quế, hồi, hạt mùi 30 giây rồi cho vào túi lọc hoặc rây gia vị.
3. Luộc gà | Cho gà vào nồi cùng 2,5 lít nước, muối, hành và gừng. Đun sôi, hớt bọt rồi hạ lửa sôi nhẹ 35–45 phút; trở gà một lần và thêm nước nóng nếu cần ngập.
4. Kiểm tra và lọc thịt | Kiểm tra phần dày ở đùi và ức đạt ít nhất 74°C. Gắp gà ra, để bớt nóng rồi lọc hoặc xé thịt bằng dụng cụ sạch; giữ thịt đậy kín, không ngâm gà chín trong nước bẩn.
5. Ninh nước dùng | Cho xương gà đã lọc trở lại nồi cùng túi gia vị. Ninh sôi nhẹ 25–30 phút, hớt bọt và mỡ dư; vớt túi gia vị để vị quế hồi không quá gắt.
6. Nêm và lọc | Thêm nước mắm, đường, nếm lại. Lọc nước dùng qua rây sang nồi sạch rồi giữ nóng; thêm nước nóng hoặc gia vị từng ít một để đạt khoảng 2 lít nước dùng.
7. Dọn phở | Trụng bánh phở theo hướng dẫn của loại phở, chia vào tô. Xếp thịt gà, hành lá và rau mùi, chan nước dùng thật nóng; thêm chanh khi ăn theo khẩu vị.','assets/photos/recipe-50.jpg',120,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Phở gà');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Phở gà với nước dùng tự nấu từ gà có xương, gừng và hành nướng, có hướng dẫn giữ nước dùng trong.',instructions='1. Chuẩn bị | Thấm khô gà đã làm sạch, bỏ mỡ thừa và mảnh xương vụn. Rửa rau, thái hành lá và rau mùi; giữ phần thịt sống riêng khỏi rau ăn kèm.
2. Làm thơm gia vị | Áp chảo hành tây, hành tím và gừng trên chảo khô 5–7 phút đến sém nhẹ, bỏ phần cháy đen. Rang quế, hồi, hạt mùi 30 giây rồi cho vào túi lọc hoặc rây gia vị.
3. Luộc gà | Cho gà vào nồi cùng 2,5 lít nước, muối, hành và gừng. Đun sôi, hớt bọt rồi hạ lửa sôi nhẹ 35–45 phút; trở gà một lần và thêm nước nóng nếu cần ngập.
4. Kiểm tra và lọc thịt | Kiểm tra phần dày ở đùi và ức đạt ít nhất 74°C. Gắp gà ra, để bớt nóng rồi lọc hoặc xé thịt bằng dụng cụ sạch; giữ thịt đậy kín, không ngâm gà chín trong nước bẩn.
5. Ninh nước dùng | Cho xương gà đã lọc trở lại nồi cùng túi gia vị. Ninh sôi nhẹ 25–30 phút, hớt bọt và mỡ dư; vớt túi gia vị để vị quế hồi không quá gắt.
6. Nêm và lọc | Thêm nước mắm, đường, nếm lại. Lọc nước dùng qua rây sang nồi sạch rồi giữ nóng; thêm nước nóng hoặc gia vị từng ít một để đạt khoảng 2 lít nước dùng.
7. Dọn phở | Trụng bánh phở theo hướng dẫn của loại phở, chia vào tô. Xếp thịt gà, hành lá và rau mùi, chan nước dùng thật nóng; thêm chanh khi ăn theo khẩu vị.',image_url='assets/photos/recipe-50.jpg',prep_time_minutes=120,servings=4 WHERE title='Phở gà';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún bò Huế','Phiên bản bún bò nấu gia đình với bắp bò, giò heo, sả và mắm ruốc đã nấu chín; không dùng tiết.','1. Sơ chế | Thấm khô bắp bò và giò đã làm sạch, kiểm tra mảnh xương vụn. Đập 60 g sả, băm phần còn lại, hành tím và tỏi; rửa rau, để riêng.
2. Lọc mắm ruốc | Hòa mắm ruốc với 200 ml nước, để lắng 10 phút. Rót phần nước trên qua rây mịn, bỏ cặn dưới đáy; phần nước này sẽ được nấu chín trong nồi.
3. Ninh thịt | Cho bò, giò, hành tây, sả đập dập, muối và 2,5 lít nước vào nồi. Đun sôi, hớt bọt rồi hạ lửa, ninh hé nắp 75–100 phút; vớt giò ra trước khi đã mềm, bò có thể cần lâu hơn.
4. Làm dầu sả ớt | Phi hành tím, tỏi và sả băm với dầu trên lửa vừa nhỏ 2 phút. Tắt lửa, thêm ớt bột và khuấy; tránh làm ớt cháy.
5. Nêm nước dùng | Vớt thịt đã mềm ra, bỏ hành và sả lớn. Thêm nước mắm ruốc đã lọc vào nồi, đun sôi nhẹ ít nhất 5 phút, thêm dầu sả ớt, nước mắm và đường; nếm và thêm nước nóng nếu đậm.
6. Thái thịt | Để bò nghỉ rồi thái ngang thớ thành lát mỏng bằng thớt sạch. Giò giữ từng khoanh, gỡ mảnh xương nhỏ khi chia; giữ thịt nóng hoặc bảo quản lạnh nếu chưa dùng.
7. Dọn bún | Trụng bún, chia vào tô với bò và giò. Chan nước dùng sôi nóng, rắc hành lá; rau thơm để riêng, điều chỉnh vị cay khi ăn.','assets/photos/recipe-51.jpg',150,4 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún bò Huế');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Ăn sáng'),description='Phiên bản bún bò nấu gia đình với bắp bò, giò heo, sả và mắm ruốc đã nấu chín; không dùng tiết.',instructions='1. Sơ chế | Thấm khô bắp bò và giò đã làm sạch, kiểm tra mảnh xương vụn. Đập 60 g sả, băm phần còn lại, hành tím và tỏi; rửa rau, để riêng.
2. Lọc mắm ruốc | Hòa mắm ruốc với 200 ml nước, để lắng 10 phút. Rót phần nước trên qua rây mịn, bỏ cặn dưới đáy; phần nước này sẽ được nấu chín trong nồi.
3. Ninh thịt | Cho bò, giò, hành tây, sả đập dập, muối và 2,5 lít nước vào nồi. Đun sôi, hớt bọt rồi hạ lửa, ninh hé nắp 75–100 phút; vớt giò ra trước khi đã mềm, bò có thể cần lâu hơn.
4. Làm dầu sả ớt | Phi hành tím, tỏi và sả băm với dầu trên lửa vừa nhỏ 2 phút. Tắt lửa, thêm ớt bột và khuấy; tránh làm ớt cháy.
5. Nêm nước dùng | Vớt thịt đã mềm ra, bỏ hành và sả lớn. Thêm nước mắm ruốc đã lọc vào nồi, đun sôi nhẹ ít nhất 5 phút, thêm dầu sả ớt, nước mắm và đường; nếm và thêm nước nóng nếu đậm.
6. Thái thịt | Để bò nghỉ rồi thái ngang thớ thành lát mỏng bằng thớt sạch. Giò giữ từng khoanh, gỡ mảnh xương nhỏ khi chia; giữ thịt nóng hoặc bảo quản lạnh nếu chưa dùng.
7. Dọn bún | Trụng bún, chia vào tô với bò và giò. Chan nước dùng sôi nóng, rắc hành lá; rau thơm để riêng, điều chỉnh vị cay khi ăn.',image_url='assets/photos/recipe-51.jpg',prep_time_minutes=150,servings=4 WHERE title='Bún bò Huế';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh sườn hầm củ sen','Sườn heo hầm củ sen và cà rốt, nước canh thanh, củ sen giòn mềm; một món canh dự kiến 60 phút.','1. Chuẩn bị rau củ | Gọt củ sen, rửa kỹ các lỗ, cắt lát đều 8–10 mm rồi ngâm tạm trong nước sạch. Gọt cà rốt, cắt khúc; thái gừng, đập hành và thái hành lá.
2. Chần sườn | Đun một nồi nước đủ ngập sườn, cho sườn vào chần 2–3 phút. Đổ bỏ nước chần, rửa lại sườn bằng nước sạch và rửa nồi để loại bọt bám.
3. Hầm ban đầu | Cho sườn, gừng, hành, muối và 1,5 lít nước vào nồi. Đun sôi, hớt bọt rồi hạ lửa nhỏ, hầm hé nắp 15 phút.
4. Thêm củ sen | Cho củ sen đã để ráo vào, hầm 15 phút. Nếu nước cạn nhiều, bổ sung nước nóng để nguyên liệu ngập và tiếp tục sôi nhẹ.
5. Thêm cà rốt | Cho cà rốt vào, nấu thêm 10–12 phút. Kiểm tra sườn mềm, thịt chín kỹ, củ sen cắn được và cà rốt mềm; sườn già hoặc miếng to cần nấu thêm.
6. Nêm và dọn | Thêm nước mắm, nếm lại rồi tắt bếp. Vớt gừng, hành lớn, rắc hành lá và tiêu, múc canh nóng ra tô.','assets/photos/recipe-52.jpg',60,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh sườn hầm củ sen');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Canh'),description='Sườn heo hầm củ sen và cà rốt, nước canh thanh, củ sen giòn mềm; một món canh dự kiến 60 phút.',instructions='1. Chuẩn bị rau củ | Gọt củ sen, rửa kỹ các lỗ, cắt lát đều 8–10 mm rồi ngâm tạm trong nước sạch. Gọt cà rốt, cắt khúc; thái gừng, đập hành và thái hành lá.
2. Chần sườn | Đun một nồi nước đủ ngập sườn, cho sườn vào chần 2–3 phút. Đổ bỏ nước chần, rửa lại sườn bằng nước sạch và rửa nồi để loại bọt bám.
3. Hầm ban đầu | Cho sườn, gừng, hành, muối và 1,5 lít nước vào nồi. Đun sôi, hớt bọt rồi hạ lửa nhỏ, hầm hé nắp 15 phút.
4. Thêm củ sen | Cho củ sen đã để ráo vào, hầm 15 phút. Nếu nước cạn nhiều, bổ sung nước nóng để nguyên liệu ngập và tiếp tục sôi nhẹ.
5. Thêm cà rốt | Cho cà rốt vào, nấu thêm 10–12 phút. Kiểm tra sườn mềm, thịt chín kỹ, củ sen cắn được và cà rốt mềm; sườn già hoặc miếng to cần nấu thêm.
6. Nêm và dọn | Thêm nước mắm, nếm lại rồi tắt bếp. Vớt gừng, hành lớn, rắc hành lá và tiêu, múc canh nóng ra tô.',image_url='assets/photos/recipe-52.jpg',prep_time_minutes=60,servings=4 WHERE title='Canh sườn hầm củ sen';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm tấm sườn áp chảo','Sườn heo ướp sả áp chảo ăn với cơm, mỡ hành và nước mắm pha; phiên bản làm tại nhà không cần bếp nướng.','1. Sơ chế | Thấm khô sườn, rạch nhẹ phần gân ngoài để miếng không co cong. Băm sả, hành tím và tỏi; rửa và thái dưa chuột, cà chua, hành lá.
2. Ướp sườn | Trộn sườn với 1,5 muỗng canh nước mắm, nước tương, 1 muỗng canh đường, sả, hành tím, nửa tỏi và 1 muỗng canh dầu. Ướp 25 phút trong ngăn mát.
3. Pha chấm | Khuấy 4 muỗng canh nước chín với phần nước mắm, đường còn lại và nước cốt chanh. Thêm nửa tỏi, ớt băm; nếm điều chỉnh chua ngọt rồi để riêng.
4. Làm mỡ hành | Đun 1 muỗng canh dầu trên lửa nhỏ, cho hành lá vào đảo 20–30 giây rồi tắt bếp. Múc ra bát, tránh để hành cháy.
5. Áp chảo | Gạt bớt vụn sả khỏi sườn, làm nóng phần dầu còn lại trong chảo lửa vừa. Áp chảo khoảng 4–6 phút mỗi mặt; kiểm tra phần dày đạt 63°C, sau đó để nghỉ ít nhất 3 phút.
6. Dọn cơm | Hâm cơm nóng đều nếu dùng cơm bảo quản lạnh. Chia cơm ra đĩa, xếp sườn, rau, rưới mỡ hành lên cơm và dùng kèm nước mắm pha; không dùng lại nước ướp sống.','assets/photos/recipe-53.jpg',60,3 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm tấm sườn áp chảo');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Cơm'),description='Sườn heo ướp sả áp chảo ăn với cơm, mỡ hành và nước mắm pha; phiên bản làm tại nhà không cần bếp nướng.',instructions='1. Sơ chế | Thấm khô sườn, rạch nhẹ phần gân ngoài để miếng không co cong. Băm sả, hành tím và tỏi; rửa và thái dưa chuột, cà chua, hành lá.
2. Ướp sườn | Trộn sườn với 1,5 muỗng canh nước mắm, nước tương, 1 muỗng canh đường, sả, hành tím, nửa tỏi và 1 muỗng canh dầu. Ướp 25 phút trong ngăn mát.
3. Pha chấm | Khuấy 4 muỗng canh nước chín với phần nước mắm, đường còn lại và nước cốt chanh. Thêm nửa tỏi, ớt băm; nếm điều chỉnh chua ngọt rồi để riêng.
4. Làm mỡ hành | Đun 1 muỗng canh dầu trên lửa nhỏ, cho hành lá vào đảo 20–30 giây rồi tắt bếp. Múc ra bát, tránh để hành cháy.
5. Áp chảo | Gạt bớt vụn sả khỏi sườn, làm nóng phần dầu còn lại trong chảo lửa vừa. Áp chảo khoảng 4–6 phút mỗi mặt; kiểm tra phần dày đạt 63°C, sau đó để nghỉ ít nhất 3 phút.
6. Dọn cơm | Hâm cơm nóng đều nếu dùng cơm bảo quản lạnh. Chia cơm ra đĩa, xếp sườn, rau, rưới mỡ hành lên cơm và dùng kèm nước mắm pha; không dùng lại nước ướp sống.',image_url='assets/photos/recipe-53.jpg',prep_time_minutes=60,servings=3 WHERE title='Cơm tấm sườn áp chảo';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Nem rán','Nem nhân thịt, miến và rau củ rán giòn, có tỷ lệ nhân, cách cuốn và nước chấm chua ngọt.','1. Ngâm và sơ chế | Ngâm miến 10 phút, mộc nhĩ 15 phút, rửa và để thật ráo rồi cắt nhỏ. Bào cà rốt, vắt nhẹ, băm hành tây; xử lý rau trong lúc ngâm.
2. Trộn nhân | Trộn thịt, miến, mộc nhĩ, cà rốt, hành tây, trứng, 0,5 muỗng canh nước mắm và tiêu. Đảo cho quyện, không thêm quá nhiều trứng khiến nhân ướt.
3. Cuốn | Làm mềm bánh theo hướng dẫn loại bánh, lấy khoảng 1,5 muỗng canh nhân cho mỗi cuốn. Gấp hai bên, cuốn vừa tay thành nem đường kính khoảng 2,5 cm; không siết quá chặt.
4. Pha chấm | Hòa 4 muỗng canh nước chín với đường, phần nước mắm và chanh còn lại. Thêm tỏi, ớt, nếm lại và để riêng khỏi khu vực thịt sống.
5. Rán | Làm nóng dầu trên lửa vừa, xếp nem từng mẻ, chừa khoảng trống. Rán khoảng 12–15 phút, trở đều để vàng các mặt; nhân giữa đạt ít nhất 71°C.
6. Giữ giòn | Gắp nem lên giá hoặc giấy thấm, không đậy kín khi còn nóng. Nếu muốn vỏ giòn hơn, rán thêm 1–2 phút ở lửa vừa lớn sau khi nhân đã chín, tránh làm cháy.
7. Dọn món | Cắt nem bằng dao sạch nếu muốn, bày với bát nước chấm. Dùng nóng cùng cơm, bún hoặc rau; nem cỡ lớn cần rán lâu hơn công thức.','assets/photos/recipe-54.jpg',60,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Nem rán');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Món mặn'),description='Nem nhân thịt, miến và rau củ rán giòn, có tỷ lệ nhân, cách cuốn và nước chấm chua ngọt.',instructions='1. Ngâm và sơ chế | Ngâm miến 10 phút, mộc nhĩ 15 phút, rửa và để thật ráo rồi cắt nhỏ. Bào cà rốt, vắt nhẹ, băm hành tây; xử lý rau trong lúc ngâm.
2. Trộn nhân | Trộn thịt, miến, mộc nhĩ, cà rốt, hành tây, trứng, 0,5 muỗng canh nước mắm và tiêu. Đảo cho quyện, không thêm quá nhiều trứng khiến nhân ướt.
3. Cuốn | Làm mềm bánh theo hướng dẫn loại bánh, lấy khoảng 1,5 muỗng canh nhân cho mỗi cuốn. Gấp hai bên, cuốn vừa tay thành nem đường kính khoảng 2,5 cm; không siết quá chặt.
4. Pha chấm | Hòa 4 muỗng canh nước chín với đường, phần nước mắm và chanh còn lại. Thêm tỏi, ớt, nếm lại và để riêng khỏi khu vực thịt sống.
5. Rán | Làm nóng dầu trên lửa vừa, xếp nem từng mẻ, chừa khoảng trống. Rán khoảng 12–15 phút, trở đều để vàng các mặt; nhân giữa đạt ít nhất 71°C.
6. Giữ giòn | Gắp nem lên giá hoặc giấy thấm, không đậy kín khi còn nóng. Nếu muốn vỏ giòn hơn, rán thêm 1–2 phút ở lửa vừa lớn sau khi nhân đã chín, tránh làm cháy.
7. Dọn món | Cắt nem bằng dao sạch nếu muốn, bày với bát nước chấm. Dùng nóng cùng cơm, bún hoặc rau; nem cỡ lớn cần rán lâu hơn công thức.',image_url='assets/photos/recipe-54.jpg',prep_time_minutes=60,servings=4 WHERE title='Nem rán';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gỏi gà bắp cải','Gà luộc xé trộn bắp cải, cà rốt và rau răm với nước mắm chanh; rau giòn và gà được nấu chín kỹ.','1. Luộc gà | Cho gà và gừng vào nồi với nước đủ ngập. Đun sôi, hớt bọt, hạ lửa luộc 25–30 phút tùy miếng; kiểm tra phần dày đạt ít nhất 74°C.
2. Chuẩn bị rau | Trong lúc luộc, rửa bắp cải, cà rốt, hành tây và rau răm. Thái, bào sợi, ngâm hành tây trong nước lạnh 5–10 phút rồi để tất cả thật ráo.
3. Pha nước trộn | Hòa nước mắm, đường và nước cốt chanh đến tan đường. Thêm tỏi, ớt băm, nếm để vị chua mặn ngọt cân bằng; giữ lại một phần để nêm sau.
4. Xé gà | Gắp gà chín ra dụng cụ sạch, để bớt nóng rồi lọc xương và xé miếng vừa ăn. Bỏ xương vụn; không dùng lại dao thớt đã tiếp xúc gà sống.
5. Trộn gỏi | Cho gà, bắp cải, cà rốt và hành vào tô lớn. Rưới khoảng hai phần ba nước trộn, đảo nhẹ, chờ 3 phút rồi nếm và thêm phần còn lại nếu cần.
6. Dọn | Trộn rau răm vào sau cùng, rắc đậu phộng rang. Dùng ngay để rau còn giòn; nếu chưa ăn, giữ gà và rau riêng trong ngăn mát rồi trộn gần giờ dùng.','assets/photos/recipe-55.jpg',50,3 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gỏi gà bắp cải');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Rau & salad'),description='Gà luộc xé trộn bắp cải, cà rốt và rau răm với nước mắm chanh; rau giòn và gà được nấu chín kỹ.',instructions='1. Luộc gà | Cho gà và gừng vào nồi với nước đủ ngập. Đun sôi, hớt bọt, hạ lửa luộc 25–30 phút tùy miếng; kiểm tra phần dày đạt ít nhất 74°C.
2. Chuẩn bị rau | Trong lúc luộc, rửa bắp cải, cà rốt, hành tây và rau răm. Thái, bào sợi, ngâm hành tây trong nước lạnh 5–10 phút rồi để tất cả thật ráo.
3. Pha nước trộn | Hòa nước mắm, đường và nước cốt chanh đến tan đường. Thêm tỏi, ớt băm, nếm để vị chua mặn ngọt cân bằng; giữ lại một phần để nêm sau.
4. Xé gà | Gắp gà chín ra dụng cụ sạch, để bớt nóng rồi lọc xương và xé miếng vừa ăn. Bỏ xương vụn; không dùng lại dao thớt đã tiếp xúc gà sống.
5. Trộn gỏi | Cho gà, bắp cải, cà rốt và hành vào tô lớn. Rưới khoảng hai phần ba nước trộn, đảo nhẹ, chờ 3 phút rồi nếm và thêm phần còn lại nếu cần.
6. Dọn | Trộn rau răm vào sau cùng, rắc đậu phộng rang. Dùng ngay để rau còn giòn; nếu chưa ăn, giữ gà và rau riêng trong ngăn mát rồi trộn gần giờ dùng.',image_url='assets/photos/recipe-55.jpg',prep_time_minutes=50,servings=3 WHERE title='Gỏi gà bắp cải';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chè khoai dẻo','Viên khoai lang dẻo nấu nước cốt dừa, định lượng bột và cách luộc để viên chín tận giữa.','1. Hấp khoai | Gọt, rửa khoai và cắt lát khoảng 1 cm. Hấp 15–20 phút đến mềm hẳn; thử đũa xuyên dễ, lấy ra và nghiền khi còn nóng.
2. Nhào bột | Trộn khoai nóng với 20 g đường, thêm 140 g bột năng từng phần. Nhào đến khối mềm, ít dính; nếu quá khô, thêm từng muỗng cà phê nước nóng, nếu quá ướt thêm chút bột áo.
3. Tạo viên | Rắc bột áo lên mặt sạch, lăn bột thành dây đường kính 1,5 cm, cắt khúc 1,5–2 cm. Áo nhẹ bột để các viên không dính nhau, không làm viên quá lớn.
4. Luộc | Đun một nồi nước sôi, thả khoai theo từng mẻ và khuấy nhẹ một lần. Khi viên nổi, tiếp tục luộc 4–5 phút; cắt thử một viên để giữa không còn lõi bột trắng.
5. Nấu nước chè | Trong lúc luộc, cho 500 ml nước, nước cốt dừa, 70 g đường, muối và lá dứa vào nồi. Đun lửa vừa nhỏ, khuấy đến tan đường rồi để sôi nhẹ 3 phút.
6. Hoàn thành | Vớt viên khoai chín sang nồi nước chè, nấu thêm 2 phút cho thấm. Bỏ lá dứa, chia bát và rắc vừng; dùng ấm hoặc để nguội rồi bảo quản lạnh.','assets/photos/recipe-56.jpg',60,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chè khoai dẻo');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Tráng miệng'),description='Viên khoai lang dẻo nấu nước cốt dừa, định lượng bột và cách luộc để viên chín tận giữa.',instructions='1. Hấp khoai | Gọt, rửa khoai và cắt lát khoảng 1 cm. Hấp 15–20 phút đến mềm hẳn; thử đũa xuyên dễ, lấy ra và nghiền khi còn nóng.
2. Nhào bột | Trộn khoai nóng với 20 g đường, thêm 140 g bột năng từng phần. Nhào đến khối mềm, ít dính; nếu quá khô, thêm từng muỗng cà phê nước nóng, nếu quá ướt thêm chút bột áo.
3. Tạo viên | Rắc bột áo lên mặt sạch, lăn bột thành dây đường kính 1,5 cm, cắt khúc 1,5–2 cm. Áo nhẹ bột để các viên không dính nhau, không làm viên quá lớn.
4. Luộc | Đun một nồi nước sôi, thả khoai theo từng mẻ và khuấy nhẹ một lần. Khi viên nổi, tiếp tục luộc 4–5 phút; cắt thử một viên để giữa không còn lõi bột trắng.
5. Nấu nước chè | Trong lúc luộc, cho 500 ml nước, nước cốt dừa, 70 g đường, muối và lá dứa vào nồi. Đun lửa vừa nhỏ, khuấy đến tan đường rồi để sôi nhẹ 3 phút.
6. Hoàn thành | Vớt viên khoai chín sang nồi nước chè, nấu thêm 2 phút cho thấm. Bỏ lá dứa, chia bát và rắc vừng; dùng ấm hoặc để nguội rồi bảo quản lạnh.',image_url='assets/photos/recipe-56.jpg',prep_time_minutes=60,servings=4 WHERE title='Chè khoai dẻo';

INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cà phê sữa đá','Cà phê phin pha cùng sữa đặc và đá, có lượng nước và thời gian ủ để ly đậm vừa.','1. Chuẩn bị dụng cụ | Tráng phin và cốc bằng nước nóng rồi đổ bỏ nước tráng. Chọn cốc chịu nhiệt đủ rộng để phin đặt vững, chuẩn bị một ly riêng có đá.
2. Cho bột | Đổ 20 g cà phê vào phin, lắc nhẹ cho mặt phẳng. Đặt tấm nén vừa chạm mặt bột, không ép quá chặt làm nước khó chảy.
3. Ủ | Rót 20 ml nước nóng từ từ cho bột ướt đều. Đợi khoảng 30–45 giây để bột nở, tránh chạm vào phin nóng.
4. Pha | Rót thêm 80 ml nước, đậy nắp và để nhỏ giọt 4–6 phút. Nếu nước chảy quá nhanh, lần sau dùng cỡ xay mịn hơn hoặc nén nhẹ hơn; không thêm bột giữa lúc pha.
5. Trộn sữa | Nhấc phin ra cẩn thận, thêm sữa đặc vào cà phê và khuấy đến tan. Nếm trước khi thêm đá, tăng hoặc giảm sữa theo khẩu vị.
6. Dọn | Rót hỗn hợp vào ly có đá, khuấy nhẹ và dùng ngay. Rửa phin sau khi nguội để không còn bã làm ảnh hưởng lần pha sau.','assets/photos/recipe-57.jpg',10,1 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cà phê sữa đá');

UPDATE recipes SET category_id=(SELECT id FROM categories WHERE name='Đồ uống'),description='Cà phê phin pha cùng sữa đặc và đá, có lượng nước và thời gian ủ để ly đậm vừa.',instructions='1. Chuẩn bị dụng cụ | Tráng phin và cốc bằng nước nóng rồi đổ bỏ nước tráng. Chọn cốc chịu nhiệt đủ rộng để phin đặt vững, chuẩn bị một ly riêng có đá.
2. Cho bột | Đổ 20 g cà phê vào phin, lắc nhẹ cho mặt phẳng. Đặt tấm nén vừa chạm mặt bột, không ép quá chặt làm nước khó chảy.
3. Ủ | Rót 20 ml nước nóng từ từ cho bột ướt đều. Đợi khoảng 30–45 giây để bột nở, tránh chạm vào phin nóng.
4. Pha | Rót thêm 80 ml nước, đậy nắp và để nhỏ giọt 4–6 phút. Nếu nước chảy quá nhanh, lần sau dùng cỡ xay mịn hơn hoặc nén nhẹ hơn; không thêm bột giữa lúc pha.
5. Trộn sữa | Nhấc phin ra cẩn thận, thêm sữa đặc vào cà phê và khuấy đến tan. Nếm trước khi thêm đá, tăng hoặc giảm sữa theo khẩu vị.
6. Dọn | Rót hỗn hợp vào ly có đá, khuấy nhẹ và dùng ngay. Rửa phin sau khi nguội để không còn bã làm ảnh hưởng lần pha sau.',image_url='assets/photos/recipe-57.jpg',prep_time_minutes=10,servings=1 WHERE title='Cà phê sữa đá';

DELETE FROM recipe_ingredients WHERE recipe_id IN (SELECT id FROM recipes WHERE title IN ('Thịt chó nấu rựa mận','Thịt chó xào sả ớt','Bún đậu mắm tôm','Thịt heo luộc chấm mắm tôm','Chân giò giả cầy','Bò kho','Gà hầm nấm','Vịt om sấu','Cá kho tộ','Cánh gà chiên nước mắm','Chả lá lốt','Bún riêu cua','Phở gà','Bún bò Huế','Canh sườn hầm củ sen','Cơm tấm sườn áp chảo','Nem rán','Gỏi gà bắp cải','Chè khoai dẻo','Cà phê sữa đá'));

DELETE FROM recipe_details WHERE recipe_id IN (SELECT id FROM recipes WHERE title IN ('Thịt chó nấu rựa mận','Thịt chó xào sả ớt','Bún đậu mắm tôm','Thịt heo luộc chấm mắm tôm','Chân giò giả cầy','Bò kho','Gà hầm nấm','Vịt om sấu','Cá kho tộ','Cánh gà chiên nước mắm','Chả lá lốt','Bún riêu cua','Phở gà','Bún bò Huế','Canh sườn hầm củ sen','Cơm tấm sườn áp chảo','Nem rán','Gỏi gà bắp cải','Chè khoai dẻo','Cà phê sữa đá'));

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,700,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Thịt chó';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Riềng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Mẻ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Nghệ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó nấu rựa mận' AND i.name='Lá mơ';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt chó":"Thịt đã làm sạch, sơ chế sẵn, cắt miếng 3 cm; bảo quản lạnh.","Riềng":"Băm hoặc giã nhỏ.","Sả":"Phần non, băm nhỏ.","Mẻ":"Lọc qua rây, bỏ phần hạt thô.","Mắm tôm":"Dùng loại đóng gói có nguồn gốc rõ ràng.","Nghệ":"Giã nhỏ, lấy phần nước.","Hành tím":"Băm nhỏ.","Nước mắm":"Nêm sau cùng nếu cần.","Lá mơ":"Rửa sạch, để ráo và thái nhỏ để nấu cùng."}','Độ chua của mẻ và độ mặn của mắm tôm khác nhau; có thể giữ lại một phần để điều chỉnh khi nấu.
Thời gian om có thể lâu hơn nếu dùng phần thịt nhiều gân; thêm nước nóng từng ít một.','' FROM recipes r WHERE r.title='Thịt chó nấu rựa mận';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Thịt chó';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Riềng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt chó xào sả ớt' AND i.name='Vừng rang';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt chó":"Thịt đã sơ chế sẵn, thái lát 3–4 mm ngang thớ.","Sả":"Phần non, thái lát mỏng.","Riềng":"Băm nhuyễn.","Hành tím":"Thái nhỏ.","Tỏi":"Băm.","Ớt":"Bỏ hạt nếu muốn ít cay."}','Thái ngang thớ và không cắt quá dày giúp thịt bớt dai.
Nêm nhẹ ở bước ướp vì nước sốt sẽ mặn hơn khi cạn.','' FROM recipes r WHERE r.title='Thịt chó xào sả ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Bún tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Rau thơm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún đậu mắm tôm' AND i.name='Muối';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bún tươi":"Bún lá cắt miếng hoặc bún sợi.","Đậu hũ":"Đậu chắc, thấm khô và cắt miếng.","Thịt ba chỉ":"Miếng dày khoảng 3 cm.","Dưa chuột":"Rửa sạch, thái lát.","Rau thơm":"Tía tô, kinh giới, húng; rửa và để ráo.","Nước":"Pha mắm tôm; nước luộc thịt dùng thêm đủ ngập.","Ớt":"Thái lát.","Hành tím":"Nửa luộc thịt, nửa băm chưng mắm.","Dầu ăn":"Chiên trong chảo nhỏ; lấy 1 muỗng canh để chưng mắm."}','Đậu phải ráo nước trước khi chiên; không đổ nước vào chảo dầu nóng.
Nước chấm ở đây là phiên bản chưng chín; điều chỉnh chanh sau khi nhấc khỏi bếp.','' FROM recipes r WHERE r.title='Bún đậu mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt heo luộc chấm mắm tôm' AND i.name='Rau thơm';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt ba chỉ":"Hoặc thịt chân giò rút xương buộc gọn; miếng dày khoảng 4 cm.","Gừng":"Đập dập.","Hành tím":"Nửa để luộc, nửa băm chưng mắm.","Nước":"1,45 lít luộc, 50 ml pha mắm."}','Để thịt nghỉ rồi thái giúp lát thịt gọn hơn.
Có thể thay một phần mắm tôm bằng nước chín trong bát chấm nếu muốn vị nhẹ.','' FROM recipes r WHERE r.title='Thịt heo luộc chấm mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,900,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Chân giò heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,70,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Riềng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Mẻ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Nghệ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,650,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chân giò giả cầy' AND i.name='Nước mắm';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Chân giò heo":"Đã thui và làm sạch sẵn, chặt khúc 3–4 cm.","Riềng":"Giã nhỏ.","Sả":"Băm phần non.","Mẻ":"Lọc mịn.","Nghệ":"Giã, lọc nước.","Hành tím":"Băm.","Nước mắm":"Chỉ thêm sau khi nếm."}','Chân giò trước thường nhiều thịt; chọn khúc đều để hầm đồng thời.
Nếu dùng nồi áp suất, làm theo hướng dẫn của nồi; thời gian ở đây dành cho nồi thường.','' FROM recipes r WHERE r.title='Chân giò giả cầy';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,700,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Thịt bò nạm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Bột gia vị bò kho';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'thanh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Quế';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'cánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Hoa hồi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Cà chua cô đặc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.2,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò kho' AND i.name='Húng quế';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt bò nạm":"Cắt khối 3 cm, có ít gân.","Cà rốt":"Sau gọt vỏ, cắt khúc 2 cm.","Sả":"Đập dập, cắt đoạn.","Hành tím":"Băm.","Tỏi":"Băm.","Gừng":"Thái lát.","Bột gia vị bò kho":"Kiểm tra nhãn; nếu có muối, giảm nước mắm.","Quế":"Thanh nhỏ 3–4 cm.","Húng quế":"Rửa sạch, dùng khi dọn."}','Không rút ngắn thời gian hầm bằng cách đun sôi mạnh: nước dễ cạn trong khi gân vẫn dai.
Không cho cà rốt từ đầu vì cà rốt sẽ nát trước khi bò mềm.','' FROM recipes r WHERE r.title='Bò kho';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,900,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Thịt gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Nấm hương khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Nấm đùi gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.3,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà hầm nấm' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt gà":"Gà có xương, chặt miếng 4–5 cm.","Nấm hương khô":"Ngâm nước ấm 20 phút, bỏ chân.","Nấm đùi gà":"Cắt miếng vừa ăn.","Cà rốt":"Sau gọt, cắt khúc.","Gừng":"Thái lát.","Hành tím":"Đập dập.","Hành lá":"Thái nhỏ."}','Không dùng nước ngâm nấm có nhiều cặn để giữ nước hầm trong.
Hầm sôi nhẹ giúp nước ít đục và gà không vỡ miếng.','' FROM recipes r WHERE r.title='Gà hầm nấm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,900,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Thịt vịt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,60,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Sấu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Khoai sọ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Rau ngổ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Vịt om sấu' AND i.name='Mùi tàu';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt vịt":"Chặt miếng 4 cm, bớt mỡ dư.","Sấu":"Khoảng 6–8 quả, cạo vỏ và khía; sấu đông lạnh cũng được.","Khoai sọ":"Khối lượng đã gọt, cắt miếng.","Sả":"2 phần: băm và đập dập.","Gừng":"Thái lát.","Hành tím":"Băm.","Tỏi":"Băm.","Rau ngổ":"Rửa sạch, thái nhỏ.","Mùi tàu":"Rửa sạch, thái nhỏ."}','Sấu càng chín càng chua; thêm nước dầm từng chút để dễ kiểm soát.
Khoai sọ mềm vừa sẽ làm nước om hơi sánh; không đảo mạnh khiến khoai nát.','' FROM recipes r WHERE r.title='Vịt om sấu';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Cá lóc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Thịt ba chỉ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá kho tộ' AND i.name='Hành lá';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cá lóc":"Khúc cá đã làm sạch, dày 2–3 cm.","Thịt ba chỉ":"Cắt lát nhỏ.","Hành tím":"Băm.","Tỏi":"Băm.","Đường":"1 muỗng tạo màu, 0,5 muỗng ướp.","Nước":"50 ml tạo màu, 200 ml kho."}','Có thể dùng nồi đáy dày thông thường; không cần nồi đất để nấu công thức này.
Không để nước màu cháy đen vì sẽ làm cả nồi cá đắng.','' FROM recipes r WHERE r.title='Cá kho tộ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,650,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Cánh gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Bột bắp';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cánh gà chiên nước mắm' AND i.name='Ớt';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cánh gà":"Chặt tách khớp, bỏ đầu cánh nếu muốn.","Tỏi":"Băm.","Bột bắp":"Áo mỏng, không pha nước.","Dầu ăn":"Chiên trong chảo nhỏ, giữ 1 muỗng canh để làm sốt.","Ớt":"Tùy chọn, thái nhỏ."}','Nếu cánh lớn, giảm lửa và kéo dài thời gian để thịt chín trước khi da sẫm màu.
Sốt chỉ cần bám một lớp mỏng; thêm một ít nước nếu sốt sệt quá nhanh.','' FROM recipes r WHERE r.title='Cánh gà chiên nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Thịt heo xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Lá lốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chả lá lốt' AND i.name='Dầu ăn';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt heo xay":"Thịt có một ít mỡ.","Lá lốt":"Khoảng 25–30 lá, rửa và lau ráo.","Hành tím":"Băm.","Tỏi":"Băm.","Hành lá":"Thái nhỏ."}','Lá ướt làm dầu bắn, vì vậy cần để ráo trước khi cuốn.
Cuốn đều cỡ giúp nhân chín đồng thời và lá ít bị cháy.','' FROM recipes r WHERE r.title='Chả lá lốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Cua đồng xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Bún tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Đậu hũ';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Mắm tôm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Giấm gạo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún riêu cua' AND i.name='Rau thơm';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cua đồng xay":"Cua làm sạch xay sẵn, giữ lạnh; không dùng cua hỏng.","Cà chua":"Bổ múi cau.","Đậu hũ":"Cắt và chiên vàng.","Hành tím":"Băm.","Mắm tôm":"Được nấu trong nước dùng.","Giấm gạo":"Nêm cuối, thêm từng ít.","Dầu ăn":"Chiên đậu trong chảo nhỏ, lấy 1 muỗng canh xào cà.","Hành lá":"Thái nhỏ.","Rau thơm":"Rửa sạch và để ráo."}','Không khuấy mạnh sau khi riêu nổi để giữ riêu thành mảng.
Rây thật kỹ giúp nước dùng không lẫn vỏ cua nhỏ.','' FROM recipes r WHERE r.title='Bún riêu cua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1200,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Gà nguyên con';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Bánh phở tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,40,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'thanh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Quế';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'cánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Hoa hồi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Hạt mùi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.5,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Rau mùi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Phở gà' AND i.name='Nước cốt chanh';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Gà nguyên con":"Gà làm sạch sẵn, bỏ nội tạng; có thể thay gà chặt đôi có xương.","Hành tây":"Bổ đôi.","Gừng":"Cắt đôi.","Quế":"Thanh nhỏ 3 cm.","Nước cốt chanh":"Dùng khi ăn, không cho tất cả vào nồi."}','Không đun sôi cuộn mạnh hoặc khuấy nhiều để giữ nước dùng trong.
Thời gian luộc phụ thuộc trọng lượng gà; dùng nhiệt kế thay vì chỉ xem màu nước thịt.','' FROM recipes r WHERE r.title='Phở gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Bắp bò';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Chân giò heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Bún tươi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Mắm ruốc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Ớt bột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.7,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún bò Huế' AND i.name='Rau thơm';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Bắp bò":"Để khối gọn hoặc buộc chỉ thực phẩm.","Chân giò heo":"Đã làm sạch, chặt khoanh.","Bún tươi":"Bún sợi to.","Sả":"60 g đập dập, 20 g băm.","Hành tây":"Bổ đôi.","Hành tím":"Băm.","Tỏi":"Băm.","Mắm ruốc":"Loại dùng nấu bún bò, khác mắm tôm.","Ớt bột":"Giảm nếu không ăn cay.","Nước":"2,5 lít ninh, 200 ml hòa mắm ruốc."}','Ninh từng phần đến mềm và vớt ra riêng giúp giò không nát khi chờ bò.
Mắm ruốc mỗi loại mặn khác nhau; có thể cho trước một nửa rồi điều chỉnh sau.','' FROM recipes r WHERE r.title='Bún bò Huế';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Sườn heo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Củ sen';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh sườn hầm củ sen' AND i.name='Tiêu xay';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Sườn heo":"Chặt khúc 4 cm, chọn sườn non.","Củ sen":"Khối lượng sau gọt, cắt lát 8–10 mm.","Cà rốt":"Sau gọt vỏ, cắt khúc.","Gừng":"Thái lát.","Hành tím":"Đập dập.","Nước":"Nước chần sườn dùng thêm đủ ngập.","Hành lá":"Thái nhỏ."}','Chần nhanh rồi rửa nồi giúp canh ít bọt hơn.
Củ sen tươi non cho kết cấu khác củ sen nhiều bột; điều chỉnh thời gian theo độ mềm thực tế.','' FROM recipes r WHERE r.title='Canh sườn hầm củ sen';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Sườn cốt lết';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,600,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Cơm chín';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Sả';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Hành tím';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Nước tương';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,25,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Hành lá';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Dưa chuột';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Cà chua';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm tấm sườn áp chảo' AND i.name='Ớt';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Sườn cốt lết":"3 miếng dày 1–1,5 cm, rạch nhẹ gân viền.","Cơm chín":"Cơm tấm đã nấu hoặc cơm trắng nóng.","Sả":"Băm thật nhỏ.","Tỏi":"Băm.","Hành tím":"Băm.","Nước mắm":"1,5 muỗng ướp; 1,5 muỗng pha chấm.","Đường":"1 muỗng ướp, 1 muỗng pha chấm.","Dầu ăn":"1 muỗng ướp, 1 muỗng áp chảo, 1 muỗng mỡ hành.","Hành lá":"Thái nhỏ.","Nước":"Pha nước chấm."}','Lửa quá lớn làm đường cháy trước khi thịt chín, nên áp chảo lửa vừa.
Có thể ướp trước trong ngăn mát để vị đậm hơn; thời gian hiển thị dành cho lần ướp ngắn.','60 phút với cơm đã nấu; không gồm thời gian nấu cơm từ gạo.' FROM recipes r WHERE r.title='Cơm tấm sườn áp chảo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,350,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Thịt heo xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Miến khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Mộc nhĩ khô';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Trứng gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'cái' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Bánh đa nem';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Tiêu xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Dầu ăn';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nem rán' AND i.name='Ớt';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Miến khô":"Ngâm nước ấm 10 phút, cắt đoạn.","Mộc nhĩ khô":"Ngâm 15 phút, bỏ gốc, băm nhỏ.","Cà rốt":"Bào nhỏ, vắt nhẹ nước.","Hành tây":"Băm nhỏ.","Bánh đa nem":"Loại mỏng để rán, theo hướng dẫn làm mềm trên bao bì.","Nước mắm":"0,5 muỗng trộn nhân, 1,5 muỗng pha chấm.","Dầu ăn":"Chảo nhỏ; thêm vừa ngập nửa nem nếu cần.","Nước":"Pha chấm, nước ngâm dùng thêm.","Tỏi":"Băm để pha chấm."}','Nhân ráo giúp vỏ ít vỡ; không ngâm miến quá lâu làm nhân nhão.
Không chiên quá nhiều cuốn một lúc vì dầu hạ nhiệt và nem dễ hút dầu.','' FROM recipes r WHERE r.title='Nem rán';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Thịt gà';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Bắp cải';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Cà rốt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Hành tây';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Rau răm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Gừng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Nước mắm';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Nước cốt chanh';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Tỏi';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Ớt';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Đậu phộng rang';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gỏi gà bắp cải' AND i.name='Nước';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Thịt gà":"Đùi hoặc ức có xương.","Bắp cải":"Thái sợi mỏng sau khi rửa.","Cà rốt":"Bào sợi.","Hành tây":"Thái mỏng, ngâm nước lạnh rồi để ráo.","Rau răm":"Rửa sạch, thái.","Tỏi":"Băm.","Đậu phộng rang":"Giã dập; bỏ nếu dị ứng.","Nước":"Luộc gà; điều chỉnh đủ ngập."}','Rau phải ráo để nước trộn không bị loãng.
Không bóp mạnh bắp cải khi trộn vì rau sẽ nhanh mềm và ra nước.','' FROM recipes r WHERE r.title='Gỏi gà bắp cải';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,450,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Khoai lang';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,160,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Bột năng';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,90,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Đường';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Nước cốt dừa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Muối';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,15,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Lá dứa';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè khoai dẻo' AND i.name='Vừng rang';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Khoai lang":"Sau gọt; có thể dùng khoai vàng hoặc tím.","Bột năng":"140 g nhào, 20 g áo; điều chỉnh theo độ ẩm khoai.","Đường":"20 g nhào, 70 g nấu nước chè.","Nước":"Nước chè; nước hấp và luộc dùng thêm.","Lá dứa":"Rửa, buộc gọn."}','Độ ẩm khoai khác nhau nên thêm bột từng ít; quá nhiều bột làm viên cứng.
Không đun nước cốt dừa sôi quá mạnh để hạn chế tách béo.','' FROM recipes r WHERE r.title='Chè khoai dẻo';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà phê sữa đá' AND i.name='Cà phê xay';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà phê sữa đá' AND i.name='Sữa đặc';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà phê sữa đá' AND i.name='Nước';

INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,120,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà phê sữa đá' AND i.name='Đá viên';

INSERT INTO recipe_details (recipe_id,ingredient_notes,tips,time_note) SELECT r.id,'{"Cà phê xay":"Xay vừa cho phin, không dùng bột hòa tan.","Sữa đặc":"Điều chỉnh độ ngọt khi pha.","Nước":"20 ml ủ, 80 ml pha, khoảng 92–96°C.","Đá viên":"Đá dùng cho đồ uống, làm từ nước sạch."}','Tỷ lệ nước ít giúp cà phê vẫn đậm sau khi đá tan.
Cỡ xay và phin khác nhau làm thời gian nhỏ giọt thay đổi; 10 phút là ước tính gồm cả chuẩn bị.','' FROM recipes r WHERE r.title='Cà phê sữa đá';

COMMIT;

SELECT COUNT(*) AS tong_cong_thuc FROM recipes;

SELECT COUNT(*) AS cong_thuc_chi_tiet FROM recipe_details;
