CREATE TABLE `scratch_pad` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(30) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_scratch_pad_user_user_id` (`USER_ID`),
  CONSTRAINT `fk_scratch_pad_user_user_id` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;