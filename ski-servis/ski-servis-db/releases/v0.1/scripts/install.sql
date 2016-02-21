/*
 ************************************ MODEL ************************************
 */

/*
 * schema
 */
DROP DATABASE IF EXISTS ski_servis;

CREATE SCHEMA IF NOT EXISTS ski_servis CHARACTER SET = 'utf8';

USE ski_servis;

/*
 * target_group
 */
CREATE TABLE IF NOT EXISTS target_group (
  id   INT          NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX uk_target_group_1 (name ASC))
ENGINE = InnoDB;