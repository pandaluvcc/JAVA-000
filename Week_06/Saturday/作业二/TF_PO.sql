
CREATE TABLE TF_PO(
    PO_ID                   DECIMAL(15, 0)    NOT NULL    COMMENT '订单ID',
    PO_NO                   VARCHAR(35)       NOT NULL    COMMENT '订单号',
    SELLER_CODE             VARCHAR(18)       NOT NULL    COMMENT '卖方代号',
    SELLER_NAME             VARCHAR(300)      NOT NULL    COMMENT '卖方名称',
    BUYER_CODE              VARCHAR(18)       NOT NULL    COMMENT '买方代号',
    BUYER_NAME              VARCHAR(300)      NOT NULL    COMMENT '买方名称',
    PO_PAY_MOD              CHAR(1)           NOT NULL    COMMENT '付款方式 1:赊销;2:货到付款;',
    PO_CCY                  VARCHAR(3)        NOT NULL    COMMENT '币种',
    PO_BAL                  DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '订单余额: 订单金额-买方付款金额',
    PO_AMT                  DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '订单金额',
    PO_DATE                 DATE                  COMMENT '生效日',
    PO_DUE_DATE             DATE                  COMMENT '到期日',
    PAY_TENOR               INT                   COMMENT '买方付款账期',
    SHIPMENT_AGREE_TENOR    INT                   COMMENT '约定发货期限',
    GOODS_DETAIL_FLAG       CHAR(1)           NOT NULL    COMMENT '是否维护商品明细 1:是;0:否;',
    PO_DESC                 VARCHAR(100)          COMMENT '订单描述',
    DATA_STATUS             CHAR(1)           NOT NULL    COMMENT '订单状态 A:未付款;B:已付款;C:已取消;D:已发货;F:已签收;',
    BUYER_PAY_AMT           DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '买方付款金额',
    SHIPMENT_AMT            DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '发货金额',
    SIGN_AMT                DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '签收金额',
    LOCK_FLAG               CHAR(1)           NOT NULL    COMMENT '锁定标记 0:否;1:是;',
    OVERDUE_FLAG            CHAR(1)           NOT NULL    COMMENT '逾期标记 1:是;0:否;',
    PO_STATUS               VARCHAR(1)        NOT NULL    COMMENT '订单有效状态 Y:是;N:否;',
    CREATE_OPER             VARCHAR(18)       NOT NULL    COMMENT '创建人',
    UPDATE_OPER             VARCHAR(35)       NOT NULL    COMMENT '更新人',
    UPDATE_TIME             DATETIME(3)       NOT NULL    COMMENT '更新时间',
    PRIMARY KEY (PO_ID)
)ENGINE=INNODB
COMMENT='订单表'
;

CREATE TABLE TF_PO_GOODS(
    PO_GOODS_ID          DECIMAL(15, 0)    NOT NULL    COMMENT '订单商品ID',
    PO_ID                DECIMAL(15, 0)    NOT NULL    COMMENT '订单ID',
    PO_NO                VARCHAR(30)       NOT NULL    COMMENT '订单号码',
    GOODS_CODE           VARCHAR(30)           COMMENT '商品号码',
    GOODS_NAME           VARCHAR(50)           COMMENT '商品名称',
    CCY                  VARCHAR(3)        NOT NULL    COMMENT '币种',
    UNIT_PRICE           DECIMAL(18, 4)    NOT NULL    COMMENT '单价',
    QTY                  DECIMAL(18, 8)    NOT NULL    COMMENT '数量',
    UNIT                 VARCHAR(10)       NOT NULL    COMMENT '商品单位',
    TOTAL_AMT            DECIMAL(18, 4)    NOT NULL    COMMENT '商品价值',
    TOTAL_SHIP_QTY       DECIMAL(18, 8)    DEFAULT 0 NOT NULL    COMMENT '发货商品数量',
    TOTAL_SHIP_AMT       DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '发货商品金额',
    TOTAL_SIGN_QTY       DECIMAL(18, 8)    DEFAULT 0 NOT NULL    COMMENT '签收商品数量',
    TOTAL_SIGN_AMT       DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '签收商品金额',
    TOTAL_PAY_QTY        DECIMAL(18, 8)    NOT NULL    COMMENT '累计付款商品数量',
    TOTAL_PAY_AMT        DECIMAL(18, 4)    DEFAULT 0 NOT NULL    COMMENT '累计付款商品价值',
    UPDATE_TIME          DATETIME(3)       NOT NULL    COMMENT '更新时间',
    PRIMARY KEY (PO_GOODS_ID)
)ENGINE=INNODB
COMMENT='订单商品表'
;