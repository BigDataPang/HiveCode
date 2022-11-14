/*
 Hive使用MySQL时使用的是latin1编码格式，并不支持中文，所以需要修改MySQL的元数据编码格式，但是整库修改，Hive会报错。所以执行以下步骤修改元数据信息
*/

-- 修改字段注释字符集
alter table COLUMNS_V2 modify column COMMENT varchar(256) character set utf8;

-- 修改表注释字符集
alter table TABLE_PARAMS modify column PARAM_VALUE varchar(20000) character set utf8;

-- 修改分区参数，支持分区建用中文表示
alter table PARTITION_PARAMS modify column PARAM_VALUE varchar(20000) character set utf8;
alter table PARTITION_KEYS modify column PKEY_COMMENT varchar(20000) character set utf8;

-- 修改索引名注释，支持中文表示
alter table INDEX_PARAMS modify column PARAM_VALUE varchar(4000) character set utf8;

-- 修改视图，支持视图中文
ALTER TABLE TBLS modify COLUMN VIEW_EXPANDED_TEXT mediumtext CHARACTER SET utf8;
ALTER TABLE TBLS modify COLUMN VIEW_ORIGINAL_TEXT mediumtext CHARACTER SET utf8;

-- 修改hive-site.xml中Hive读取元数据的编码 &amp;characterEncoding=UTF-8
 <property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:mysql://hadoop102:3306/metastore?useSSL=false&amp;useUnicode=true&amp;characterEncoding=UTF-8</value>
</property>
