Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1F308B9A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 18:36:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F199845;
	Fri, 29 Jan 2021 18:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F199845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611941765;
	bh=sd20Ine5ba650qI53TZuWyIM/n24OGk+Az33z7eul14=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOrn0CFrib3JFoWdeuo5uzIgDOu4ek292MJVVPSTXzBoA9/K94OOoralRRUEpfg41
	 3Gkbz/lU8WE2ft3sZT4YvGMpWvLVN5+Lz7E33Y2Z5zJA7JtlawqTMv6o8A9MhvS2l+
	 peaIiBVoz+JO8pXSPyULOun+YkxYW44MkxmTT7hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C7EF804E5;
	Fri, 29 Jan 2021 18:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A4EFF80277; Fri, 29 Jan 2021 18:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F5E7F80277
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 18:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5E7F80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uvfKtwZ+"
Received: by mail-wr1-x429.google.com with SMTP id s7so6664157wru.5
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfBwc9juEmKkxkxZ+pO3/BcQV7OceEBCypkwLET1fg8=;
 b=uvfKtwZ+T+jaeCOa7MNOKZfp60TG0xHw1yFeeUlABkXUrcEGJZTU9RvbFJyNAZKfJx
 dqPKTYpJuaYqQBYTlFm/Osci30S6/dforVLpqtBtApXrauErCfKDvMwKBZefyB38Fa3p
 K1XG/4EK9DNo3TgpZNW99vQiSSvqhbNy5ifvq30ceq1Rwo2mYV4/CW5dXJ5p1kJTZL7t
 tX4Zyyjmsgz8A9LrujvHVCrSWdvnnU0Fq6hxuJdybGxlu0Jx7/PTRlqY7cQaTv3TMAVD
 BzdfhBxTFCibbfKvSR4+/9VrQj+vPeH/QP6WCOXHQetQ/j+fdMA0MM40rz3lIcUchCOf
 hQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfBwc9juEmKkxkxZ+pO3/BcQV7OceEBCypkwLET1fg8=;
 b=NH7ii0GSK3nUzVN0XjiHBbaH6m5I7hmFusdwdGUgy4iyMxSuWcSePCOQi7L5QeEHvt
 2vrWcKohSbtYjjSY+8fQ0P3LYWeJtUt/S4ZU5M1iNVORqfjhHR9OGHuUyyE57l44FVHR
 mI9uK1d3NlYIkiHki6rLyWjdaaxBHjQZzj0hlh9KvpeMQcS1KQ9NL4Nb1Ayup2OruFpN
 Y0A+/4HBaAkMywonRiR2ncRjTydsXjmQb8Szva5EuYNvtOhr6AQy4RUm/hXcctrcCJXz
 +0BYPhVwP26GdHQJno6iERaEPQ3I50kt+q1vVGWnElO5p8IeehE28Ue8s46vH5Jn/8mQ
 OaPA==
X-Gm-Message-State: AOAM5322qKpanz21VbM/HFU4SjQRTlWO57ZnE6sPITkkJoEH+uQtnkS9
 vpGuAlIUGdYfRj/xs2v7UiY5v/YJOfuUDw==
X-Google-Smtp-Source: ABdhPJypI7k4bXA5pHWf/48AXFmkMjvKoIOtDoMh0UHVenxHzDUzT5M1TkUPZZyd5Pv9Y3kJRSV3Jg==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr4474424wrx.357.1611941582598; 
 Fri, 29 Jan 2021 09:33:02 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h18sm13202294wru.65.2021.01.29.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 09:33:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 6/6] soundwire: qcom: add support to new interrupts
Date: Fri, 29 Jan 2021 17:32:48 +0000
Message-Id: <20210129173248.5941-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support to new interrupts and update irq routine in a way
to deal with multiple pending interrupts with in a single interrupt!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 191 ++++++++++++++++++++++++++++++---------
 1 file changed, 146 insertions(+), 45 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d61b204dc284..c699bd51d29a 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -28,10 +28,21 @@
 #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
 #define SWRM_INTERRUPT_STATUS					0x200
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
+#define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
 #define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
 #define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
+#define SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET			BIT(3)
+#define SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW			BIT(4)
+#define SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW			BIT(5)
+#define SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW		BIT(6)
 #define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
+#define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
+#define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
 #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
+#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
+#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
+#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
+#define SWRM_INTERRUPT_MAX					17
 #define SWRM_INTERRUPT_MASK_ADDR				0x204
 #define SWRM_INTERRUPT_CLEAR					0x208
 #define SWRM_INTERRUPT_CPU_EN					0x210
@@ -105,11 +116,8 @@ struct qcom_swrm_ctrl {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *mmio;
-	struct completion *comp;
 	struct completion broadcast;
 	struct work_struct slave_work;
-	/* read/write lock */
-	spinlock_t comp_lock;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct mutex io_lock;
@@ -126,6 +134,7 @@ struct qcom_swrm_ctrl {
 	int rows_index;
 	unsigned long dout_port_mask;
 	unsigned long din_port_mask;
+	u32 intr_mask;
 	u8 rcmd_id;
 	u8 wcmd_id;
 	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
@@ -315,6 +324,27 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
 	return ret;
 }
 
+static int qcom_swrm_get_alert_slave(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 val;
+	int i;
+
+	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+
+	for (i = 0; i < SDW_MAX_DEVICES; i++) {
+		u32 s;
+
+		s = (val >> (i * 2));
+
+		if ((s & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
+			ctrl->status[i] = s;
+			return i;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -333,40 +363,122 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
-	struct qcom_swrm_ctrl *ctrl = dev_id;
-	u32 sts, value;
-	unsigned long flags;
-
-	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
-
-	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
-		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
-		dev_err_ratelimited(ctrl->dev,
-				    "CMD error, fifo status 0x%x\n",
-				     value);
-		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
-	}
+	struct qcom_swrm_ctrl *swrm = dev_id;
+	u32 value, intr_sts, intr_sts_masked;
+	u32 i;
+	u8 devnum = 0;
+	int ret = IRQ_HANDLED;
+
+
+	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
+	intr_sts_masked = intr_sts & swrm->intr_mask;
+
+handle_irq:
+	for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
+		value = intr_sts_masked & (1 << i);
+		if (!value)
+			continue;
+
+		switch (value) {
+		case SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ:
+			devnum = qcom_swrm_get_alert_slave(swrm);
+			if (devnum < 0) {
+				dev_err_ratelimited(swrm->dev,
+				    "no slave alert found.spurious interrupt\n");
+			} else {
+				sdw_handle_slave_status(&swrm->bus, swrm->status);
+			}
 
-	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
-	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS)
-		schedule_work(&ctrl->slave_work);
-
-	/**
-	 * clear the interrupt before complete() is called, as complete can
-	 * schedule new read/writes which require interrupts, clearing the
-	 * interrupt would avoid missing interrupts in such cases.
-	 */
-	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
-
-	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
-		spin_lock_irqsave(&ctrl->comp_lock, flags);
-		if (ctrl->comp)
-			complete(ctrl->comp);
-		spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+			break;
+		case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
+		case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
+			dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
+				__func__);
+			qcom_swrm_get_device_status(swrm);
+			sdw_handle_slave_status(&swrm->bus, swrm->status);
+			break;
+		case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
+			dev_err_ratelimited(swrm->dev,
+					"%s: SWR bus clsh detected\n",
+					__func__);
+			swrm->intr_mask &=
+				~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
+			swrm->reg_write(swrm,
+				SWRM_INTERRUPT_CPU_EN,
+				swrm->intr_mask);
+			break;
+		case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
+			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+			dev_err_ratelimited(swrm->dev,
+				"%s: SWR read FIFO overflow fifo status 0x%x\n",
+				__func__, value);
+			break;
+		case SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW:
+			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+			dev_err_ratelimited(swrm->dev,
+				"%s: SWR read FIFO underflow fifo status 0x%x\n",
+				__func__, value);
+			break;
+		case SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW:
+			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+			dev_err(swrm->dev,
+				"%s: SWR write FIFO overflow fifo status %x\n",
+				__func__, value);
+			swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
+			break;
+		case SWRM_INTERRUPT_STATUS_CMD_ERROR:
+			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+			dev_err_ratelimited(swrm->dev,
+			"%s: SWR CMD error, fifo status 0x%x, flushing fifo\n",
+					__func__, value);
+			swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
+			break;
+		case SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION:
+			dev_err_ratelimited(swrm->dev,
+					"%s: SWR Port collision detected\n",
+					__func__);
+			swrm->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
+			swrm->reg_write(swrm,
+				SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
+			break;
+		case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
+			dev_err_ratelimited(swrm->dev,
+				"%s: SWR read enable valid mismatch\n",
+				__func__);
+			swrm->intr_mask &=
+				~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
+			swrm->reg_write(swrm,
+				SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
+			break;
+		case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
+			complete(&swrm->broadcast);
+			break;
+		case SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2:
+			break;
+		case SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2:
+			break;
+		case SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP:
+			break;
+		default:
+			dev_err_ratelimited(swrm->dev,
+					"%s: SWR unknown interrupt value: %d\n",
+					__func__, value);
+			ret = IRQ_NONE;
+			break;
+		}
 	}
+	swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, intr_sts);
+	swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, 0x0);
+
+	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
+	intr_sts_masked = intr_sts & swrm->intr_mask;
+
+	if (intr_sts_masked)
+		goto handle_irq;
 
-	return IRQ_HANDLED;
+	return ret;
 }
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -380,6 +492,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Disable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
 
+	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
 	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
 			SWRM_INTERRUPT_STATUS_RMSK);
@@ -615,16 +728,6 @@ static u32 qcom_swrm_freq_tbl[MAX_FREQ_NUM] = {
 	DEFAULT_CLK_FREQ,
 };
 
-static void qcom_swrm_slave_wq(struct work_struct *work)
-{
-	struct qcom_swrm_ctrl *ctrl =
-			container_of(work, struct qcom_swrm_ctrl, slave_work);
-
-	qcom_swrm_get_device_status(ctrl);
-	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
-}
-
-
 static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
 					struct sdw_stream_runtime *stream)
 {
@@ -989,11 +1092,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
-	spin_lock_init(&ctrl->comp_lock);
 	mutex_init(&ctrl->port_lock);
 	mutex_init(&ctrl->io_lock);
 	init_completion(&ctrl->broadcast);
-	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
-- 
2.21.0

