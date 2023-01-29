/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.17 : Database - dazuoye
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dazuoye` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dazuoye`;

/*Table structure for table `class` */

CREATE TABLE `class` (
  `Cduration` varchar(66) DEFAULT NULL,
  `Croom` varchar(66) DEFAULT NULL,
  `Cday` varchar(66) DEFAULT NULL,
  `Cweek` varchar(66) DEFAULT NULL,
  `Cobject` varchar(66) NOT NULL,
  PRIMARY KEY (`Cobject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class` */

insert  into `class`(`Cduration`,`Croom`,`Cday`,`Cweek`,`Cobject`) values 
('3-18周','1栋315','3-5节','MON;WED','数据库应用'),
('3-18周','1栋218','1-2节','Tues;Fri','计算机网络'),
('3-18周','1栋102','6-8节','Thur;','高等数学');

/*Table structure for table `course` */

CREATE TABLE `course` (
  `Cnum` varchar(66) NOT NULL,
  `Chour` varchar(66) NOT NULL,
  `Cstart` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`Cnum`,`Chour`,`Cstart`) values 
('1节','40min','8:00'),
('2节','40min','8:45'),
('3节','40min','9:45'),
('4节','40min','10:35'),
('5节','40min','11:20');

/*Table structure for table `sit` */

CREATE TABLE `sit` (
  `name` varchar(66) DEFAULT NULL,
  `attendance` enum('正常','早退','迟到','旷课','事假','病假') DEFAULT NULL,
  `sit` varchar(66) DEFAULT NULL,
  `scourse` varchar(66) DEFAULT NULL,
  KEY `name` (`name`),
  CONSTRAINT `sit_ibfk_1` FOREIGN KEY (`name`) REFERENCES `student` (`Sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sit` */

insert  into `sit`(`name`,`attendance`,`sit`,`scourse`) values 
('李慧慧','正常','1行2列',NULL),
('安宥真','正常','1行3列',NULL),
('肖英华','正常','1行4列',NULL),
('金炫植','病假','1行5列',NULL),
('张元英','迟到','2行1列',NULL),
('金彩元','旷课','2行2列',NULL),
('李彩燕','事假','2行3列',NULL),
('姜慧元','正常','2行4列',NULL),
('曺柔理','正常','2行5列',NULL),
('权恩菲','正常','3行1列',NULL),
('刘秀敏','正常','3行2列',NULL),
('申留真','迟到','3行3列',NULL),
('朴彩英','旷课','3行4列',NULL),
('崔叡娜','事假','3行5列',NULL),
('张小白','早退','1行1列',NULL),
(NULL,NULL,NULL,NULL);

/*Table structure for table `student` */

CREATE TABLE `student` (
  `Sname` varchar(66) NOT NULL,
  `Sno` int(66) DEFAULT NULL,
  `Ssit` varchar(66) DEFAULT NULL,
  `Sclass` varchar(66) DEFAULT NULL,
  PRIMARY KEY (`Sname`),
  KEY `Sno_index` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`Sname`,`Sno`,`Ssit`,`Sclass`) values 
('刘秀敏',19070012,'2行4列','高等数学'),
('姜慧元',19070009,'3行2列','计算机网络'),
('安宥真',19070003,'1行3列','数据库应用'),
('崔叡娜',19070015,'3行5列','高等数学'),
('张元英',19070006,'2行1列','计算机网络'),
('张小白',19070001,'1行1列','数据库应用'),
('曺柔理',19070010,'2行5列','计算机网络'),
('朴彩英',19070014,'3行4列','高等数学'),
('权恩菲',19070011,'3行1列','高等数学'),
('李彩燕',19070008,'2行3列','计算机网络'),
('李慧慧',19070002,'1行2列','数据库应用'),
('申留真',19070013,'3行3列','高等数学'),
('肖英华',19070004,'1行4列','数据库应用'),
('金彩元',19070007,'2行2列','计算机网络'),
('金炫植',19070005,'1行5列','计算机网络');

/*Table structure for table `teacher` */

CREATE TABLE `teacher` (
  `Tname` varchar(66) DEFAULT NULL,
  `Tno` int(66) DEFAULT NULL,
  `Tpwd` int(66) DEFAULT NULL,
  `Tcourse` varchar(66) DEFAULT NULL,
  KEY `Tcourse` (`Tcourse`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`Tcourse`) REFERENCES `class` (`Cobject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`Tname`,`Tno`,`Tpwd`,`Tcourse`) values 
('杨贤硕',113208,78456,'计算机网络'),
('李秀满',555623,123456,'数据库应用'),
('朴振英',895657,123456,'高等数学');

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `backup` */

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `backup` ON SCHEDULE EVERY 1 WEEK STARTS '2021-12-31 11:22:43' ON COMPLETION NOT PRESERVE ENABLE DO begin
 call backup_event();
 end */$$
DELIMITER ;

/* Event structure for event `backupdt` */

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `backupdt` ON SCHEDULE EVERY 1 WEEK STARTS '2021-12-31 11:30:19' ON COMPLETION NOT PRESERVE ENABLE DO begin
  call bp_event();
  end */$$
DELIMITER ;

/* Event structure for event `budt` */

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `budt` ON SCHEDULE EVERY 1 WEEK STARTS '2021-12-31 11:29:10' ON COMPLETION NOT PRESERVE ENABLE DO begin
  call bp_event();
  end */$$
DELIMITER ;

/* Function  structure for function  `query_course_place` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `query_course_place`(course_id int, class_id int) RETURNS varchar(255) CHARSET utf8mb4
begin
		set @a = (select classroom_id from t_attend_class as a where a.class_id=class_id and a.course_id=course_id limit 1);
		set @b = (select position from t_classroom where id = @a);
		return @b;
	end */$$
DELIMITER ;

/* Function  structure for function  `stuclass` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `stuclass`(sname char(66),scourse char(66)) RETURNS char(66) CHARSET utf8
begin
set @a=(select Sname from student as a where a.sname=Sname limit 1);
SET @b=(SELECT Sclass FROM student  WHERE Sname =@a);
return @b;
end */$$
DELIMITER ;

/* Function  structure for function  `stuname` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `stuname`(id int) RETURNS varchar(300) CHARSET utf8
BEGIN
 return(select ('name',Sname,'sit',Ssit)from student where Sno =id);
END */$$
DELIMITER ;

/* Function  structure for function  `stu_class` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `stu_class`(sname char(66),scourse char(66)) RETURNS char(66) CHARSET utf8
begin
set @a=(select Sname from student as a where a.sname=Sname and a.scourse=Sclass limit 1);
SET @b=(SELECT Sclass FROM student  WHERE Sname =@a);
return @b;
end */$$
DELIMITER ;

/* Function  structure for function  `stu_info` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `stu_info`(id int) RETURNS varchar(300) CHARSET utf8
BEGIN
 return(select concat('名字:',Sname,'座位：',Ssit)from student where Sno =id);
END */$$
DELIMITER ;

/* Function  structure for function  `stu_name` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `stu_name`(id int) RETURNS varchar(300) CHARSET utf8
BEGIN
 return(select concat('name',Sname,'sit',Ssit)from student where Sno =id);
END */$$
DELIMITER ;

/* Procedure structure for procedure `all_attendance` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `all_attendance`()
    READS SQL DATA
begin 
select student.Sno,Sname,Sclass,sit.sit,attendance from student,sit where sit.name = student.Sname;
end */$$
DELIMITER ;

/* Procedure structure for procedure `backup_event` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `backup_event`()
begin
select *from class into outfile 'd\\class\\class.txt';
end */$$
DELIMITER ;

/* Procedure structure for procedure `backup_procedure` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `backup_procedure`()
begin 
		select * from t_attend_class into outfile 'd:\\teaching\\t_attend_class.txt';
		select * from t_attendance into outfile 'd:\\teaching\\t_attendance.txt';
		select * from t_class into outfile 'd:\\teaching\\t_class.txt';
		select * from t_classroom into outfile 'd:\\teaching\\t_classroom.txt';
		select * from t_course into outfile 'd:\\teaching\\t_course.txt';
		select * from t_role into outfile 'd:\\teaching\\t_role.txt';
		select * from t_seat into outfile 'd:\\teaching\\t_seat.txt';
		select * from t_section into outfile 'd:\\teaching\\t_section.txt';
		select * from t_student into outfile 'd:\\teaching\\t_student.txt';
		select * from t_teacher into outfile 'd:\\teaching\\t_teacher.txt';
		select * from t_user into outfile 'd:\\teaching\\t_user.txt';
	end */$$
DELIMITER ;

/* Procedure structure for procedure `bp_event` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `bp_event`()
begin
select *from class into outfile 'd\\class\\class.txt';
end */$$
DELIMITER ;

/* Procedure structure for procedure `Schange` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Schange`()
begin
start transaction;
 select * from student where Sno='19070012' or Sno='19070009';
 update student set Ssit='3行2列' where Sno='19070009';
 update student set Ssit='2行4列' where Sno='19070012';
end */$$
DELIMITER ;

/* Procedure structure for procedure `sit_change` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sit_change`()
begin
start transaction;
 select * from student where Sno='19070012' or Sno='19070009';
 update student set Ssit='1行1列' where Sno='19070009';
 update student set Ssit='1行2列' where Sno='19070012';
end */$$
DELIMITER ;

/* Procedure structure for procedure `swap_seat` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `swap_seat`(IN stu1_id int, IN stu2_id int, IN course_id int)
begin 
		start transaction;
			set @a = (select seat_id from t_attend_class as a where a.student_id = stu1_id and a.course_id = course_id);
			set @b = (select seat_id from t_attend_class as a where a.student_id = stu2_id and a.course_id = course_id);
			update t_attend_class as a set seat_id = @a where a.student_id = stu2_id and a.course_id = course_id;
			update t_attend_class as a set seat_id = @b where a.student_id = stu1_id and a.course_id = course_id;
		commit;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `update_attend_class_status` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attend_class_status`(IN student_id int, IN section_id int, IN status int)
begin 
		update t_attendance as a set a.status = status where a.student_id = student_id and a.section_id = section_id;
	end */$$
DELIMITER ;

/*Table structure for table `lesson_place` */

DROP TABLE IF EXISTS `lesson_place`;

/*!50001 CREATE TABLE  `lesson_place`(
 `corse` varchar(66) ,
 `room` varchar(66) ,
 `duration` varchar(66) ,
 `teacher` varchar(66) 
)*/;

/*Table structure for table `stu_attendance` */

DROP TABLE IF EXISTS `stu_attendance`;

/*!50001 CREATE TABLE  `stu_attendance`(
 `id` int(66) ,
 `stuname` varchar(66) ,
 `attendance` enum('正常','早退','迟到','旷课','事假','病假') 
)*/;

/*View structure for view lesson_place */

/*!50001 DROP TABLE IF EXISTS `lesson_place` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lesson_place` AS select `class`.`Cobject` AS `corse`,`class`.`Croom` AS `room`,`class`.`Cduration` AS `duration`,`teacher`.`Tname` AS `teacher` from (`class` join `teacher`) where (`teacher`.`Tcourse` = `class`.`Cobject`) */;

/*View structure for view stu_attendance */

/*!50001 DROP TABLE IF EXISTS `stu_attendance` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stu_attendance` AS select `student`.`Sno` AS `id`,`student`.`Sname` AS `stuname`,`sit`.`attendance` AS `attendance` from (`student` join `sit`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
