Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA463338C4B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF821729;
	Fri, 12 Mar 2021 13:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF821729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550591;
	bh=GH9Zx2fjGVbOMJPmIGAsUEw4wdgLkT1twbWfrXsgv+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1nlE+G3MTFXpyrWiJVFlMhmEiP3U9qgGMRYTXwT9pD8x+cLmg9Yv3sJUA29AuPPF
	 AKQogxq6fSK6RrQQU7R+bmuDkLdirtgA5VXGtfgRc5RgIIdIA3N5InR125Li1a2xoU
	 GJr5y5gC6QcsQz5AWbbCAy7dDO2agd5qtX5uO7tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9597EF8016C;
	Fri, 12 Mar 2021 13:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 525F8F80475; Fri, 12 Mar 2021 13:00:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38A50F802E7
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A50F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yuAwZqI5"
Received: by mail-wm1-x32b.google.com with SMTP id l19so3649578wmh.1
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PyVet0MMNWzuhpz0LymeggNR30pG1D8Q6fhrbm8pPJQ=;
 b=yuAwZqI5hE3Nk1PQHMW8alNtebLpjAxb00I/vDK2HYDGwbW19/3HnDctnAOISkpyKL
 /Yzey65rKRNHS924Cl1SQbOYbsfXCpf4/YjODLbIDtAqGBf6KbGRmU5oKxkBenIWKmr7
 buIa65ePyv/64ORhiczgM6Dqrl0lvpw9J3EdVr6y5J4R5g+5WmJjjY8Q3xhsudxqeOe+
 UVueMLxryIVAgUG+BhBZRG24VhrCcHSdWiPNKY2u0lc8QrUXnfiqMhZhSmIr8fJ98h4t
 ZsbB2KJwG2sjOelLn4VjIcJScq0cyZvJ5gZ+7PTXNDc2Lynp6VOoNHpFt52YSSyWtZ8u
 quOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PyVet0MMNWzuhpz0LymeggNR30pG1D8Q6fhrbm8pPJQ=;
 b=pg+nCkNTgbK9n967JWR80iy/QCESODaFmYr0I8LeuPKFngIUMDZVkXg9L+EwjwjF7w
 4bRd9omaA0GlubbFrxPtZEhrU94ZJsRNVqBBiCpPYUu2eMgDoS42p+3tioxGXY8dEMWo
 BRkUdGY2/nWlKKLfRVjquAGP5JL0hL5n/gjxYE+AiHM8yUzl60Pv2KSg+qF3XGXd9LFq
 8GNkH5x3wSlkZfGpTr7Jq44Cyl79MCS00ERv0Kz8o9DvVIBku+pbXJ239B17PdK8Ff0G
 9Z9yCPGp/biCoiP94xtKc4m0bVupgSHc7bMWx0kVoHUcL4PszjGUvBhFD6R9/kxrabDP
 fxtA==
X-Gm-Message-State: AOAM531yHxmqDsgn5u8EfjBCpF9+btwWKKh/IAHpRV898tiIob9kXMrH
 UH7mbm7eGttj7K9f7NbvPKVvAw==
X-Google-Smtp-Source: ABdhPJy9KcO9sDBKosM7tc7Jg0n438myr81vwQ09fMmyMQpHv/Hs5T5U8qaJ9Ym9nGmhjYyAyK+doA==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr12574908wmd.83.1615550429802; 
 Fri, 12 Mar 2021 04:00:29 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h25sm2268315wml.32.2021.03.12.04.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:00:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v4 6/9] soundwire: qcom: add support to new interrupts
Date: Fri, 12 Mar 2021 12:00:06 +0000
Message-Id: <20210312120009.22386-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
References: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
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

Add support to new interrupts which includes reporting some of the
error interrupts and adding support to SLAVE pending interrupt!

This patch also changes the interrupt handler behaviour on handling
any pending interrupts by checking it before returning out of irq handler.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 161 ++++++++++++++++++++++++++++++++-------
 1 file changed, 135 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 0cbd611fb8c6..6a563fb52444 100644
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
@@ -58,6 +69,7 @@
 #define SWRM_MCP_STATUS_BANK_NUM_MASK				BIT(0)
 #define SWRM_MCP_SLV_STATUS					0x1090
 #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
+#define SWRM_MCP_SLV_STATUS_SZ					2
 #define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_BLOCK_CTRL_1(n)		(0x112C + 0x100 * (n - 1))
@@ -123,6 +135,7 @@ struct qcom_swrm_ctrl {
 	int rows_index;
 	unsigned long dout_port_mask;
 	unsigned long din_port_mask;
+	u32 intr_mask;
 	u8 rcmd_id;
 	u8 wcmd_id;
 	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
@@ -304,6 +317,25 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
 	return SDW_CMD_IGNORED;
 }
 
+static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 val, status;
+	int dev_num;
+
+	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+
+	for (dev_num = 0; dev_num < SDW_MAX_DEVICES; dev_num++) {
+		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
+
+		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
+			ctrl->status[dev_num] = status;
+			return dev_num;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -322,36 +354,112 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
-	struct qcom_swrm_ctrl *ctrl = dev_id;
-	u32 sts, value;
+	struct qcom_swrm_ctrl *swrm = dev_id;
+	u32 value, intr_sts, intr_sts_masked;
+	u32 i;
+	u8 devnum = 0;
+	int ret = IRQ_HANDLED;
 
-	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
+	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
+	intr_sts_masked = intr_sts & swrm->intr_mask;
 
-	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
-		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
-		dev_err_ratelimited(ctrl->dev,
-				    "CMD error, fifo status 0x%x\n",
-				     value);
-		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
-	}
-
-	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
-	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS) {
-		qcom_swrm_get_device_status(ctrl);
-		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
-	}
-
-	/**
-	 * clear the interrupt before complete() is called, as complete can
-	 * schedule new read/writes which require interrupts, clearing the
-	 * interrupt would avoid missing interrupts in such cases.
-	 */
-	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
+	do {
+		for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
+			value = intr_sts_masked & (1 << i);
+			if (!value)
+				continue;
+
+			switch (value) {
+			case SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ:
+				devnum = qcom_swrm_get_alert_slave_dev_num(swrm);
+				if (devnum < 0) {
+					dev_err_ratelimited(swrm->dev,
+					    "no slave alert found.spurious interrupt\n");
+				} else {
+					sdw_handle_slave_status(&swrm->bus, swrm->status);
+				}
 
-	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
-		complete(&ctrl->broadcast);
+				break;
+			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
+			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
+				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
+					__func__);
+				qcom_swrm_get_device_status(swrm);
+				sdw_handle_slave_status(&swrm->bus, swrm->status);
+				break;
+			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
+				dev_err_ratelimited(swrm->dev,
+						"%s: SWR bus clsh detected\n",
+						__func__);
+				swrm->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
+				swrm->reg_write(swrm, SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
+				break;
+			case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
+				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+				dev_err_ratelimited(swrm->dev,
+					"%s: SWR read FIFO overflow fifo status 0x%x\n",
+					__func__, value);
+				break;
+			case SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW:
+				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+				dev_err_ratelimited(swrm->dev,
+					"%s: SWR read FIFO underflow fifo status 0x%x\n",
+					__func__, value);
+				break;
+			case SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW:
+				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+				dev_err(swrm->dev,
+					"%s: SWR write FIFO overflow fifo status %x\n",
+					__func__, value);
+				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
+				break;
+			case SWRM_INTERRUPT_STATUS_CMD_ERROR:
+				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+				dev_err_ratelimited(swrm->dev,
+					"%s: SWR CMD error, fifo status 0x%x, flushing fifo\n",
+					__func__, value);
+				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
+				break;
+			case SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION:
+				dev_err_ratelimited(swrm->dev,
+						"%s: SWR Port collision detected\n",
+						__func__);
+				swrm->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
+				swrm->reg_write(swrm,
+					SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
+				break;
+			case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
+				dev_err_ratelimited(swrm->dev,
+					"%s: SWR read enable valid mismatch\n",
+					__func__);
+				swrm->intr_mask &=
+					~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
+				swrm->reg_write(swrm,
+					SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
+				break;
+			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
+				complete(&swrm->broadcast);
+				break;
+			case SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2:
+				break;
+			case SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2:
+				break;
+			case SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP:
+				break;
+			default:
+				dev_err_ratelimited(swrm->dev,
+						"%s: SWR unknown interrupt value: %d\n",
+						__func__, value);
+				ret = IRQ_NONE;
+				break;
+			}
+		}
+		swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, intr_sts);
+		swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
+		intr_sts_masked = intr_sts & swrm->intr_mask;
+	} while (intr_sts_masked);
 
-	return IRQ_HANDLED;
+	return ret;
 }
 
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
@@ -367,6 +475,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Disable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
 
+	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
 	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
 			SWRM_INTERRUPT_STATUS_RMSK);
-- 
2.21.0

