--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.1.13.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 30.06.2016 17:13:43
-- Версия сервера: 5.7.12-0ubuntu1
-- Версия клиента: 4.1
--


SET NAMES 'utf8';

INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(1, 'Продукты питания', 'produkty-pitanija', 0, '1', '{}', '2016-06-22 15:25:14.952', '2016-06-27 10:13:34.477', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(2, 'Спорт и отдых', 'sport-i-otdyh', 0, '2', '{}', '2016-06-22 17:07:54.618', '2016-06-23 14:34:01.628', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(3, 'Одежда, обувь и аксессуары', 'odezhda,-obuv’-i-aksessuary', 0, '3', '{}', '2016-06-22 17:15:40.32', '2016-06-22 17:15:40.32', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(4, 'Дом и офис', 'dom-i-ofis', 0, '4', '{}', '2016-06-23 11:33:22.612', '2016-06-23 14:33:49.251', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(5, 'Красота и здоровье', 'krasota-i-zdorov’e', 0, '5', '{}', '2016-06-23 14:30:45.639', '2016-06-23 14:33:33.121', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(6, 'Компьютеры и программы', 'komp’jutery-i-programmy', 0, '6', '{}', '2016-06-23 14:33:09.966', '2016-06-23 14:33:09.987', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(7, 'Программное обеспечение', 'programmnoe-obespechenie', 1, '6,7', '{}', '2016-06-23 14:53:11.506', '2016-06-23 14:53:11.525', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(8, 'Игровые приставки и консоли', 'igrovye-pristavki-i-konsoli', 1, '6,8', '{}', '2016-06-23 14:53:11.541', '2016-06-29 13:22:43.937', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(9, 'Сканеры', 'skanery', 1, '6,9', '{}', '2016-06-23 14:53:11.57', '2016-06-23 14:53:11.583', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(11, 'Сетевое оборудование', 'setevoe-oborudovanie', 1, '6,11', '{}', '2016-06-23 14:53:11.621', '2016-06-23 14:53:11.631', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(12, 'Серверы и серверное оборудование', 'servery-i-servernoe-oborudovanie', 1, '6,12', '{}', '2016-06-23 14:53:11.643', '2016-06-23 14:53:11.65', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(13, 'Проекторы и презентационное оборудование', 'proektory-i-prezentatsionnoe-oborudovanie', 1, '6,13', '{}', '2016-06-23 14:53:11.663', '2016-06-23 14:53:11.672', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(14, 'Принтеры', 'printery', 1, '6,14', '{}', '2016-06-23 14:53:11.686', '2016-06-23 14:53:11.693', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(15, 'Планшеты', 'planshety', 1, '6,15', '{}', '2016-06-23 14:53:11.707', '2016-06-23 14:53:11.715', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(16, 'Ноутбуки', 'noutbuki', 1, '6,16', '{}', '2016-06-23 14:53:11.73', '2016-06-23 14:53:11.739', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(17, 'Персональные компьютеры', 'personal’nye-komp’jutery', 1, '6,17', '{}', '2016-06-23 14:53:11.752', '2016-06-29 13:22:23.408', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(18, 'МФУ и копиры', 'mfu-i-kopiry', 1, '6,18', '{}', '2016-06-23 14:53:11.771', '2016-06-23 14:53:11.777', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(19, 'Мониторы', 'monitory', 1, '6,19', '{}', '2016-06-23 14:53:11.792', '2016-06-23 14:53:11.799', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(20, 'Напитки алкогольные', 'napitki-alkogol’nye', 1, '1,20', '{}', '2016-06-23 15:02:54.661', '2016-06-27 12:25:47.002', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(21, 'Бакалея', 'bakaleja', 1, '1,21', '{}', '2016-06-23 15:02:54.691', '2016-06-23 15:02:54.701', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(22, 'Детское питание', 'detskoe-pitanie', 1, '1,22', '{}', '2016-06-23 15:02:54.714', '2016-06-23 15:02:54.721', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(23, 'Диетические продукты', 'dieticheskie-produkty', 1, '1,23', '{}', '2016-06-23 15:02:54.73', '2016-06-23 15:02:54.737', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(24, 'Замороженные продукты', 'zamorozhennye-produkty', 1, '1,24', '{}', '2016-06-23 15:02:54.747', '2016-06-23 15:02:54.754', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(25, 'Кондитерские изделия', 'konditerskie-izdelija', 1, '1,25', '{}', '2016-06-23 15:02:54.763', '2016-06-23 15:02:54.772', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(26, 'Кулинария и полуфабрикаты', 'kulinarija-i-polufabrikaty', 1, '1,26', '{}', '2016-06-23 15:02:54.779', '2016-06-23 15:02:54.785', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(27, 'Молочные продукты, мороженое', 'molochnye-produkty,-morozhenoe', 1, '1,27', '{}', '2016-06-23 15:02:54.793', '2016-06-23 15:02:54.8', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(28, 'Мясо, птица (мясо и мясная продукция)', 'mjaso,-ptitsa-(mjaso-i-mjasnaja-produktsija)', 1, '1,28', '{}', '2016-06-23 15:02:54.808', '2016-06-23 15:02:54.813', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(29, 'Напитки, соки, воды', 'napitki,-soki,-vody', 1, '1,29', '{}', '2016-06-23 15:02:54.819', '2016-06-23 15:02:54.828', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(30, 'Овощи, фрукты, зелень, грибы', 'ovoschi,-frukty,-zelen’,-griby', 1, '1,30', '{}', '2016-06-23 15:02:54.835', '2016-06-23 15:02:54.842', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(31, 'Рыба и морепродукты', 'ryba-i-moreprodukty', 1, '1,31', '{}', '2016-06-23 15:02:54.849', '2016-06-23 15:02:54.856', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(32, 'Хлебобулочные изделия и выпечка', 'hlebobulochnye-izdelija-i-vypechka', 1, '1,32', '{}', '2016-06-23 15:02:54.864', '2016-06-23 15:02:54.871', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(33, 'Эко-продукты', 'eko-produkty', 1, '1,33', '{}', '2016-06-23 15:02:54.88', '2016-06-23 15:02:54.886', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(34, 'Яйцо....', 'jajtso....', 1, '1,34', '{}', '2016-06-23 15:02:54.896', '2016-06-27 12:45:36.119', NULL, 1, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(35, 'Вегетарианские и диетические продукты', 'vegetarianskie-i-dieticheskie-produkty', 2, '1,21,35', '{}', '2016-06-23 15:05:12.206', '2016-06-23 15:05:12.224', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(36, 'Консервы', 'konservy', 2, '1,21,36', '{}', '2016-06-23 15:05:12.233', '2016-06-23 15:05:12.239', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(38, 'Крупы', 'krupy', 2, '1,21,38', '{}', '2016-06-23 15:05:12.27', '2016-06-23 15:05:12.275', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(39, 'Макаронные изделия', 'makaronnye-izdelija', 2, '1,21,39', '{}', '2016-06-23 15:05:12.282', '2016-06-23 15:05:12.289', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(40, 'Масло растительное', 'maslo-rastitel’noe', 2, '1,21,40', '{}', '2016-06-23 15:05:12.298', '2016-06-23 15:05:12.305', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(41, 'Варенье, джем, мёд', 'varen’e,-dzhem,-med', 2, '1,21,41', '{}', '2016-06-23 15:05:12.312', '2016-06-23 15:05:12.319', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(42, 'Мука и отруби', 'muka-i-otrubi', 2, '1,21,42', '{}', '2016-06-23 15:05:12.328', '2016-06-23 15:05:12.334', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(43, 'Орехи', 'orehi', 2, '1,21,43', '{}', '2016-06-23 15:05:12.341', '2016-06-23 15:05:12.347', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(44, 'Ореховые и шоколадные пасты', 'orehovye-i-shokoladnye-pasty', 2, '1,21,44', '{}', '2016-06-23 15:05:12.356', '2016-06-23 15:05:12.363', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(45, 'Пищевые добавки', 'pischevye-dobavki', 2, '1,21,45', '{}', '2016-06-23 15:05:12.371', '2016-06-23 15:05:12.376', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(46, 'Пряности, специи, приправы', 'prjanosti,-spetsii,-pripravy', 2, '1,21,46', '{}', '2016-06-23 15:05:12.384', '2016-06-23 15:05:12.39', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(47, 'Сахар', 'sahar', 2, '1,21,47', '{}', '2016-06-23 15:05:12.398', '2016-06-23 15:05:12.405', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(48, 'Снеки (семечки, сухарики, чипсы, попкорн)', 'sneki-(semechki,-suhariki,-chipsy,-popkorn)', 2, '1,21,48', '{}', '2016-06-23 15:05:12.414', '2016-06-23 15:05:12.419', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(49, 'Сода пищевая', 'soda-pischevaja', 2, '1,21,49', '{}', '2016-06-23 15:05:12.429', '2016-06-23 15:05:12.437', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(50, 'Соевые продукты', 'soevye-produkty', 2, '1,21,50', '{}', '2016-06-23 15:05:12.446', '2016-06-23 15:05:12.454', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(51, 'Соль пищевая', 'sol’-pischevaja', 2, '1,21,51', '{}', '2016-06-23 15:05:12.462', '2016-06-23 15:05:12.468', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(52, 'Соусы, кетчупы, томатная паста (уксус?)', 'sousy,-ketchupy,-tomatnaja-pasta-(uksus?)', 2, '1,21,52', '{}', '2016-06-23 15:05:12.477', '2016-06-23 15:05:12.484', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(53, 'Специи и пряности', 'spetsii-i-prjanosti', 2, '1,21,53', '{}', '2016-06-23 15:05:12.492', '2016-06-23 15:05:12.499', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(54, 'Сублимированные продукты', 'sublimirovannye-produkty', 2, '1,21,54', '{}', '2016-06-23 15:05:12.509', '2016-06-23 15:05:12.517', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(55, 'Сухофрукты', 'suhofrukty', 2, '1,21,55', '{}', '2016-06-23 15:05:12.525', '2016-06-23 15:05:12.531', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(56, 'Хлопья и мюсли', 'hlop’ja-i-mjusli', 2, '1,21,56', '{}', '2016-06-23 15:05:12.539', '2016-06-23 15:05:12.547', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(59, 'Экзотические товары (для суши, например)', 'ekzoticheskie-tovary-(dlja-sushi,-naprimer)', 2, '1,21,59', '{}', '2016-06-23 15:05:12.59', '2016-06-23 15:05:12.598', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(60, 'Комплектующие', 'komplektujuschie', 1, '6,60', '{}', '2016-06-24 10:01:41.347', '2016-06-24 10:01:41.36', NULL, 6, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(90, 'Чай, кофе, какао...', 'chaj,-kofe,-kakao...', 2, '1,21,90', '{}', '2016-06-24 17:58:20.156', '2016-06-24 17:58:20.174', NULL, 21, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(91, 'Чай', 'chaj', 2, '1,25,91', '{}', '2016-06-24 17:59:16.673', '2016-06-30 09:57:29.794', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(92, 'Кофе', 'kofe', 3, '1,21,90,92', '{}', '2016-06-24 17:59:16.691', '2016-06-24 17:59:16.699', NULL, 90, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(93, 'Какао', 'kakao', 3, '1,21,90,93', '{}', '2016-06-24 17:59:16.708', '2016-06-24 17:59:16.716', NULL, 90, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(94, 'Матэ', 'mate', 3, '1,21,90,94', '{}', '2016-06-24 17:59:16.724', '2016-06-24 17:59:16.731', NULL, 90, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(95, 'Безе, Меренги', 'beze,-merengi', 2, '1,25,95', '{}', '2016-06-24 18:04:51.434', '2016-06-24 18:04:51.448', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(96, 'Мармелад', 'marmelad', 2, '1,25,96', '{}', '2016-06-24 18:04:51.458', '2016-06-24 18:04:51.464', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(97, 'Грильяж', 'gril’jazh', 2, '1,25,97', '{}', '2016-06-24 18:04:51.475', '2016-06-29 14:45:54.124', 315, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(98, 'Зефир, пастила', 'zefir,-pastila', 2, '1,25,98', '{}', '2016-06-24 18:04:51.49', '2016-06-24 18:04:51.499', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(99, 'Конфеты шоколадные', 'konfety-shokoladnye', 2, '1,25,99', '{}', '2016-06-24 18:04:51.507', '2016-06-24 18:04:51.513', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(100, 'Ирис', 'iris', 2, '1,25,100', '{}', '2016-06-24 18:04:51.521', '2016-06-24 18:04:51.526', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(101, 'Конфеты карамель', 'konfety-karamel’', 2, '1,25,101', '{}', '2016-06-24 18:04:51.532', '2016-06-24 18:04:51.54', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(102, 'Конфеты леденцы', 'konfety-ledentsy', 2, '1,25,102', '{}', '2016-06-24 18:04:51.547', '2016-06-24 18:04:51.555', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(103, 'Кремы', 'kremy', 2, '1,25,103', '{}', '2016-06-24 18:04:51.562', '2016-06-24 18:04:51.569', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(104, 'Марципан', 'martsipan', 2, '1,25,104', '{}', '2016-06-24 18:04:51.577', '2016-06-24 18:04:51.586', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(105, 'Муссы', 'mussy', 2, '1,25,105', '{}', '2016-06-24 18:04:51.595', '2016-06-24 18:04:51.603', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(106, 'Помадка', 'pomadka', 2, '1,25,106', '{}', '2016-06-24 18:04:51.612', '2016-06-24 18:04:51.62', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(107, 'Самбук', 'sambuk', 2, '1,25,107', '{}', '2016-06-24 18:04:51.632', '2016-06-24 18:04:51.64', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(108, 'Суфле', 'sufle', 2, '1,25,108', '{}', '2016-06-24 18:04:51.65', '2016-06-24 18:04:51.658', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(109, 'Халва, лукум и другие восточные сладости', 'halva,-lukum-i-drugie-vostochnye-sladosti', 2, '1,25,109', '{}', '2016-06-24 18:04:51.667', '2016-06-24 18:04:51.674', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(110, 'Цукаты', 'tsukaty', 2, '1,25,110', '{}', '2016-06-24 18:04:51.683', '2016-06-24 18:04:51.691', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(111, 'Шоколад', 'shokolad', 2, '1,25,111', '{}', '2016-06-24 18:04:51.7', '2016-06-24 18:04:51.708', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(112, 'Торты', 'torty', 2, '1,25,112', '{}', '2016-06-24 18:04:51.717', '2016-06-24 18:04:51.729', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(113, 'Вафли', 'vafli', 2, '1,25,113', '{}', '2016-06-24 18:04:51.74', '2016-06-24 18:04:51.751', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(114, 'Печенье', 'pechen’e', 2, '1,25,114', '{}', '2016-06-24 18:04:51.76', '2016-06-24 18:04:51.767', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(115, 'Пироги сладкие, пирожки, ватрушки, булки, пончики, кексы, ромовые бабы', 'pirogi-sladkie,-pirozhki,-vatrushki,-bulki,-ponchiki,-keksy,-romovye-baby', 2, '1,25,115', '{}', '2016-06-24 18:04:51.776', '2016-06-24 18:04:51.782', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(116, 'Пряники, коврижки', 'prjaniki,-kovrizhki', 2, '1,25,116', '{}', '2016-06-24 18:04:51.791', '2016-06-24 18:04:51.8', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(117, 'Пирожные, эклеры', 'pirozhnye,-eklery', 2, '1,25,117', '{}', '2016-06-24 18:04:51.808', '2016-06-24 18:04:51.815', NULL, 25, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(118, 'Велосипеды и аксессуары', 'velosipedy-i-aksessuary', 1, '2,118', '{}', '2016-06-27 10:20:22.221', '2016-06-27 10:20:22.237', NULL, 2, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(119, 'Велосипеды', 'velosipedy', 2, '2,118,119', '{}', '2016-06-27 10:23:19.536', '2016-06-27 10:23:19.555', NULL, 118, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(120, 'Велоаксессуары', 'veloaksessuary', 2, '2,118,120', '{}', '2016-06-27 10:23:19.566', '2016-06-27 10:23:19.577', NULL, 118, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(121, 'Велозапчасти', 'velozapchasti', 2, '2,118,121', '{}', '2016-06-27 10:23:19.591', '2016-06-27 10:23:19.599', NULL, 118, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(122, 'Велоэкипировка', 'veloekipirovka', 2, '2,118,122', '{}', '2016-06-27 10:23:19.613', '2016-06-27 10:23:19.622', NULL, 118, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(123, 'Велоинструменты', 'veloinstrumenty', 2, '2,118,123', '{}', '2016-06-27 10:23:19.629', '2016-06-27 10:23:19.636', NULL, 118, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(124, 'Горные велосипеды', 'gornye-velosipedy', 3, '2,118,119,124', '{}', '2016-06-27 11:22:38.094', '2016-06-27 11:22:38.117', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(125, 'Женские велосипеды', 'zhenskie-velosipedy', 3, '2,118,119,125', '{}', '2016-06-27 11:22:38.125', '2016-06-27 11:22:38.136', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(126, 'Детские велосипеды', 'detskie-velosipedy', 3, '2,118,119,126', '{}', '2016-06-27 11:22:38.153', '2016-06-27 11:22:38.169', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(127, 'Складные велосипеды', 'skladnye-velosipedy', 3, '2,118,119,127', '{}', '2016-06-27 11:22:38.175', '2016-06-27 11:22:38.182', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(128, 'Комфортные велосипеды', 'komfortnye-velosipedy', 3, '2,118,119,128', '{}', '2016-06-27 11:22:38.191', '2016-06-27 11:22:38.199', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(129, 'Двухподвесные велосипеды', 'dvuhpodvesnye-velosipedy', 3, '2,118,119,129', '{}', '2016-06-27 11:22:38.207', '2016-06-27 11:22:38.216', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(130, 'Экстремальные велосипеды', 'ekstremal’nye-velosipedy', 3, '2,118,119,130', '{}', '2016-06-27 11:22:38.223', '2016-06-27 11:22:38.229', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(131, 'Шоссейные велосипеды', 'shossejnye-velosipedy', 3, '2,118,119,131', '{}', '2016-06-27 11:22:38.237', '2016-06-27 11:22:38.245', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(132, 'Городские велосипеды', 'gorodskie-velosipedy', 3, '2,118,119,132', '{}', '2016-06-27 11:22:38.253', '2016-06-27 11:22:38.259', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(133, 'Электровелосипеды', 'elektrovelosipedy', 3, '2,118,119,133', '{}', '2016-06-27 11:22:38.266', '2016-06-27 11:22:38.273', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(134, 'Начального уровня', 'nachal’nogo-urovnja', 4, '2,118,119,124,134', '{}', '2016-06-27 11:25:48.634', '2016-06-27 11:25:48.662', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(135, 'Любительские', 'ljubitel’skie', 4, '2,118,119,124,135', '{}', '2016-06-27 11:25:48.67', '2016-06-27 11:25:48.675', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(136, 'Полупрофессиональные', 'poluprofessional’nye', 4, '2,118,119,124,136', '{}', '2016-06-27 11:25:48.685', '2016-06-27 11:25:48.691', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(137, 'Профессиональные', 'professional’nye', 4, '2,118,119,124,137', '{}', '2016-06-27 11:25:48.698', '2016-06-27 11:25:48.704', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(138, 'Велосипеды 26"', 'velosipedy-26’', 4, '2,118,119,124,138', '{}', '2016-06-27 11:25:48.71', '2016-06-27 11:25:48.718', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(139, 'Велосипеды 27,5"', 'velosipedy-27,5’', 4, '2,118,119,124,139', '{}', '2016-06-27 11:25:48.726', '2016-06-27 11:25:48.732', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(140, 'Велосипеды 29"', 'velosipedy-29’', 4, '2,118,119,124,140', '{}', '2016-06-27 11:25:48.746', '2016-06-27 11:25:48.752', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(141, 'Fat Bike', 'fat-bike', 4, '2,118,119,124,141', '{}', '2016-06-27 11:25:48.76', '2016-06-27 11:25:48.766', NULL, 124, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(142, 'Спортивные велосипеды', 'sportivnye-velosipedy', 4, '2,118,119,125,142', '{}', '2016-06-27 11:26:41.653', '2016-06-27 11:26:41.707', NULL, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(143, 'Круизёры', 'kruizery', 4, '2,118,119,125,143', '{}', '2016-06-27 11:26:41.715', '2016-06-29 13:27:15.805', 156, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(144, 'Двухподвесы', 'dvuhpodvesy', 4, '2,118,119,125,144', '{}', '2016-06-27 11:26:41.734', '2016-06-27 11:26:41.743', NULL, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(145, 'Велосипеды 26"', 'velosipedy-26’', 4, '2,118,119,125,145', '{}', '2016-06-27 11:26:41.753', '2016-06-27 11:26:41.765', NULL, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(146, 'Велосипеды 27,5"', 'velosipedy-27,5’', 4, '2,118,119,125,146', '{}', '2016-06-27 11:26:41.778', '2016-06-27 11:26:41.792', NULL, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(147, 'Велосипеды 29"', 'velosipedy-29’', 4, '2,118,119,125,147', '{}', '2016-06-27 11:26:41.802', '2016-06-27 11:26:41.81', NULL, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(148, 'Шоссейные', 'shossejnye', 4, '2,118,119,125,148', '{}', '2016-06-27 11:26:41.819', '2016-06-29 13:28:28.961', 167, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(149, 'Комфортные велосипеды', 'komfortnye-velosipedy', 4, '2,118,119,125,149', '{}', '2016-06-27 11:26:41.839', '2016-06-27 11:26:41.849', NULL, 125, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(150, 'Подростковые велосипеды', 'podrostkovye-velosipedy', 3, '2,118,119,150', '{}', '2016-06-27 11:29:21.013', '2016-06-27 11:29:21.034', NULL, 119, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(151, 'Для мальчиков (9-12 лет)', 'dlja-mal’chikov-(9-12-let)', 4, '2,118,119,150,151', '{}', '2016-06-27 11:29:39.175', '2016-06-27 11:29:39.18', NULL, 150, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(152, 'Для девочек (9-12 лет)', 'dlja-devochek-(9-12-let)', 4, '2,118,119,150,152', '{}', '2016-06-27 11:29:39.189', '2016-06-27 11:29:39.198', NULL, 150, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(153, 'Хардтейлы-комфорт', 'hardtejly-komfort', 4, '2,118,119,128,153', '{}', '2016-06-27 11:30:39.343', '2016-06-27 11:30:39.355', NULL, 128, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(154, 'Дорожные', 'dorozhnye', 4, '2,118,119,128,154', '{}', '2016-06-27 11:30:39.364', '2016-06-27 11:30:39.373', NULL, 128, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(155, 'Тандемы', 'tandemy', 4, '2,118,119,128,155', '{}', '2016-06-27 11:30:39.382', '2016-06-27 11:30:39.39', NULL, 128, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(156, 'Круизёры', 'kruizery', 4, '2,118,119,128,156', '{}', '2016-06-27 11:30:39.396', '2016-06-27 11:30:39.404', NULL, 128, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(157, 'Двухподвесы 27,5"', 'dvuhpodvesy-27,5’', 4, '2,118,119,129,157', '{}', '2016-06-27 11:31:28.74', '2016-06-27 11:31:28.746', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(158, 'Начальные', 'nachal’nye', 4, '2,118,119,129,158', '{}', '2016-06-27 11:31:28.755', '2016-06-27 11:31:28.763', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(159, 'Любительские', 'ljubitel’skie', 4, '2,118,119,129,159', '{}', '2016-06-27 11:31:28.774', '2016-06-27 11:31:28.78', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(160, 'Профессиональные', 'professional’nye', 4, '2,118,119,129,160', '{}', '2016-06-27 11:31:28.792', '2016-06-27 11:31:28.798', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(161, 'Полупрофессиональные', 'poluprofessional’nye', 4, '2,118,119,129,161', '{}', '2016-06-27 11:31:28.807', '2016-06-27 11:31:28.813', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(162, 'Двухподвесы 26"', 'dvuhpodvesy-26’', 4, '2,118,119,129,162', '{}', '2016-06-27 11:31:28.822', '2016-06-27 11:31:28.828', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(163, 'Двухподвесы 29"', 'dvuhpodvesy-29’', 4, '2,118,119,129,163', '{}', '2016-06-27 11:31:28.839', '2016-06-27 11:31:28.849', NULL, 129, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(164, 'Стрит/дёрт', 'strit~dert', 4, '2,118,119,130,164', '{}', '2016-06-27 11:32:23.038', '2016-06-27 11:32:23.043', NULL, 130, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(165, 'Велосипеды BMX', 'velosipedy-bmx', 4, '2,118,119,130,165', '{}', '2016-06-27 11:32:23.049', '2016-06-27 11:32:23.059', NULL, 130, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(166, 'Триал', 'trial', 4, '2,118,119,130,166', '{}', '2016-06-27 11:32:23.066', '2016-06-27 11:32:23.072', NULL, 130, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(167, 'Шоссейные', 'shossejnye', 4, '2,118,119,131,167', '{}', '2016-06-27 11:32:55.661', '2016-06-27 11:32:55.678', NULL, 131, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(168, 'Циклокроссовые', 'tsiklokrossovye', 4, '2,118,119,131,168', '{}', '2016-06-27 11:32:55.687', '2016-06-27 11:32:55.695', NULL, 131, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(169, 'Фитнес', 'fitnes', 4, '2,118,119,132,169', '{}', '2016-06-27 11:33:33.645', '2016-06-27 11:33:33.655', NULL, 132, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(170, 'Кроссовые', 'krossovye', 4, '2,118,119,132,170', '{}', '2016-06-27 11:33:33.663', '2016-06-27 11:33:33.671', NULL, 132, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(171, 'Амортизаторы', 'amortizatory', 3, '2,118,121,171', '{}', '2016-06-27 11:35:44.11', '2016-06-27 11:35:44.144', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(172, 'Вилки', 'vilki', 3, '2,118,121,172', '{}', '2016-06-27 11:35:44.152', '2016-06-27 11:35:44.16', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(173, 'Колёса', 'kolesa', 3, '2,118,121,173', '{}', '2016-06-27 11:35:44.171', '2016-06-27 11:35:44.182', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(174, 'Детали переключателей', 'detali-perekljuchatelej', 3, '2,118,121,174', '{}', '2016-06-27 11:35:44.193', '2016-06-27 11:35:44.201', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(175, 'Детали привода', 'detali-privoda', 3, '2,118,121,175', '{}', '2016-06-27 11:35:44.209', '2016-06-27 11:45:42.102', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(176, 'Рамы', 'ramy', 3, '2,118,121,176', '{}', '2016-06-27 11:35:44.228', '2016-06-27 11:35:44.235', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(177, 'Рулевое управление', 'rulevoe-upravlenie', 3, '2,118,121,177', '{}', '2016-06-27 11:35:44.244', '2016-06-27 11:35:44.251', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(178, 'Седла и подседельные штыри', 'sedla-i-podsedel’nye-shtyri', 3, '2,118,121,178', '{}', '2016-06-27 11:35:44.263', '2016-06-27 11:35:44.271', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(179, 'Тормоза', 'tormoza', 3, '2,118,121,179', '{}', '2016-06-27 11:35:44.282', '2016-06-27 11:35:44.287', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(180, 'Тросы, трассы, оболочки, рубашки, наконечники', 'trosy,-trassy,-obolochki,-rubashki,-nakonechniki', 3, '2,118,121,180', '{}', '2016-06-27 11:35:44.296', '2016-06-27 12:03:48.892', NULL, 121, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(181, 'Амортизирующие вилки', 'amortizirujuschie-vilki', 4, '2,118,121,171,181', '{}', '2016-06-27 11:37:38.339', '2016-06-27 11:37:38.356', NULL, 171, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(182, 'Амортизаторы задние', 'amortizatory-zadnie', 4, '2,118,121,171,182', '{}', '2016-06-27 11:37:38.367', '2016-06-27 11:37:38.374', NULL, 171, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(183, 'Пружины', 'pruzhiny', 4, '2,118,121,171,183', '{}', '2016-06-27 11:37:38.382', '2016-06-27 11:37:38.388', NULL, 171, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(184, 'Комплектующие велоамортизаторов', 'komplektujuschie-veloamortizatorov', 4, '2,118,121,171,184', '{}', '2016-06-27 11:37:38.398', '2016-06-27 11:37:38.403', NULL, 171, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(185, 'Вилки амортизационные', 'vilki-amortizatsionnye', 4, '2,118,121,172,185', '{}', '2016-06-27 11:38:38.094', '2016-06-27 11:38:38.112', NULL, 172, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(186, 'Вилки жёсткие', 'vilki-zhestkie', 4, '2,118,121,172,186', '{}', '2016-06-27 11:38:38.12', '2016-06-27 11:38:38.125', NULL, 172, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(187, 'Комплектующие', 'komplektujuschie', 4, '2,118,121,172,187', '{}', '2016-06-27 11:38:38.134', '2016-06-27 11:38:38.14', NULL, 172, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(188, 'Велопокрышки', 'velopokryshki', 4, '2,118,121,173,188', '{}', '2016-06-27 11:40:47.245', '2016-06-27 11:41:10.662', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(189, 'Обода', 'oboda', 4, '2,118,121,173,189', '{}', '2016-06-27 11:40:47.268', '2016-06-27 11:40:47.275', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(190, 'Втулки задние', 'vtulki-zadnie', 4, '2,118,121,173,190', '{}', '2016-06-27 11:40:47.284', '2016-06-27 11:40:47.293', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(191, 'Втулки передние', 'vtulki-perednie', 4, '2,118,121,173,191', '{}', '2016-06-27 11:40:47.301', '2016-06-27 11:40:47.306', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(192, 'Втулки планетарные', 'vtulki-planetarnye', 4, '2,118,121,173,192', '{}', '2016-06-27 11:40:47.313', '2016-06-27 11:40:47.323', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(193, 'Втулки-динамо', 'vtulki-dinamo', 4, '2,118,121,173,193', '{}', '2016-06-27 11:40:47.329', '2016-06-27 11:40:47.334', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(194, 'Колёса в сборе', 'kolesa-v-sbore', 4, '2,118,121,173,194', '{}', '2016-06-27 11:40:47.34', '2016-06-27 11:40:47.346', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(195, 'Эксцентрики', 'ekstsentriki', 4, '2,118,121,173,195', '{}', '2016-06-27 11:40:47.354', '2016-06-27 11:40:47.359', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(196, 'Оси', 'osi', 4, '2,118,121,173,196', '{}', '2016-06-27 11:40:47.369', '2016-06-27 11:40:47.374', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(197, 'Велокамеры', 'velokamery', 4, '2,118,121,173,197', '{}', '2016-06-27 11:40:47.381', '2016-06-27 11:40:47.386', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(198, 'Ободные ленты', 'obodnye-lenty', 4, '2,118,121,173,198', '{}', '2016-06-27 11:40:47.395', '2016-06-27 11:40:47.402', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(199, 'Спицы, пистоны', 'spitsy,-pistony', 4, '2,118,121,173,199', '{}', '2016-06-27 11:40:47.415', '2016-06-27 11:40:47.421', NULL, 173, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(200, 'Трёхколёсные', 'trehkolesnye', 4, '2,118,119,126,200', '{}', '2016-06-27 11:43:35.677', '2016-06-27 11:43:35.699', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(201, 'Велосипеды с ручкой', 'velosipedy-s-ruchkoj', 4, '2,118,119,126,201', '{}', '2016-06-27 11:43:35.713', '2016-06-27 11:43:35.722', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(202, 'Четырехколесные', 'chetyrehkolesnye', 4, '2,118,119,126,202', '{}', '2016-06-27 11:43:35.732', '2016-06-27 11:43:35.743', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(203, 'Беговелы', 'begovely', 4, '2,118,119,126,203', '{}', '2016-06-27 11:43:35.753', '2016-06-27 11:43:35.76', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(204, 'Велосипеды для детей от 1,5 до 3 лет (12")', 'velosipedy-dlja-detej-ot-1,5-do-3-let-(12’)', 4, '2,118,119,126,204', '{}', '2016-06-27 11:43:35.769', '2016-06-28 09:03:06.755', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(205, 'Велосипед для детей от 3 до 5 лет (14", 16")', 'velosiped-dlja-detej-ot-3-do-5-let-(14’,-16’)', 4, '2,118,119,126,205', '{}', '2016-06-27 11:43:35.783', '2016-06-27 11:43:35.79', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(206, 'Велосипеды для детей от 5 до 9 лет (18", 20")', 'velosipedy-dlja-detej-ot-5-do-9-let-(18’,-20’)', 4, '2,118,119,126,206', '{}', '2016-06-27 11:43:35.8', '2016-06-28 09:03:31.538', NULL, 126, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(207, 'Переключатели задние', 'perekljuchateli-zadnie', 4, '2,118,121,174,207', '{}', '2016-06-27 11:44:56.383', '2016-06-27 11:44:56.398', NULL, 174, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(208, 'Переключатели передние', 'perekljuchateli-perednie', 4, '2,118,121,174,208', '{}', '2016-06-27 11:44:56.407', '2016-06-27 11:44:56.414', NULL, 174, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(209, 'Манетки', 'manetki', 4, '2,118,121,174,209', '{}', '2016-06-27 11:44:56.423', '2016-06-27 11:44:56.431', NULL, 174, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(210, 'Комплектующие', 'komplektujuschie', 4, '2,118,121,174,210', '{}', '2016-06-27 11:44:56.44', '2016-06-27 11:44:56.452', NULL, 174, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(211, 'Кассеты, трещотки', 'kassety,-treschotki', 4, '2,118,121,175,211', '{}', '2016-06-27 11:48:26.319', '2016-06-27 11:48:26.335', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(212, 'Велоцепи и замковые звенья', 'velotsepi-i-zamkovye-zven’ja', 4, '2,118,121,175,212', '{}', '2016-06-27 11:48:26.343', '2016-06-27 11:48:26.351', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(213, 'Системы', 'sistemy', 4, '2,118,121,175,213', '{}', '2016-06-27 11:48:26.36', '2016-06-27 11:48:26.369', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(214, 'Шатуны', 'shatuny', 4, '2,118,121,175,214', '{}', '2016-06-27 11:48:26.377', '2016-06-27 11:48:26.385', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(215, 'Каретки', 'karetki', 4, '2,118,121,175,215', '{}', '2016-06-27 11:48:26.392', '2016-06-27 11:48:26.398', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(216, 'Адаптеры', 'adaptery', 4, '2,118,121,175,216', '{}', '2016-06-27 11:48:26.405', '2016-06-27 11:48:26.421', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(217, 'Педали', 'pedali', 4, '2,118,121,175,217', '{}', '2016-06-27 11:48:26.432', '2016-06-27 11:48:26.442', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(218, 'Звезды', 'zvezdy', 4, '2,118,121,175,218', '{}', '2016-06-27 11:48:26.451', '2016-06-27 11:48:26.461', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(219, 'Рокринги', 'rokringi', 4, '2,118,121,175,219', '{}', '2016-06-27 11:48:26.471', '2016-06-27 11:48:26.481', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(220, 'Бонки', 'bonki', 4, '2,118,121,175,220', '{}', '2016-06-27 11:48:26.494', '2016-06-27 11:48:26.503', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(221, 'Успокоители', 'uspokoiteli', 4, '2,118,121,175,221', '{}', '2016-06-27 11:48:26.512', '2016-06-27 11:48:26.519', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(222, 'Натяжители цепи', 'natjazhiteli-tsepi', 4, '2,118,121,175,222', '{}', '2016-06-27 11:48:26.527', '2016-06-27 11:48:26.537', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(223, 'Комплектующие', 'komplektujuschie', 4, '2,118,121,175,223', '{}', '2016-06-27 11:48:26.546', '2016-06-27 11:48:26.554', NULL, 175, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(224, 'Рамы хардтейл', 'ramy-hardtejl', 4, '2,118,121,176,224', '{}', '2016-06-27 11:49:33.304', '2016-06-27 11:49:33.31', NULL, 176, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(225, 'Рамы двухподвесные', 'ramy-dvuhpodvesnye', 4, '2,118,121,176,225', '{}', '2016-06-27 11:49:33.319', '2016-06-27 11:49:33.327', NULL, 176, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(226, 'Рамы шоссейные', 'ramy-shossejnye', 4, '2,118,121,176,226', '{}', '2016-06-27 11:49:33.337', '2016-06-27 11:49:33.343', NULL, 176, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(227, '…Другие', '…drugie', 4, '2,118,121,176,227', '{}', '2016-06-27 11:49:33.353', '2016-06-27 11:49:33.36', NULL, 176, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(228, 'Рули', 'ruli', 4, '2,118,121,177,228', '{}', '2016-06-27 11:52:41.39', '2016-06-27 11:52:41.407', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(229, 'Выносы', 'vynosy', 4, '2,118,121,177,229', '{}', '2016-06-27 11:52:41.414', '2016-06-27 11:52:41.423', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(230, 'Рулевые колонки', 'rulevye-kolonki', 4, '2,118,121,177,230', '{}', '2016-06-27 11:52:41.431', '2016-06-27 11:52:41.441', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(231, 'Якоря и подъёмные кольца', 'jakorja-i-pod’emnye-kol’tsa', 4, '2,118,121,177,231', '{}', '2016-06-27 11:52:41.451', '2016-06-27 14:11:35.302', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(232, 'Рога на руль', 'roga-na-rul’', 4, '2,118,121,177,232', '{}', '2016-06-27 11:52:41.467', '2016-06-27 11:52:41.474', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(233, 'Грипсы', 'gripsy', 4, '2,118,121,177,233', '{}', '2016-06-27 11:52:41.485', '2016-06-27 11:52:41.494', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(234, 'Обмотки руля', 'obmotki-rulja', 4, '2,118,121,177,234', '{}', '2016-06-27 11:52:41.501', '2016-06-27 11:52:41.507', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(235, 'Заглушки руля', 'zaglushki-rulja', 4, '2,118,121,177,235', '{}', '2016-06-27 11:52:41.516', '2016-06-27 11:52:41.522', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(236, 'Комплектующие', 'komplektujuschie', 4, '2,118,121,177,236', '{}', '2016-06-27 11:52:41.528', '2016-06-27 11:52:41.535', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(237, '…Другое', '…drugoe', 4, '2,118,121,177,237', '{}', '2016-06-27 11:52:41.542', '2016-06-27 11:52:41.547', NULL, 177, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(238, 'Седла', 'sedla', 4, '2,118,121,178,238', '{}', '2016-06-27 11:55:10.083', '2016-06-27 11:55:10.097', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(239, 'Подседельные штыри жесткие', 'podsedel’nye-shtyri-zhestkie', 4, '2,118,121,178,239', '{}', '2016-06-27 11:55:10.105', '2016-06-27 11:55:10.11', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(240, 'Подседельные штыри регулируемые', 'podsedel’nye-shtyri-reguliruemye', 4, '2,118,121,178,240', '{}', '2016-06-27 11:55:10.119', '2016-06-27 11:55:10.126', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(241, 'Подседельные штыри амортизирующие', 'podsedel’nye-shtyri-amortizirujuschie', 4, '2,118,121,178,241', '{}', '2016-06-27 11:55:10.135', '2016-06-27 11:55:10.185', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(242, 'Хомуты', 'homuty', 4, '2,118,121,178,242', '{}', '2016-06-27 11:55:10.192', '2016-06-27 11:55:10.2', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(243, 'Переходники и адаптеры', 'perehodniki-i-adaptery', 4, '2,118,121,178,243', '{}', '2016-06-27 11:55:10.207', '2016-06-27 11:55:10.213', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(244, 'Чехлы на седла', 'chehly-na-sedla', 4, '2,118,121,178,244', '{}', '2016-06-27 11:55:10.224', '2016-06-27 11:55:10.231', NULL, 178, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(245, 'Амортизирующие подседельные штыри', 'amortizirujuschie-podsedel’nye-shtyri', 4, '2,118,121,171,245', '{}', '2016-06-27 11:55:41.85', '2016-06-27 11:55:41.859', NULL, 171, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(246, 'Тормоза дисковые гидравлические (суппорты, трассы и ручки)', 'tormoza-diskovye-gidravlicheskie-(supporty,-trassy-i-ruchki)', 4, '2,118,121,179,246', '{}', '2016-06-27 11:57:46.557', '2016-06-27 13:27:31.004', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(247, 'Тормоза дисковые механические (суппорты и ручки)', 'tormoza-diskovye-mehanicheskie-(supporty-i-ruchki)', 4, '2,118,121,179,247', '{}', '2016-06-27 11:57:46.581', '2016-06-27 13:28:37.865', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(248, 'Тормоза ободные (V-брейки)', 'tormoza-obodnye-(v-brejki)', 4, '2,118,121,179,248', '{}', '2016-06-27 11:57:46.596', '2016-06-27 11:57:46.602', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(249, 'Тормоза роллерные', 'tormoza-rollernye', 4, '2,118,121,179,249', '{}', '2016-06-27 11:57:46.61', '2016-06-27 11:57:46.619', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(250, 'Тормозные колодки', 'tormoznye-kolodki', 4, '2,118,121,179,250', '{}', '2016-06-27 11:57:46.627', '2016-06-27 11:57:46.633', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(251, 'Тормозные диски и роторы', 'tormoznye-diski-i-rotory', 4, '2,118,121,179,251', '{}', '2016-06-27 11:57:46.64', '2016-06-27 11:58:39.455', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(252, 'Тормозные ручки', 'tormoznye-ruchki', 4, '2,118,121,179,252', '{}', '2016-06-27 11:57:46.658', '2016-06-27 11:57:46.718', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(253, 'Адаптеры', 'adaptery', 4, '2,118,121,179,253', '{}', '2016-06-27 11:57:46.728', '2016-06-27 11:57:46.738', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(254, 'Комплектующие', 'komplektujuschie', 4, '2,118,121,179,254', '{}', '2016-06-27 11:57:46.748', '2016-06-27 11:57:46.757', NULL, 179, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(255, 'Оболочки (рубашки) тросов', 'obolochki-(rubashki)-trosov', 4, '2,118,121,180,255', '{}', '2016-06-27 12:02:20.653', '2016-06-27 13:28:13.072', NULL, 180, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(256, 'Наконечники', 'nakonechniki', 4, '2,118,121,180,256', '{}', '2016-06-27 12:02:20.679', '2016-06-27 12:02:20.686', NULL, 180, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(257, 'Троса', 'trosa', 4, '2,118,121,180,257', '{}', '2016-06-27 12:02:20.694', '2016-06-27 12:02:20.7', NULL, 180, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(258, 'Монтажки', 'montazhki', 3, '2,118,123,258', '{}', '2016-06-27 12:07:44.005', '2016-06-27 12:07:44.025', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(259, 'Наборы для прокачки тормозов', 'nabory-dlja-prokachki-tormozov', 3, '2,118,123,259', '{}', '2016-06-27 12:07:44.033', '2016-06-27 12:07:44.042', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(260, 'Наборы инструментов', 'nabory-instrumentov', 3, '2,118,123,260', '{}', '2016-06-27 12:07:44.049', '2016-06-27 12:07:44.058', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(261, 'Смазки и спецсредства', 'smazki-i-spetssredstva', 3, '2,118,123,261', '{}', '2016-06-27 12:07:44.065', '2016-06-27 12:07:44.075', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(262, 'Стойки для ремонта', 'stojki-dlja-remonta', 3, '2,118,123,262', '{}', '2016-06-27 12:07:44.085', '2016-06-27 12:07:44.09', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(263, 'Съёмники', 's’emniki', 3, '2,118,123,263', '{}', '2016-06-27 12:07:44.098', '2016-06-27 12:07:44.106', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(264, '…Другой велоинструмент', '…drugoj-veloinstrument', 3, '2,118,123,264', '{}', '2016-06-27 12:07:44.113', '2016-06-27 12:07:44.126', NULL, 123, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(265, 'Крылья', 'kryl’ja', 3, '2,118,120,265', '{}', '2016-06-27 12:10:27.159', '2016-06-27 12:10:27.179', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(266, 'Велофонари', 'velofonari', 3, '2,118,120,266', '{}', '2016-06-27 12:10:27.187', '2016-06-27 12:11:38.688', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(267, 'Велонасосы', 'velonasosy', 3, '2,118,120,267', '{}', '2016-06-27 12:10:27.2', '2016-06-29 13:30:12.968', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(268, 'Велозамки', 'velozamki', 3, '2,118,120,268', '{}', '2016-06-27 12:10:27.215', '2016-06-27 12:10:27.222', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(269, 'Подножки', 'podnozhki', 3, '2,118,120,269', '{}', '2016-06-27 12:10:27.231', '2016-06-27 12:10:27.239', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(270, 'Детские кресла на велосипед', 'detskie-kresla-na-velosiped', 3, '2,118,120,270', '{}', '2016-06-27 12:10:27.248', '2016-06-29 13:29:37.775', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(271, 'Велокомпьютеры', 'velokomp’jutery', 3, '2,118,120,271', '{}', '2016-06-27 12:10:27.263', '2016-06-27 12:10:27.27', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(272, 'Велосумки', 'velosumki', 3, '2,118,120,272', '{}', '2016-06-27 12:10:27.277', '2016-06-27 12:10:27.282', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(274, 'Звонки / Клаксоны', 'zvonki-~-klaksony', 3, '2,118,120,274', '{}', '2016-06-27 12:10:27.306', '2016-06-27 12:10:27.313', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(275, 'Фляги и флягодержатели', 'fljagi-i-fljagoderzhateli', 3, '2,118,120,275', '{}', '2016-06-27 12:10:27.321', '2016-06-27 12:14:22.432', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(276, 'Велобагажники', 'velobagazhniki', 3, '2,118,120,276', '{}', '2016-06-27 12:10:27.34', '2016-06-27 12:12:21.737', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(277, 'Велобагажники на автомобиль', 'velobagazhniki-na-avtomobil’', 3, '2,118,120,277', '{}', '2016-06-27 12:10:27.356', '2016-06-27 12:10:27.366', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(278, 'Дополнительные колёса', 'dopolnitel’nye-kolesa', 3, '2,118,120,278', '{}', '2016-06-27 12:10:27.373', '2016-06-27 12:10:27.381', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(279, 'Корзины', 'korziny', 3, '2,118,120,279', '{}', '2016-06-27 12:10:27.39', '2016-06-27 12:10:27.397', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(280, 'Велоаптечки', 'veloaptechki', 3, '2,118,120,280', '{}', '2016-06-27 12:10:27.406', '2016-06-27 12:10:27.413', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(281, 'Зеркала', 'zerkala', 3, '2,118,120,281', '{}', '2016-06-27 12:10:27.423', '2016-06-27 12:10:27.432', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(282, 'Защита рамы', 'zaschita-ramy', 3, '2,118,120,282', '{}', '2016-06-27 12:10:27.441', '2016-06-27 12:10:27.447', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(283, 'Велочехлы для смартфонов', 'velochehly-dlja-smartfonov', 3, '2,118,120,283', '{}', '2016-06-27 12:10:27.456', '2016-06-27 12:10:27.464', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(284, 'Велоприцепы', 'velopritsepy', 3, '2,118,120,284', '{}', '2016-06-27 12:10:27.473', '2016-06-27 12:10:27.48', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(285, 'Велочехлы', 'velochehly', 3, '2,118,120,285', '{}', '2016-06-27 12:10:27.597', '2016-06-27 12:10:27.667', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(286, 'Велотренажёры', 'velotrenazhery', 3, '2,118,120,286', '{}', '2016-06-27 12:10:27.681', '2016-06-27 12:10:27.689', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(287, 'GPS навигаторы', 'gps-navigatory', 3, '2,118,120,287', '{}', '2016-06-27 12:10:27.7', '2016-06-27 12:10:27.709', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(288, 'Пульсометры', 'pul’sometry', 3, '2,118,120,288', '{}', '2016-06-27 12:10:27.719', '2016-06-27 12:10:27.73', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(289, 'Наклейки', 'naklejki', 3, '2,118,120,289', '{}', '2016-06-27 12:10:27.742', '2016-06-27 12:10:27.753', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(290, 'Сувениры', 'suveniry', 3, '2,118,120,290', '{}', '2016-06-27 12:10:27.764', '2016-06-27 12:10:27.772', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(291, 'Актив- и видеокамеры', 'aktiv--i-videokamery', 3, '2,118,120,291', '{}', '2016-06-27 12:10:27.783', '2016-06-27 12:43:07.194', NULL, 120, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(292, 'Сумки под седло', 'sumki-pod-sedlo', 4, '2,118,120,272,292', '{}', '2016-06-27 12:10:58.491', '2016-06-28 13:28:41.563', NULL, 272, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(293, 'Сумки на руль', 'sumki-na-rul’', 4, '2,118,120,272,293', '{}', '2016-06-27 12:10:58.513', '2016-06-27 12:10:58.521', NULL, 272, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(294, 'Сумки на раму', 'sumki-na-ramu', 4, '2,118,120,272,294', '{}', '2016-06-27 12:10:58.531', '2016-06-27 12:10:58.541', NULL, 272, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(295, 'Сумки на багажник', 'sumki-na-bagazhnik', 4, '2,118,120,272,295', '{}', '2016-06-27 12:10:58.551', '2016-06-27 12:10:58.559', NULL, 272, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(296, 'Велоочки и веломаски', 'veloochki-i-velomaski', 3, '2,118,122,296', '{}', '2016-06-27 12:48:42.905', '2016-06-27 12:48:42.937', NULL, 122, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(297, 'Велорюкзаки', 'velorjukzaki', 3, '2,118,122,297', '{}', '2016-06-27 12:48:42.947', '2016-06-27 12:48:42.954', NULL, 122, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(299, 'Велообувь', 'veloobuv’', 3, '2,118,122,299', '{}', '2016-06-27 12:48:42.977', '2016-06-27 12:49:41.366', NULL, 122, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(300, 'Одежда велосипедиста', 'odezhda-velosipedista', 3, '2,118,122,300', '{}', '2016-06-27 12:48:42.992', '2016-06-29 13:34:14.468', NULL, 122, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(301, 'Шлемы и велозащита', 'shlemy-i-velozaschita', 3, '2,118,122,301', '{}', '2016-06-27 12:54:42.925', '2016-06-27 12:54:42.932', NULL, 122, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(302, 'Каргаде', 'kargade', 3, '1,21,90,302', '{}', '2016-06-27 14:15:58.941', '2016-06-27 14:15:58.962', NULL, 90, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(303, 'Чёрный (оранжевый) чай', 'chernyj-(oranzhevyj)-chaj', 3, '1,25,91,303', '{}', '2016-06-27 14:17:47.002', '2016-06-30 09:57:29.801', NULL, 91, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(304, 'Зеленый чай', 'zelenyj-chaj', 3, '1,25,91,304', '{}', '2016-06-27 14:17:47.018', '2016-06-30 09:57:29.812', NULL, 91, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(305, 'Белый чай', 'belyj-chaj', 3, '1,25,91,305', '{}', '2016-06-27 14:17:47.038', '2016-06-30 09:57:29.823', NULL, 91, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(306, 'Цветочный (herbal) чай', 'tsvetochnyj-(herbal)-chaj', 3, '1,25,91,306', '{}', '2016-06-27 14:17:47.053', '2016-06-30 09:57:29.831', NULL, 91, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(307, 'Земляной (черный) чай', 'zemljanoj-(chernyj)-chaj', 3, '1,25,91,307', '{}', '2016-06-27 14:17:47.07', '2016-06-30 09:57:29.838', NULL, 91, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(308, 'Козинаки', 'kozinaki', 3, '1,25,109,308', '{}', '2016-06-29 14:11:16.301', '2016-06-29 14:11:16.318', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(309, 'Лукум', 'lukum', 3, '1,25,109,309', '{}', '2016-06-29 14:11:16.326', '2016-06-29 14:11:16.336', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(310, 'Халва', 'halva', 3, '1,25,109,310', '{}', '2016-06-29 14:11:16.346', '2016-06-29 14:11:16.355', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(311, 'Нуга', 'nuga', 3, '1,25,109,311', '{}', '2016-06-29 14:11:16.361', '2016-06-29 14:11:16.368', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(312, 'Пахлава', 'pahlava', 3, '1,25,109,312', '{}', '2016-06-29 14:11:16.375', '2016-06-29 14:11:16.383', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(313, 'Кята', 'kjata', 3, '1,25,109,313', '{}', '2016-06-29 14:11:16.391', '2016-06-29 14:11:16.397', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(314, 'Чак-чак', 'chak-chak', 3, '1,25,109,314', '{}', '2016-06-29 14:11:16.403', '2016-06-29 14:11:16.41', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(315, 'Грильяж', 'gril’jazh', 3, '1,25,109,315', '{}', '2016-06-29 14:11:16.416', '2016-06-29 14:11:16.422', NULL, 109, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(316, 'Автомобили и транспорт', 'avtomobili-i-transport', 0, '316', '{}', '2016-06-30 12:17:16.504', '2016-06-30 12:17:16.513', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(317, 'Бытовая техника и электроника', 'bytovaja-tehnika-i-elektronika', 0, '317', '{}', '2016-06-30 12:17:54.657', '2016-06-30 12:17:54.814', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(318, 'Зоотовары', 'zootovary', 0, '318', '{}', '2016-06-30 12:19:23.133', '2016-06-30 12:19:23.239', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(319, 'Медицина и фармацевтика', 'meditsina-i-farmatsevtika', 0, '319', '{}', '2016-06-30 12:20:08.956', '2016-06-30 12:22:43.559', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(320, 'Детские товары', 'detskie-tovary', 0, '320', '{}', '2016-06-30 12:20:47.173', '2016-06-30 12:20:47.243', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(321, 'Оборудование, станки и инструменты', 'oborudovanie,-stanki-i-instrumenty', 0, '321', '{}', '2016-06-30 12:23:22.375', '2016-06-30 12:24:54.883', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(322, 'Развлечение и досуг', 'razvlechenie-i-dosug', 0, '322', '{}', '2016-06-30 12:25:27.452', '2016-06-30 12:25:27.515', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(323, 'Сад и огород', 'sad-i-ogorod', 0, '323', '{}', '2016-06-30 12:48:15.966', '2016-06-30 12:48:16.098', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(324, 'Строительство', 'stroitel’stvo', 0, '324', '{}', '2016-06-30 12:50:24.444', '2016-06-30 12:51:16.675', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(325, 'Сырье и материалы', 'syr’e-i-materialy', 0, '325', '{}', '2016-06-30 12:51:58.964', '2016-06-30 12:51:59.024', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(326, 'Тара и упаковка', 'tara-i-upakovka', 0, '326', '{}', '2016-06-30 12:53:24.159', '2016-06-30 12:53:24.313', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(327, 'Телекоммуникации и связь', 'telekommunikatsii-i-svjaz’', 0, '327', '{}', '2016-06-30 12:53:54.94', '2016-06-30 12:53:54.999', NULL, NULL, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(328, 'Автомобили коммерческие и спецтехника', 'avtomobili-kommercheskie-i-spetstehnika', 1, '316,328', '{}', '2016-06-30 13:09:18.613', '2016-06-30 13:09:18.631', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(329, 'Автомобили легковые', 'avtomobili-legkovye', 1, '316,329', '{}', '2016-06-30 13:09:18.639', '2016-06-30 13:09:18.647', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(330, 'Водный транспорт', 'vodnyj-transport', 1, '316,330', '{}', '2016-06-30 13:09:18.658', '2016-06-30 13:09:18.664', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(331, 'Воздушный транспорт', 'vozdushnyj-transport', 1, '316,331', '{}', '2016-06-30 13:09:18.671', '2016-06-30 13:09:18.677', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(332, 'Гужевой транспорт', 'guzhevoj-transport', 1, '316,332', '{}', '2016-06-30 13:09:18.684', '2016-06-30 13:09:18.69', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(333, 'Ж/Д и рельсовый транспорт', 'zh~d-i-rel’sovyj-transport', 1, '316,333', '{}', '2016-06-30 13:09:18.698', '2016-06-30 13:09:18.706', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(334, 'Канатный транспорт', 'kanatnyj-transport', 1, '316,334', '{}', '2016-06-30 13:09:18.716', '2016-06-30 13:09:18.723', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(335, 'Мототехника', 'mototehnika', 1, '316,335', '{}', '2016-06-30 13:09:18.731', '2016-06-30 13:09:18.738', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(336, 'Специальное оборудование для транспортировки', 'spetsial’noe-oborudovanie-dlja-transportirovki', 1, '316,336', '{}', '2016-06-30 13:09:18.746', '2016-06-30 13:09:18.752', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(337, 'Трубопроводный транспорт', 'truboprovodnyj-transport', 1, '316,337', '{}', '2016-06-30 13:09:18.76', '2016-06-30 13:09:18.767', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(338, '…Автозапчасти, -инструменты и -оборудование', '…avtozapchasti,--instrumenty-i--oborudovanie', 1, '316,338', '{}', '2016-06-30 13:09:18.778', '2016-06-30 13:09:18.786', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(339, '…Другая авто- и мото-техника', '…drugaja-avto--i-moto-tehnika', 1, '316,339', '{}', '2016-06-30 13:09:18.793', '2016-06-30 13:09:18.801', NULL, 316, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(340, 'Автозапчасти и комплектующие', 'avtozapchasti-i-komplektujuschie', 2, '316,338,340', '{}', '2016-06-30 13:25:49.567', '2016-06-30 13:25:49.606', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(341, 'Автоинструмент', 'avtoinstrument', 2, '316,338,341', '{}', '2016-06-30 13:25:49.614', '2016-06-30 13:25:49.62', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(342, 'Автомобильная электроника', 'avtomobil’naja-elektronika', 2, '316,338,342', '{}', '2016-06-30 13:25:49.628', '2016-06-30 13:25:49.635', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(343, 'Автохимия, автокосметика и автомасла', 'avtohimija,-avtokosmetika-i-avtomasla', 2, '316,338,343', '{}', '2016-06-30 13:25:49.641', '2016-06-30 13:25:49.648', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(344, 'Аксессуары для авто', 'aksessuary-dlja-avto', 2, '316,338,344', '{}', '2016-06-30 13:25:49.657', '2016-06-30 13:25:49.666', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(345, 'Газораспределительный механизм (ГРМ)', 'gazoraspredelitel’nyj-mehanizm-(grm)', 2, '316,338,345', '{}', '2016-06-30 13:25:49.674', '2016-06-30 13:25:49.68', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(346, 'Двигатели и детали двигателя', 'dvigateli-i-detali-dvigatelja', 2, '316,338,346', '{}', '2016-06-30 13:25:49.687', '2016-06-30 13:25:49.694', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(347, 'Детали мостов и привода трансмиссии', 'detali-mostov-i-privoda-transmissii', 2, '316,338,347', '{}', '2016-06-30 13:25:49.703', '2016-06-30 13:25:49.709', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(348, 'Детали рулевого управления', 'detali-rulevogo-upravlenija', 2, '316,338,348', '{}', '2016-06-30 13:25:49.717', '2016-06-30 13:25:49.727', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(349, 'Детали салона', 'detali-salona', 2, '316,338,349', '{}', '2016-06-30 13:25:49.737', '2016-06-30 13:25:49.746', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(350, 'Детали тормозной системы', 'detali-tormoznoj-sistemy', 2, '316,338,350', '{}', '2016-06-30 13:25:49.757', '2016-06-30 13:25:49.766', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(351, 'Детали трансмиссии', 'detali-transmissii', 2, '316,338,351', '{}', '2016-06-30 13:25:49.775', '2016-06-30 13:25:49.783', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(352, 'Детали ходовой части', 'detali-hodovoj-chasti', 2, '316,338,352', '{}', '2016-06-30 13:25:49.791', '2016-06-30 13:25:49.8', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(353, 'Диски и шины', 'diski-i-shiny', 2, '316,338,353', '{}', '2016-06-30 13:25:49.81', '2016-06-30 13:25:49.818', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(354, 'Дополнительное оборудование', 'dopolnitel’noe-oborudovanie', 2, '316,338,354', '{}', '2016-06-30 13:25:49.826', '2016-06-30 13:25:49.833', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(355, 'Дополнительное оборудование', 'dopolnitel’noe-oborudovanie', 2, '316,338,355', '{}', '2016-06-30 13:25:49.842', '2016-06-30 13:25:49.849', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(356, 'Кондиционеры, системы отопления и охлаждения', 'konditsionery,-sistemy-otoplenija-i-ohlazhdenija', 2, '316,338,356', '{}', '2016-06-30 13:25:49.859', '2016-06-30 13:25:49.869', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(357, 'Кривошипно-шатунный механизм (КШМ)', 'krivoshipno-shatunnyj-mehanizm-(kshm)', 2, '316,338,357', '{}', '2016-06-30 13:25:49.882', '2016-06-30 13:25:49.891', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(358, 'Кузовные запчасти', 'kuzovnye-zapchasti', 2, '316,338,358', '{}', '2016-06-30 13:25:49.901', '2016-06-30 13:25:49.911', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(359, 'Оборудование для автосервиса', 'oborudovanie-dlja-avtoservisa', 2, '316,338,359', '{}', '2016-06-30 13:25:49.922', '2016-06-30 13:25:49.932', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(360, 'Предпусковые подогреватели и автономные отопители', 'predpuskovye-podogrevateli-i-avtonomnye-otopiteli', 2, '316,338,360', '{}', '2016-06-30 13:25:49.945', '2016-06-30 13:25:49.953', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(361, 'Ремкомплекты автомобильные', 'remkomplekty-avtomobil’nye', 2, '316,338,361', '{}', '2016-06-30 13:25:49.963', '2016-06-30 13:25:49.971', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(362, 'Система выпуска отработавших газов и детали выхлопных систем', 'sistema-vypuska-otrabotavshih-gazov-i-detali-vyhlopnyh-sistem', 2, '316,338,362', '{}', '2016-06-30 13:25:49.98', '2016-06-30 13:25:49.988', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(363, 'Система зажигания двигателя', 'sistema-zazhiganija-dvigatelja', 2, '316,338,363', '{}', '2016-06-30 13:25:49.999', '2016-06-30 13:25:50.007', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(364, 'Система охлаждения двигателя', 'sistema-ohlazhdenija-dvigatelja', 2, '316,338,364', '{}', '2016-06-30 13:25:50.014', '2016-06-30 13:25:50.021', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(365, 'Система очистки окон и фар автомобиля', 'sistema-ochistki-okon-i-far-avtomobilja', 2, '316,338,365', '{}', '2016-06-30 13:25:50.031', '2016-06-30 13:25:50.037', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(366, 'Система питания двигателя', 'sistema-pitanija-dvigatelja', 2, '316,338,366', '{}', '2016-06-30 13:25:50.044', '2016-06-30 13:25:50.051', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(367, 'Система смазки двигателя', 'sistema-smazki-dvigatelja', 2, '316,338,367', '{}', '2016-06-30 13:25:50.058', '2016-06-30 13:25:50.065', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(368, 'Фары и световые приборы', 'fary-i-svetovye-pribory', 2, '316,338,368', '{}', '2016-06-30 13:25:50.071', '2016-06-30 13:25:50.077', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(369, 'Фильтры для авто-, мото- и грузовой техники', 'fil’try-dlja-avto-,-moto--i-gruzovoj-tehniki', 2, '316,338,369', '{}', '2016-06-30 13:25:50.087', '2016-06-30 13:25:50.093', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(370, 'Шайбы, гровер', 'shajby,-grover', 2, '316,338,370', '{}', '2016-06-30 13:25:50.103', '2016-06-30 13:25:50.11', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(371, 'Шины и диски', 'shiny-i-diski', 2, '316,338,371', '{}', '2016-06-30 13:25:50.119', '2016-06-30 13:25:50.127', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(372, 'Электрооборудование автомобилей', 'elektrooborudovanie-avtomobilej', 2, '316,338,372', '{}', '2016-06-30 13:25:50.136', '2016-06-30 13:25:50.145', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(373, '…Другие автозапчасти', '…drugie-avtozapchasti', 2, '316,338,373', '{}', '2016-06-30 13:25:50.158', '2016-06-30 13:25:50.165', NULL, 338, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(374, 'Аккумуляторы автомобильные', 'akkumuljatory-avtomobil’nye', 3, '316,338,372,374', '{}', '2016-06-30 13:33:51.658', '2016-06-30 13:33:51.673', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(375, 'Блоки управления', 'bloki-upravlenija', 3, '316,338,372,375', '{}', '2016-06-30 13:33:51.686', '2016-06-30 13:33:51.693', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(376, 'Генераторы, альтернаторы и комплектующие', 'generatory,-al’ternatory-i-komplektujuschie', 3, '316,338,372,376', '{}', '2016-06-30 13:33:51.714', '2016-06-30 13:33:51.721', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(377, 'Звуковые сигналы и клаксоны автомобильные', 'zvukovye-signaly-i-klaksony-avtomobil’nye', 3, '316,338,372,377', '{}', '2016-06-30 13:33:51.732', '2016-06-30 13:33:51.738', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(378, 'Индикаторы, панели приборов и управления автомобильные', 'indikatory,-paneli-priborov-i-upravlenija-avtomobil’nye', 3, '316,338,372,378', '{}', '2016-06-30 13:33:51.745', '2016-06-30 13:33:51.752', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(379, 'Предохранители и переключатели автомобильные', 'predohraniteli-i-perekljuchateli-avtomobil’nye', 3, '316,338,372,379', '{}', '2016-06-30 13:33:51.76', '2016-06-30 13:33:51.766', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(380, 'Проводка, провода, клеммы и разъемы автомобильные', 'provodka,-provoda,-klemmy-i-raz’emy-avtomobil’nye', 3, '316,338,372,380', '{}', '2016-06-30 13:33:51.774', '2016-06-30 13:33:51.79', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(381, 'Реле и датчики автомобильные', 'rele-i-datchiki-avtomobil’nye', 3, '316,338,372,381', '{}', '2016-06-30 13:33:51.8', '2016-06-30 13:33:51.808', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(382, 'Стартеры и комплектующие', 'startery-i-komplektujuschie', 3, '316,338,372,382', '{}', '2016-06-30 13:33:51.817', '2016-06-30 13:33:51.825', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(383, 'Электродвигатели, корректоры и приводы автомобильные', 'elektrodvigateli,-korrektory-i-privody-avtomobil’nye', 3, '316,338,372,383', '{}', '2016-06-30 13:33:51.834', '2016-06-30 13:33:51.841', NULL, 372, 1);
INSERT INTO django_classify.classifier_treeclassify(id, sSectionName_ru, sSectionName_trans, iNesting, lParentChain, sSectionPropertiesJSON, dSectionCreate, dSectionModify, kAlias_id, kParent_id, iSectionType) VALUES
(384, '…Другое электрооборудование автомобилей', '…drugoe-elektrooborudovanie-avtomobilej', 3, '316,338,372,384', '{}', '2016-06-30 13:33:51.85', '2016-06-30 13:33:51.858', NULL, 372, 1);