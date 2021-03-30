Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D134EB0E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DAD0169D;
	Tue, 30 Mar 2021 16:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DAD0169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115872;
	bh=7oGS8sjqwWq+W88Itw4zIOM6hgQRkLmlvQpt4w8qHkU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5IEs7hmXbLHnRWehLTn3wxSTnkC5LS90l5pULa9mGdjYbvEV8uhhfyRzT0Ib8OdG
	 wRFz+8aSXNVIoX+Uf5y4qUX4wJoAkPnvRCLwE1LfzXABxRfteqfUOrGD4h6ArOaHAl
	 1zvWBRpGh8u9eFsGP3/xwdEa4dcdcasBViTiYHZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 813DEF804B4;
	Tue, 30 Mar 2021 16:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C31B3F804AB; Tue, 30 Mar 2021 16:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 980A5F80425
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 980A5F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yWKXS/Es"
Received: by mail-ed1-x52e.google.com with SMTP id l18so18537793edc.9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdgRcDUqvxdVTHvtsiK+mNjOO9P7JIyTzvTk1ge6DVA=;
 b=yWKXS/Esu+CP2JquUFXRo6KE9qfV1tTmADTCc/bVxdfep0umEFUcdQDMmJ/7p1x6Ke
 9KnSw1OE+TQt7H25ba18usowtLygxkWqy+dpSParPsI5gQTQzKpnH7lIodsK86XGL3Yj
 QBe0ylgicHprDdGEgq7Mph3De/ZMaTxLBijn87ee8bFGowFbl38O7RjK5wMcU8i20V7D
 j10PHM5lynvpyQTu2mLII+1PEetgiyytd9GnXT12L1rlaD9i5k3L6pgOTbLrEZJQPwkD
 VhytMx6IgvL9HBzhir6QD40YxhGnGzxQ+PyaHbN6O2a6PG69juRKeCMqvgDWAZZmpIhN
 AMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdgRcDUqvxdVTHvtsiK+mNjOO9P7JIyTzvTk1ge6DVA=;
 b=DRa+ogyjiV1eTNgo36Vez6I1zxZzdqsLduU4CU0EFCWM2ryJl9R4dkZS3h6YP6M7yH
 HoUbnJj+b/qD6PYkzC14UGRq2IdJbBPJuNItlVg54s7+Lw1U7f13IEAQMj3/HTnQQDQ1
 afi4c8dplZV60EP1cMLQOksZlJBObbR0iJ8YD1JhFxeWXVVs/bUg4O1z01z6UxLss4BL
 8QhhJBQTARC2xLtYsNm0NeDR7t1nhP2nZ2aJzVesL61FvZjiW2C29zR0J65lk3kneqIA
 cB+B6gzviMKvnwYJPErCVi9bKUu5ih/9q9YtfSGAkcHn5/g2erHhyZkCpqAR7nr+VJmG
 jsyQ==
X-Gm-Message-State: AOAM533s6X8BdoHCHcBwTnCjP3CP8eX+abTX4b7qDn24VZJyiQxCS8YE
 R850kzxZzuv+ZRIxXG+XeTJ8Xg==
X-Google-Smtp-Source: ABdhPJzyR3NwvmMc1NSQCsQ6q5E9W6S6ZjCukVgVFwTQPK7nKU1iV0aY/YWSLg+9Hkdiy2l9ZeUk/w==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr33735147edt.36.1617115658080; 
 Tue, 30 Mar 2021 07:47:38 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 8/9] soundwire: qcom: add auto enumeration support
Date: Tue, 30 Mar 2021 15:47:18 +0100
Message-Id: <20210330144719.13284-9-srinivas.kandagatla@linaro.org>
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

Qualcomm SoundWire controller supports Auto Enumeration of the
devices within the IP. This patch enables support for this feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 86 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 1ad07784db4b..b1dbaf8263e5 100644
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
@@ -343,6 +346,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	int i;
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+	ctrl->slave_status = val;
 
 	for (i = 0; i < SDW_MAX_DEVICES; i++) {
 		u32 s;
@@ -353,10 +357,74 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	}
 }
 
+static void qcom_swrm_set_slave_dev_num(struct sdw_bus *bus,
+					struct sdw_slave *slave, int devnum)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 status;
+
+	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &status);
+	status = (status >> (devnum * SWRM_MCP_SLV_STATUS_SZ));
+	status &= SWRM_MCP_SLV_STATUS_MASK;
+
+	if (status == SDW_SLAVE_ATTACHED) {
+		if (slave)
+			slave->dev_num = devnum;
+		mutex_lock(&bus->bus_lock);
+		set_bit(devnum, bus->assigned);
+		mutex_unlock(&bus->bus_lock);
+	}
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
+				qcom_swrm_set_slave_dev_num(bus, slave, i);
+				found = true;
+				break;
+			}
+		}
+
+		if (!found) {
+			qcom_swrm_set_slave_dev_num(bus, NULL, i);
+			sdw_slave_add(bus, &id, NULL);
+		}
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
@@ -385,8 +453,15 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
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
@@ -473,8 +548,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
-	/* Disable Auto enumeration */
-	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
+	/* Enable Auto enumeration */
+	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
@@ -508,6 +583,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
+	ctrl->slave_status = 0;
 	return 0;
 }
 
-- 
2.21.0

