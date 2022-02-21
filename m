Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B34BD924
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 11:43:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042301695;
	Mon, 21 Feb 2022 11:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042301695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645440198;
	bh=BpRDITN5byLhz8jVygp1nNvxAU9oVFtliH7PkbKoyro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GOxwo9oWNX/b+zDOpsp0qfef9oOzErT4E4Eysq4sjmAmav5QUJ0tukwi0hnlgQvIG
	 be7Eaw5u+vDgeL+EYIHMzylNKllY30RIzr/tm72/ITY3fzAfksPdmWh8y80ieimoSl
	 qkFOFHCax4+Mo9ZhCAC0wwE9iYlUC04M7ESg0aCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28D9F800FA;
	Mon, 21 Feb 2022 11:41:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE33F80516; Mon, 21 Feb 2022 11:41:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B1CAF80139
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 11:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B1CAF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OfsXYcjL"
Received: by mail-wr1-x435.google.com with SMTP id d3so10600707wrf.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 02:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5u3/tjplSbqBvtv+CBLeJGiOWDAXG28Kg+gjvP6yzs=;
 b=OfsXYcjLe0Pa80cVcxnRTOtZ7+c5BlxackmLVJIdwvnrCgJ3M53PK2/ooaVS6oWl5v
 7a4z9FKfbxXklj0IakAJvzFjiO4b24fad1VOg2n3JdLJrYPF2gGTxi8xaH2rTl50pKrP
 89l/SF+XvRTSn7YT7q2ywopGtjP7All7CB0QaOJXRsToVKy/DQEY+6/5YVPRI+jMtpMQ
 kyHMUnbcU8PTZVNMmFlgmDtxCrcmEkUdkCEKU9zMf/5PA147i694oCzOdQkDPi+/22Xr
 sRx/KhelK+Wy9NKCjXOU4sy0ziaxujbE7CHHDGqC1q/m/03HSFKnAuUtAr7td+DH2j/y
 phUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5u3/tjplSbqBvtv+CBLeJGiOWDAXG28Kg+gjvP6yzs=;
 b=gC3B4q1vUyOQ+rh+rwJXefTDMNK5nhv3R9bLfzw+Jbshnk4g4d48U9JdAhNRr2QaZr
 E+Yo840v4Cbhdt8ajMUuGxNl0OwCqBPbdd7S27Mg/e16vCAX/WlPXHHITNVJRZaZb9f7
 x9zoNXXf1yRZEK9wOFMgxkbexmAi9oCPDzAa0CVT9whcu4EM9yeLTKA+X5riJ26Efadq
 agEeGbAcsSlzMCIdys15bPbGv75kq5CUhOeENfvqGmQUudse990hs9W7NYG75QPb5BD3
 Dj4bnX2HVVpILi6PXQjrSKFyTWM6WWuAwRPbCKfVvuJVowkaxNlYOGpzUl+F/ol68KLs
 G/DQ==
X-Gm-Message-State: AOAM532VHqxaCMOpD6gDQWl/FdKFnES0R9cMGXPXR6yUN/VbUHaszaF8
 U24BmoJM5TFnE1uHgCj/Cx+teA==
X-Google-Smtp-Source: ABdhPJzY+draSc+xcUZXs87PrrqgPD4blTi4+DXCDX9LaPaldj4TGaB+vs9fcyL7Ah7398OqmA+f9w==
X-Received: by 2002:adf:f644:0:b0:1e3:bfed:6eb5 with SMTP id
 x4-20020adff644000000b001e3bfed6eb5mr15181547wrp.654.1645440100186; 
 Mon, 21 Feb 2022 02:41:40 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm7584817wmq.44.2022.02.21.02.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 02:41:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/3] soundwire: qcom: add runtime pm support
Date: Mon, 21 Feb 2022 10:41:25 +0000
Message-Id: <20220221104127.15670-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Add support to runtime PM using SoundWire clock stop on supported instances
and bus reset on instances that require full reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 150 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 54813417ef8e..3b2eb95a7e96 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/slimbus.h>
@@ -20,6 +21,9 @@
 #include <sound/soc.h>
 #include "bus.h"
 
+#define SWRM_COMP_SW_RESET					0x008
+#define SWRM_COMP_STATUS					0x014
+#define SWRM_FRM_GEN_ENABLED					BIT(0)
 #define SWRM_COMP_HW_VERSION					0x00
 #define SWRM_COMP_CFG_ADDR					0x04
 #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
@@ -29,6 +33,7 @@
 #define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
 #define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
 #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
+#define SWRM_COMP_MASTER_ID					0x104
 #define SWRM_INTERRUPT_STATUS					0x200
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
 #define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
@@ -111,6 +116,13 @@
 #define SWR_MAX_CMD_ID	14
 #define MAX_FIFO_RD_RETRY 3
 #define SWR_OVERFLOW_RETRY_COUNT 30
+#define SWRM_LINK_STATUS_RETRY_CNT 100
+
+enum {
+	MASTER_ID_WSA = 1,
+	MASTER_ID_RX,
+	MASTER_ID_TX
+};
 
 struct qcom_swrm_port_config {
 	u8 si;
@@ -159,6 +171,7 @@ struct qcom_swrm_ctrl {
 	u32 slave_status;
 	u32 wr_fifo_depth;
 	u32 rd_fifo_depth;
+	bool clk_stop_bus_reset;
 };
 
 struct qcom_swrm_data {
@@ -497,6 +510,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	u32 i;
 	int devnum;
 	int ret = IRQ_HANDLED;
+	clk_prepare_enable(swrm->hclk);
 
 	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
 	intr_sts_masked = intr_sts & swrm->intr_mask;
@@ -604,6 +618,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 		intr_sts_masked = intr_sts & swrm->intr_mask;
 	} while (intr_sts_masked);
 
+	clk_disable_unprepare(swrm->hclk);
 	return ret;
 }
 
@@ -1017,6 +1032,15 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
+	ret = pm_runtime_get_sync(ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(ctrl->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
+		return ret;
+	}
+
 	sruntime = sdw_alloc_stream(dai->name);
 	if (!sruntime)
 		return -ENOMEM;
@@ -1044,6 +1068,9 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 
 	sdw_release_stream(ctrl->sruntime[dai->id]);
 	ctrl->sruntime[dai->id] = NULL;
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
+
 }
 
 static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
@@ -1197,12 +1224,23 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 static int swrm_reg_show(struct seq_file *s_file, void *data)
 {
 	struct qcom_swrm_ctrl *swrm = s_file->private;
-	int reg, reg_val;
+	int reg, reg_val, ret;
+
+	ret = pm_runtime_get_sync(swrm->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(swrm->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(swrm->dev);
+	}
 
 	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
 		swrm->reg_read(swrm, reg, &reg_val);
 		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
 	}
+	pm_runtime_mark_last_busy(swrm->dev);
+	pm_runtime_put_autosuspend(swrm->dev);
+
 
 	return 0;
 }
@@ -1267,6 +1305,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
+	ctrl->bus.clk_stop_timeout = 300;
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
@@ -1319,6 +1358,21 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	/* Clk stop is not supported on WSA Soundwire masters */
+	if (ctrl->version <= 0x01030000) {
+		ctrl->clk_stop_bus_reset = true;
+	} else {
+		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
+		if (val == MASTER_ID_WSA)
+			ctrl->clk_stop_bus_reset = true;
+	}
+
 #ifdef CONFIG_DEBUG_FS
 	ctrl->debugfs = debugfs_create_dir("qualcomm-sdw", ctrl->bus.debugfs);
 	debugfs_create_file("qualcomm-registers", 0400, ctrl->debugfs, ctrl,
@@ -1345,6 +1399,99 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *swrm)
+{
+	int retry = SWRM_LINK_STATUS_RETRY_CNT;
+	int comp_sts;
+
+	do {
+		swrm->reg_read(swrm, SWRM_COMP_STATUS, &comp_sts);
+
+		if (comp_sts & SWRM_FRM_GEN_ENABLED)
+			return true;
+
+		usleep_range(500, 510);
+	} while (retry--);
+
+	dev_err(swrm->dev, "%s: link status not %s\n", __func__,
+		comp_sts && SWRM_FRM_GEN_ENABLED ? "connected" : "disconnected");
+
+	return false;
+}
+
+static int swrm_runtime_resume(struct device *dev)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+	int ret;
+
+	clk_prepare_enable(ctrl->hclk);
+
+	if (ctrl->clk_stop_bus_reset) {
+		reinit_completion(&ctrl->enumeration);
+		ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
+		qcom_swrm_get_device_status(ctrl);
+		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
+		qcom_swrm_init(ctrl);
+		wait_for_completion_timeout(&ctrl->enumeration,
+					    msecs_to_jiffies(TIMEOUT_MS));
+	} else {
+		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR,
+			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
+
+		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+
+		usleep_range(100, 105);
+	}
+
+	if (!swrm_wait_for_frame_gen_enabled(ctrl))
+		dev_err(ctrl->dev, "link failed to connect\n");
+
+	usleep_range(300, 305);
+	ret = sdw_bus_exit_clk_stop(&ctrl->bus);
+	if (ret < 0)
+		dev_err(ctrl->dev, "bus failed to exit clock stop %d\n", ret);
+
+	return 0;
+}
+
+static int __maybe_unused swrm_runtime_suspend(struct device *dev)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+	int ret;
+
+	if (!ctrl->clk_stop_bus_reset) {
+		/* Mask bus clash interrupt */
+		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+	}
+	/* Prepare slaves for clock stop */
+	ret = sdw_bus_prep_clk_stop(&ctrl->bus);
+	if (ret < 0) {
+		dev_err(dev, "prepare clock stop failed %d", ret);
+		return ret;
+	}
+
+	ret = sdw_bus_clk_stop(&ctrl->bus);
+	if (ret < 0 && ret != -ENODATA) {
+		dev_err(dev, "bus clock stop failed %d", ret);
+		return ret;
+	}
+
+	clk_disable_unprepare(ctrl->hclk);
+
+	usleep_range(300, 305);
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
@@ -1359,6 +1506,7 @@ static struct platform_driver qcom_swrm_driver = {
 	.driver = {
 		.name	= "qcom-soundwire",
 		.of_match_table = qcom_swrm_of_match,
+		.pm = &swrm_dev_pm_ops,
 	}
 };
 module_platform_driver(qcom_swrm_driver);
-- 
2.21.0

