-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: leoshop
-- ------------------------------------------------------
-- Server version	5.5.59

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'leoshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUser`(
    IN userNick VARCHAR(64),
    IN userPassword VARCHAR(64)
)
BEGIN
    SELECT idUsuario, nombre, correo,
        imgPerfil, extPerfil, imgPortada, extPortada,
        telefono, calle, numero, colonia, ciudad, estado,
        pais, codigoPostal
    FROM Usuario
    WHERE nick = userNick AND
        contrasenia = userPassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_setUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setUser`(
	IN userNick VARCHAR(50),
    IN userPassword VARCHAR(50),
    IN userName VARCHAR(50),
    IN userFirstName VARCHAR(50),
    IN userLastName VARCHAR(50),
    IN userBirthdate DATE,
    IN userEmail VARCHAR(50),
    IN userPhone VARCHAR(32),
    IN userStreet VARCHAR(50),
    IN userNumber VARCHAR(50),
    IN userSuburb VARCHAR(50),
    IN userCity VARCHAR(50),
    IN userState VARCHAR(50),
    IN userCountry VARCHAR(50),
    IN userZipCode VARCHAR(50),
    IN userAvatar MEDIUMBLOB,
    IN userCover MEDIUMBLOB,
    IN avatarExt VARCHAR(16),
    IN coverExt VARCHAR(16)
)
BEGIN
	DECLARE userId INT DEFAULT NULL;
    
    SELECT idUsuario
    INTO userId
    FROM Usuario
    WHERE nick LIKE userNick;
    
    IF (userId IS NULL)
    THEN
		INSERT INTO Usuario
        VALUES (
			DEFAULT,
			userNick,
			userPassword,
			userName,
			userFirstName,
			userLastName,
			userBirthdate,
			userEmail,
			userPhone,
			userStreet,
			userNumber,
			userSuburb,
			userCity,
			userState,
			userCountry,
			userZipCode,
			userAvatar,
			userCover,
			avatarExt,
			coverExt
        );
    ELSE
		SELECT 'Usuario existente';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-19  0:39:52
