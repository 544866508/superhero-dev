# Host: 127.0.0.1  (Version 8.0.16)
# Date: 2019-10-19 15:42:49
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "auth_group"
#

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "auth_group"
#


#
# Structure for table "auth_user"
#

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "auth_user"
#

INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$Wt9Q73OtYouz$b8+yfWaS1bI5qbwLsiE34221ASQoK7DWoKAieWFC8Gk=',X'323031392D31302D31352031313A34393A32372E303332353033',1,'admin','','','544866508@qq.com',1,1,X'323031392D30392D31392031343A30363A30322E363734323935');

#
# Structure for table "auth_user_groups"
#

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "auth_user_groups"
#


#
# Structure for table "django_content_type"
#

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "django_content_type"
#

INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'swiper','swiper'),(8,'film','poster'),(9,'film','actor'),(10,'film','film'),(11,'film','filmactor'),(12,'user','user'),(13,'user','otherinfo'),(14,'user','userfilm'),(15,'user','userinterest');

#
# Structure for table "django_admin_log"
#

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "django_admin_log"
#

INSERT INTO `django_admin_log` VALUES (1,X'323031392D30392D31392031343A32353A31332E353631313232','1','蝙蝠侠大战超人',1,'[{\"added\": {}}]',7,1),(2,X'323031392D30392D31392031343A32353A33322E383430323235','2','蜘蛛侠4',1,'[{\"added\": {}}]',7,1),(3,X'323031392D30392D31392032323A35333A30392E313035353430','1','小罗伯特·唐尼 Robert Downey Jr.',1,'[{\"added\": {}}]',9,1),(4,X'323031392D30392D31392032323A35383A35392E333831353734','2','盖·皮尔斯 Guy Pearce',1,'[{\"added\": {}}]',9,1),(5,X'323031392D30392D31392032323A35393A34322E353336303433','3','格温妮斯·帕特洛 Gwyneth Paltrow',1,'[{\"added\": {}}]',9,1),(6,X'323031392D30392D31392032333A30303A34322E363037343739','4','本·金斯利 Ben Kingsley',1,'[{\"added\": {}}]',9,1),(7,X'323031392D30392D31392032333A30303A34382E313333373935','5','本·金斯利 Ben Kingsley',1,'[{\"added\": {}}]',9,1),(8,X'323031392D30392D31392032333A30313A32332E373030383239','6','唐·钱德尔 Don Cheadle',1,'[{\"added\": {}}]',9,1),(9,X'323031392D30392D31392032333A33333A30332E353031343931','7','11',1,'[{\"added\": {}}]',9,1),(10,X'323031392D30392D31392032333A33353A31322E353332383732','1','1111212',1,'[{\"added\": {}}]',10,1),(11,X'323031392D30392D31392032333A33353A33342E393034313531','1','1111212',2,'[{\"changed\": {\"fields\": [\"trailer\"]}}]',10,1),(12,X'323031392D30392D31392032333A33363A30342E353532383437','1','钢铁侠3 Iron Man 3',2,'[{\"changed\": {\"fields\": [\"name\", \"cover\", \"score\"]}}]',10,1),(13,X'323031392D30392D31392032333A33363A32362E313237303831','1','钢铁侠3 Iron Man 3',2,'[{\"changed\": {\"fields\": [\"prised_count\", \"basic_info\"]}}]',10,1),(14,X'323031392D30392D31392032333A33363A35392E323337393735','1','钢铁侠3 Iron Man 3',2,'[{\"changed\": {\"fields\": [\"original_name\", \"release_date\"]}}]',10,1),(15,X'323031392D30392D31392032333A33373A34332E323238343931','1','钢铁侠3 Iron Man 3',2,'[{\"changed\": {\"fields\": [\"release_place\", \"total_time\", \"plot_desc\", \"directors\"]}}]',10,1),(16,X'323031392D30392D31392032333A33383A33322E333834333032','1','钢铁侠3 Iron Man 3',2,'[]',10,1),(17,X'323031392D30392D32302031313A30363A34392E333633303931','1','钢铁侠3-Iron-Man-3',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(18,X'323031392D30392D32302031313A31323A35312E333634333639','6','钢铁侠3-Iron-Man-3',1,'[{\"added\": {}}]',11,1),(19,X'323031392D30392D32302031313A31343A32362E303637373330','1','钢铁侠3-Iron-Man-3',2,'[{\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}]',10,1),(20,X'323031392D30392D32302031313A32353A34342E313130333233','2','寄生虫-기생충',1,'[{\"added\": {}}]',10,1),(21,X'323031392D30392D32302031313A32353A34342E393133353332','3','寄生虫-기생충',1,'[{\"added\": {}}]',10,1),(22,X'323031392D30392D32302031313A32363A34352E313134343335','4','凄凄切切',1,'[{\"added\": {}}]',10,1),(23,X'323031392D30392D32302031313A32373A30322E313731323835','4','凄凄切切',3,'',10,1),(24,X'323031392D30392D32302031313A32373A32342E353734353630','3','寄生虫-기생충',3,'',10,1),(25,X'323031392D30392D32302031313A32373A32362E383936323632','3','寄生虫-기생충',3,'',10,1),(26,X'323031392D30392D32302031313A32383A31332E313133303138','7','11',3,'',9,1),(27,X'323031392D30392D32302031313A32383A32332E323435393539','6','唐·钱德尔 Don Cheadle',3,'',9,1),(28,X'323031392D30392D32302031313A33353A34392E363833383938','8','宋康昊 Kang-ho Song',1,'[{\"added\": {}}]',9,1),(29,X'323031392D30392D32302031313A33373A30332E353536363736','9','李善均 Seon-gyun Lee',1,'[{\"added\": {}}]',9,1),(30,X'323031392D30392D32302031313A33373A34332E333838303731','10','赵汝贞 Yeo-Jeong Jo',1,'[{\"added\": {}}]',9,1),(31,X'323031392D30392D32302031313A33383A32352E393535313837','11','崔宇植 Woo-Sik Choi',1,'[{\"added\": {}}]',9,1),(32,X'323031392D30392D32302031313A33393A31302E333138353330','12','朴素丹 Su-dam Park',1,'[{\"added\": {}}]',9,1),(33,X'323031392D30392D32302031313A34303A33342E313332353530','2','寄生虫-기생충',2,'[{\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}]',10,1),(34,X'323031392D30392D32302031313A34313A34362E383036343839','1','小罗伯特·唐尼 Robert Downey Jr.',2,'[{\"changed\": {\"fields\": [\"photo\"]}}]',9,1),(35,X'323031392D30392D32302031313A34323A30382E323635313032','5','本·金斯利 Ben Kingsley',3,'',9,1),(36,X'323031392D30392D32302031313A34323A34342E353034313234','2','盖·皮尔斯 Guy Pearce',2,'[{\"changed\": {\"fields\": [\"photo\"]}}]',9,1),(37,X'323031392D30392D32302031313A34333A33332E303438303630','4','本·金斯利 Ben Kingsley',2,'[{\"changed\": {\"fields\": [\"photo\"]}}]',9,1),(38,X'323031392D30392D32302031313A34343A31322E383035333632','3','格温妮斯·帕特洛 Gwyneth Paltrow',2,'[{\"changed\": {\"fields\": [\"photo\"]}}]',9,1),(39,X'323031392D30392D32302031323A33323A31342E363230373132','1','钢铁侠3-Iron-Man-3',2,'[{\"changed\": {\"fields\": [\"is_hot\"]}}]',10,1),(40,X'323031392D30392D32302031343A35303A33372E313239363632','3','战斗天使阿丽塔',1,'[{\"added\": {}}]',7,1),(41,X'323031392D30392D32302031343A35343A34302E313037383134','3','战斗天使阿丽塔',2,'[{\"changed\": {\"fields\": [\"img\"]}}]',7,1),(42,X'323031392D30392D32302031363A30393A30342E383538363439','1','钢铁侠3-Iron-Man-3',2,'[{\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u94a2\\u94c1\\u4fa03-Iron-Man-3\"}}]',10,1),(43,X'323031392D30392D32302031363A31323A33352E393234373231','2','寄生虫-기생충',2,'[{\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u5bc4\\u751f\\u866b-\\uae30\\uc0dd\\ucda9\"}}]',10,1),(44,X'323031392D30392D32302032313A33393A33382E363236303736','2','寄生虫-기생충',2,'[{\"changed\": {\"fields\": [\"basic_info\"]}}]',10,1),(45,X'323031392D30392D32302032313A34303A32312E393238353532','1','钢铁侠3-Iron-Man-3',2,'[{\"changed\": {\"fields\": [\"basic_info\"]}}]',10,1),(46,X'323031392D30392D32312032313A33363A35342E323533333732','5','阿丽塔：战斗天使 Alita: Battle Angel',1,'[{\"added\": {}}]',10,1),(47,X'323031392D30392D32312032313A33393A31302E353036303132','13','罗莎·萨拉查 Rosa Salazar',1,'[{\"added\": {}}]',9,1),(48,X'323031392D30392D32312032313A34343A32322E333439343736','14','克里斯托弗·沃尔兹 Christoph Waltz',1,'[{\"added\": {}}]',9,1),(49,X'323031392D30392D32312032313A34353A30382E313432373933','15','基恩·约翰逊 Keean Johnson',1,'[{\"added\": {}}]',9,1),(50,X'323031392D30392D32312032313A34363A30382E353133303537','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u963f\\u4e3d\\u5854\\uff1a\\u6218\\u6597\\u5929\\u4f7f Alita: Battle Angel\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u963f\\u4e3d\\u5854\\uff1a\\u6218\\u6597\\u5929\\u4f7f Alita: Battle Angel\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u963f\\u4e3d\\u5854\\uff1a\\u6218\\u6597\\u5929\\u4f7f Alita: Battle Angel\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u963f\\u4e3d\\u5854\\uff1a\\u6218\\u6597\\u5929\\u4f7f Alita: Battle Angel\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u963f\\u4e3d\\u5854\\uff1a\\u6218\\u6597\\u5929\\u4f7f Alita: Battle Angel\"}}]',10,1),(51,X'323031392D30392D32322031373A30393A34392E343238313635','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"plot_desc\"]}}]',10,1),(52,X'323031392D30392D32322031373A31303A32382E343337303937','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"plot_desc\"]}}]',10,1),(53,X'323031392D30392D32322031373A31313A35372E343432393631','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"plot_desc\"]}}]',10,1),(54,X'323031392D31302D31342031333A35313A34302E383335393030','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',10,1),(55,X'323031392D31302D31342031333A35323A33332E373136373032','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',10,1),(56,X'323031392D31302D31342032303A31373A35322E333730363039','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"roll_img\"]}}]',10,1),(57,X'323031392D31302D31342032303A35313A31322E323231393534','2','寄生虫-기생충',2,'[{\"changed\": {\"fields\": [\"roll_img\"]}}]',10,1),(58,X'323031392D31302D31342032303A35313A33342E303330343336','1','钢铁侠3-Iron-Man-3',2,'[{\"changed\": {\"fields\": [\"roll_img\"]}}]',10,1),(59,X'323031392D31302D31342032323A34333A35342E373834323735','5','阿丽塔：战斗天使 Alita: Battle Angel',2,'[{\"changed\": {\"fields\": [\"is_swiper\"]}}]',10,1),(60,X'323031392D31302D31342032323A34343A30332E323639303332','2','寄生虫-기생충',2,'[{\"changed\": {\"fields\": [\"is_swiper\"]}}]',10,1),(61,X'323031392D31302D31342032323A34343A31332E353237363133','1','钢铁侠3-Iron-Man-3',2,'[{\"changed\": {\"fields\": [\"is_swiper\"]}}]',10,1),(62,X'323031392D31302D31352032323A32323A31332E333533303532','6','续命之徒：绝命毒师电影 El Camino: A Break',1,'[{\"added\": {}}]',10,1),(63,X'323031392D31302D31352032323A32323A32312E303039343930','7','续命之徒：绝命毒师电影 El Camino: A Break',1,'[{\"added\": {}}]',10,1),(64,X'323031392D31302D31352032323A32323A33392E323839353335','6','续命之徒：绝命毒师电影 El Camino: A Break',3,'',10,1),(65,X'323031392D31302D31352032323A32353A32332E383937393531','7','续命之徒：绝命毒师电影 El Camino: A Break',2,'[{\"changed\": {\"fields\": [\"swiper_img\"]}}]',10,1),(66,X'323031392D31302D31352032323A33303A34362E373339343136','16','亚伦·保尔 Aaron Paul',1,'[{\"added\": {}}]',9,1),(67,X'323031392D31302D31352032323A33313A34382E343132393434','17','布莱恩·科兰斯顿 Bryan Cranston',1,'[{\"added\": {}}]',9,1),(68,X'323031392D31302D31352032323A33323A34342E313537313332','18','杰西·普莱蒙 Jesse Plemons',1,'[{\"added\": {}}]',9,1),(69,X'323031392D31302D31352032323A33333A34342E333437353735','19','克里斯滕·里特 Krysten Ritter',1,'[{\"added\": {}}]',9,1),(70,X'323031392D31302D31352032323A33353A30322E393936303733','7','续命之徒：绝命毒师电影 El Camino: A Break',2,'[{\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}, {\"added\": {\"name\": \"\\u6f14\\u5458\\u548c\\u7535\\u5f71\\u7684\\u7d22\\u5f15\\u8868\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}, {\"added\": {\"name\": \"\\u6d77\\u62a5\", \"object\": \"\\u7eed\\u547d\\u4e4b\\u5f92\\uff1a\\u7edd\\u547d\\u6bd2\\u5e08\\u7535\\u5f71 El Camino: A Break\"}}]',10,1);

#
# Structure for table "auth_permission"
#

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "auth_permission"
#

INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 轮播图',7,'add_swiper'),(26,'Can change 轮播图',7,'change_swiper'),(27,'Can delete 轮播图',7,'delete_swiper'),(28,'Can view 轮播图',7,'view_swiper'),(29,'Can add 海报',8,'add_poster'),(30,'Can change 海报',8,'change_poster'),(31,'Can delete 海报',8,'delete_poster'),(32,'Can view 海报',8,'view_poster'),(33,'Can add 演员',9,'add_actor'),(34,'Can change 演员',9,'change_actor'),(35,'Can delete 演员',9,'delete_actor'),(36,'Can view 演员',9,'view_actor'),(37,'Can add 影片',10,'add_film'),(38,'Can change 影片',10,'change_film'),(39,'Can delete 影片',10,'delete_film'),(40,'Can view 影片',10,'view_film'),(41,'Can add film actor',11,'add_filmactor'),(42,'Can change film actor',11,'change_filmactor'),(43,'Can delete film actor',11,'delete_filmactor'),(44,'Can view film actor',11,'view_filmactor'),(45,'Can add 用户',12,'add_user'),(46,'Can change 用户',12,'change_user'),(47,'Can delete 用户',12,'delete_user'),(48,'Can view 用户',12,'view_user'),(49,'Can add 其他用户信息',13,'add_otherinfo'),(50,'Can change 其他用户信息',13,'change_otherinfo'),(51,'Can delete 其他用户信息',13,'delete_otherinfo'),(52,'Can view 其他用户信息',13,'view_otherinfo'),(53,'Can add 用户关注的电影',14,'add_userfilm'),(54,'Can change 用户关注的电影',14,'change_userfilm'),(55,'Can delete 用户关注的电影',14,'delete_userfilm'),(56,'Can view 用户关注的电影',14,'view_userfilm'),(57,'Can add 基本用户信息',15,'add_userinterest'),(58,'Can change 基本用户信息',15,'change_userinterest'),(59,'Can delete 基本用户信息',15,'delete_userinterest'),(60,'Can view 基本用户信息',15,'view_userinterest');

#
# Structure for table "auth_user_user_permissions"
#

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "auth_user_user_permissions"
#


#
# Structure for table "auth_group_permissions"
#

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "auth_group_permissions"
#


#
# Structure for table "django_migrations"
#

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "django_migrations"
#

INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial',X'323031392D30392D31392031343A30343A32302E343937343531'),(2,'auth','0001_initial',X'323031392D30392D31392031343A30343A32392E303330393339'),(3,'admin','0001_initial',X'323031392D30392D31392031343A30353A30312E343532373933'),(4,'admin','0002_logentry_remove_auto_add',X'323031392D30392D31392031343A30353A30382E303839313733'),(5,'admin','0003_logentry_add_action_flag_choices',X'323031392D30392D31392031343A30353A30382E323238313831'),(6,'contenttypes','0002_remove_content_type_name',X'323031392D30392D31392031343A30353A31322E393135343439'),(7,'auth','0002_alter_permission_name_max_length',X'323031392D30392D31392031343A30353A31352E393832363234'),(8,'auth','0003_alter_user_email_max_length',X'323031392D30392D31392031343A30353A31362E393234363738'),(9,'auth','0004_alter_user_username_opts',X'323031392D30392D31392031343A30353A31372E323036363934'),(10,'auth','0005_alter_user_last_login_null',X'323031392D30392D31392031343A30353A32302E323833383730'),(11,'auth','0006_require_contenttypes_0002',X'323031392D30392D31392031343A30353A32302E343433383830'),(12,'auth','0007_alter_validators_add_error_messages',X'323031392D30392D31392031343A30353A32302E363336383931'),(13,'auth','0008_alter_user_username_max_length',X'323031392D30392D31392031343A30353A32342E393437313337'),(14,'auth','0009_alter_user_last_name_max_length',X'323031392D30392D31392031343A30353A32382E343631333338'),(15,'auth','0010_alter_group_name_max_length',X'323031392D30392D31392031343A30353A32392E303233333730'),(16,'auth','0011_update_proxy_permissions',X'323031392D30392D31392031343A30353A32392E323539333834'),(17,'sessions','0001_initial',X'323031392D30392D31392031343A30353A33302E383933343737'),(18,'swiper','0001_initial',X'323031392D30392D31392031343A31393A33372E313732383832'),(29,'user','0001_initial',X'323031392D31302D30362032333A31303A30372E363831343337'),(36,'user','0002_user_jwt',X'323031392D31302D31332031393A35333A35312E323036303937'),(38,'film','0001_initial',X'323031392D31302D31342032323A32303A30332E353533383431'),(39,'film','0002_remove_film_is_swiper',X'323031392D31302D31342032323A33363A32362E323433373531'),(40,'film','0003_film_is_swiper',X'323031392D31302D31342032323A33383A33302E323834363931'),(41,'user','0003_auto_20191015_2353',X'323031392D31302D31352032333A35343A31372E393137303339'),(42,'user','0004_delete_userinterest',X'323031392D31302D31352032333A35373A34362E383131393837');

#
# Structure for table "django_session"
#

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "django_session"
#

INSERT INTO `django_session` VALUES ('0wfbqn2j0gpt50jgx3gu5lw2vbkfv4j5','NzU0Yjk4OGI3MTFiMmEwNDdkNzMwM2Q2MzNhZGQyYWMyOTI2ZTg4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZWQ1NGFhMDc3OTk5MDJjOWNlNjUwMTZiMTM2YzM3ZTg3NDE5YWE0In0=',X'323031392D31302D30332031343A32333A32342E353939383930'),('3qatc383lyj6fpbcbpqvn343xmcv9dmz','NzU0Yjk4OGI3MTFiMmEwNDdkNzMwM2Q2MzNhZGQyYWMyOTI2ZTg4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZWQ1NGFhMDc3OTk5MDJjOWNlNjUwMTZiMTM2YzM3ZTg3NDE5YWE0In0=',X'323031392D31302D32382031333A31313A30372E373539373533'),('pg48l1ojuwqzqxszviqbxgm4p4g46mst','NzU0Yjk4OGI3MTFiMmEwNDdkNzMwM2Q2MzNhZGQyYWMyOTI2ZTg4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZWQ1NGFhMDc3OTk5MDJjOWNlNjUwMTZiMTM2YzM3ZTg3NDE5YWE0In0=',X'323031392D31302D30332031343A32333A32352E333433393332'),('tai1zwubv4scf9ha265dnqlr2hu9hw2t','NzU0Yjk4OGI3MTFiMmEwNDdkNzMwM2Q2MzNhZGQyYWMyOTI2ZTg4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZWQ1NGFhMDc3OTk5MDJjOWNlNjUwMTZiMTM2YzM3ZTg3NDE5YWE0In0=',X'323031392D31302D32392031313A34393A32372E323336353134');

#
# Structure for table "film_actor"
#

DROP TABLE IF EXISTS `film_actor`;
CREATE TABLE `film_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "film_actor"
#

INSERT INTO `film_actor` VALUES (1,'小罗伯特·唐尼 Robert Downey Jr.','影人简介  · · · · · ·\r\n　　小罗伯特·唐尼，美国男演员。7岁时在父亲的电影《Greaser\'s Palace》中饰演角色，8岁时父亲递给了他人生第一支大麻烟，10岁时全家居住在伦敦，他参加了切尔西著名的Perry House School 学习古典芭蕾。从1976年起，他参加了三届Stagedoor Manor 表演夏令营，学习表演、舞蹈、声乐等，在其整个青少年时期，他和其家庭成员都在滥用大麻及可卡因。\r\n　　1977年，父母离异，他陪母亲住在纽约，而姐姐则和父亲住在加州。1981年， 前往洛杉矶和父亲团聚，在Santa Monica高中继续学业并加入高中戏剧团，为了出演音乐剧Oklahoma中的角色学会了跳踢踏舞。\r\n　　1982年，父亲在给他附加了苛刻的条件后同意了他辍学的请求，他得以在高中毕业前辍学，前往纽约投奔姐姐发展演艺事业，为供养自己，做过餐厅服务员、鞋店员工和活体艺术表演者，同时在剧院表演戏剧，最终被星探发掘，被带回洛杉矶好莱坞寻求发展。1984年，拍摄电影Firstborn期间，与莎拉·杰西卡·帕克相恋同居，开启了长达7年的恋情。1985年，拍摄电影《Weird Science》期间与Anthony Michael Hall 成为挚友，在其帮助下参演了一年的《Saturday Night Live》。\r\n　　1986年，首次担任男主角拍摄电影《The pick-up Artist》；1987年，因在电影《less than zero》中出色的饰演了瘾君子纨绔子弟julian wells一角而成名，获取影评界关注。\r\n　　1991年，与莎拉·杰西卡·帕克分手，击败著名影人达斯汀·霍夫曼、罗宾·威廉姆斯和比利·克里斯托，获得卓别林一角。1992年， 在约会仅42天后，与模特、演员、歌手Deborah Falconer结婚。\r\n　　1993年， 获得个人首个奥斯卡提名，儿子Indio也于同年9月7日降生。1996年起，由于开始吸食烈性毒品，东窗事发，与妻子正式分居，因持有毒品、在毒品作用下超速驾驶私闯民宅、非法携带gun，多次被捕并出庭受审，遭法庭强制勒戒并判缓刑。但由于多次打破缓刑保释条例（即多次逃避验毒尿检），最终两次入狱服刑累计16个月。期间，在1998年1月23日，卷入与其他犯人殴斗，面部受伤，出狱接受治疗。1999年至2000年8月，在加州科克兰州立监狱服刑。2000年11月，第二次服刑出狱后，参演美剧《Ally Mcbeal》期间两次故态复萌，被捕并被勒令戒毒。 2000至2003年，参加法庭指定的戒毒治疗项目，最终在2003年戒毒成功。\r\n　　2000年， 参演美剧Ally Mcbeal，在演出10集后便获取巨大成功，拉动该剧收视率大幅上升，并凭剧中角色获金球奖。2001年，续签8集《Ally Mcbeal》，该剧原声带中收录了其原创歌曲“snakes”，这是他第一次向公众披露自己的音乐。\r\n　　同年，应好友Elton John之邀，为其拍摄了新单曲“I want love”的MTV，并为慈善戒毒互助组织Hollywood-Sunset Free Clinic策划、演出筹款。\r\n　　2003年4月份在加拿大拍摄电影《Gothika》时与影片制片人Susan Levin结识相恋。2003年11月6日，在Susan30周岁生日前一分钟求婚成功，在解释自己为什么这样求婚时，他说：I figured I kind of wanted to get her while she was still in her 20s.（我有点想在她还是20几岁的时候把她搞到手），随即在当月的The Frank Skinner Show上公开婚讯。\r\n　　2004年11月23日，与索尼签约推出个人首张音乐专辑“The Futurist”，在北美Billboard排行榜上占据新歌手专辑的销量第一名。同年与Deborah Falconer正式离婚。2005年8月27日，与Susan Levin在纽约长岛的Amagansett喜结连理，正式完婚。婚礼宾客包括基努·里维斯、斯汀和比利·乔尔。比利·乔尔为新婚夫妇献唱了“Just the way you are”。\r\n　　2006年9月，获得职业生涯中最重要的角色“Iron man”，2008年影片《钢铁侠》大卖，重新回归事业巅峰，同年凭借在影片热带惊雷中的完美表演，获得各大主要奖项的提名。2009年12月7日，在 Grauman\'s Chinese Theater外留下手足印记及签名。同年圣诞节，主演影片《大侦探福尔摩斯》上映，创圣诞节首映票房新纪录。2010年2月，与妻子Susan Levin Downey组建个人制片公司Team Downey。',X'323031392D30392D31392032323A35333A30382E373430353139','357af94c-fe6c-45e0-9653-a2068744298a.jpg'),(2,'盖·皮尔斯 Guy Pearce','影人简介  · · · · · ·\r\n　　生于英格兰剑桥郡，三岁时举家迁往澳大利亚。自幼喜爱表演，大银幕上的突破是1994年的《沙漠妖姬》，后跟澳洲同乡罗素·克洛一齐出演《洛城机密》。2000年以失忆症为题材的另类佳作《记忆碎片》，其表演极具震撼力，前景看好。',X'323031392D30392D31392032323A35383A35392E333233353731','5103d6e4-ba99-4c67-b911-6b6d67f238ee.jpg'),(3,'格温妮斯·帕特洛 Gwyneth Paltrow','影人简介  · · · · · ·\r\n　　 格温妮丝-帕特洛(Gwyneth Paltrow)，1973年9月28日生于美国加州洛杉矶一个艺人家庭，父亲布鲁斯-帕特洛是电影制片人，母亲布莱思-丹纳是著名的电影演员。格温妮丝有着金色的童年，从儿语识字起，就陪妈妈练习台词，当起了“小陪演”。她11岁的时候，父母将全家搬到了好莱坞。作为著名女演员的女儿，她继承了母亲的优点。虽然父母并不希望女儿成为一名演员，但小时候的耳孺目染、家庭薰陶，使格温妮丝很小的时候就表现出演艺方面的才华。\r\n　　格温妮丝的从影历程可谓一帆风顺，1991年，18岁的她就在自己的教父--大名鼎鼎的导演史蒂芬-斯皮尔伯格的影片《霍克船长》中担任角色，扮演剧中少女时期的温蒂。1993年在影片《无情大地有情天》(Flesh and Bone)中首次担纲主演，同年又与妮科尔-基德曼搭档拍摄了《邪恶》(Malice)。1994年拍摄了《帕克夫人的情人》(Mrs. Parker and the Vicious Circle)和《总统的秘密情人》(Jefferson in Paris)。\r\n　　1995年她在《七宗罪》(Seven)中扮演年轻貌美、温柔体贴的妻子，戏不多，却十分地引人注目。而她与布拉德-皮特的戏下恋情却是她拍摄此片的最大收获。被誉为“有史以来最性感的男人”--布拉德-皮特给格温妮丝带来了巨大的知名度，作为皮特的女友，格温妮丝开始闻名全球。由于她拥有着这个全球无数少女为之疯狂的梦中情人，媒体将她称为“世界上最幸运的女孩”。\r\n　　1996年格温妮丝拍摄了她的成名作《艾玛》(Emma)，该片似乎是专为她而作，格温妮丝的演技得到了充分的展现。1997年6月，“皮特-帕特洛”这对金童玉女突然宣布分手，“天作之合”的童话破灭了。在经历了爱情挫折的打击后，格温妮丝不久就重返银幕，她不遗余力地要做一个成熟女性，事业并由此开始蒸蒸日上。\r\n　　1998年是格温妮丝事业上成功而繁忙的一年。她先是接受了英国导演彼特-郝伊特的邀请，主演了英国影片《双面情人》(Sliding Doors)，她为此片甚至不惜将自己的一头秀发剪短，并回绝了成为票房神话--《泰坦尼克号》的拍摄。功夫不负有心人，此片上演后轰动整个国际影坛，成为继《四个婚礼和一个葬礼》、《一脱到底》之后最成功的英国电影。紧接着她又拍摄了两部重拍经典片--《烈爱风云》(Great Expectations)和《完美的谋杀案》(A Perfect Murder)，后者改编自希区柯克的《电话谋杀案》，剧中她与迈克尔-道格拉斯的完美合作，使该片成为当年的卖座片之一。这一年她参加的最后一部、也是把她推向事业顶峰的一部影片--《莎翁情史》(Shakespeare in Love)的拍摄，格温妮丝-帕特洛凭借此片的出色表演获得了第71届奥斯卡最佳女演员奖，并一举成为好莱坞的一流大明星。但有趣的是，格温妮丝回家后就把奖杯丢进了储藏间，免得回忆起颁奖典礼上的哭得像个泪人、不知道感谢谁的尴尬场面。\r\n　　1999年格温妮丝与马特-达蒙合作主演了《天才瑞普利》(The Talented Mr. Ripley)，该片成为1999年最具争议性的影片之一。今年法拉利兄弟看中格温妮丝-帕特洛，邀其出演新片《Shallow Hal》，格温妮丝将在剧中演出一个大丑女的角色。\r\n　　格温妮丝举止高雅、充满自信，寡言少语却心思缜密，很有教养的她总是令电影观众们着迷，导演们也总是发现她身上很知性、教化的一面，并进而认为她典雅有气质。她相貌姣好、注重仪表，是一个真正的明星、一个好女孩。1997年与布拉德-皮特分手后，她开始寻找真正的朋友，这时，格温妮丝遇到了本-阿尔佛莱克。乐观而充满朝气的本，是新一代男人的象征，他不喜欢张扬，自控能力强，处事总是保持低姿态，但多少少了一些好莱坞的传奇色彩。他“坚信，只要自己有坚韧不拔的力量和获胜的愿望，就能获得成功”。前不久，本-阿尔佛莱克被华纳电影公司看中将出演第四代蝙蝠侠，本力邀其女友格温妮丝-帕特洛出演“猫女”一角。据说华纳方面对格温妮丝出演该角色也非常有信心。\r\n　　格温妮丝是一个工作忘我的人，她的处事格言是不求独特，只求使自己保持不变。她说，\"我这样做的理由是我要这样，而不是钱要我这样。这与出名毫无关系。那些喜欢金钱、喜欢出名的演员不是由爱他们的人抚养大的。而我则完全相反。\"',X'323031392D30392D31392032323A35393A34322E353335303433','93a97529-3dd6-412e-a8d4-92e66a905cf3.jpg'),(4,'本·金斯利 Ben Kingsley','影人简介  · · · · · ·\r\n　　本·金斯利，有着英国、东印度和南非的血统。父亲是旅英的印度裔全科医师，母亲则是一个英裔模特和演员。由于受到母亲的熏陶，自幼爱好戏剧，并发现自己善于模仿动作表情，于是在曼彻斯特开始参加业余戏剧表演。1967年，刚23岁的金斯利首次在伦敦西区的奥德乌奇(Aldwych)剧场参加了职业表演。在这以后参加了著名的皇家莎士比亚剧团(Royal Shakespeare Company)、皇家宫廷剧团(Royal Court)和国家剧院(National Theatr)，经常登台表演莎翁名剧。',X'323031392D30392D31392032333A30303A34322E363036343739','f926ca9d-7baf-4198-ad31-2c476620179a.jpg'),(8,'宋康昊 Kang-ho Song','影人简介  · · · · · ·\r\n　　宋康昊，韩国知名男演员。釜山经营专门大学放送演艺科毕业。舞台剧演员出身，有韩国国民影帝的称号，韩国重要电影奖项的影帝他都拿过，也是首届亚洲电影大奖影帝得主。宋康昊在韩国是极具票房号召力，是演技备受肯定的顶级明星。代表作品有电影《密阳》、《汉江怪物》、《生死谍变》、《义兄弟》、《蝙蝠》等。出生在韩国庆尚南道。和大部分韩国演员不同，宋康昊并没有在大学修读电影或进修演技。出身舞台演员的他，是一边学习一边工作。\r\n　　在1996年，他开始接拍电影，主要演出配角，凭《胜者为王之阿三》一片成名。2000年，他终获机会担正演出，《茅趸王》一片奠定了他在电影界的地位，后凭《共同警备区域JSA》的精湛演出再下一城，除了赢得最佳演员的奖项外，更令他在韩国一线男星之列站稳住脚。2004年，林赞相导演的影片《孝子洞理发师》描述的是在流行“总统阁下”的时代，为总统理发的理发师滑稽而感人的故事。扮演朴素的丈夫的宋康昊和扮演意志坚强的妻子的文素丽向人们展示了出色的演技。\r\n　　第40届韩国大钟奖颁奖典礼，宋康昊以《杀人回忆》打败劲敌张东健的《海岸线》及车胜元的《老师你好》称帝，该片以1986年起在京畿道华城郡一连6年发生的10起奸杀案为背景，一共拿下最佳影片、最佳导演、最佳男主角和最佳灯光等4项大奖。2005年，宋康昊和刘智泰共同打造韩国探险题材影片《南极日记》，该片以励志为主题，故在第六届韩国全州国际电影节被选定为闭幕式作品。\r\n　　《怪物》是宋康昊与导演奉俊昊继《杀人记忆》之后的再度合作。该片是一部投资超过110亿韩元的大制作，奉俊昊从高中时代就开始构思这部影片，片中的怪物是在剧毒刺激下产生变异的生命体，与我们常在好莱坞电影中所看到的躲在阴暗中的怪物不同，它非常胆大，白天现身攻击人类。导演奉俊昊以其特有的幽默将紧张的画面融入家人间的浓浓亲情，更加渲染了恐怖气氛。奉导表示这是一部“现实主义的韩国式怪物影片”。2007年，宋康昊与全度妍联袂主演了李沧东导演的《密阳》，该片为全度妍赢得了戛纳影后的桂冠。而同年宋康昊也凭借《优雅的世界》一举拿下韩国几乎所有电影奖项的最佳男主角，风头强劲。2008年，他又出现在金知云导演的《好家伙、坏家伙、怪家伙》中，与李秉宪、郑宇成同飚演技。2009年宋康昊与朴赞郁再次联手《蝙蝠》，并凭借该片获得亚洲电影大奖最佳男演员提名。',X'323031392D30392D32302031313A33353A34392E363831383938','d0600eca-2197-4961-ac42-3e735c4477b1.jpg'),(9,'李善均 Seon-gyun Lee','影人简介  · · · · · ·\r\n　　李善均是韩国戏剧综合学校戏剧班一期出身，上学期间开始出演戏剧和音乐剧，音乐剧《洛基恐怖秀》中胜任主人公布拉德的流畅演技获得肯定。2002年开始，李善均在大银幕上出演了从处在社会末端的侍者到留学精英等多样性角色而为观众所熟悉，2003年影片《秀秀秀》展示他闪光的演技，电视剧作品则有《新娘18岁》、《爱情中毒》、《千年之爱》等等；嗓音洪亮动听、外表高大清新的他给人们留下了理性、善良而又很有安全感的印象，尽管挥之不去的“模范青年”称号给他带来了不错的广告合约，但是最终李善均还是在2006年迫不及待地迎接了转机。《客人是王》中他以时刻嚼着口香糖，脸上挂着一幅卑鄙的笑容的看起来更像是麻烦制造者的“解决者”的身份出现在观众面前，《残酷的上班》李善均扮演了一个本质上很淳朴的青年，却因为债台高筑而谋划起绑架，最后终于麻烦像雪球越滚愈大，逼得自己走投无路。就这样，凭借着2006年的两部作品李善均在韩国电影男演员的名录里将自己的名字描画得更加醒目。07年他不但同吴满锡、柳德焕两位演技新人同台飙戏，共同主演警匪对决影片《故里情殇》，而且亮相了两部倍受关注的热门韩剧韩版《白色巨塔》合《咖啡王子1号店》，人气迈上了新台阶。\r\n　　2010年，李善均又在电视剧《Pasta》中挑起大梁，扮演“暴躁厨师”崔贤旭一角大受欢迎，之后与崔江姬合作影片《吝啬罗曼史》回到了大银幕。',X'323031392D30392D32302031313A33373A30332E353535363736','aa9d5955-d88f-4f9a-9be7-89f6a6e734a8.jpg'),(10,'赵汝贞 Yeo-Jeong Jo','影人简介  · · · · · ·\r\n　　赵茹珍初次亮相于1997年3月号CECI杂志 ，1999年拍摄《不知别人的速度》而出道，作品包括《太阳的南边》、《野人时代》以及在中央电视台播过出的《当爱已成往事》等，2006年在被称为韩国版的《罗密欧与朱丽叶》的MBC剧集《到底有多好》饰演了个性突出的富家女角色，给人留下深刻印象。为了锻炼自己的演技，赵茹珍通过时装剧和短篇电影中不断挑战恶角、搞笑人物等多样化的角色，2005年还和池贤宇一起出演了音乐剧，展现出不俗的唱歌和舞蹈实力，《吸血刑警罗道烈》是她第一次担当主角的电影作品。2010年，她顶住了巨大压力在古装艳情片《方子传》中大胆裸露，该片票房飘红的同时也让她抛弃了半红不紫的尴尬境地，正式成为忠武路的潜力股。',X'323031392D30392D32302031313A33373A34332E333837303731','3d4e8f31-7784-41ec-85a5-4321d0cabce7.jpg'),(11,'崔宇植 Woo-Sik Choi','影人简介  · · · · · ·\r\n　　2010年MBC日日剧《越看越可爱》138集客串 郑秀晶的男朋友\r\n　　2010年MBC电视台淘气之吻 （即《韩版恶作剧之吻》）网络版 第7集 饰演 白胜祖（金贤重 饰演）的后辈（ 在6分54秒出现 ）\r\n　　2010年MBC 《别巡检3》第2集第17分出现',X'323031392D30392D32302031313A33383A32352E393533313837','500393de-4f20-41b3-a244-2ca9a1a00d05.jpg'),(12,'朴素丹 Su-dam Park','影人简介  · · · · · ·\r\n　　So-dam Park was born on September 8, 1991 in South Korea. She is an actress, known for The Priests (2015), The Silenced (2015) and Ode to the Goose (2018).',X'323031392D30392D32302031313A33393A31302E333137353330','46d62edd-c4d8-4830-b4a6-84f865f0a0f8.jpg'),(13,'罗莎·萨拉查 Rosa Salazar','影人简介  · · · · · ·\r\n　　罗莎·萨拉查，美国女演员，曾出演《移动迷宫2》《分歧者2：绝地反击》等影片。',X'323031392D30392D32312032313A33393A31302E353036303132','5474f76b-280f-4164-9c34-e8214992d75e.jpg'),(14,'克里斯托弗·沃尔兹 Christoph Waltz','影人简介  · · · · · ·\r\n　　奥地利籍男演员，1956年10月4日出生于奥地利维也纳的一个表演世家。父母亲均为职业演员，而祖父则一直在剧院工作。克里斯托弗·瓦尔兹最早活跃于戏剧舞台上，在接拍了大量的影视作品之后于2000年首次执导了一部名为《Wenn man sich traut》的爱情喜剧片。2009年在昆汀·塔伦蒂诺执导的《无耻混蛋》中，精通德语、法语和英语三门语言的克里斯托弗充分发挥了自己的这一特长，除此之外他还在片中说起了意大利语。并打动了所有评委夺得67届金球奖最佳男配角。在2010年3月8日举办的第82届奥斯卡上夺得最佳男配角奖。\r\n　　影帝所代表的应该是最有商业味道的那一个了，不过没有人对克里斯托弗·瓦尔兹的演技产生质疑。从猎杀犹太人那华丽森冷的残酷转变成双面间谍时极尽狡诈贪婪的嘴脸，再到最后身陷敌营如蝼蚁般的挣扎慌乱，克里斯托弗·瓦尔兹在《无耻混蛋》中展现的演技层次转换之快深广足可媲美一干实力派演员，其精彩表演更是获得了各路影评家及媒体的一致好评，评审团愿意怎样去平衡奖项，那是他们的事情，只要这个演员是个好演员，大家就会心服口服。事实上克里斯托弗在《无耻混蛋》中扮演的纳粹军官非常传神，冷酷而狡猾，笑里藏刀。尤其是影片开始十分钟的那一幕，他如何从屋主口里一点一点套出话，又如何指使手下向藏在屋子地板下的人开枪，那些细节被他演得活灵活现。 众多影迷甚至认为他的锋芒盖过了片中的主角布拉德·皮特。2009年他凭借本片一举摘得戛纳电影节影帝桂冠，此后还包揽了包括纽约影评人协会、华盛顿影评人协会、芝加哥影评人协会、第14届金卫星奖最佳男配角、第67届金球奖最佳剧情片男主角等在内的20多个表演奖。 克里斯托弗·瓦尔兹相当幽默，不停地说笑话逗台下的记者。说到与昆汀的合作的时候，他笑着说：“从准备到拍摄这部片子，我花了30年。一开始我很开心，等到10年之后我觉得有点点不爽，30年过去以后我就更加不爽了。”别人也像问夏洛特那样，问他获奖后最先打电话给谁，他很风趣地接在夏洛特后面说：“她打给她妈妈，我则打给我‘妈妈’，我‘妈妈’名叫昆汀。”台下记者们都笑成一团，谁知道他还接下去说：“昆汀也像夏洛特的妈妈所说的那样回了我，只不过他用的是英语。”又是爆笑。',X'323031392D30392D32312032313A34343A32322E333438343736','e5447a1f-03a4-4d5f-93a9-19177bc66909.jpg'),(15,'基恩·约翰逊 Keean Johnson','影人简介  · · · · · ·',X'323031392D30392D32312032313A34353A30382E313431373933','bea0148d-5a95-445d-81a9-e41e1fc684a9.jpg'),(16,'亚伦·保尔 Aaron Paul','影人简介  · · · · · ·\r\n　　1979年出生于爱达荷州，高中毕业后想当演员就去参加了戏剧培训，搬到了洛杉矶。一开始在某个电影院当引座员。当年第一次演戏，是在99年FOX台的电视剧《飞跃比佛利 Beverly Hills, 90210》里打酱油。在好莱坞的第一次演戏，是01年在《K星异客 K-PAX》里演主角Jeff Bridges的儿子。\r\n　　后来又陆续在热门剧《女法官艾米 Judging Amy》《X档案》《纽约重案组》《CSI》《急诊室的故事》《犯罪心理》《鬼语者》《识骨寻踪》等剧里有了客串角色。06年的时候，演了《害羞男人 Choking Man》，又在《碟中谍3》里演 Tom Cruise的小舅子rick。07年他在《大爱 Big Love》剧组得到了Scott Quittman这个角色出现了十几集。\r\n　　在之后，《绝命毒师》开拍以后，他就红了~总共获得2个艾美奖提名，2个艾美奖剧情类最佳男配角奖，一次提名土星奖，2次获得土星奖最佳电视男配角奖，提名卫星奖。\r\n　　明年上映的同名游戏改编的《极品飞车 Need for Speed》由梦工厂打造，Aaron Paul出演！\r\n　　今年五月份，爱情事业双丰收，迎娶了妻子Lauren Parsekian。',X'323031392D31302D31352032323A33303A34362E373238343135','266c1ef3-2446-466d-86f5-14c188da2009.jpg'),(17,'布莱恩·科兰斯顿 Bryan Cranston','影人简介  · · · · · ·\r\n　　布莱恩·克兰斯顿出生于演员家庭，第一次在电视上亮相是在他8岁的时候，出演联合之路的广告，饰演一个出车祸的受害人，广告导演是他父亲Joe Cranston。大学毕业后，布莱恩开始认真考虑做职业演员。一开始他喜欢的职业是法律和体育，尤其是棒球。毕业后布莱恩和哥哥Kyle Edward Cranston一起骑摩托车环游美国。在佛罗里达过冬的时候，布莱恩兄弟俩迷上了戏剧，开始探索戏剧表演之道，随后他们加入了一家公司开始表演生涯。\r\n　　之后布莱恩回到洛杉矶很快接拍了电视电影《爱无止境》（Love Without End），这部电视电影为布莱恩敲开了表演之门。随后他就签约出演了ABC电视台的热播剧《爱》(Loveing)，并因为这部剧布莱恩成为了小荧屏上的常客。后陆续出演了《飞狼》（Airwolf）和《希尔街的忧伤》（Hill Street Blues）等肥皂剧。直到1988年的电视剧《Raising Miranda》播出他才成为一名成功的演员。此后几年间他在影视领域都很活跃，出演了《挡不住的奇迹》和《拯救大兵瑞恩》等60多部影片。\r\n　　2000年开始布莱恩接拍了喜剧《马尔科姆的一家》(Malcolm in the Middle)，剧集中他饰演男配角Hal，这一角色为布莱恩赢得了3次艾美提名和一次金球奖提名。而这部剧集也相当成功，一共在FOX电视台播出了7季。最近一段时间，布莱恩除了接拍《绝命毒师》外，还完成了ABC家庭频道迷你剧《 堕落天使》(Fallen)的拍摄。他还参演了CBS电视台《老爸老妈浪漫史》（How I Met Your Mother）。在《宋飞传》（Seinfeld）中他让观众欢笑，他也是《后中之王》（The King of Queens）中那个惹人厌的邻居，在汤姆·汉克斯领衔的《从地球到月球》（From the Earth to the Moon）中也能看到布莱恩的身影。在拍戏之余布莱恩还尽可能参与舞台剧的表演，多才多艺的他还曾担任编剧和导演。\r\n　　布莱恩现居新墨西哥州阿尔伯克基，妻子为演员Robin Dearden，两人育有一女泰勒·克兰斯顿（出生于1993年2月12日）。',X'323031392D31302D31352032323A33313A34382E333639393431','fbd537a4-2466-4ab1-84a8-65522a6d8f8b.jpg'),(18,'杰西·普莱蒙 Jesse Plemons','影人简介  · · · · · ·\r\n　　演技精湛的后起之秀，曾在《绝命毒师》、《奥丽芙·基特里奇》、《冰血暴 第二季》等热门美剧中出演配角，近年持续发力，参与《间谍之桥》、《其他人》、《美国制造》等电影作品，皆有出色的表演。',X'323031392D31302D31352032323A33323A34342E313137313330','1907d3c4-e527-4023-af48-65d85267bbe5.jpg'),(19,'克里斯滕·里特 Krysten Ritter','影人简介  · · · · · ·\r\n　　克里斯滕·蕊特，美国女演员，曾有过模特经历。她参演过《赌城无记事》、《27宜嫁》、《一个购物狂的自白》等电影，也在许多电视剧中露面，如《吉尔莫女孩》、《美眉校探》、《爱你到死》等。她曾在热门美剧《绯闻女孩》中，《Valley Girls》一集客串过，和在电视剧《绝命毒师》中扮演过一个主要角色。2010年，主演电影《我配不上她》和电视剧《Gravity》。',X'323031392D31302D31352032323A33333A34342E333239353734','8d68021b-8f18-4995-8fa0-3f48baf104de.jpg');

#
# Structure for table "film_film"
#

DROP TABLE IF EXISTS `film_film`;
CREATE TABLE `film_film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `trailer` varchar(100) DEFAULT NULL,
  `score` decimal(3,1) NOT NULL,
  `prised_count` int(11) NOT NULL,
  `basic_info` varchar(100) NOT NULL,
  `original_name` varchar(30) NOT NULL,
  `release_date` datetime(6) NOT NULL,
  `release_place` varchar(10) NOT NULL,
  `total_time` int(11) NOT NULL,
  `plot_desc` longtext NOT NULL,
  `directors` varchar(30) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `swiper_img` varchar(100) DEFAULT NULL,
  `is_swiper` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "film_film"
#

INSERT INTO `film_film` VALUES (1,'钢铁侠3-Iron-Man-3','9a6b1310-1540-4630-aec1-db68dcc1c115.jpg','fa165e7c-acff-4a60-8025-70edb18d2573.mp4',7.8,2123,'动作 / 科幻','铁甲奇侠3(港) / 钢铁人3(台) / 铁人3',X'323031332D30352D30312030303A30303A30302E303030303030','中国大陆',134,'钢铁侠3的剧情简介 · · · · · ·\r\n　　自纽约事件以来，托尼·斯塔克（小罗伯特·唐尼 Robert Downey Jr. 饰）为前所未有的焦虑症所困扰。他疯狂投入钢铁侠升级版的研发，为此废寝忘食，甚至忽略了女友佩珀·波茨（格温妮斯·帕特洛 Gwyneth Paltrow 饰）的感受。与此同时，臭名昭著的恐怖头目曼达林（本·金斯利 Ben Kingsley 饰）制造了一连串的爆炸袭击事件，托尼当年最忠诚的保镖即在最近的一次袭击中身负重伤。未过多久，托尼、佩珀以及曾与他有过一面之缘的女植物学家玛雅（丽贝卡·豪尔 Rebecca Hall 饰）在家中遭到猛烈的炮火袭击，几乎丧命，而这一切似乎都与22年前那名偶然邂逅的科学家阿尔德里奇·基连（盖·皮尔斯 Guy Pearce 饰）及其终极生物的研究有关。 \r\n　　即使有精密先进的铠甲护身，也无法排遣发自心底的焦虑。被击碎一切的托尼，如何穿越来自地狱的熊熊烈火…','沙恩·布莱克 Shane Black',X'323031392D30392D31392032333A33353A31322E353331383732',1,'e97b5e2a-35d9-46e5-ad6d-39ff85d59ba5.jpg',1),(2,'寄生虫-기생충','ce52ab58-85db-4958-80c4-9ae3faf1e4d7.jpg','5f7fe882-f7d1-4d87-948d-d186cc8b3b95.mp4',8.7,4387,'剧情 / 喜剧','寄生上流(台) / 上流寄生族(港) / 패러사이트 / P',X'323031392D30352D32312030303A30303A30302E303030303030','戛纳电影节',132,'基宇（崔宇植 饰）出生在一个贫穷的家庭之中，和妹妹基婷（朴素丹 饰）以及父母在狭窄的地下室里过着相依为命的日子。一天，基宇的同学上门拜访，他告诉基宇，自己在一个有钱人家里给他们的女儿做家教，太太是一个头脑简单出手又阔绰的女人，因为自己要出国留学，所以将家教的职位暂时转交给基宇。 \r\n　　就这样，基宇来到了朴社长（李善均 饰）家中，并且见到了他的太太（赵汝贞 饰），没过多久，基宇的妹妹和父母也如同寄生虫一般的进入了朴社长家里工作。然而，他们的野心并没有止步于此，基宇更是和大小姐坠入了爱河。随着时间的推移，朴社长家里隐藏的秘密渐渐浮出了水面。','奉俊昊 Joon-ho Bong',X'323031392D30392D32302031313A32353A34342E313130333233',1,'aeff447c-35b4-450b-9186-58c80d279434.jpg',1),(5,'阿丽塔：战斗天使 Alita: Battle Angel','489a0a6b-f425-4355-807c-e9ed5ae4b469.jpg','b4d596ff-48e7-41fc-ac1c-e188216204bc.mp4',7.5,1865,'动作 / 科幻 / 冒险','铳梦 / 铳梦：战斗天使(港) / 艾莉塔：战斗天使(台)',X'323031392D30322D30352030303A30303A30302E303030303030','中国大陆',122,'阿丽塔：战斗天使的剧情简介 · · · · · ·\r\n　　故事发生在遥远的26世纪，外科医生依德（克里斯托弗·瓦尔兹 Christoph Waltz 饰）在垃圾场里捡到了只剩下头部的机械少女将她带回家中，给她装上了本来为自己已故的女儿所准备的义体，并取名阿丽塔（罗莎·萨拉扎尔 Rosa Salazar 饰）。苏醒后的阿丽塔对这个五彩斑斓但却暴力而又残酷的世界产生了浓厚的兴趣，在结识了青年雨果（基恩·约翰逊 Keean Johnson 饰）后，阿丽塔开始接触名为机动球的运动，并在比赛中展现出了惊人的格斗天赋。 \r\n　　在废铁城居民们的头顶，漂浮着巨大的浮空城市撒冷，废铁城居民们的一切劳作和付出，都是为了给撒冷提供继续运作的燃料。在大财阀维克特（马赫沙拉·阿里 Mahershala Ali 饰）所设立的机动球比赛中，最终获得冠军的人能够获得前往撒冷生活的资格，阿丽塔决定利用自己的格斗天赋参加比赛，却被卷入了一个巨大的阴谋之中','罗伯特·罗德里格兹 Robert Rodriguez',X'323031392D30392D32312032313A33363A35332E393935333537',1,'ab0ffa0b-b643-4e79-82f8-5f1d395e26da.jpg',1),(7,'续命之徒：绝命毒师电影 El Camino: A Break','30472342-31dc-4f88-8d9c-9a7dcc2f260a.jpg','a4b000b1-57c6-4a67-8ddb-ae7b45d686ab.mp4',8.4,3869,'剧情 / 惊悚 / 犯罪','绝命毒师电影：续命之徒 / 格林布莱尔 / Greenbri',X'323031392D31302D31312030303A30303A30302E303030303030','美国',122,'续命之徒：绝命毒师电影的剧情简介 · · · · · ·\r\n　　Netflix 电视内容《续命之徒：绝命毒师电影》回归，主角杰西·平克曼（艾美奖得主亚伦·保尔饰演）再次与粉丝见面。杰西戏剧性地逃出囚禁后，他必须接受自己的过去，才有可能创造未来。这部扣人心弦的惊悚片由《绝命毒师》的创剧人文斯·吉里根编写和执导。该电影由马克·约翰逊、梅利莎·伯恩斯坦、查尔斯·纽沃斯、黛安娜·默瑟和亚伦·保尔以及 Sony Pictures Television 联合制作。','文斯·吉里根',X'323031392D31302D31352032323A32323A32302E393935343839',1,'33a5b3f8-e752-40ab-b43e-f934971599d4.jpg',1);

#
# Structure for table "film_filmactor"
#

DROP TABLE IF EXISTS `film_filmactor`;
CREATE TABLE `film_filmactor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_filmactor_actor_id_aa207486_fk_film_actor_id` (`actor_id`),
  KEY `film_filmactor_film_id_3732e86d_fk_film_film_id` (`film_id`),
  CONSTRAINT `film_filmactor_actor_id_aa207486_fk_film_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `film_actor` (`id`),
  CONSTRAINT `film_filmactor_film_id_3732e86d_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "film_filmactor"
#

INSERT INTO `film_filmactor` VALUES (6,'钢铁侠',1,1,X'323031392D30392D32302031313A31323A35312E333634333639'),(7,NULL,2,1,X'323031392D30392D32302031313A31343A32362E303632373330'),(8,NULL,3,1,X'323031392D30392D32302031313A31343A32362E303633373330'),(9,NULL,4,1,X'323031392D30392D32302031313A31343A32362E303634373330'),(11,NULL,8,2,X'323031392D30392D32302031313A34303A33342E313237353530'),(12,NULL,9,2,X'323031392D30392D32302031313A34303A33342E313238353530'),(13,NULL,10,2,X'323031392D30392D32302031313A34303A33342E313239353530'),(14,NULL,11,2,X'323031392D30392D32302031313A34303A33342E313330353530'),(15,NULL,12,2,X'323031392D30392D32302031313A34303A33342E313331353530'),(16,NULL,13,5,X'323031392D30392D32312032313A34363A30382E333737303534'),(17,NULL,14,5,X'323031392D30392D32312032313A34363A30382E333738303534'),(18,NULL,15,5,X'323031392D30392D32312032313A34363A30382E333739303534'),(19,NULL,16,7,X'323031392D31302D31352032323A33353A30322E353735303439'),(20,NULL,17,7,X'323031392D31302D31352032323A33353A30322E363235303532'),(21,NULL,18,7,X'323031392D31302D31352032323A33353A30322E363338303533'),(22,NULL,19,7,X'323031392D31302D31352032323A33353A30322E373436303539');

#
# Structure for table "film_poster"
#

DROP TABLE IF EXISTS `film_poster`;
CREATE TABLE `film_poster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` varchar(100) NOT NULL,
  `film_id` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_poster_film_id_c13178a7_fk_film_film_id` (`film_id`),
  CONSTRAINT `film_poster_film_id_c13178a7_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "film_poster"
#

INSERT INTO `film_poster` VALUES (1,'5d04c8cc-24ff-4cd6-b04a-129e35d97dda.jpg',1,X'323031392D30392D32302031363A30393A30342E303133363031'),(2,'b30af8f7-c505-409d-bb9d-0801ea31be55.jpg',1,X'323031392D30392D32302031363A30393A30342E313237363037'),(3,'7e185172-51a0-47d6-ae5a-191a0e6995ce.jpg',1,X'323031392D30392D32302031363A30393A30342E313239363037'),(4,'01eafab8-5c52-4d97-b3f7-8296f935da95.jpg',1,X'323031392D30392D32302031363A30393A30342E323437363134'),(5,'033e72b4-f791-4de7-a4aa-5cb6efb5b8e7.jpg',2,X'323031392D30392D32302031363A31323A33352E383833373139'),(6,'4d3d2d67-7f8f-491c-a6d2-9aa8e6bf7a99.jpg',2,X'323031392D30392D32302031363A31323A33352E393039373230'),(7,'384c4eea-5c39-4ec5-8e77-c2067a707be3.jpg',2,X'323031392D30392D32302031363A31323A33352E393136373231'),(8,'df2e6d1f-1c10-4460-b3e2-4369ca1a00b1.jpg',2,X'323031392D30392D32302031363A31323A33352E393232373231'),(9,'3d7f0ea8-d56a-4ee3-bb56-abc1c9a95fc5.jpg',5,X'323031392D30392D32312032313A34363A30382E343035303535'),(10,'a679c993-defa-4ea4-aaef-d0f5b45aafa1.jpg',5,X'323031392D30392D32312032313A34363A30382E353133303537'),(11,'696ce464-e1d2-47a8-b078-55460666f729.jpg',7,X'323031392D31302D31352032323A33353A30322E383138303633'),(12,'4ec9e772-58f2-42be-9d65-80a2af8bf6c7.jpg',7,X'323031392D31302D31352032323A33353A30322E393139303639'),(13,'124b0ab9-adf7-4f77-b0c5-4244b3256a89.jpg',7,X'323031392D31302D31352032323A33353A30322E393934303733');

#
# Structure for table "user_otherinfo"
#

DROP TABLE IF EXISTS `user_otherinfo`;
CREATE TABLE `user_otherinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(11) NOT NULL,
  `birthday` datetime(6) NOT NULL,
  `say_sth` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "user_otherinfo"
#

INSERT INTO `user_otherinfo` VALUES (3,3,X'323031392D31302D30362032333A31353A31382E353635373333','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(4,1,X'323030302D30312D32312030303A30303A30302E303030303030','唱、跳、rap、篮球'),(5,3,X'323031392D31302D31342030313A32383A35302E323630393438','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(6,3,X'323031392D31302D31342030313A32393A32352E353234383239','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(7,3,X'323031392D31302D31342030313A33333A33392E353637303332','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(8,3,X'323031392D31302D31342030313A33373A35352E353036363230','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(9,3,X'323031392D31302D31342030323A30343A30362E383738313330','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(10,3,X'323031392D31302D31342030323A30363A34342E373038353935','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(11,3,X'323031392D31302D31342030323A31313A32332E303139333931','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(12,3,X'323031392D31302D31342030323A31313A35342E353136323639','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(13,3,X'323031392D31302D31342030323A32333A34342E393433303131','这个人懒死了，什么都没有写╮(╯▽╰)╭'),(14,3,X'323031392D31302D31342030323A32343A30332E343531343638','这个人懒死了，什么都没有写╮(╯▽╰)╭');

#
# Structure for table "user_user"
#

DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(10) NOT NULL,
  `face` varchar(100) NOT NULL,
  `random` char(32) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `other_info_id` int(11) DEFAULT NULL,
  `jwt` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `other_info_id` (`other_info_id`),
  CONSTRAINT `user_user_other_info_id_d7ce5715_fk_user_otherinfo_id` FOREIGN KEY (`other_info_id`) REFERENCES `user_otherinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "user_user"
#

INSERT INTO `user_user` VALUES (3,'zoesama','921102..','无名','default_face.jpg','b256005bd32a4411b1b8129ed87901b4',X'323031392D31302D30362032333A31353A31382E373532333335',3,NULL),(4,'zoe','921102..','cai先生','611173e7-46aa-4bf8-bded-2ea4d4f62f0c.png','b652dfe811d64072aff3c0de62cedab8',X'323031392D31302D30362032333A31393A31392E333838393639',4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJoZWFkZXJzIjp7InR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0sInVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InpvZSIsImlzcyI6InpvZSIsImV4cCI6MTU3MTQyOTYyNiwiaWF0IjoxNTcxNDI2MDI2fQ.wkAKWBeeGZ3fQbjyHt9ShXjzjIWO3Co_cUgfQXCCfKA'),(5,'111','222','无名','default_face.jpg','98d836485fd74e47a428b5403b34a724',X'323031392D31302D31342030313A32383A35302E333737373532',5,NULL),(6,'11','22','无名','default_face.jpg','c74560d3eb30451abd4ff6a1225ba146',X'323031392D31302D31342030313A32393A32352E373330363330',6,NULL),(7,'1','2','无名','default_face.jpg','c5f859c69d074b639c78b36e0fa034e4',X'323031392D31302D31342030313A33333A33392E363934383332',7,NULL),(8,'2','2','无名','default_face.jpg','5f79db69cd734b9ba5161c3187b604ba',X'323031392D31302D31342030313A33373A35352E373237303230',8,NULL),(9,'22','22','无名','default_face.jpg','a4ea3cb0845f46d0aff4ca6ad43e5aef',X'323031392D31302D31342030323A30343A30372E303037333331',9,NULL),(10,'222','222','无名','default_face.jpg','cd5261bf65d04547bb2fa5e7c71380de',X'323031392D31302D31342030323A30363A34342E383532333937',10,NULL),(11,'3','','无名','default_face.jpg','344cfc4cad5d4221bb72a4f8b799456a',X'323031392D31302D31342030323A31313A32332E313133333932',11,NULL),(12,'33','33','无名','default_face.jpg','c56c560c1c3d42608035774f0fabb6f5',X'323031392D31302D31342030323A31313A35342E363331343730',12,NULL),(13,'333','333','无名','default_face.jpg','ba68bca904944a558197466198c394ba',X'323031392D31302D31342030323A32333A34352E303833323133',13,NULL),(14,'444','444','无名','default_face.jpg','0b349867de614117ae75adba70e1bfb5',X'323031392D31302D31342030323A32343A30342E303332303730',14,NULL);

#
# Structure for table "user_userfilm"
#

DROP TABLE IF EXISTS `user_userfilm`;
CREATE TABLE `user_userfilm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_userfilm_film_id_b52ea84d_fk_film_film_id` (`film_id`),
  KEY `user_userfilm_user_id_2a1b6f0f_fk_user_user_id` (`user_id`),
  CONSTRAINT `user_userfilm_film_id_b52ea84d_fk_film_film_id` FOREIGN KEY (`film_id`) REFERENCES `film_film` (`id`),
  CONSTRAINT `user_userfilm_user_id_2a1b6f0f_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "user_userfilm"
#

INSERT INTO `user_userfilm` VALUES (10,X'323031392D31302D31362031353A34303A34382E313430323738',5,7),(12,X'323031392D31302D31362031353A34323A30312E363435343832',1,7),(34,X'323031392D31302D31382032323A30373A30312E333438333131',5,4);
