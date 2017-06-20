DROP SCHEMA IF EXISTS PreAndPostScriptSchema CASCADE;
CREATE SCHEMA PreAndPostScriptSchema;

CREATE SEQUENCE PreAndPostScriptSchema.t_ili2db_seq start 2000;
-- ModelA.TopicA.ClassA
CREATE TABLE PreAndPostScriptSchema.classa (
  T_Id bigint PRIMARY KEY DEFAULT nextval('PreAndPostScriptSchema.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,attr1 varchar(60) NULL
)
;
COMMENT ON TABLE PreAndPostScriptSchema.classa IS '@iliname ModelA.TopicA.ClassA';
-- ModelA.TopicA.ClassB
CREATE TABLE PreAndPostScriptSchema.classb (
  T_Id bigint PRIMARY KEY DEFAULT nextval('PreAndPostScriptSchema.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,attr2 varchar(60) NULL
)
;
COMMENT ON TABLE PreAndPostScriptSchema.classb IS '@iliname ModelA.TopicA.ClassB';
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_IMPORT (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NOT NULL
  ,importDate timestamp NOT NULL
  ,importUser varchar(40) NOT NULL
  ,importFile varchar(200) NULL
)
;
COMMENT ON TABLE PreAndPostScriptSchema.T_ILI2DB_IMPORT IS 'DEPRECATED, do not use';
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_IMPORT_BASKET (
  T_Id bigint PRIMARY KEY
  ,import bigint NOT NULL
  ,basket bigint NOT NULL
  ,objectCount integer NULL
  ,start_t_id bigint NULL
  ,end_t_id bigint NULL
)
;
COMMENT ON TABLE PreAndPostScriptSchema.T_ILI2DB_IMPORT_BASKET IS 'DEPRECATED, do not use';
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_IMPORT_OBJECT (
  T_Id bigint PRIMARY KEY
  ,import_basket bigint NOT NULL
  ,class varchar(200) NOT NULL
  ,objectCount integer NULL
  ,start_t_id bigint NULL
  ,end_t_id bigint NULL
)
;
COMMENT ON TABLE PreAndPostScriptSchema.T_ILI2DB_IMPORT_OBJECT IS 'DEPRECATED, do not use';
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(255) NULL
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_MODEL (
  file varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (iliversion,modelName)
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE PreAndPostScriptSchema.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,Owner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (SqlName,Owner)
)
;
ALTER TABLE PreAndPostScriptSchema.T_ILI2DB_DATASET ADD CONSTRAINT T_ILI2DB_DATASET_datasetName_key UNIQUE (datasetName)
;
ALTER TABLE PreAndPostScriptSchema.T_ILI2DB_MODEL ADD CONSTRAINT T_ILI2DB_MODEL_iliversion_modelName_key UNIQUE (iliversion,modelName)
;
ALTER TABLE PreAndPostScriptSchema.T_ILI2DB_ATTRNAME ADD CONSTRAINT T_ILI2DB_ATTRNAME_SqlName_Owner_key UNIQUE (SqlName,Owner)
;
