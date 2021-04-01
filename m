Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A4351165
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 11:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558351693;
	Thu,  1 Apr 2021 11:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558351693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617267780;
	bh=2Z7pl3qeedDT0vwd1NM+8xmk4y/QZW6X+cvMch0f3q0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EBoJtmREPTv2Dc2RhZtODQKG8mKAKCFkpaS/NN4pfW4GBm60KCyfBJir++1q2KQz3
	 gjlDiAyJjEnvmjvPmIeyWJYmoIUTdBSE7HNAwnI5MwQu30xQlRcAaJe2BxY4WnB424
	 mrVDLAWzbHyKzLwSAH2AWaXcWQ78EQQXMUlybttQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA969F8026F;
	Thu,  1 Apr 2021 11:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5386F8026B; Thu,  1 Apr 2021 11:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89802F8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 11:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89802F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FEl2YMxT"
Received: by mail-ej1-x636.google.com with SMTP id u5so1752123ejn.8
 for <alsa-devel@alsa-project.org>; Thu, 01 Apr 2021 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeawG8MSfVqkUaUQtWGB1XMFCzIepDytNa9lre7e8Mw=;
 b=FEl2YMxTXVENiSYhVxaNieJr41QVaMPMGAbtjUf0Lcupljd9MFs4+63s/XEefLX86R
 j5pyDaWxXXyH+dA3uC9nREG6q9KH91YJevjvLMEA74/8t061DdCnVSgNU0LlpUaBoSdC
 etLUdWLlFDQvbOxuzIfkrR6e9+C3bZ+KmNQCkF7e6Asm3NqVojfmMsI4h8WR7NoR9bWN
 olH/pHoqmabUJbIDL2hHPAOPsNVGjKyoEZF4p77ig+wSAAnXyWZcw7O5ckhq+RdSfVOy
 A2RvwCS7fHrckzzFc99HthIuDG/Nsk1GhY0qp/q+eTKc/FVmfkOF18vif9+qlO+dh9I5
 MZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeawG8MSfVqkUaUQtWGB1XMFCzIepDytNa9lre7e8Mw=;
 b=pIKZrHU2SRb3eJt3aq53jQFopBqSY+KXwJ2QQBV1hnrOADh+bPpPvvItFn+QE+M4Fl
 SFNn47pKLTXnTW6CGqPUg01/my5eA5ygwwQTcV9Vqx2OC5tUOu8xJbmCK2JxXOgmnEYu
 bHY+PFn220HKPJ98pT8JhTdfXd/1mUfMC1Wte8/T5O/L0aJJCK6iqH+JjrPnebhPXR/m
 SUnF8puuyU/xpVg1vpfHBEQdbzCPcjDr58tD5ORrv68nX/VT7NK5PXvXboET5jAlUjc3
 0CePSMjTi/xdyqIX5UFmn+W1kSa+lcczekhSqJpXevyD5CzKPDoKP6jbOrSG+AIJWyS6
 m+7Q==
X-Gm-Message-State: AOAM531teyMWmFb1vzK7MQCgakXSTrRaOuTQps6THLSyvRWErRBMkrCj
 iGLUnzzsZkWNA5+o0jc5speIZg==
X-Google-Smtp-Source: ABdhPJyND7NWGHCHO2SVFXcbvtjRs4Uug5GLJ9Z0wsMVcYpCzK4a0hP/S/pqmI46Vcx93pGbGdmXIQ==
X-Received: by 2002:a17:906:b202:: with SMTP id
 p2mr8135406ejz.244.1617267680719; 
 Thu, 01 Apr 2021 02:01:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q26sm2500264eja.45.2021.04.01.02.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:01:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2] soundwire: qcom: wait for fifo space to be available
 before read/write
Date: Thu,  1 Apr 2021 10:00:58 +0100
Message-Id: <20210401090058.24041-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
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

If we write registers very fast we can endup in a situation where some
of the writes will be dropped without any notice.

So wait for the fifo space to be available before reading/writing the
soundwire registers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

Changes since v1:
        merged some of the loop code to make it simple as suggested by Pierre
        updated error code and comments as suggested by Vinod


 drivers/soundwire/qcom.c | 66 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6affa3cd4039..5fd4a99cc8ac 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -24,6 +24,8 @@
 #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
 #define SWRM_COMP_CFG_ENABLE_MSK				BIT(0)
 #define SWRM_COMP_PARAMS					0x100
+#define SWRM_COMP_PARAMS_WR_FIFO_DEPTH				GENMASK(14, 10)
+#define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
 #define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
 #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
 #define SWRM_INTERRUPT_STATUS					0x200
@@ -51,6 +53,8 @@
 #define SWRM_CMD_FIFO_CMD					0x308
 #define SWRM_CMD_FIFO_FLUSH					0x1
 #define SWRM_CMD_FIFO_STATUS					0x30C
+#define SWRM_RD_CMD_FIFO_CNT_MASK				GENMASK(20, 16)
+#define SWRM_WR_CMD_FIFO_CNT_MASK				GENMASK(12, 8)
 #define SWRM_CMD_FIFO_CFG_ADDR					0x314
 #define SWRM_CONTINUE_EXEC_ON_CMD_IGNORE			BIT(31)
 #define SWRM_RD_WR_CMD_RETRIES					0x7
@@ -104,6 +108,7 @@
 #define SWR_BROADCAST_CMD_ID    0x0F
 #define SWR_MAX_CMD_ID	14
 #define MAX_FIFO_RD_RETRY 3
+#define SWR_OVERFLOW_RETRY_COUNT 30
 
 struct qcom_swrm_port_config {
 	u8 si;
@@ -147,6 +152,8 @@ struct qcom_swrm_ctrl {
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 	u32 slave_status;
+	u32 wr_fifo_depth;
+	u32 rd_fifo_depth;
 };
 
 struct qcom_swrm_data {
@@ -238,6 +245,55 @@ static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
 	return val;
 }
 
+static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
+{
+	u32 fifo_outstanding_data, value;
+	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
+
+	do {
+		/* Check for fifo underflow during read */
+		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+		fifo_outstanding_data = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
+
+		/* Check if read data is available in read fifo */
+		if (fifo_outstanding_data > 0)
+			return 0;
+
+		usleep_range(500, 510);
+	} while (fifo_retry_count--);
+
+	if (fifo_outstanding_data == 0) {
+		dev_err_ratelimited(swrm->dev, "%s err read underflow\n", __func__);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
+{
+	u32 fifo_outstanding_cmds, value;
+	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
+
+	do {
+		/* Check for fifo overflow during write */
+		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+		fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
+
+		/* Check for space in write fifo before writing */
+		if (fifo_outstanding_cmds < swrm->wr_fifo_depth)
+			return 0;
+
+		usleep_range(500, 510);
+	} while (fifo_retry_count--);
+
+	if (fifo_outstanding_cmds == swrm->wr_fifo_depth) {
+		dev_err_ratelimited(swrm->dev, "%s err write overflow\n", __func__);
+		return -EIO;
+	}
+
+	return 0;
+}
 
 static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 				     u8 dev_addr, u16 reg_addr)
@@ -256,6 +312,9 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 					      dev_addr, reg_addr);
 	}
 
+	if (swrm_wait_for_wr_fifo_avail(swrm))
+		return SDW_CMD_FAIL_OTHER;
+
 	/* Its assumed that write is okay as we do not get any status back */
 	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
 
@@ -295,6 +354,9 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
 	/* wait for FIFO RD CMD complete to avoid overflow */
 	usleep_range(250, 255);
 
+	if (swrm_wait_for_rd_fifo_avail(swrm))
+		return SDW_CMD_FAIL_OTHER;
+
 	do {
 		swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
 		rval[0] = cmd_data & 0xFF;
@@ -586,6 +648,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
 	ctrl->slave_status = 0;
+	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
+	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
+	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+
 	return 0;
 }
 
-- 
2.21.0

