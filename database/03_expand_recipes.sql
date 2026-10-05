-- Bep Nha: 27 cong thuc bo sung. Import bang phpMyAdmin vao recipe_db.
-- Khong xoa/sua mon cu. Nhap lai khong nhan doi du lieu mau.
USE recipe_db;
SET NAMES utf8mb4;
START TRANSACTION;
INSERT INTO categories (name,description) SELECT 'Món mặn', 'Công thức món mặn cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');
INSERT INTO ingredients (name) SELECT 'Thịt ba chỉ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt ba chỉ');
INSERT INTO ingredients (name) SELECT 'Trứng gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trứng gà');
INSERT INTO ingredients (name) SELECT 'Nước dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước dừa');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Hành tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tím');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Thịt kho trứng','Thịt kho trứng cho 4 người, với thịt ba chỉ, trứng gà, nước dừa. Các bước đơn giản cho căn bếp mỗi ngày.','1. Luộc trứng 10 phút, bóc vỏ. Thịt rửa sạch, cắt miếng 3 cm; hành băm nhỏ.
2. Ướp thịt với hành, nước mắm và nửa lượng đường trong 15 phút.
3. Thắng phần đường còn lại với ít nước đến màu hổ phách, thêm thịt và đảo săn.
4. Thêm nước dừa, đun sôi rồi hạ lửa, kho 35 phút. Cho trứng vào kho thêm 15 phút đến khi thịt mềm và chín hoàn toàn.','assets/dishes/dish-1.svg',70,4 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Thịt kho trứng');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Thịt ba chỉ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,4.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Trứng gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Nước dừa' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'củ' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Thịt kho trứng' AND i.name='Hành tím' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món mặn', 'Công thức món mặn cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');
INSERT INTO ingredients (name) SELECT 'Thịt gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt gà');
INSERT INTO ingredients (name) SELECT 'Gừng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gừng');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Gà kho gừng','Gà kho gừng cho 3 người, với thịt gà, gừng, nước mắm. Các bước đơn giản cho căn bếp mỗi ngày.','1. Cắt gà miếng vừa ăn, gừng thái sợi.
2. Ướp gà với nước mắm và đường trong 10 phút.
3. Làm nóng dầu, phi gừng rồi cho gà vào đảo săn.
4. Thêm nước, đậy nắp kho lửa nhỏ 20 phút, đảo giữa chừng. Nấu đến khi gà chín hoàn toàn, nước kho sánh.','assets/dishes/dish-2.svg',35,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Gà kho gừng');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Thịt gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,30.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Gừng' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Gà kho gừng' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món mặn', 'Công thức món mặn cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');
INSERT INTO ingredients (name) SELECT 'Cá basa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá basa');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Tiêu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tiêu');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Hành tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tím');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cá basa kho tiêu','Cá basa kho tiêu cho 3 người, với cá basa, nước mắm, tiêu. Các bước đơn giản cho căn bếp mỗi ngày.','1. Làm sạch cá, cắt khoanh, thấm khô; băm hành.
2. Ướp cá với nước mắm, nửa tiêu và nửa đường trong 10 phút.
3. Thắng đường còn lại với ít nước, thêm hành, cá và 200 ml nước.
4. Kho lửa nhỏ 20 phút, nhẹ tay trở cá. Khi cá chín hoàn toàn và nước sánh, rắc tiêu còn lại.','assets/dishes/dish-3.svg',35,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cá basa kho tiêu');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Cá basa' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Tiêu' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'củ' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Hành tím' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cá basa kho tiêu' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món mặn', 'Công thức món mặn cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');
INSERT INTO ingredients (name) SELECT 'Tôm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tôm');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Tôm rim mặn ngọt','Tôm rim mặn ngọt cho 2 người, với tôm, nước mắm, đường. Các bước đơn giản cho căn bếp mỗi ngày.','1. Bỏ đầu, chỉ lưng tôm; rửa và thấm khô. Tỏi băm nhỏ.
2. Phi tỏi với dầu, cho tôm vào đảo đến khi đổi màu.
3. Thêm nước mắm, đường và nước, rim lửa vừa 5–7 phút.
4. Đảo nhẹ đến khi tôm chín hoàn toàn, sốt bám đều rồi tắt bếp.','assets/dishes/dish-4.svg',20,2 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Tôm rim mặn ngọt');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Tôm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'tép' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Tỏi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Tôm rim mặn ngọt' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món mặn', 'Công thức món mặn cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');
INSERT INTO ingredients (name) SELECT 'Thịt bò' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt bò');
INSERT INTO ingredients (name) SELECT 'Hành tây' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành tây');
INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Tiêu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tiêu');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bò xào hành tây','Bò xào hành tây cho 2 người, với thịt bò, hành tây, tỏi. Các bước đơn giản cho căn bếp mỗi ngày.','1. Thái bò mỏng ngang thớ, hành tây thái múi, tỏi băm.
2. Ướp bò với nước tương và tiêu trong 10 phút.
3. Phi tỏi, xào bò lửa lớn đến khi chín rồi trút ra.
4. Xào hành tây 2–3 phút, cho bò trở lại đảo 30 giây và dùng nóng.','assets/dishes/dish-5.svg',20,2 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bò xào hành tây');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Thịt bò' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'củ' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Hành tây' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'tép' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Tỏi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bò xào hành tây' AND i.name='Tiêu' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món mặn', 'Công thức món mặn cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món mặn');
INSERT INTO ingredients (name) SELECT 'Sườn heo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sườn heo');
INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Giấm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Giấm');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sườn xào chua ngọt','Sườn xào chua ngọt cho 3 người, với sườn heo, cà chua, nước mắm. Các bước đơn giản cho căn bếp mỗi ngày.','1. Chặt sườn vừa ăn, chần nước sôi rồi rửa sạch. Cà chua thái nhỏ.
2. Áp chảo sườn với dầu đến khi vàng nhẹ hai mặt.
3. Thêm cà chua, nước mắm, đường, giấm và nước; đun sôi.
4. Đậy nắp nấu lửa nhỏ 25 phút đến khi sườn chín mềm, mở nắp đun cho sốt sánh.','assets/dishes/dish-6.svg',45,3 FROM categories c WHERE c.name='Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sườn xào chua ngọt');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,500.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Sườn heo' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Cà chua' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Giấm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sườn xào chua ngọt' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Canh', 'Công thức canh cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Canh');
INSERT INTO ingredients (name) SELECT 'Bí đỏ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bí đỏ');
INSERT INTO ingredients (name) SELECT 'Thịt heo xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt heo xay');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành lá');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh bí đỏ thịt băm','Canh bí đỏ thịt băm cho 3 người, với bí đỏ, thịt heo xay, nước. Các bước đơn giản cho căn bếp mỗi ngày.','1. Gọt bí, bỏ hạt và cắt miếng 2 cm.
2. Đun nước sôi, cho thịt vào khuấy tơi và hớt bọt.
3. Cho bí vào nấu 12–15 phút đến khi bí mềm, thịt chín.
4. Nêm nước mắm, thêm hành lá thái nhỏ, đun sôi lại và tắt bếp.','assets/dishes/dish-7.svg',25,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh bí đỏ thịt băm');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Bí đỏ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Thịt heo xay' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'nhánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh bí đỏ thịt băm' AND i.name='Hành lá' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Canh', 'Công thức canh cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Canh');
INSERT INTO ingredients (name) SELECT 'Cá basa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cá basa');
INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');
INSERT INTO ingredients (name) SELECT 'Dứa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dứa');
INSERT INTO ingredients (name) SELECT 'Đậu bắp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu bắp');
INSERT INTO ingredients (name) SELECT 'Me' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Me');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước mắm');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh chua cá','Canh chua cá cho 4 người, với cá basa, cà chua, dứa. Các bước đơn giản cho căn bếp mỗi ngày.','1. Làm sạch cá; thái cà chua, dứa và đậu bắp. Ngâm me với nước nóng, lọc lấy nước chua.
2. Đun nước với dứa, cà chua 5 phút.
3. Cho cá vào, nấu lửa vừa khoảng 10 phút đến khi cá chín hoàn toàn.
4. Thêm đậu bắp, nước me, nước mắm và đường, nấu thêm 3 phút, nêm lại vừa khẩu vị.','assets/dishes/dish-8.svg',30,4 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh chua cá');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Cá basa' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Cà chua' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Dứa' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Đậu bắp' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,20.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Me' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.2,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh chua cá' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Canh', 'Công thức canh cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Canh');
INSERT INTO ingredients (name) SELECT 'Rau cải' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau cải');
INSERT INTO ingredients (name) SELECT 'Đậu hũ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');
INSERT INTO ingredients (name) SELECT 'Gừng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gừng');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh cải đậu hũ','Canh cải đậu hũ cho 2 người, với rau cải, đậu hũ, nước. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa rau cải, cắt khúc; đậu hũ cắt miếng, gừng thái lát.
2. Đun nước với gừng, cho đậu hũ vào nấu 3 phút.
3. Thêm rau cải và muối, nấu 3–4 phút.
4. Khi rau vừa mềm, đậu nóng đều, tắt bếp và dùng nóng.','assets/dishes/dish-9.svg',15,2 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh cải đậu hũ');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Rau cải' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Đậu hũ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,800.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Muối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh cải đậu hũ' AND i.name='Gừng' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Canh', 'Công thức canh cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Canh');
INSERT INTO ingredients (name) SELECT 'Nấm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm');
INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');
INSERT INTO ingredients (name) SELECT 'Bắp' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');
INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành lá');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Canh nấm rau củ','Canh nấm rau củ cho 3 người, với nấm, cà rốt, bắp. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa nấm, thái cà rốt và cắt bắp thành khúc.
2. Đun bắp với nước 10 phút.
3. Thêm cà rốt nấu 5 phút, sau đó thêm nấm nấu thêm 5 phút.
4. Nêm muối, rắc hành lá và dùng nóng khi rau củ chín mềm.','assets/dishes/dish-10.svg',25,3 FROM categories c WHERE c.name='Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Canh nấm rau củ');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Nấm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Cà rốt' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'trái' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Bắp' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Muối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'nhánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Canh nấm rau củ' AND i.name='Hành lá' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Rau & salad', 'Công thức rau & salad cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Rau & salad');
INSERT INTO ingredients (name) SELECT 'Rau muống' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau muống');
INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Rau muống xào tỏi','Rau muống xào tỏi cho 2 người, với rau muống, tỏi, dầu ăn. Các bước đơn giản cho căn bếp mỗi ngày.','1. Nhặt rau, rửa kỹ và để ráo. Tỏi đập dập.
2. Làm nóng dầu, phi tỏi thơm nhưng không để cháy.
3. Cho rau và nước vào xào lửa lớn, đảo đều 3–5 phút.
4. Nêm muối, đảo đến khi rau chín vừa rồi bày ra đĩa.','assets/dishes/dish-11.svg',15,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Rau muống xào tỏi');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Rau muống' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,5.0,'tép' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Tỏi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Muối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Rau muống xào tỏi' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Rau & salad', 'Công thức rau & salad cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Rau & salad');
INSERT INTO ingredients (name) SELECT 'Dưa chuột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dưa chuột');
INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');
INSERT INTO ingredients (name) SELECT 'Xà lách' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Xà lách');
INSERT INTO ingredients (name) SELECT 'Dầu ô liu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ô liu');
INSERT INTO ingredients (name) SELECT 'Chanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chanh');
INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Salad dưa chuột cà chua','Salad dưa chuột cà chua cho 2 người, với dưa chuột, cà chua, xà lách. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa sạch rau, để ráo; thái dưa chuột, cà chua vừa ăn.
2. Vắt chanh, bỏ hạt, khuấy với dầu ô liu và muối.
3. Cho rau vào tô, rưới sốt và trộn nhẹ.
4. Dùng ngay để rau giòn; chỉ trộn sốt trước khi ăn.','assets/dishes/dish-12.svg',10,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Salad dưa chuột cà chua');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Dưa chuột' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Cà chua' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Xà lách' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Dầu ô liu' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Chanh' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.25,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Salad dưa chuột cà chua' AND i.name='Muối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Rau & salad', 'Công thức rau & salad cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Rau & salad');
INSERT INTO ingredients (name) SELECT 'Bông cải xanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bông cải xanh');
INSERT INTO ingredients (name) SELECT 'Nấm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm');
INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bông cải xào nấm','Bông cải xào nấm cho 2 người, với bông cải xanh, nấm, tỏi. Các bước đơn giản cho căn bếp mỗi ngày.','1. Cắt bông cải thành nhánh, rửa sạch; nấm thái vừa ăn.
2. Chần bông cải trong nước sôi 2 phút, vớt ra.
3. Phi tỏi với dầu, xào nấm 3 phút.
4. Thêm bông cải, nước tương và nước, đảo thêm 3 phút đến khi chín vừa.','assets/dishes/dish-13.svg',20,2 FROM categories c WHERE c.name='Rau & salad' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bông cải xào nấm');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Bông cải xanh' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Nấm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'tép' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Tỏi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,50.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bông cải xào nấm' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món chay', 'Công thức món chay cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món chay');
INSERT INTO ingredients (name) SELECT 'Đậu hũ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ');
INSERT INTO ingredients (name) SELECT 'Cà chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà chua');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Đậu hũ sốt cà chua','Đậu hũ sốt cà chua cho 2 người, với đậu hũ, cà chua, dầu ăn. Các bước đơn giản cho căn bếp mỗi ngày.','1. Thấm khô đậu, cắt miếng; cà chua thái nhỏ.
2. Chiên đậu vàng nhẹ với dầu rồi vớt ra.
3. Dùng chảo đó xào cà chua, thêm nước, nước tương và đường, nấu 5 phút.
4. Cho đậu trở lại, rim 5–7 phút để sốt thấm đều.','assets/dishes/dish-14.svg',25,2 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Đậu hũ sốt cà chua');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Đậu hũ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Cà chua' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Đậu hũ sốt cà chua' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món chay', 'Công thức món chay cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món chay');
INSERT INTO ingredients (name) SELECT 'Nấm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nấm');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO ingredients (name) SELECT 'Tiêu' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tiêu');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Nấm kho tiêu','Nấm kho tiêu cho 2 người, với nấm, nước tương, tiêu. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa nhanh nấm, để ráo; cắt đôi nấm lớn.
2. Làm nóng dầu, đảo nấm 3 phút.
3. Thêm nước tương, đường, tiêu và nước.
4. Kho lửa nhỏ 10–12 phút đến khi nấm chín, nước kho sánh.','assets/dishes/dish-15.svg',25,2 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Nấm kho tiêu');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Nấm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Tiêu' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Nấm kho tiêu' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Món chay', 'Công thức món chay cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Món chay');
INSERT INTO ingredients (name) SELECT 'Cà tím' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà tím');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cà tím áp chảo sốt tương','Cà tím áp chảo sốt tương cho 2 người, với cà tím, nước tương, tỏi. Các bước đơn giản cho căn bếp mỗi ngày.','1. Cắt cà tím thành lát dày 1 cm, tỏi băm.
2. Áp chảo cà với dầu, trở hai mặt vàng nhẹ.
3. Khuấy nước tương, đường và nước; cho vào chảo cùng tỏi.
4. Đậy nắp nấu 5–7 phút đến khi cà mềm, mở nắp cho sốt sánh.','assets/dishes/dish-16.svg',20,2 FROM categories c WHERE c.name='Món chay' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cà tím áp chảo sốt tương');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Cà tím' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'tép' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Tỏi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cà tím áp chảo sốt tương' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Cơm', 'Công thức cơm cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Cơm');
INSERT INTO ingredients (name) SELECT 'Cơm nguội' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm nguội');
INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');
INSERT INTO ingredients (name) SELECT 'Đậu Hà Lan' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu Hà Lan');
INSERT INTO ingredients (name) SELECT 'Bắp hạt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bắp hạt');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm chiên rau củ','Cơm chiên rau củ cho 2 người, với cơm nguội, cà rốt, đậu hà lan. Các bước đơn giản cho căn bếp mỗi ngày.','1. Dùng cơm đã bảo quản lạnh đúng cách, bóp tơi; cà rốt thái hạt lựu.
2. Làm nóng dầu, xào cà rốt 3 phút.
3. Thêm bắp và đậu, xào 3 phút, sau đó cho cơm vào.
4. Nêm nước tương, đảo 5 phút đến khi cơm nóng đều; dùng ngay.','assets/dishes/dish-17.svg',20,2 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm chiên rau củ');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Cơm nguội' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Cà rốt' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Đậu Hà Lan' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Bắp hạt' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm chiên rau củ' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Cơm', 'Công thức cơm cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Cơm');
INSERT INTO ingredients (name) SELECT 'Thịt gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt gà');
INSERT INTO ingredients (name) SELECT 'Cơm chín' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cơm chín');
INSERT INTO ingredients (name) SELECT 'Dưa chuột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dưa chuột');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO ingredients (name) SELECT 'Mật ong' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mật ong');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cơm gà áp chảo','Cơm gà áp chảo cho 2 người, với thịt gà, cơm chín, dưa chuột. Các bước đơn giản cho căn bếp mỗi ngày.','1. Dùng thịt gà không xương, dàn mỏng đều; ướp nước tương và mật ong 10 phút.
2. Áp chảo gà với dầu 3–4 phút mỗi mặt.
3. Thêm nước, đậy nắp nấu 8–10 phút đến khi gà chín hoàn toàn; mở nắp cho sốt sánh.
4. Thái gà, bày với cơm nóng và dưa chuột rửa sạch thái lát.','assets/dishes/dish-18.svg',35,2 FROM categories c WHERE c.name='Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cơm gà áp chảo');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,300.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Thịt gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Cơm chín' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Dưa chuột' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Mật ong' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,80.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cơm gà áp chảo' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Ăn sáng', 'Công thức ăn sáng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');
INSERT INTO ingredients (name) SELECT 'Gạo' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Gạo');
INSERT INTO ingredients (name) SELECT 'Thịt gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt gà');
INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Muối');
INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Hành lá');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Cháo gà cà rốt','Cháo gà cà rốt cho 3 người, với gạo, thịt gà, cà rốt. Các bước đơn giản cho căn bếp mỗi ngày.','1. Vo gạo, cà rốt thái nhỏ.
2. Đun gạo với nước, hạ lửa nấu 25 phút; khuấy định kỳ.
3. Thêm gà cắt nhỏ và cà rốt, nấu 15 phút đến khi gà chín hoàn toàn, gạo mềm.
4. Nêm muối, thêm hành lá và dùng nóng; thêm nước nóng nếu cháo quá đặc.','assets/dishes/dish-19.svg',50,3 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Cháo gà cà rốt');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Gạo' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,250.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Thịt gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Cà rốt' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.75,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Muối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'nhánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Cháo gà cà rốt' AND i.name='Hành lá' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Ăn sáng', 'Công thức ăn sáng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');
INSERT INTO ingredients (name) SELECT 'Bánh mì' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bánh mì');
INSERT INTO ingredients (name) SELECT 'Trứng gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trứng gà');
INSERT INTO ingredients (name) SELECT 'Dưa chuột' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dưa chuột');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bánh mì trứng','Bánh mì trứng cho 1 người, với bánh mì, trứng gà, dưa chuột. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa dưa chuột, thái lát. Rạch bánh mì.
2. Làm nóng dầu, chiên trứng đến khi lòng trắng và lòng đỏ chín.
3. Làm ấm bánh mì trên chảo khô.
4. Cho trứng, dưa chuột và nước tương vào bánh, dùng ngay.','assets/dishes/dish-20.svg',10,1 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bánh mì trứng');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'ổ' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Bánh mì' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Trứng gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,0.5,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Dưa chuột' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bánh mì trứng' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Ăn sáng', 'Công thức ăn sáng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');
INSERT INTO ingredients (name) SELECT 'Bún khô' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bún khô');
INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Cà rốt');
INSERT INTO ingredients (name) SELECT 'Rau cải' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau cải');
INSERT INTO ingredients (name) SELECT 'Đậu hũ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu hũ');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Bún xào rau củ','Bún xào rau củ cho 2 người, với bún khô, cà rốt, rau cải. Các bước đơn giản cho căn bếp mỗi ngày.','1. Ngâm hoặc luộc bún theo hướng dẫn trên bao bì, để ráo.
2. Thái cà rốt sợi, rau cải cắt khúc; đậu cắt nhỏ.
3. Xào đậu và cà rốt với dầu 4 phút, thêm rau nấu chín.
4. Thêm bún, nước tương, đảo nhẹ 2–3 phút cho nóng đều.','assets/dishes/dish-21.svg',25,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Bún xào rau củ');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Bún khô' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Cà rốt' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Rau cải' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Đậu hũ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Bún xào rau củ' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Ăn sáng', 'Công thức ăn sáng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Ăn sáng');
INSERT INTO ingredients (name) SELECT 'Mì trứng' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mì trứng');
INSERT INTO ingredients (name) SELECT 'Thịt bò' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Thịt bò');
INSERT INTO ingredients (name) SELECT 'Rau cải' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Rau cải');
INSERT INTO ingredients (name) SELECT 'Tỏi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Tỏi');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước tương' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước tương');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Mì xào bò','Mì xào bò cho 2 người, với mì trứng, thịt bò, rau cải. Các bước đơn giản cho căn bếp mỗi ngày.','1. Luộc mì theo bao bì, để ráo. Thái bò mỏng và rau cải cắt khúc.
2. Phi tỏi với dầu, xào bò đến chín rồi trút ra.
3. Xào cải 3–4 phút, thêm mì và nước tương.
4. Cho bò trở lại, đảo đều 1 phút và dùng nóng.','assets/dishes/dish-22.svg',25,2 FROM categories c WHERE c.name='Ăn sáng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Mì xào bò');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Mì trứng' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Thịt bò' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Rau cải' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'tép' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Tỏi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.5,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Mì xào bò' AND i.name='Nước tương' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Tráng miệng', 'Công thức tráng miệng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Tráng miệng');
INSERT INTO ingredients (name) SELECT 'Đậu xanh cà vỏ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đậu xanh cà vỏ');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Đường' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đường');
INSERT INTO ingredients (name) SELECT 'Nước cốt dừa' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước cốt dừa');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chè đậu xanh','Chè đậu xanh cho 4 người, với đậu xanh cà vỏ, nước, đường. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa đậu, ngâm 2 giờ trước khi nấu; thời gian ngâm chưa tính trong thời gian công thức.
2. Cho đậu và nước vào nồi, đun sôi, hớt bọt.
3. Hạ lửa nấu 25–30 phút đến khi đậu mềm, khuấy để không bén đáy.
4. Thêm đường nấu 5 phút, múc ra bát và thêm nước cốt dừa.','assets/dishes/dish-23.svg',40,4 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chè đậu xanh');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,150.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Đậu xanh cà vỏ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,900.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,70.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Đường' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chè đậu xanh' AND i.name='Nước cốt dừa' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Tráng miệng', 'Công thức tráng miệng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Tráng miệng');
INSERT INTO ingredients (name) SELECT 'Sữa chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa chua');
INSERT INTO ingredients (name) SELECT 'Chuối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chuối');
INSERT INTO ingredients (name) SELECT 'Xoài' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Xoài');
INSERT INTO ingredients (name) SELECT 'Mật ong' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mật ong');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sữa chua trái cây','Sữa chua trái cây cho 2 người, với sữa chua, chuối, xoài. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa xoài, gọt vỏ, cắt hạt lựu. Chuối bóc vỏ, thái lát.
2. Chia sữa chua vào hai cốc.
3. Thêm xoài, chuối và mật ong.
4. Trộn nhẹ và dùng ngay hoặc bảo quản lạnh đến lúc ăn.','assets/dishes/dish-24.svg',10,2 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sữa chua trái cây');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Sữa chua' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Chuối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Xoài' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sữa chua trái cây' AND i.name='Mật ong' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Tráng miệng', 'Công thức tráng miệng cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Tráng miệng');
INSERT INTO ingredients (name) SELECT 'Chuối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chuối');
INSERT INTO ingredients (name) SELECT 'Bơ' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Bơ');
INSERT INTO ingredients (name) SELECT 'Mật ong' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mật ong');
INSERT INTO ingredients (name) SELECT 'Mè rang' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mè rang');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Chuối áp chảo mật ong','Chuối áp chảo mật ong cho 2 người, với chuối, bơ, mật ong. Các bước đơn giản cho căn bếp mỗi ngày.','1. Bóc chuối, bổ đôi theo chiều dọc.
2. Đun chảy bơ trên chảo lửa vừa.
3. Áp chảo chuối 1–2 phút mỗi mặt đến khi vàng nhẹ.
4. Rưới mật ong, rắc mè rang và dùng ấm.','assets/dishes/dish-25.svg',10,2 FROM categories c WHERE c.name='Tráng miệng' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Chuối áp chảo mật ong');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,3.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Chuối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,10.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Bơ' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Mật ong' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Chuối áp chảo mật ong' AND i.name='Mè rang' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Đồ uống', 'Công thức đồ uống cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Đồ uống');
INSERT INTO ingredients (name) SELECT 'Xoài' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Xoài');
INSERT INTO ingredients (name) SELECT 'Sữa tươi' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa tươi');
INSERT INTO ingredients (name) SELECT 'Sữa chua' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Sữa chua');
INSERT INTO ingredients (name) SELECT 'Đá viên' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đá viên');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Sinh tố xoài','Sinh tố xoài cho 2 người, với xoài, sữa tươi, sữa chua. Các bước đơn giản cho căn bếp mỗi ngày.','1. Rửa xoài, gọt vỏ, lấy thịt và cắt nhỏ.
2. Cho xoài, sữa tươi và sữa chua vào máy xay.
3. Thêm đá, xay đến khi mịn; điều chỉnh lượng sữa để đạt độ đặc mong muốn.
4. Rót vào cốc và dùng ngay.','assets/dishes/dish-26.svg',10,2 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Sinh tố xoài');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Xoài' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,200.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Sữa tươi' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Sữa chua' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Sinh tố xoài' AND i.name='Đá viên' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO categories (name,description) SELECT 'Đồ uống', 'Công thức đồ uống cho bữa ăn đa dạng.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Đồ uống');
INSERT INTO ingredients (name) SELECT 'Trà túi lọc' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Trà túi lọc');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Nước');
INSERT INTO ingredients (name) SELECT 'Chanh' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Chanh');
INSERT INTO ingredients (name) SELECT 'Mật ong' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Mật ong');
INSERT INTO ingredients (name) SELECT 'Đá viên' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name='Đá viên');
INSERT INTO recipes (category_id,title,description,instructions,image_url,prep_time_minutes,servings) SELECT c.id,'Trà chanh mật ong','Trà chanh mật ong cho 2 người, với trà túi lọc, nước, chanh. Các bước đơn giản cho căn bếp mỗi ngày.','1. Đun nước nóng, hãm trà theo thời gian trên bao bì rồi bỏ túi trà.
2. Đợi trà nguội bớt, khuấy mật ong.
3. Rửa chanh, vắt nước bỏ hạt; thêm vào trà và khuấy.
4. Chia vào hai cốc có đá, điều chỉnh vị theo khẩu vị.','assets/dishes/dish-27.svg',15,2 FROM categories c WHERE c.name='Đồ uống' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title='Trà chanh mật ong');
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'túi' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Trà túi lọc' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,400.0,'ml' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,1.0,'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Chanh' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,2.0,'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Mật ong' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
INSERT INTO recipe_ingredients (recipe_id,ingredient_id,quantity,unit) SELECT r.id,i.id,100.0,'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title='Trà chanh mật ong' AND i.name='Đá viên' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id=r.id AND ri.ingredient_id=i.id);
COMMIT;
SELECT COUNT(*) AS tong_cong_thuc FROM recipes;
