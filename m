Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95B32660E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:06:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BA01682;
	Fri, 26 Feb 2021 18:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BA01682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614359195;
	bh=MCQfHMEndN2KJLq/RzkH5tUJURCq0lqVzek0x//QQQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItZaMFmUokCRO1+5ehFv9o2xAIX7Bo893gDlNX3EMOLfTFhXO0LkGWUB/LizRsQkr
	 i9Lqk2SfmR9FvvCVxQaxoVwynZCQbvokxFaOTbUha/TCERPGS2ikX3v4QOlmkoGwLp
	 sMe+Th9DeQXgRPeYZYbWMzt06mehTOqK0wpIolDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D86F802E3;
	Fri, 26 Feb 2021 18:04:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB27F802D2; Fri, 26 Feb 2021 18:04:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4764BF80234
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4764BF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mCmKujyW"
Received: by mail-wm1-x336.google.com with SMTP id u11so2270078wmq.5
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSGBCXrnmFpcu9xP5Fu7hsNHkO8470wY7hVrqUDHTAc=;
 b=mCmKujyWV4+5a493B2ZFwQYeR1S4UnXxLT86/P0wYWvxvK2pVK3rI4M5T5qfZAI1MK
 2dxJ4HNje167kd5u7tpeZLxN3YupJAf7U2A5WhBb2tKfUzJdgPiLoszVKRA3blpodd76
 VUp5psDPVBtfVJ0ijxsIsXp4PTbgslSCAReGcdy0z7ijh4HY+OLrfLXChwouuLy2txma
 WY+4V4lF5qQfl5cAm0EZ6Uqp4KfZbBeI2+yCJmOrDC4JUzh7kuj95frYjWRqILEZPzFe
 skh4cTzjQfkzswDx1f9Mo0kpJ9lqW+Nn/EiEiToBVwb2X3AIEGD39Oypbw0ImLjKpln9
 meig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSGBCXrnmFpcu9xP5Fu7hsNHkO8470wY7hVrqUDHTAc=;
 b=izsqtq4zpEJGEemSBSOFplbWKDemGai4Vb+fM/Va1IT3eIXVD+rrwbCAs81UuwBurq
 2/WlSAPQLci4/abHgUdkSu8eGBJHhbXbVLUEcX8Hu9+9Rkna9CJR5Sev+4OIv0Anro6x
 WF+vuibCGSFhFkFZ9iOwa3dHIGayw2Khw1y7O7pznMrBUfQvTEOpOEQoBkdQNSeh7pl1
 o/dTM7EKHNvS164AXKpT+sI1pR961NvJ5qQJ/uxhl7Ll0bAxyTmZG3EpGGjjfHAB88Rn
 sD3XUlmQMSTJriGb6d+f/R60gFQugcizJDe7nl1iuzf8vu1Y6puiG3tDrC8QmpzghMIi
 DCOw==
X-Gm-Message-State: AOAM533UHCMmIRp7wAtO6JQovrthxF2Wi+f0zF/w/wNUHF6dSNYigLMa
 XaEU320qHTlZtQrwh1YlPrZw61VyfryKzw==
X-Google-Smtp-Source: ABdhPJw1bnUklU6l3SzESpOTeCGIfijBQDbl01b6ZyWLgaLOFxabRdBFxfHoI8mJcb9fmA7LQMi2uA==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr3842454wmd.130.1614359051501; 
 Fri, 26 Feb 2021 09:04:11 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id w13sm15962972wre.2.2021.02.26.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:04:11 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: qcom: add clock stop via runtime pm support
Date: Fri, 26 Feb 2021 17:02:50 +0000
Message-Id: <20210226170250.9067-4-srinivas.kandagatla@linaro.org>
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

Add Clock stop feature support using runtime PM.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 103 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d90eba6a1e88..0cf8c5c724e2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/slimbus.h>
@@ -19,6 +20,8 @@
 #include <sound/soc.h>
 #include "bus.h"
 
+#define SWRM_COMP_SW_RESET					(0x008)
+#define SWRM_COMP_STATUS					(0x014)
 #define SWRM_COMP_HW_VERSION					0x00
 #define SWRM_COMP_CFG_ADDR					0x04
 #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
@@ -408,6 +411,9 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 			}
 		}
 	}
+	pm_runtime_get_sync(ctrl->dev);
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
 
 	complete(&ctrl->enumeration);
 	return 0;
@@ -421,6 +427,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	u8 devnum = 0;
 	int ret = IRQ_HANDLED;
 
+	clk_prepare_enable(swrm->hclk);
 	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
 	intr_sts_masked = intr_sts & swrm->intr_mask;
 
@@ -529,6 +536,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 		intr_sts_masked = intr_sts & swrm->intr_mask;
 	} while (intr_sts_masked);
 
+	clk_disable_unprepare(swrm->hclk);
 	return ret;
 }
 
@@ -587,6 +595,8 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	int ret, i, len;
 
+	pm_runtime_get_sync(ctrl->dev);
+
 	if (msg->flags == SDW_MSG_FLAG_READ) {
 		for (i = 0; i < msg->len;) {
 			if ((msg->len - i) < QCOM_SWRM_MAX_RD_LEN)
@@ -598,7 +608,7 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 							msg->addr + i, len,
 						       &msg->buf[i]);
 			if (ret)
-				return ret;
+				goto done;
 
 			i = i + len;
 		}
@@ -607,12 +617,20 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
 							msg->dev_num,
 						       msg->addr + i);
-			if (ret)
-				return SDW_CMD_IGNORED;
+			if (ret) {
+				ret = SDW_CMD_IGNORED;
+				goto done;
+			}
 		}
 	}
 
+	pm_runtime_put_autosuspend(ctrl->dev);
+	pm_runtime_mark_last_busy(ctrl->dev);
 	return SDW_CMD_OK;
+done:
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
+	return ret;
 }
 
 static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
@@ -620,13 +638,19 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	u32 reg = SWRM_MCP_FRAME_CTRL_BANK_ADDR(bus->params.next_bank);
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 val;
+	int ret;
 
+	pm_runtime_get_sync(ctrl->dev);
 	ctrl->reg_read(ctrl, reg, &val);
 
 	u32p_replace_bits(&val, ctrl->cols_index, SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK);
 	u32p_replace_bits(&val, ctrl->rows_index, SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK);
 
-	return ctrl->reg_write(ctrl, reg, val);
+	ret = ctrl->reg_write(ctrl, reg, val);
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
+
+	return ret;
 }
 
 static int qcom_swrm_port_params(struct sdw_bus *bus,
@@ -634,13 +658,18 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 				 unsigned int bank)
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	int ret = 0;
+	pm_runtime_get_sync(ctrl->dev);
 
 	if (p_params->bps != SWR_INVALID_PARAM)
-		return ctrl->reg_write(ctrl,
+		ret = ctrl->reg_write(ctrl,
 				       SWRM_DP_BLOCK_CTRL_1(p_params->num),
 				       p_params->bps - 1);
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
 
-	return 0;
+
+	return ret;
 }
 
 static int qcom_swrm_transport_params(struct sdw_bus *bus,
@@ -651,6 +680,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	u32 value;
 	int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
 	int ret;
+	pm_runtime_get_sync(ctrl->dev);
 
 	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
 	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
@@ -685,6 +715,9 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
 		ret = ctrl->reg_write(ctrl, reg, params->blk_pkg_mode);
 	}
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
+
 
 	return ret;
 }
@@ -696,6 +729,9 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 val;
+	int ret;
+
+	pm_runtime_get_sync(ctrl->dev);
 
 	ctrl->reg_read(ctrl, reg, &val);
 
@@ -704,7 +740,11 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 	else
 		val &= ~(0xff << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
 
-	return ctrl->reg_write(ctrl, reg, val);
+	ret  = ctrl->reg_write(ctrl, reg, val);
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
+
+	return ret;
 }
 
 static const struct sdw_master_port_ops qcom_swrm_port_ops = {
@@ -1194,6 +1234,13 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
+	pm_runtime_set_autosuspend_delay(dev, 30000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	return 0;
 
 err_master_add:
@@ -1214,6 +1261,47 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int swrm_runtime_resume(struct device *dev)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+
+	reinit_completion(&ctrl->enumeration);
+	clk_prepare_enable(ctrl->hclk);
+	ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
+	qcom_swrm_get_device_status(ctrl);
+	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
+	qcom_swrm_init(ctrl);
+	wait_for_completion_timeout(&ctrl->enumeration,
+					msecs_to_jiffies(TIMEOUT_MS));
+	usleep_range(100, 105);
+
+	pm_runtime_mark_last_busy(dev);
+
+	return 0;
+}
+
+static int __maybe_unused swrm_runtime_suspend(struct device *dev)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+
+	/* Mask bus clash interrupt */
+	ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
+	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
+	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+	/* clock stop sequence */
+	qcom_swrm_cmd_fifo_wr_cmd(ctrl, 0x2, 0xF, SDW_SCP_CTRL);
+
+	clk_disable_unprepare(ctrl->hclk);
+
+	usleep_range(100, 105);
+
+	return 0;
+}
+
+static const struct dev_pm_ops swrm_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
+};
+
 static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
 	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
@@ -1228,6 +1316,7 @@ static struct platform_driver qcom_swrm_driver = {
 	.driver = {
 		.name	= "qcom-soundwire",
 		.of_match_table = qcom_swrm_of_match,
+		.pm = &swrm_dev_pm_ops,
 	}
 };
 module_platform_driver(qcom_swrm_driver);
-- 
2.21.0

