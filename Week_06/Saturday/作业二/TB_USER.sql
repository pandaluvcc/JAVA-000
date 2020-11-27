CREATE TABLE TB_USER(
    USER_CODE            VARCHAR(35)      NOT NULL    COMMENT '用户代码',
    USER_NAME            VARCHAR(16)      NOT NULL    COMMENT '用户名称',
    USER_TYPE            CHAR(1)          NOT NULL    COMMENT '用户类型',
    USER_PWD             VARCHAR(200)     NOT NULL    COMMENT '用户密码',
    USER_STATUS          CHAR(1)          NOT NULL    COMMENT '用户状态',
    FIRST_NAME           VARCHAR(30)      NOT NULL    COMMENT '姓名',
    ADDR1                VARCHAR(80)          COMMENT '地址',
    ADDR_CITY            VARCHAR(50)          COMMENT '城市',
    ADDR_STATE           VARCHAR(50)          COMMENT '省(州)',
    ADDR_ZIP             VARCHAR(20)          COMMENT '邮编',
    ADDR_COUNTRY         VARCHAR(2)           COMMENT '国家',
    EMAIL                VARCHAR(80)          COMMENT '邮箱',
    PHONE                VARCHAR(20)          COMMENT '手机号',
    LAST_LOGON_TIME      DATETIME             COMMENT '上次登录时间',
    DATA_STATUS          CHAR(1)          NOT NULL    COMMENT '数据状态 V:已审核;C:创建待提交;J:创建被驳回;P:创建待审核;U:修改待提交;G:修改待审核;T:修改被驳回;D:删除待审核;H:删除被驳回;',
    UPDATE_OPER          VARCHAR(35)      NOT NULL    COMMENT '更新人',
    UPDATE_TIME          DATETIME(3)      NOT NULL    COMMENT '更新时间',
    VERIFY_OPER          VARCHAR(35)          COMMENT '审核人',
    VERIFY_TIME          DATETIME(3)          COMMENT '审核时间',
    DATA_ACTIVE          CHAR(1)          NOT NULL    COMMENT '数据是否有效 Y:是;N:否;',
    ID_NO                VARCHAR(18)          COMMENT '身份证',
    ID_TYPE              CHAR(1)              COMMENT '证件类型 1:身份证;2:护照;3:港澳居民往来内地通行证;4:台湾居民往来内地通行证;',
    PRIMARY KEY (USER_CODE)
)ENGINE=INNODB
COMMENT='TB_USER'
;