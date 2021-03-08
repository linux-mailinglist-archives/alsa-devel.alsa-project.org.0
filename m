Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F66331012
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE13176B;
	Mon,  8 Mar 2021 14:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE13176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615211694;
	bh=Nkm4NyfdM9mjWR0SL/lqvxj//pshO6VTTzXNxW+jzGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1e/D7riI8lg946xZyPWz0fT0QjEcbXP2wPJWlJXjlmcjotigPBRNM/c8eGMe3mB3
	 lTtbUr9bzbV+hNG+yhFy6WQ7+it4t0FFoj7NLuAw7DFxTL6Yw+UwpVj6fxWlm3j8I8
	 uG+kZDAtW4hiGOlztMuY/xkK6lgm0X7ZYjs/9jF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FDFF804D8;
	Mon,  8 Mar 2021 14:50:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE3C9F8032C; Mon,  8 Mar 2021 14:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1885F8032C
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1885F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="u/W+m7nQ"
Received: by mail-wm1-x32f.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso3834609wma.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOp+qRZu2gKah0IFBSsnvDyVDByPi75OS4T/F8F3HTo=;
 b=u/W+m7nQHI1UmupI+STM7bhnMrsZkbFCr1JOHLGnc49qYbMAYCMKthAXcBkHjcyS0g
 nJNJMK4S3wV/WHAaFosNazUU+CtA0ozCO5MMhhEDY7mk84wAiDgQIJ3XpgoHqx1SrP5L
 wiDbNGWij0odJrPxrwxGNVzUS9T6TFfmG0rtnlPdHrjP3KJHNW73Cb9Krn5KrW9KG33s
 gaE6aR1sFqjBYDfETEZVZB3rnkSmnGrdQGQF2r5vU2RuGoQAdlwKZuBslu/YcWIOZ6nN
 J4HypVg9vszqvthSmYfa3K5L6/g3+fUZk1Tbt58cEbxFfT0+G4tu3hPyXaH0X4n/BNzO
 Sh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOp+qRZu2gKah0IFBSsnvDyVDByPi75OS4T/F8F3HTo=;
 b=qb2JeTkZQP1ImJb3c6emMaNclkxhuqHkE9iGtavuyAn5xrqZyjdKuRkKOF66okPBCO
 YJoarCs8v1m6Isj8NSyYaXiw6g+g32wGnJ5XsT/QYawEe3SavdKbbSyfE9AwVpav5NEt
 IekT5RQ6S/Y32FGQ0U4DtCqENznLStYkwKeFIVzP8v7H4VkXC4y9DujizRywMlFZEy0S
 PcgEsny08ldF9so8eHZFiq0qcfSbxAnJ6GU2yjCtsECVlgkTFBKELjIhw0Dl1hrk1eCi
 kuABkH8gCWCQoF6HSUKU3dbSkYRajQEg3s9kVVYLGxWxEUZo1RB6Jh3ZRnQeOIiC356k
 VUGQ==
X-Gm-Message-State: AOAM531w1m/nhiM3xYBH54tRzwmqXeLqlN2av0vl6UaBHLwwQWfsXzqB
 USEYoiDMOjVFBmYQKcaMdd6ynw==
X-Google-Smtp-Source: ABdhPJxRcdQb83ODTgBwFsAIY/EMZ8fcWlCx7EzLQtN4ylbRXwciHA27L1U+VJ20FbkWCsw0AbIvWg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr11767608wmq.141.1615211414107; 
 Mon, 08 Mar 2021 05:50:14 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h22sm19490589wmb.36.2021.03.08.05.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:50:13 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v3 8/9] soundwire: qcom: add auto enumeration support
Date: Mon,  8 Mar 2021 13:49:56 +0000
Message-Id: <20210308134957.16024-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
References: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
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

Qualcomm SoundWire controller supports Auto Enumeration of the
devices within the IP. This patch enables support for this feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 84 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 2a53da521626..3109ec6c33ac 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -57,6 +57,8 @@
 #define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
 #define SWRM_RD_FIFO_CMD_ID_MASK				GENMASK(11, 8)
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
+#define SWRM_ENUMERATOR_SLAVE_DEV_ID_1(m)		(0x530 + 0x8 * (m))
+#define SWRM_ENUMERATOR_SLAVE_DEV_ID_2(m)		(0x534 + 0x8 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
@@ -143,6 +145,7 @@ struct qcom_swrm_ctrl {
 	enum sdw_slave_status status[SDW_MAX_DEVICES];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
+	u32 slave_status;
 };
 
 struct qcom_swrm_data {
@@ -342,6 +345,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	int i;
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+	ctrl->slave_status = val;
 
 	for (i = 0; i < SDW_MAX_DEVICES; i++) {
 		u32 s;
@@ -352,10 +356,72 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	}
 }
 
+static int qcom_swrm_get_n_device_status(struct qcom_swrm_ctrl *ctrl, int devnum)
+{
+	u32 val;
+
+	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+	val = (val >> (devnum * SWRM_MCP_SLV_STATUS_SZ));
+	val &= SWRM_MCP_SLV_STATUS_MASK;
+
+	return val;
+}
+
+static int qcom_swrm_enumerate(struct sdw_bus *bus)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct sdw_slave *slave, *_s;
+	struct sdw_slave_id id;
+	u32 val1, val2;
+	bool found;
+	u64 addr;
+	int i;
+	char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
+
+	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
+		/*SCP_Devid5 - Devid 4*/
+		ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
+
+		/*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
+		ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);
+
+		if (!val1 && !val2)
+			break;
+
+		addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
+			((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
+			((u64)buf1[0] << 40);
+
+		sdw_extract_slave_id(bus, addr, &id);
+		found = false;
+		/* Now compare with entries */
+		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
+			if (sdw_compare_devid(slave, id) == 0) {
+				u32 status = qcom_swrm_get_n_device_status(ctrl, i);
+
+				found = true;
+				if (status == SDW_SLAVE_ATTACHED) {
+					slave->dev_num = i;
+					mutex_lock(&bus->bus_lock);
+					set_bit(i, bus->assigned);
+					mutex_unlock(&bus->bus_lock);
+
+				}
+				break;
+			}
+		}
+
+		if (!found)
+			sdw_slave_add(bus, &id, NULL);
+	}
+
+	return 0;
+}
+
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *swrm = dev_id;
-	u32 value, intr_sts, intr_sts_masked;
+	u32 value, intr_sts, intr_sts_masked, slave_status;
 	u32 i;
 	u8 devnum = 0;
 	int ret = IRQ_HANDLED;
@@ -384,8 +450,15 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
 				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
 					__func__);
-				qcom_swrm_get_device_status(swrm);
-				sdw_handle_slave_status(&swrm->bus, swrm->status);
+				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
+				if (swrm->slave_status == slave_status) {
+					dev_err(swrm->dev, "Slave status not changed %x\n",
+						slave_status);
+				} else {
+					qcom_swrm_get_device_status(swrm);
+					qcom_swrm_enumerate(&swrm->bus);
+					sdw_handle_slave_status(&swrm->bus, swrm->status);
+				}
 				break;
 			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
 				dev_err_ratelimited(swrm->dev,
@@ -472,8 +545,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
-	/* Disable Auto enumeration */
-	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
+	/* Enable Auto enumeration */
+	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
@@ -507,6 +580,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
+	ctrl->slave_status = 0;
 	return 0;
 }
 
-- 
2.21.0

