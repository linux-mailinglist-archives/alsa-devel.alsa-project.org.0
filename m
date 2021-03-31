Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA752350534
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 19:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B04167D;
	Wed, 31 Mar 2021 19:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B04167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617210173;
	bh=lvt8xA3BI1mHjYajqAWOj2J7+O+WOW1r4evh7BIovYQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jfW24x/LZtoBCUuQ1n7HEAjG4OljMc64/K69qlchqCc/689gMo04GYCWsIsN86XYl
	 ThnnIg4mdIEbYTrICnF1ijHvwVLAHksmvY/F0EXu21F+8d/4x1Bl3mhwf6smAZke2Y
	 kr0yCO6hV/LvAGMqOcer2i21VYavPBadvrHx+1jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A88B8F8016E;
	Wed, 31 Mar 2021 19:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4217CF80166; Wed, 31 Mar 2021 19:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F210F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 19:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F210F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mfCmqZgp"
Received: by mail-ej1-x632.google.com with SMTP id w3so31158115ejc.4
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KspNwzuOj9aLMXGk2fyODvGz7byP37BIX3QwCShIa1U=;
 b=mfCmqZgpg+o9P0WseEbaUpCianBH4aueY2MbD8bcRz6g31+B/W8uqpCcIgaz3s+6w9
 B0DEL4KazRRSF3ycZPlJQacoS5R8vwFLdizPiIHLKr6NRPhtivQPzY+ydqccz6WdECeF
 O9w8aBRWZXB8CrStVsCGVOg+VVpeXOAUuUBrDsrfoLGjN8uatANCivyzTQta7ROHu8Om
 0H+2zkFEz0BU4WV9JH4KXpWpxC/tZFC+aYcgqc6ccm8dJwzce/71lo6OmV9/nkpe8sII
 VARSSWDSzJMYOlQHWKnHElfGLNq7GnFgsyJkbOZj9zOYYqrGYbr2dMUE8Fx2wy7+8uJ2
 RNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KspNwzuOj9aLMXGk2fyODvGz7byP37BIX3QwCShIa1U=;
 b=QgZk7DpYok8YqYA5zZq6P585xijL9/s7F1J+eUnrmCDpBo1akgv3u+fasfogYyw/xC
 5P7K8niQHphwxWjwwSMF2nycyIQE+nxRsh7tC0j7oPdR94jm6HzWn61sHIVsFwvGz/MR
 JeLIPIJ61nmImV7UpmlEJnhDI75M0VCdr2wFAF40WSBMuB+r7Si6Uoj89L8mYQfsQgVm
 47U1pdtT9sjNkrhhfqoAd9FlbfrhwwL9m4GfetB+9RfS59DRj9je9mtxAUFPGYCmSVfm
 2/+0PZTJI1FuXEnKheP0u43/XfMVspSZu8yBwCmvRdjWeVaUItJZYWQgB4zeJtnZ/9E1
 xURA==
X-Gm-Message-State: AOAM533cbErRs0pwrCoR9534m52BtyoWjaGJQ7TEc31QX5BgwNwWrXJh
 xbtm0Y7ZIEan7JSFF3RXibk8vQ==
X-Google-Smtp-Source: ABdhPJyZ/YGsfKKEJ78XYWOEq3oaf4XoaUn3hoN0mkzXk+2J11yt+vHn3WhwhlT7kxbdZeQ4exjF9A==
X-Received: by 2002:a17:906:3882:: with SMTP id
 q2mr4587674ejd.540.1617210076003; 
 Wed, 31 Mar 2021 10:01:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id rs24sm1515247ejb.75.2021.03.31.10.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 10:01:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: wait for fifo space to be available before
 read/write
Date: Wed, 31 Mar 2021 18:00:33 +0100
Message-Id: <20210331170033.17174-1-srinivas.kandagatla@linaro.org>
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
 drivers/soundwire/qcom.c | 74 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6affa3cd4039..9b45717577f2 100644
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
@@ -238,6 +245,63 @@ static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
 	return val;
 }
 
+static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
+{
+	u32 fifo_outstanding_cmd, value;
+	u8 fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
+
+	/* Check for fifo underflow during read */
+	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+	fifo_outstanding_cmd = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
+
+	 /* Check number of outstanding commands in fifo before read */
+	if (fifo_outstanding_cmd)
+		return 0;
+
+	do {
+		usleep_range(500, 510);
+		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+		fifo_outstanding_cmd = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
+		if (fifo_outstanding_cmd > 0)
+			break;
+	} while (fifo_retry_count--);
+
+	if (fifo_outstanding_cmd == 0) {
+		dev_err_ratelimited(swrm->dev, "%s err read underflow\n", __func__);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
+{
+	u32 fifo_outstanding_cmd, value;
+	u8 fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
+
+	/* Check for fifo overflow during write */
+	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+	fifo_outstanding_cmd = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
+
+	/* Check number of outstanding commands in fifo before write */
+	if (fifo_outstanding_cmd != swrm->wr_fifo_depth)
+		return 0;
+
+	do {
+		usleep_range(500, 510);
+		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+		fifo_outstanding_cmd = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
+		if (fifo_outstanding_cmd < swrm->wr_fifo_depth)
+			break;
+	} while (fifo_retry_count--);
+
+	if (fifo_outstanding_cmd == swrm->wr_fifo_depth) {
+		dev_err_ratelimited(swrm->dev, "%s err write overflow\n", __func__);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
 
 static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 				     u8 dev_addr, u16 reg_addr)
@@ -256,6 +320,9 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 					      dev_addr, reg_addr);
 	}
 
+	if (swrm_wait_for_wr_fifo_avail(swrm))
+		return SDW_CMD_FAIL_OTHER;
+
 	/* Its assumed that write is okay as we do not get any status back */
 	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
 
@@ -295,6 +362,9 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
 	/* wait for FIFO RD CMD complete to avoid overflow */
 	usleep_range(250, 255);
 
+	if (swrm_wait_for_rd_fifo_avail(swrm))
+		return SDW_CMD_FAIL_OTHER;
+
 	do {
 		swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
 		rval[0] = cmd_data & 0xFF;
@@ -586,6 +656,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
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

