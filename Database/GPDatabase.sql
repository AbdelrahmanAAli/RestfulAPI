ALTER TABLE VEHICLES_HISTORY DROP FOREIGN KEY FKVEHICLES_H651953;
ALTER TABLE RSU_HISTORY DROP FOREIGN KEY FKRSU_HISTOR344265;
DROP TABLE IF EXISTS VEHICLES;
DROP TABLE IF EXISTS RSU;
DROP TABLE IF EXISTS VEHICLES_HISTORY;
DROP TABLE IF EXISTS RSU_HISTORY;
DROP TABLE IF EXISTS CAR_MAINTENANCE;
CREATE TABLE VEHICLES (VEHICLE_ID int(4) NOT NULL, VEHICLE_MODEL_NAME varchar(255) NOT NULL, VEHICLE_OWNER_NAME varchar(255), VEHICLE_OWNER_EMAIL varchar(255), VEHICLE_MODEL_YEAR int(4) NOT NULL, VEHICLE_STATE_FLAG int(1) NOT NULL comment '0 : InActive
1 : Active
2 : Emergency', VEHICLE_LAT numeric(24, 14) NOT NULL, VEHICLE_LONG numeric(28, 14) NOT NULL, VEHICLE_EMERG_NOTE varchar(255), PRIMARY KEY (VEHICLE_ID));
CREATE TABLE RSU (RSU_ID int(4) NOT NULL, RSU_LONG numeric(14, 8) NOT NULL, RSU_LAT numeric(14, 8) NOT NULL, RSU_EMERG_NOTES varchar(255), RSU_STATE int(1) NOT NULL comment '0 : InActive
1 : Active
3 : Emergency
 ', PRIMARY KEY (RSU_ID));
CREATE TABLE VEHICLES_HISTORY (VEHICLE_HISTORY_ID int(4) NOT NULL AUTO_INCREMENT, VEHICLE_ID int(4) NOT NULL, `CASE` int(1) NOT NULL comment '0 : Normal case
1 : Emergency case', CASE_NOTE varchar(255) NOT NULL, CASE_LAT numeric(28, 14) NOT NULL, CASE_LONG numeric(28, 14), CASE_STATE int(1) DEFAULT 1 NOT NULL comment '0 : Inactive
1 : Active', PRIMARY KEY (VEHICLE_HISTORY_ID));
CREATE TABLE RSU_HISTORY (RSU_HISTORY_ID int(4) NOT NULL AUTO_INCREMENT, RSU_ID int(4) NOT NULL, `CASE` int(1) comment '0 : Normal case
1 : Emergency case', CASE_NOTE varchar(255) NOT NULL, CASE_STATE int(1) comment '0 : Inactive
1 : Active', PRIMARY KEY (RSU_HISTORY_ID));
CREATE TABLE CAR_MAINTENANCE (CAR_MAINTENANCE_ID int(4) NOT NULL AUTO_INCREMENT, CAR_MAINTENANCE_NAME int(10) NOT NULL, CAR_MAINTENANCE_LAT numeric(28, 14) NOT NULL, CAR_MAINTENANCE_LONG numeric(28, 14) NOT NULL, CAR_MAINTENANCE_MOBILE int(11) NOT NULL, CAR_MAINTENANCE_EMAIL varchar(255) NOT NULL, PRIMARY KEY (CAR_MAINTENANCE_ID));
ALTER TABLE VEHICLES_HISTORY ADD INDEX FKVEHICLES_H651953 (VEHICLE_ID), ADD CONSTRAINT FKVEHICLES_H651953 FOREIGN KEY (VEHICLE_ID) REFERENCES VEHICLES (VEHICLE_ID);
ALTER TABLE RSU_HISTORY ADD INDEX FKRSU_HISTOR344265 (RSU_ID), ADD CONSTRAINT FKRSU_HISTOR344265 FOREIGN KEY (RSU_ID) REFERENCES RSU (RSU_ID);
