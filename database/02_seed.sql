-- De 29: Du lieu mau cho website cong thuc nau an.
-- Import 01_schema.sql first. No existing records are deleted or updated.
-- Re-importing this sample file does not duplicate these sample records.
USE recipe_db;
SET NAMES utf8mb4;
START TRANSACTION;

INSERT INTO categories (name, description) SELECT 'Món mặn', 'Các món dùng trong bữa cơm gia đình.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Món mặn');
INSERT INTO categories (name, description) SELECT 'Canh', 'Các món canh thanh mát, dễ nấu.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Canh');
INSERT INTO categories (name, description) SELECT 'Cơm', 'Các món cơm tiện lợi cho bữa ăn hằng ngày.' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Cơm');
INSERT INTO ingredients (name) SELECT 'Trứng gà' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Trứng gà');
INSERT INTO ingredients (name) SELECT 'Dầu ăn' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Dầu ăn');
INSERT INTO ingredients (name) SELECT 'Nước mắm' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Nước mắm');
INSERT INTO ingredients (name) SELECT 'Hành lá' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Hành lá');
INSERT INTO ingredients (name) SELECT 'Rau ngót' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Rau ngót');
INSERT INTO ingredients (name) SELECT 'Thịt heo xay' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Thịt heo xay');
INSERT INTO ingredients (name) SELECT 'Nước' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Nước');
INSERT INTO ingredients (name) SELECT 'Cơm nguội' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Cơm nguội');
INSERT INTO ingredients (name) SELECT 'Cà rốt' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Cà rốt');
INSERT INTO ingredients (name) SELECT 'Muối' WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'Muối');

INSERT INTO recipes (category_id, title, description, instructions, prep_time_minutes, servings) SELECT c.id, 'Trứng chiên hành lá', 'Món trứng đơn giản, thơm hành, dùng cùng cơm nóng.', '1. Rửa hành lá và thái nhỏ.
2. Đập trứng vào bát, thêm nước mắm và hành lá rồi đánh đều.
3. Làm nóng dầu trong chảo, đổ trứng vào và chiên lửa vừa.
4. Lật nhẹ, chiên đến khi trứng chín hoàn toàn rồi bày ra đĩa.', 10, 2 FROM categories c WHERE c.name = 'Món mặn' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title = 'Trứng chiên hành lá');
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 3, 'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Trứng chiên hành lá' AND i.name = 'Trứng gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 1, 'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Trứng chiên hành lá' AND i.name = 'Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 1, 'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Trứng chiên hành lá' AND i.name = 'Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 2, 'nhánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Trứng chiên hành lá' AND i.name = 'Hành lá' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);

INSERT INTO recipes (category_id, title, description, instructions, prep_time_minutes, servings) SELECT c.id, 'Canh rau ngót thịt băm', 'Canh rau ngót dễ nấu cho bữa cơm gia đình.', '1. Nhặt rau ngót, rửa sạch và vò nhẹ.
2. Đun sôi nước, cho thịt xay vào, khuấy tơi và hớt bọt.
3. Khi thịt chín, cho rau ngót vào và nấu thêm 3–5 phút.
4. Nêm nước mắm vừa ăn, đợi canh sôi lại rồi tắt bếp.', 20, 3 FROM categories c WHERE c.name = 'Canh' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title = 'Canh rau ngót thịt băm');
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 200, 'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Canh rau ngót thịt băm' AND i.name = 'Rau ngót' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 150, 'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Canh rau ngót thịt băm' AND i.name = 'Thịt heo xay' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 1, 'lít' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Canh rau ngót thịt băm' AND i.name = 'Nước' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 2, 'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Canh rau ngót thịt băm' AND i.name = 'Nước mắm' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);

INSERT INTO recipes (category_id, title, description, instructions, prep_time_minutes, servings) SELECT c.id, 'Cơm chiên trứng cà rốt', 'Cơm chiên trứng cùng cà rốt và hành lá.', '1. Gọt cà rốt, rửa sạch và thái hạt lựu; thái nhỏ hành lá.
2. Làm nóng dầu, cho cà rốt vào xào đến khi mềm.
3. Thêm trứng và đảo đều đến khi trứng chín.
4. Cho cơm vào, đảo cho tơi và nóng đều, nêm muối.
5. Thêm hành lá, đảo thêm một phút rồi tắt bếp.', 20, 2 FROM categories c WHERE c.name = 'Cơm' AND NOT EXISTS (SELECT 1 FROM recipes WHERE title = 'Cơm chiên trứng cà rốt');
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 400, 'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Cơm chiên trứng cà rốt' AND i.name = 'Cơm nguội' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 2, 'quả' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Cơm chiên trứng cà rốt' AND i.name = 'Trứng gà' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 100, 'g' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Cơm chiên trứng cà rốt' AND i.name = 'Cà rốt' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 1, 'muỗng canh' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Cơm chiên trứng cà rốt' AND i.name = 'Dầu ăn' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 0.5, 'muỗng cà phê' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Cơm chiên trứng cà rốt' AND i.name = 'Muối' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit) SELECT r.id, i.id, 2, 'nhánh' FROM recipes r CROSS JOIN ingredients i WHERE r.title = 'Cơm chiên trứng cà rốt' AND i.name = 'Hành lá' AND NOT EXISTS (SELECT 1 FROM recipe_ingredients ri WHERE ri.recipe_id = r.id AND ri.ingredient_id = i.id);

COMMIT;
