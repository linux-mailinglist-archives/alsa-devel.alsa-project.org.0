Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB1326611
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:06:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A300A16A8;
	Fri, 26 Feb 2021 18:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A300A16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614359207;
	bh=DKKDRKXVRC311Hj/Kl0D3TmTV38CtEDug7xs1l/GH0s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJoQzTOW0wRwMmRoAq3ANOghPjbjMosDcTFmFnqnxzMgo+QdMMPyebib1ielNAXIK
	 8SKbkflbS/LiLqcf+kyvgZozHflJsaAbrXNH/sWZf/TAEZc76vIk+gh+XTOMni0xgU
	 pd4HlR6UsN8WmaJ27VPeg9pkiBlu13ApIpBiidoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D34A6F8032D;
	Fri, 26 Feb 2021 18:04:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BEE1F80234; Fri, 26 Feb 2021 18:04:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBDE0F8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBDE0F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l770UNXt"
Received: by mail-wm1-x330.google.com with SMTP id n4so6985491wmq.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UFwBCm6HrJKHxscAt59AxdAYrvfQ1oAdw/JgYFUJbXY=;
 b=l770UNXtFuPJoYAmuiZ45pNtSa0Xh65CavALPfvZSZz8KUtQlMoJbY92RvYw+PvxlH
 xFUHRwN05sCSIaMt3iAZ2pmxJhKY84S9KsIz9/aeMaTKfKdtZIBAQLIdUM4ghmm95lJB
 g8zTqZgLRU+Y2W3t4wPMr7ICsNmb3QSv7n/1jcT8LeDXy290uflmsIOgXffqSYnVOYAm
 Ye4SGqQUdNW7w6vT98J0kwopl2IYhR8Ks1dz1mnlFb7RkyIKNLZLz2dQOIgyYeqt0h3d
 K4FaHMR0aG3aTCCW5YVyrBFnHgpJq+2rtmQwiLPhb+sFVJdzsNqtkHd7Ss3mYGmHJ/a7
 ZpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UFwBCm6HrJKHxscAt59AxdAYrvfQ1oAdw/JgYFUJbXY=;
 b=TyBbq0XxrpGiC2VmQ8NUh/PjmWoqMaRDXY+9af81tlSZULpNqrGtnLf3TSwhjQjfRb
 8BqW6RlnCrzgrYL4snR2biPaK6ew7oZ1RwEBafF0nspn7JOs9Hfl2k0bTrOYpnawba/u
 9IK1VZ9o82VYlorSbg4fUJn9fgkwEzGQI7E2Kei3cdNvPapSa+IWsFSyxv4Wk+LiTueO
 vNRo8UHzwXUpTXePQuMuCZMpJL68FFWU2ST5KmJ2J+IRpNshMFRd7PZpYsBSzeBGgki0
 ou/wEL3i7hVrjs/okwK2RwHon3Eb2wKw4DgSHpxa58XNuGbGxm4tSOATFYqYLwD2DtEf
 ReaA==
X-Gm-Message-State: AOAM532mGSWL2C2hhxZcjRMxIAkNEB2xIoUUTrNb7pK8jX1Mj2TsL2tO
 dQwgBQA9I8XJglH9tTwK8WOg8A==
X-Google-Smtp-Source: ABdhPJyaWV4rGjsm+DtbdD0ua/bhu8nDmtycZVp8fJVqSHrTe2CJiv8Lz2q+1aZ3Do7PUcpfDbllUA==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr3908239wmi.34.1614359050443;
 Fri, 26 Feb 2021 09:04:10 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id w13sm15962972wre.2.2021.02.26.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:04:09 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 2/3] soundwire: qcom: add auto enumeration support
Date: Fri, 26 Feb 2021 17:02:49 +0000
Message-Id: <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
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
 1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 8438f9812d7c..d90eba6a1e88 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -57,6 +57,8 @@
 #define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
 #define SWRM_RD_FIFO_CMD_ID_MASK				GENMASK(11, 8)
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
+#define SWRM_ENUMERATOR_SLAVE_DEV_ID_1(m)		(0x530 + 0x8 * (m))
+#define SWRM_ENUMERATOR_SLAVE_DEV_ID_2(m)   		(0x534 + 0x8 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
@@ -121,6 +123,7 @@ struct qcom_swrm_ctrl {
 	struct regmap *regmap;
 	void __iomem *mmio;
 	struct completion broadcast;
+	struct completion enumeration;
 	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
@@ -143,6 +146,7 @@ struct qcom_swrm_ctrl {
 	enum sdw_slave_status status[SDW_MAX_DEVICES];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
+	u32 slave_status;
 };
 
 struct qcom_swrm_data {
@@ -342,6 +346,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	int i;
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+	ctrl->slave_status = val;
 
 	for (i = 0; i < SDW_MAX_DEVICES; i++) {
 		u32 s;
@@ -352,10 +357,66 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
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
+	u64 addr;
+	int i;
+	char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
+
+	for (i = 1; i < (SDW_MAX_DEVICES + 1); i++) {
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
+		/* Now compare with entries */
+		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
+			if (sdw_compare_devid(slave, id) == 0) {
+				u32 status = qcom_swrm_get_n_device_status(ctrl, i);
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
+	}
+
+	complete(&ctrl->enumeration);
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
@@ -382,10 +443,19 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				break;
 			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
 			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
-				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
+				dev_err_ratelimited(swrm->dev, "%s: SWR slave status changed\n",
 					__func__);
-				qcom_swrm_get_device_status(swrm);
-				sdw_handle_slave_status(&swrm->bus, swrm->status);
+				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
+				if (swrm->slave_status == slave_status) {
+					dev_err(swrm->dev, "Slave status not changed %x\n",
+						slave_status);
+					break;
+				} else {
+					dev_err(swrm->dev, "Slave status handle %x\n", slave_status);
+					qcom_swrm_get_device_status(swrm);
+					qcom_swrm_enumerate(&swrm->bus);
+					sdw_handle_slave_status(&swrm->bus, swrm->status);
+				}
 				break;
 			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
 				dev_err_ratelimited(swrm->dev,
@@ -472,8 +542,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
-	/* Disable Auto enumeration */
-	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
+	/* Enable Auto enumeration */
+	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
@@ -507,6 +577,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
+	ctrl->slave_status = 0;
 	return 0;
 }
 
@@ -1068,6 +1139,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
 	init_completion(&ctrl->broadcast);
+	init_completion(&ctrl->enumeration);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
-- 
2.21.0

