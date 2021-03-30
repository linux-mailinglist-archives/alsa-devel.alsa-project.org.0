Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2734EB09
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F971675;
	Tue, 30 Mar 2021 16:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F971675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115856;
	bh=c20J8Jm4jLWWULPsxJlXImv0u0dwQUSe2pY+mT0tZqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OuSY8onEARAC/EiD8i+gn3m9CFk6Ym3RDPQSvVfoOGsHOBdGEgRYuHKHfJK42KZc1
	 4pjODPvwTB0b7uJJ25y5gWAcWZBSdSNzoMg4ZySop9dLtBe/EY665nCerG4ezV/Fvd
	 MjMP0BN+eK/DQvg+dqLmkE7U67CaZ7FDnQSLER2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8626F804AF;
	Tue, 30 Mar 2021 16:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D63F8023E; Tue, 30 Mar 2021 16:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E61DCF8023E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61DCF8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RLzBjFWN"
Received: by mail-ej1-x62c.google.com with SMTP id u5so25251290ejn.8
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NagpBPmewIGobpClYjbr4VbFIIG7lSH4M1EpdzRLCM8=;
 b=RLzBjFWNwg/cj6Rn4q8332vODvASUggc4aCUDQccYpPpzSqZR6EgYKwxE2am2jc9Mm
 +DZKJMqaALfM3cOEhJ3H7JHILrE7ONMon9f5q9JmFvmuV8yDRkUJf+CqK8U8znCYLI0z
 AjlgNgF4zhtGN1sun8mhfXAmGJ6XRVsNvUsH+peWRl0DUDro/1SEJWnl0HQG/RG/08oJ
 InK+GE5GD7fTJvPL851HwgkSeRxmAancoCeD9FYEE/zDqETv523VD80VoH4WQq9CeDWq
 53J24qDfINq5AzWA9wZgqllx6OA/mWAVuaOsmvSQo1PScatJGC7Q1X9y29MK+M8pnXhd
 5u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NagpBPmewIGobpClYjbr4VbFIIG7lSH4M1EpdzRLCM8=;
 b=uRoLYZUTqrpnQ01XRwipermRpDGWqD4f+uS1D8NwK9qcxkhi5A1I9kRZ9rtAETjG9V
 dz2jpz7r7wk7UFJGDx3Wc/oyuLde4zPBlVf5cvrDtx+KNryP1CDhdMy4jho4kKOIHB6k
 n1UofadlFq4tam26NKgwTcBFpY8UowpBib16e/LfbJZlupatWzIE4/5pWifmp9ZzTYGA
 iXuJUBb2EoiSFYDz1fZn3Tmj0f5rTMwuZvmqxBHzaNhjQ8bZ7Z7d3yiWr/qC/jg7anwK
 Gi3xepMMuaJlXwZXWhGU68/v9UfybW1QLoaZImTOM67dngTykkcFuOEtwBN/B0W+FvaH
 mVyQ==
X-Gm-Message-State: AOAM530CHMtakfFMr9hsvmHIg6PHwCsrc5oeJo0UKoWSyWCBGiLyPnUu
 tHT9ltaHsZDwemgW8vmHcdJPaQ==
X-Google-Smtp-Source: ABdhPJx+LbRrQJR3yVOI4L7aQWSaMw+AEdxPdgr8RZBkOwi0B3w8maKPm80I5AtlDqqFRK3xvxcQGA==
X-Received: by 2002:a17:906:7c48:: with SMTP id
 g8mr34654915ejp.138.1617115654703; 
 Tue, 30 Mar 2021 07:47:34 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 5/9] soundwire: qcom: update register read/write routine
Date: Tue, 30 Mar 2021 15:47:15 +0100
Message-Id: <20210330144719.13284-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
References: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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
 drivers/soundwire/qcom.c | 179 ++++++++++++++++++++++-----------------
 1 file changed, 100 insertions(+), 79 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 0f2167433d2f..faa4c84dcf61 100644
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
@@ -198,77 +203,106 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
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
+	/* Its assumed that write is okay as we do not get any status back */
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
@@ -291,7 +325,6 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_id;
 	u32 sts, value;
-	unsigned long flags;
 
 	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
 
@@ -304,8 +337,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
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
@@ -314,15 +349,12 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
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
@@ -562,16 +594,6 @@ static u32 qcom_swrm_freq_tbl[MAX_FREQ_NUM] = {
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
@@ -930,9 +952,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
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

