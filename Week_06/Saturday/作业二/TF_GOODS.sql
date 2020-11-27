
CREATE TABLE TF_GOODS(
    GOODS_ID           DECIMAL(15, 0)    NOT NULL    COMMENT '商品ID',
    GOODS_CAT_ID       DECIMAL(15, 0)    NOT NULL    COMMENT '商品目录ID',
    ORG_CODE           VARCHAR(6)        NOT NULL    COMMENT '机构',
    BR_CODE            VARCHAR(12)       NOT NULL    COMMENT '分支机构',
    GOODS_CODE         VARCHAR(30)           COMMENT '商品代码',
    GOODS_NAME_CODE    VARCHAR(3)            COMMENT '商品名代码',
    GOODS_NAME         VARCHAR(70)           COMMENT '商品名称',
    UNIT               VARCHAR(10)           COMMENT '计价单位',
    CCY                VARCHAR(3)            COMMENT '计价币别',
    PRICE              DECIMAL(18, 3)        COMMENT '最新单价',
    REGION             VARCHAR(10)           COMMENT '地区',
    CNOTE              VARCHAR(140)          COMMENT '详细描述',
    PRICE_STAT         CHAR(1)               COMMENT '商品价格状态 1:是;0:否;',
    REF_SPECIFI        VARCHAR(255)          COMMENT '参考规格',
    REF_MATERIAL       VARCHAR(255)          COMMENT '参考材质',
    FACTURER           VARCHAR(255)          COMMENT '生产厂商',
    GOODS_STATUS       CHAR(1)           NOT NULL    COMMENT '商品状态 Y:是;N:否;',
    DATA_STATUS        CHAR(1)           NOT NULL    COMMENT '流程状态 V:已审核;C:创建待提交;J:创建被驳回;P:创建待审核;U:修改待提交;G:修改待审核;T:修改被驳回;D:删除待审核;H:删除被驳回;',
    UPDATE_OPER        VARCHAR(35)       NOT NULL    COMMENT '更新人',
    UPDATE_TIME        DATETIME(3)       NOT NULL    COMMENT '更新日期',
    CREATE_TIME        DATETIME(3)       NOT NULL    COMMENT '创建时间',
    PRIMARY KEY (GOODS_ID),
    UNIQUE INDEX IDX_TF_GOODS_1(GOODS_CODE)
)ENGINE=INNODB
COMMENT='商品信息表'
;