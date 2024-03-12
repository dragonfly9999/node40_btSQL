/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `descs` varchar(250) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(250) DEFAULT NULL,
  `arr_sub_id` varchar(250) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `decs` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_foods` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(250) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_foods_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `pass_word` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(1, 'Spaghetti Carbonara', 'spaghetti_carbonara.jpg', 12.99, 'Classic Italian pasta dish with eggs, cheese, bacon, and pepper.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(2, 'Orange Chicken', 'orange_chicken.jpg', 10.99, 'Crispy chicken pieces tossed in a tangy orange sauce.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(3, 'Tacos', 'tacos.jpg', 8.99, 'Traditional Mexican dish with seasoned meat, salsa, cheese, and vegetables wrapped in a soft corn tortilla.', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(4, 'Sushi Rolls', 'sushi_rolls.jpg', 15.99, 'Assorted sushi rolls with fresh fish, rice, and vegetables.', 4),
(5, 'Chicken Tikka Masala', 'chicken_tikka_masala.jpg', 13.99, 'Creamy and flavorful Indian dish with marinated chicken in a spiced tomato-based sauce.', 5),
(6, 'Pad Thai', 'pad_thai.jpg', 11.99, 'Thai stir-fried noodles with eggs, tofu, shrimp, and bean sprouts, garnished with peanuts and lime.', 6),
(7, 'Hamburger', 'hamburger.jpg', 9.99, 'Classic American burger with a beef patty, lettuce, tomato, onion, pickles, and cheese, served with fries.', 7),
(8, 'Croissant', 'croissant.jpg', 3.99, 'Flaky and buttery French pastry.', 8),
(9, 'Greek Salad', 'greek_salad.jpg', 7.99, 'Fresh and crisp salad with tomatoes, cucumbers, olives, onions, and feta cheese.', 9),
(10, 'Pho', 'pho.jpg', 9.99, 'Vietnamese noodle soup with beef or chicken, fresh herbs, bean sprouts, and rice noodles in a flavorful broth.', 10),
(11, 'Lasagna', 'lasagna.jpg', 12.99, 'Layers of pasta, meat sauce, and cheese baked to perfection.', 1),
(12, 'General Tso Chicken', 'general_tso_chicken.jpg', 11.99, 'Popular Chinese dish featuring crispy chicken in a sweet and spicy sauce.', 2),
(13, 'Burritos', 'burritos.jpg', 10.99, 'Hearty Mexican dish with a flour tortilla filled with beans, rice, meat, cheese, and salsa.', 3),
(14, 'Sashimi', 'sashimi.jpg', 17.99, 'Assortment of thinly sliced raw fish, served with soy sauce and wasabi.', 4),
(15, 'Butter Chicken', 'butter_chicken.jpg', 14.99, 'Creamy and rich Indian curry with tender pieces of chicken.', 5),
(16, 'Green Curry', 'green_curry.jpg', 12.99, 'Thai curry made with green curry paste, coconut milk, vegetables, and meat or tofu.', 6),
(17, 'BBQ Ribs', 'bbq_ribs.jpg', 16.99, 'Tender and smoky ribs slathered in barbecue sauce.', 7),
(18, 'Baguette', 'baguette.jpg', 2.99, 'Crusty French bread loaf, perfect for sandwiches or dipping in soup.', 8),
(19, 'Falafel', 'falafel.jpg', 8.99, 'Middle Eastern dish made from ground chickpeas or fava beans, formed into balls or patties and deep-fried.', 9),
(20, 'Banh Mi', 'banh_mi.jpg', 6.99, 'Vietnamese sandwich on a baguette, typically filled with pork, pickled vegetables, cilantro, and chili peppers.', 10),
(21, 'Ravioli', 'ravioli.jpg', 13.99, 'Italian pasta filled with cheese or meat, served with marinara sauce.', 1),
(22, 'Kung Pao Chicken', 'kung_pao_chicken.jpg', 11.99, 'Szechuan dish with diced chicken, peanuts, vegetables, and chili peppers.', 2),
(23, 'Enchiladas', 'enchiladas.jpg', 10.99, 'Mexican dish consisting of rolled tortillas filled with meat, cheese, and sauce, baked until bubbly.', 3),
(24, 'Tempura', 'tempura.jpg', 14.99, 'Japanese dish of battered and deep-fried seafood and vegetables.', 4),
(25, 'Vindaloo', 'vindaloo.jpg', 15.99, 'Spicy Indian curry dish with meat marinated in vinegar, sugar, and spices.', 5),
(26, 'Tom Yum Soup', 'tom_yum_soup.jpg', 9.99, 'Hot and sour Thai soup with shrimp, mushrooms, lemongrass, and chili peppers.', 6),
(27, 'Cheeseburger', 'cheeseburger.jpg', 10.99, 'Classic American burger with cheese, lettuce, tomato, onion, pickles, and sauce, served with fries.', 7),
(28, 'Macarons', 'macarons.jpg', 5.99, 'Colorful French meringue-based cookies filled with ganache, buttercream, or jam.', 8),
(29, 'Tabbouleh', 'tabbouleh.jpg', 7.99, 'Levantine vegetarian salad made of finely chopped parsley, tomatoes, mint, onion, and bulgur.', 9),
(30, 'Bun Cha', 'bun_cha.jpg', 8.99, 'Vietnamese dish of grilled pork served with vermicelli noodles, herbs, and dipping sauce.', 10);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Chinese');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Japanese'),
(5, 'Indian'),
(6, 'Thai'),
(7, 'American'),
(8, 'French'),
(9, 'Mediterranean'),
(10, 'Vietnamese');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-01-01 08:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2024-01-02 09:45:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 3, '2024-01-03 10:20:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(4, 4, '2024-01-04 11:00:00'),
(5, 5, '2024-01-05 12:15:00'),
(6, 6, '2024-01-06 13:30:00'),
(7, 7, '2024-01-07 14:45:00'),
(8, 8, '2024-01-08 15:20:00'),
(9, 9, '2024-01-09 16:00:00'),
(10, 10, '2024-01-10 17:15:00'),
(11, 11, '2024-01-11 18:30:00'),
(12, 12, '2024-01-12 19:45:00'),
(13, 13, '2024-01-13 20:20:00'),
(14, 14, '2024-01-14 21:00:00'),
(15, 15, '2024-01-15 22:15:00'),
(16, 16, '2024-01-16 08:30:00'),
(17, 17, '2024-01-17 09:45:00'),
(18, 18, '2024-01-18 10:20:00'),
(19, 19, '2024-01-19 11:00:00'),
(20, 20, '2024-01-20 12:15:00'),
(21, 21, '2024-01-21 13:30:00'),
(22, 22, '2024-01-22 14:45:00'),
(23, 23, '2024-01-23 15:20:00'),
(24, 24, '2024-01-24 16:00:00'),
(25, 25, '2024-01-25 17:15:00'),
(26, 26, '2024-01-26 18:30:00'),
(27, 27, '2024-01-27 19:45:00'),
(28, 28, '2024-01-28 20:20:00'),
(29, 29, '2024-01-29 21:00:00'),
(30, 30, '2024-01-30 22:15:00'),
(31, 31, '2024-01-31 08:30:00'),
(32, 32, '2024-02-01 09:45:00'),
(33, 33, '2024-02-02 10:20:00'),
(34, 34, '2024-02-03 11:00:00'),
(35, 35, '2024-02-04 12:15:00'),
(36, 36, '2024-02-05 13:30:00'),
(37, 37, '2024-02-06 14:45:00'),
(38, 38, '2024-02-07 15:20:00'),
(39, 39, '2024-02-08 16:00:00'),
(40, 40, '2024-02-09 17:15:00'),
(41, 41, '2024-02-10 18:30:00'),
(42, 42, '2024-02-11 19:45:00'),
(43, 43, '2024-02-12 20:20:00'),
(44, 44, '2024-02-13 21:00:00'),
(45, 45, '2024-02-14 22:15:00'),
(46, 46, '2024-02-15 08:30:00'),
(47, 47, '2024-02-16 09:45:00'),
(48, 48, '2024-02-17 10:20:00'),
(49, 49, '2024-02-18 11:00:00'),
(50, 50, '2024-02-19 12:15:00');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 20, 2, 'ABC123', 'SUB001');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ABC123', 'SUB001');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 1, 'DEF456', 'SUB002');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 'GHI789', 'SUB003'),
(1, 4, 1, 'JKL012', 'SUB004'),
(4, 5, 2, 'MNO345', 'SUB005'),
(2, 6, 1, 'PQR678', 'SUB006'),
(5, 7, 2, 'STU901', 'SUB007'),
(3, 8, 1, 'VWX234', 'SUB008'),
(1, 9, 3, 'YZA567', 'SUB009'),
(6, 10, 2, 'BCD890', 'SUB010'),
(2, 11, 1, 'EFG123', 'SUB011'),
(7, 12, 1, 'HIJ456', 'SUB012'),
(3, 13, 2, 'KLM789', 'SUB013'),
(8, 14, 2, 'NOP012', 'SUB014'),
(4, 15, 1, 'QRS345', 'SUB015'),
(9, 16, 3, 'TUV678', 'SUB016'),
(5, 17, 1, 'WXY901', 'SUB017'),
(10, 18, 2, 'ZAB234', 'SUB018'),
(1, 19, 1, 'CDE567', 'SUB019'),
(6, 20, 3, 'FGH890', 'SUB020'),
(2, 21, 2, 'IJK123', 'SUB021'),
(7, 22, 1, 'LMN456', 'SUB022'),
(3, 23, 1, 'OPQ789', 'SUB023'),
(8, 24, 3, 'RST012', 'SUB024'),
(4, 25, 2, 'UVW345', 'SUB025'),
(9, 26, 2, 'XYZ678', 'SUB026'),
(5, 27, 1, 'ABC901', 'SUB027'),
(10, 28, 1, 'DEF234', 'SUB028'),
(1, 29, 3, 'GHI567', 'SUB029'),
(6, 30, 2, 'JKL890', 'SUB030');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 4, '2024-03-10 08:30:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 5, '2024-03-10 09:45:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, '2024-03-10 10:20:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 4, '2024-03-10 11:00:00'),
(5, 5, 5, '2024-03-10 12:15:00'),
(6, 6, 2, '2024-03-10 13:30:00'),
(7, 7, 4, '2024-03-10 14:45:00'),
(8, 8, 3, '2024-03-10 15:20:00'),
(9, 9, 5, '2024-03-10 16:00:00'),
(10, 10, 4, '2024-03-10 17:15:00'),
(11, 11, 3, '2024-03-10 18:30:00'),
(12, 12, 2, '2024-03-10 19:45:00'),
(13, 13, 4, '2024-03-10 20:20:00'),
(14, 14, 5, '2024-03-10 21:00:00'),
(15, 15, 3, '2024-03-10 22:15:00'),
(16, 16, 4, '2024-03-11 08:30:00'),
(17, 17, 5, '2024-03-11 09:45:00'),
(18, 18, 3, '2024-03-11 10:20:00'),
(19, 19, 4, '2024-03-11 11:00:00'),
(20, 20, 5, '2024-03-11 12:15:00'),
(21, 21, 2, '2024-03-11 13:30:00'),
(22, 22, 4, '2024-03-11 14:45:00'),
(23, 23, 3, '2024-03-11 15:20:00'),
(24, 24, 5, '2024-03-11 16:00:00'),
(25, 25, 4, '2024-03-11 17:15:00'),
(26, 26, 3, '2024-03-11 18:30:00'),
(27, 27, 2, '2024-03-11 19:45:00'),
(28, 28, 4, '2024-03-11 20:20:00'),
(29, 29, 5, '2024-03-11 21:00:00'),
(30, 30, 3, '2024-03-11 22:15:00'),
(31, 31, 4, '2024-03-12 08:30:00'),
(32, 32, 5, '2024-03-12 09:45:00'),
(33, 33, 3, '2024-03-12 10:20:00'),
(34, 34, 4, '2024-03-12 11:00:00'),
(35, 35, 5, '2024-03-12 12:15:00'),
(36, 36, 2, '2024-03-12 13:30:00'),
(37, 37, 4, '2024-03-12 14:45:00'),
(38, 38, 3, '2024-03-12 15:20:00'),
(39, 39, 5, '2024-03-12 16:00:00'),
(40, 40, 4, '2024-03-12 17:15:00'),
(41, 41, 3, '2024-03-12 18:30:00'),
(42, 42, 2, '2024-03-12 19:45:00'),
(43, 43, 4, '2024-03-12 20:20:00'),
(44, 44, 5, '2024-03-12 21:00:00'),
(45, 45, 3, '2024-03-12 22:15:00'),
(46, 46, 4, '2024-03-13 08:30:00'),
(47, 47, 5, '2024-03-13 09:45:00'),
(48, 48, 3, '2024-03-13 10:20:00'),
(49, 49, 4, '2024-03-13 11:00:00'),
(50, 50, 5, '2024-03-13 12:15:00');

INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `decs`) VALUES
(1, 'Restaurant A', 'restaurant_a.jpg', 'This is a description of Restaurant A');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `decs`) VALUES
(2, 'Restaurant B', 'restaurant_b.jpg', 'This is a description of Restaurant B');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `decs`) VALUES
(3, 'Restaurant C', 'restaurant_c.jpg', 'This is a description of Restaurant C');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `decs`) VALUES
(4, 'Restaurant D', 'restaurant_d.jpg', 'This is a description of Restaurant D'),
(5, 'Restaurant E', 'restaurant_e.jpg', 'This is a description of Restaurant E'),
(6, 'Restaurant A', 'image1.jpg', 'Description for Restaurant A'),
(7, 'Restaurant B', 'image2.jpg', 'Description for Restaurant B'),
(8, 'Restaurant C', 'image3.jpg', 'Description for Restaurant C'),
(9, 'Restaurant D', 'image4.jpg', 'Description for Restaurant D'),
(10, 'Restaurant E', 'image5.jpg', 'Description for Restaurant E'),
(11, 'Restaurant F', 'image6.jpg', 'Description for Restaurant F'),
(12, 'Restaurant G', 'image7.jpg', 'Description for Restaurant G'),
(13, 'Restaurant H', 'image8.jpg', 'Description for Restaurant H'),
(14, 'Restaurant I', 'image9.jpg', 'Description for Restaurant I'),
(15, 'Restaurant J', 'image10.jpg', 'Description for Restaurant J'),
(16, 'Restaurant K', 'image11.jpg', 'Description for Restaurant K'),
(17, 'Restaurant L', 'image12.jpg', 'Description for Restaurant L'),
(18, 'Restaurant M', 'image13.jpg', 'Description for Restaurant M'),
(19, 'Restaurant N', 'image14.jpg', 'Description for Restaurant N'),
(20, 'Restaurant O', 'image15.jpg', 'Description for Restaurant O'),
(21, 'Restaurant P', 'image16.jpg', 'Description for Restaurant P'),
(22, 'Restaurant Q', 'image17.jpg', 'Description for Restaurant Q'),
(23, 'Restaurant R', 'image18.jpg', 'Description for Restaurant R'),
(24, 'Restaurant S', 'image19.jpg', 'Description for Restaurant S'),
(25, 'Restaurant T', 'image20.jpg', 'Description for Restaurant T'),
(26, 'Restaurant U', 'image21.jpg', 'Description for Restaurant U'),
(27, 'Restaurant V', 'image22.jpg', 'Description for Restaurant V'),
(28, 'Restaurant W', 'image23.jpg', 'Description for Restaurant W'),
(29, 'Restaurant X', 'image24.jpg', 'Description for Restaurant X'),
(30, 'Restaurant Y', 'image25.jpg', 'Description for Restaurant Y'),
(31, 'Restaurant Z', 'image26.jpg', 'Description for Restaurant Z'),
(32, 'Restaurant AA', 'image27.jpg', 'Description for Restaurant AA'),
(33, 'Restaurant AB', 'image28.jpg', 'Description for Restaurant AB'),
(34, 'Restaurant AC', 'image29.jpg', 'Description for Restaurant AC'),
(35, 'Restaurant AD', 'image30.jpg', 'Description for Restaurant AD'),
(36, 'Restaurant AE', 'image31.jpg', 'Description for Restaurant AE'),
(37, 'Restaurant AF', 'image32.jpg', 'Description for Restaurant AF'),
(38, 'Restaurant AG', 'image33.jpg', 'Description for Restaurant AG'),
(39, 'Restaurant AH', 'image34.jpg', 'Description for Restaurant AH'),
(40, 'Restaurant AI', 'image35.jpg', 'Description for Restaurant AI'),
(41, 'Restaurant AJ', 'image36.jpg', 'Description for Restaurant AJ'),
(42, 'Restaurant AK', 'image37.jpg', 'Description for Restaurant AK'),
(43, 'Restaurant AL', 'image38.jpg', 'Description for Restaurant AL'),
(44, 'Restaurant AM', 'image39.jpg', 'Description for Restaurant AM'),
(45, 'Restaurant AN', 'image40.jpg', 'Description for Restaurant AN'),
(46, 'Restaurant AO', 'image41.jpg', 'Description for Restaurant AO'),
(47, 'Restaurant AP', 'image42.jpg', 'Description for Restaurant AP'),
(48, 'Restaurant AQ', 'image43.jpg', 'Description for Restaurant AQ'),
(49, 'Restaurant AR', 'image44.jpg', 'Description for Restaurant AR'),
(50, 'Restaurant AS', 'image45.jpg', 'Description for Restaurant AS'),
(51, 'Restaurant AT', 'image46.jpg', 'Description for Restaurant AT'),
(52, 'Restaurant AU', 'image47.jpg', 'Description for Restaurant AU'),
(53, 'Restaurant AV', 'image48.jpg', 'Description for Restaurant AV'),
(54, 'Restaurant AW', 'image49.jpg', 'Description for Restaurant AW'),
(55, 'Restaurant AX', 'image50.jpg', 'Description for Restaurant AX');

INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Garlic Bread', 4.99, 1);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Caesar Salad', 6.99, 1);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Spring Rolls', 3.99, 2);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Fried Rice', 2.99, 2),
(5, 'Chips and Salsa', 2.49, 3),
(6, 'Guacamole', 4.99, 3),
(7, 'Miso Soup', 1.99, 4),
(8, 'Edamame', 3.49, 4),
(9, 'Naan Bread', 2.99, 5),
(10, 'Samosa', 3.49, 5),
(11, 'Vegetable Pad Thai', 10.99, 6),
(12, 'Shrimp Pad Thai', 12.99, 6),
(13, 'Onion Rings', 3.99, 7),
(14, 'Sweet Potato Fries', 4.49, 7),
(15, 'Croissant Sandwich', 5.99, 8),
(16, 'Quiche', 7.49, 8),
(17, 'Greek Yogurt Parfait', 4.99, 9),
(18, 'Hummus and Pita', 3.99, 9),
(19, 'Egg Rolls', 3.99, 10),
(20, 'Banh Xeo', 6.49, 10),
(21, 'Meat Ravioli', 11.99, 11),
(22, 'Vegetable Ravioli', 10.99, 11),
(23, 'Egg Drop Soup', 2.99, 12),
(24, 'Wonton Soup', 3.49, 12),
(25, 'Burrito Bowl', 9.99, 13),
(26, 'Quesadilla', 8.99, 13),
(27, 'Tuna Sashimi', 14.99, 14),
(28, 'Salmon Sashimi', 16.99, 14),
(29, 'Paneer Tikka', 9.99, 15),
(30, 'Chicken Tikka', 11.99, 15);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'John Doe', 'john@example.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(2, 'Alice Smith', 'alice@example.com', 'password456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(3, 'Bob Johnson', 'bob@example.com', 'password789');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(4, 'Emma Brown', 'emma@example.com', 'password123'),
(5, 'Michael Davis', 'michael@example.com', 'passwordabc'),
(6, 'John Doe', 'john@example.com', 'password1'),
(7, 'Jane Smith', 'jane@example.com', 'password2'),
(8, 'Alice Johnson', 'alice@example.com', 'password3'),
(9, 'Bob Brown', 'bob@example.com', 'password4'),
(10, 'Emily Davis', 'emily@example.com', 'password5'),
(11, 'Michael Wilson', 'michael@example.com', 'password6'),
(12, 'Sarah Taylor', 'sarah@example.com', 'password7'),
(13, 'Chris Martinez', 'chris@example.com', 'password8'),
(14, 'Emma Anderson', 'emma@example.com', 'password9'),
(15, 'Daniel Thomas', 'daniel@example.com', 'password10'),
(16, 'Olivia White', 'olivia@example.com', 'password11'),
(17, 'David Martin', 'david@example.com', 'password12'),
(18, 'Sophia Garcia', 'sophia@example.com', 'password13'),
(19, 'Matthew Rodriguez', 'matthew@example.com', 'password14'),
(20, 'Ava Martinez', 'ava@example.com', 'password15'),
(21, 'James Hernandez', 'james@example.com', 'password16'),
(22, 'Isabella Lopez', 'isabella@example.com', 'password17'),
(23, 'Benjamin Gonzalez', 'benjamin@example.com', 'password18'),
(24, 'Charlotte Perez', 'charlotte@example.com', 'password19'),
(25, 'William Sanchez', 'william@example.com', 'password20'),
(26, 'Mia Ramirez', 'mia@example.com', 'password21'),
(27, 'Elijah Torres', 'elijah@example.com', 'password22'),
(28, 'Amelia Flores', 'amelia@example.com', 'password23'),
(29, 'Ethan Collins', 'ethan@example.com', 'password24'),
(30, 'Harper Stewart', 'harper@example.com', 'password25'),
(31, 'Evelyn Murphy', 'evelyn@example.com', 'password26'),
(32, 'Liam Reed', 'liam@example.com', 'password27'),
(33, 'Elizabeth Rivera', 'elizabeth@example.com', 'password28'),
(34, 'Noah Cook', 'noah@example.com', 'password29'),
(35, 'Avery Bailey', 'avery@example.com', 'password30'),
(36, 'Chloe Ward', 'chloe@example.com', 'password31'),
(37, 'Alexander Simmons', 'alexander@example.com', 'password32'),
(38, 'Sofia Ortiz', 'sofia@example.com', 'password33'),
(39, 'Mason Vargas', 'mason@example.com', 'password34'),
(40, 'Ella Munoz', 'ella@example.com', 'password35'),
(41, 'Carter Kim', 'carter@example.com', 'password36'),
(42, 'Aubrey Chapman', 'aubrey@example.com', 'password37'),
(43, 'Luke Nguyen', 'luke@example.com', 'password38'),
(44, 'Scarlett Alvarez', 'scarlett@example.com', 'password39'),
(45, 'Gabriel Kelly', 'gabriel@example.com', 'password40'),
(46, 'Lily Ruiz', 'lily@example.com', 'password41'),
(47, 'Jackson Walker', 'jackson@example.com', 'password42'),
(48, 'Layla Ross', 'layla@example.com', 'password43'),
(49, 'Aiden Washington', 'aiden@example.com', 'password44'),
(50, 'Penelope Wood', 'penelope@example.com', 'password45'),
(51, 'Logan Barnes', 'logan@example.com', 'password46'),
(52, 'Zoe Coleman', 'zoe@example.com', 'password47'),
(53, 'Christopher Butler', 'christopher@example.com', 'password48'),
(54, 'Hannah Barnes', 'hannah@example.com', 'password49'),
(55, 'Mila Hughes', 'mila@example.com', 'password50');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;