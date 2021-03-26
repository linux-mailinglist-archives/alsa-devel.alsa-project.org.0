Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CCB34A227
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 07:45:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5621D166C;
	Fri, 26 Mar 2021 07:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5621D166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616741143;
	bh=JSnn8lLqJtODb/wAs/IbpgXq23Fq5jGyhqIjr9dP5dk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TcTe9zUVnhCdkO79fe47imdv9934Lx5PtShg2jEX5SMUkrox70K5zfjSk8y96icLX
	 zuCHPKQ7TG1hG+ZSDVEsnZESrAFocfRlEgod7zhFX4xQzW8ACPjwvdc5qZlF/6+GLA
	 ZsVK2k8q5H6xKxg80fyRt3S+c8UU73Io15HsjZfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1F0F80240;
	Fri, 26 Mar 2021 07:42:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28519F804E2; Fri, 26 Mar 2021 07:42:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6D6F80240
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 07:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6D6F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="B/LjN6DL"
Received: by mail-ed1-x535.google.com with SMTP id bx7so5029366edb.12
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqsKmLEvrwdPhmuMzUrjlU9RFEkvVfbmgNXNut1H8ME=;
 b=B/LjN6DLJvci+guequLaUflHU+kCCCVoBZLQUCm3vpvU5xGOdTIM1Ka9yWOUFtkcUl
 O/D9MST72Di52yOc4VpAB+JxsOV64SDv6crD3Y3cNt/kpzFZFM4CpicamrKstErYKsSX
 sJ5I7kQpFP7tUoJtEubbHOnqUjJPdMYs/9rex3j3M/MUU2NJK4Qx3MREZikoEu1lg6Jz
 Rzn4uPuCx2/IspgNBFArzr9jukIQXhlJzmzjxKKNlW8n3Hf3OfgRAMALdtwg5gWWzh/9
 hyWamgRdQY6uU4DzMpu1jkRP1QBXRFJTwbRz+sm+Ghs9TZ6i7v1i5U4m9u7Lf0UlUaiA
 FOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqsKmLEvrwdPhmuMzUrjlU9RFEkvVfbmgNXNut1H8ME=;
 b=QYhyaCxjnPPp/uV12JO5XClgFCb5DZAu2EPzZ+dGfYbUPaLwEN4cVcTzarJokb/QOf
 7c/B+c2qvWRrCMUVSqLV/+CnrW4A+IMbw4jRbhw0oJcALMeq1PEUfvnyoDqJQL+kTeEi
 /GbBKrnL9sAAflkJcm+iKNmXmGIKGXFBL3jD2bNG50NU0EGZeu/kyAvfJ/fj3yEZlfT2
 ky/CCbikKRkUrDC6ZRCtXxUrPWVUkUmD4ifOA6MgZrtdtlAkouQxJyNZdx99tbVnonVc
 wwut6u1PNr+JlJUlB14YgusfMn6Ab5dji+/80tnMigOGqAoT9P/sOGHfsHZh9mEO5qVY
 pZZw==
X-Gm-Message-State: AOAM532QpBMO6pMcVhhqPnqULLYMWstudzK0FOoQUdPZmTJL/va2rC6C
 GjGbYiauPQX6ev4I8I+SevE7EjsnMcUNUA==
X-Google-Smtp-Source: ABdhPJwO0n9MKBULZq0koeZ54umEw2dkgUUAKLq9oMoyaS44n393u/PZz6OyCDTMWdfoJJJqjEwn1Q==
X-Received: by 2002:aa7:c342:: with SMTP id j2mr13429464edr.8.1616740881327;
 Thu, 25 Mar 2021 23:41:21 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id ci22sm125325ejc.54.2021.03.25.23.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:41:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v5 5/9] soundwire: qcom: update register read/write routine
Date: Fri, 26 Mar 2021 06:39:40 +0000
Message-Id: <20210326063944.31683-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
References: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

In the existing code every soundwire register read and register write
are kinda blocked. Each of these are using a special command id that
generates interrupt after it successfully finishes. This is really
overhead, limiting and not really necessary unless we are doing
something special.

We can simply read/write the fifo that should also give exactly
what we need! This will also allow to read/write registers in
interrupt context, which was not possible with the special
command approach.

With previous approach number of interrupts generated
after enumeration are around 130:
$ cat /proc/interrupts  | grep soundwire
 21: 130 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire

after this patch they are just 3 interrupts
$ cat /proc/interrupts  | grep soundwire
 21: 3 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire

This has significantly not only reduced interrupting CPU during enumeration
but also during streaming!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 178 ++++++++++++++++++++++-----------------
 1 file changed, 99 insertions(+), 79 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 2bcb4362f0e0..0cbd611fb8c6 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -38,11 +38,13 @@
 #define SWRM_CMD_FIFO_WR_CMD					0x300
 #define SWRM_CMD_FIFO_RD_CMD					0x304
 #define SWRM_CMD_FIFO_CMD					0x308
+#define SWRM_CMD_FIFO_FLUSH					0x1
 #define SWRM_CMD_FIFO_STATUS					0x30C
 #define SWRM_CMD_FIFO_CFG_ADDR					0x314
 #define SWRM_CONTINUE_EXEC_ON_CMD_IGNORE			BIT(31)
 #define SWRM_RD_WR_CMD_RETRIES					0x7
 #define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
+#define SWRM_RD_FIFO_CMD_ID_MASK				GENMASK(11, 8)
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
@@ -78,13 +80,16 @@
 #define SWRM_SPECIAL_CMD_ID	0xF
 #define MAX_FREQ_NUM		1
 #define TIMEOUT_MS		(2 * HZ)
-#define QCOM_SWRM_MAX_RD_LEN	0xf
+#define QCOM_SWRM_MAX_RD_LEN	0x1
 #define QCOM_SDW_MAX_PORTS	14
 #define DEFAULT_CLK_FREQ	9600000
 #define SWRM_MAX_DAIS		0xF
 #define SWR_INVALID_PARAM 0xFF
 #define SWR_HSTOP_MAX_VAL 0xF
 #define SWR_HSTART_MIN_VAL 0x0
+#define SWR_BROADCAST_CMD_ID    0x0F
+#define SWR_MAX_CMD_ID	14
+#define MAX_FIFO_RD_RETRY 3
 
 struct qcom_swrm_port_config {
 	u8 si;
@@ -103,10 +108,8 @@ struct qcom_swrm_ctrl {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *mmio;
-	struct completion *comp;
+	struct completion broadcast;
 	struct work_struct slave_work;
-	/* read/write lock */
-	spinlock_t comp_lock;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct clk *hclk;
@@ -120,6 +123,8 @@ struct qcom_swrm_ctrl {
 	int rows_index;
 	unsigned long dout_port_mask;
 	unsigned long din_port_mask;
+	u8 rcmd_id;
+	u8 wcmd_id;
 	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
 	enum sdw_slave_status status[SDW_MAX_DEVICES];
@@ -198,77 +203,105 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
 	return SDW_CMD_OK;
 }
 
-static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
-				     u8 dev_addr, u16 reg_addr)
+static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
+				   u8 dev_addr, u16 reg_addr)
 {
-	DECLARE_COMPLETION_ONSTACK(comp);
-	unsigned long flags;
 	u32 val;
-	int ret;
-
-	spin_lock_irqsave(&ctrl->comp_lock, flags);
-	ctrl->comp = &comp;
-	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
-	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr,
-				SWRM_SPECIAL_CMD_ID, reg_addr);
-	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
-	if (ret)
-		goto err;
-
-	ret = wait_for_completion_timeout(ctrl->comp,
-					  msecs_to_jiffies(TIMEOUT_MS));
+	u8 id = *cmd_id;
 
-	if (!ret)
-		ret = SDW_CMD_IGNORED;
-	else
-		ret = SDW_CMD_OK;
-err:
-	spin_lock_irqsave(&ctrl->comp_lock, flags);
-	ctrl->comp = NULL;
-	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+	if (id != SWR_BROADCAST_CMD_ID) {
+		if (id < SWR_MAX_CMD_ID)
+			id += 1;
+		else
+			id = 0;
+		*cmd_id = id;
+	}
+	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
 
-	return ret;
+	return val;
 }
 
-static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
-				     u8 dev_addr, u16 reg_addr,
-				     u32 len, u8 *rval)
+
+static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
+				     u8 dev_addr, u16 reg_addr)
 {
-	int i, ret;
-	u32 val;
-	DECLARE_COMPLETION_ONSTACK(comp);
-	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->comp_lock, flags);
-	ctrl->comp = &comp;
-	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+	u32 val;
+	int ret = 0;
+	u8 cmd_id = 0x0;
 
-	val = SWRM_REG_VAL_PACK(len, dev_addr, SWRM_SPECIAL_CMD_ID, reg_addr);
-	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
-	if (ret)
-		goto err;
+	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
+		cmd_id = SWR_BROADCAST_CMD_ID;
+		val = swrm_get_packed_reg_val(&cmd_id, cmd_data,
+					      dev_addr, reg_addr);
+	} else {
+		val = swrm_get_packed_reg_val(&swrm->wcmd_id, cmd_data,
+					      dev_addr, reg_addr);
+	}
 
-	ret = wait_for_completion_timeout(ctrl->comp,
-					  msecs_to_jiffies(TIMEOUT_MS));
+	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
+
+	/* version 1.3 or less */
+	if (swrm->version <= 0x01030000)
+		usleep_range(150, 155);
+
+	if (cmd_id == SWR_BROADCAST_CMD_ID) {
+		/*
+		 * sleep for 10ms for MSM soundwire variant to allow broadcast
+		 * command to complete.
+		 */
+		ret = wait_for_completion_timeout(&swrm->broadcast,
+						  msecs_to_jiffies(TIMEOUT_MS));
+		if (!ret)
+			ret = SDW_CMD_IGNORED;
+		else
+			ret = SDW_CMD_OK;
 
-	if (!ret) {
-		ret = SDW_CMD_IGNORED;
-		goto err;
 	} else {
 		ret = SDW_CMD_OK;
 	}
+	return ret;
+}
 
-	for (i = 0; i < len; i++) {
-		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &val);
-		rval[i] = val & 0xFF;
-	}
+static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
+				     u8 dev_addr, u16 reg_addr,
+				     u32 len, u8 *rval)
+{
+	u32 cmd_data, cmd_id, val, retry_attempt = 0;
+
+	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
+
+	/* wait for FIFO RD to complete to avoid overflow */
+	usleep_range(100, 105);
+	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
+	/* wait for FIFO RD CMD complete to avoid overflow */
+	usleep_range(250, 255);
+
+	do {
+		swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
+		rval[0] = cmd_data & 0xFF;
+		cmd_id = FIELD_GET(SWRM_RD_FIFO_CMD_ID_MASK, cmd_data);
+
+		if (cmd_id != swrm->rcmd_id) {
+			if (retry_attempt < (MAX_FIFO_RD_RETRY - 1)) {
+				/* wait 500 us before retry on fifo read failure */
+				usleep_range(500, 505);
+				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD,
+						SWRM_CMD_FIFO_FLUSH);
+				swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
+			}
+			retry_attempt++;
+		} else {
+			return SDW_CMD_OK;
+		}
 
-err:
-	spin_lock_irqsave(&ctrl->comp_lock, flags);
-	ctrl->comp = NULL;
-	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+	} while (retry_attempt < MAX_FIFO_RD_RETRY);
 
-	return ret;
+	dev_err(swrm->dev, "failed to read fifo: reg: 0x%x, rcmd_id: 0x%x,\
+		dev_num: 0x%x, cmd_data: 0x%x\n",
+		reg_addr, swrm->rcmd_id, dev_addr, cmd_data);
+
+	return SDW_CMD_IGNORED;
 }
 
 static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
@@ -291,7 +324,6 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_id;
 	u32 sts, value;
-	unsigned long flags;
 
 	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
 
@@ -304,8 +336,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	}
 
 	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
-	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS)
-		schedule_work(&ctrl->slave_work);
+	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS) {
+		qcom_swrm_get_device_status(ctrl);
+		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
+	}
 
 	/**
 	 * clear the interrupt before complete() is called, as complete can
@@ -314,15 +348,12 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	 */
 	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
 
-	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
-		spin_lock_irqsave(&ctrl->comp_lock, flags);
-		if (ctrl->comp)
-			complete(ctrl->comp);
-		spin_unlock_irqrestore(&ctrl->comp_lock, flags);
-	}
+	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
+		complete(&ctrl->broadcast);
 
 	return IRQ_HANDLED;
 }
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -570,16 +601,6 @@ static u32 qcom_swrm_freq_tbl[MAX_FREQ_NUM] = {
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
@@ -947,9 +968,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
-	spin_lock_init(&ctrl->comp_lock);
 	mutex_init(&ctrl->port_lock);
-	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
+	init_completion(&ctrl->broadcast);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
-- 
2.21.0

