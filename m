Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1CD1D36D8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 390D41669;
	Thu, 14 May 2020 18:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 390D41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589474663;
	bh=O+8phz9Nh3TCHggniDffvUklBzwLrpfR/vTBgUg6yyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqQd8WTPlHUa7I+6nBLY8dawfrBQktfIU6MhYOgwbLo67ltIPWfdWUWyND+VtRnAO
	 a7yXSTrlLOUyg78LlkpdV0rU+ooRYFHUhZZN3odmAwSXOtEombGqUJpHRSRzmsNmnx
	 kCrrg3Ql9/7c0fc7s6+49rQHaFbe7f0FjMyK7MqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F70F802E3;
	Thu, 14 May 2020 18:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79043F802E3; Thu, 14 May 2020 18:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B4DAF802E0
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B4DAF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="n6MFc5EV"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589474443; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gh+7XKcW4qhjuv0NWfjLPY1ugiOoe8hRg6HLf+b5KRw=;
 b=n6MFc5EVPLvgEIa53r7rcI56U1ywO3QInhI6i0FIjr/0JAnHSEbTYGGX8XPRPkOkKB+4clb8
 dgBxvGI6nwcge+NvFnQ4SBkaWEYKxSSGpAVaByX4aCnN1sU3vf1hQ0CpRQasfMO8S7V2cFfT
 TsqKeA18kq8GhGEe56OdPxGJMiQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd7480.7f8d2f802d88-smtp-out-n03;
 Thu, 14 May 2020 16:40:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C395C432C2; Thu, 14 May 2020 16:40:31 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77875C433D2;
 Thu, 14 May 2020 16:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77875C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH v2 7/7] ASoC: qcom: lpass-sc7180: Add platform driver for
 lpass audio
Date: Thu, 14 May 2020 22:08:18 +0530
Message-Id: <1589474298-29437-8-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <ajitp@codeaurora.org>
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

Create a platform driver for configuring sc7180 lpass core I2S and
DMA configuration to support playback & capture to external codecs
connected over primary & secondary MI2S interfaces.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/Kconfig        |   5 +
 sound/soc/qcom/Makefile       |   2 +
 sound/soc/qcom/lpass-sc7180.c | 252 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-sc7180.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index f51b28d..17f44ea 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -24,6 +24,11 @@ config SND_SOC_LPASS_APQ8016
 	select SND_SOC_LPASS_CPU
 	select SND_SOC_LPASS_PLATFORM
 
+config SND_SOC_LPASS_SC7180
+	tristate
+	select SND_SOC_LPASS_CPU
+	select SND_SOC_LPASS_PLATFORM
+
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
 	depends on SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 41b2c7a..7972c94 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -4,11 +4,13 @@ snd-soc-lpass-cpu-objs := lpass-cpu.o
 snd-soc-lpass-platform-objs := lpass-platform.o
 snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
 snd-soc-lpass-apq8016-objs := lpass-apq8016.o
+snd-soc-lpass-sc7180-objs := lpass-sc7180.o
 
 obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
 obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
 obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
 obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
+obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
 
 # Machine
 snd-soc-storm-objs := storm.o
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
new file mode 100644
index 0000000..f483c2b
--- /dev/null
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ *
+ * lpass-sc7180.c -- ALSA SoC platform-machine driver for QTi LPASS
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
+	[MI2S_PRIMARY] = {
+		.id = MI2S_PRIMARY,
+		.name = "Primary MI2S",
+		.playback = {
+			.stream_name = "Primary Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "Primary Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+	},
+
+	[MI2S_SECONDARY] = {
+		.id = MI2S_SECONDARY,
+		.name = "Secondary MI2S",
+		.playback = {
+			.stream_name = "Secondary Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+	},
+};
+
+static int sc7180_init_dmactl_bitfields(struct lpaif_dmactl *dmactl,
+					 struct regmap *map,
+					 unsigned int reg)
+{
+	struct reg_field bursten = DMACTL_BURSTEN_V2_FLD(reg);
+	struct reg_field wpscnt = DMACTL_WPSCNT_V2_FLD(reg);
+	struct reg_field fifowm = DMACTL_FIFOWM_V2_FLD(reg);
+	struct reg_field intf = DMACTL_AUDINTF_V2_FLD(reg);
+	struct reg_field enable = DMACTL_ENABLE_V2_FLD(reg);
+	struct reg_field dyncclk = DMACTL_DYNCLK_V2_FLD(reg);
+
+	dmactl->bursten = regmap_field_alloc(map, bursten);
+	dmactl->wpscnt = regmap_field_alloc(map, wpscnt);
+	dmactl->fifowm = regmap_field_alloc(map, fifowm);
+	dmactl->intf = regmap_field_alloc(map, intf);
+	dmactl->enable = regmap_field_alloc(map, enable);
+	dmactl->dyncclk = regmap_field_alloc(map, dyncclk);
+
+	if (IS_ERR(dmactl->bursten) || IS_ERR(dmactl->wpscnt) ||
+	    IS_ERR(dmactl->fifowm) || IS_ERR(dmactl->intf) ||
+	    IS_ERR(dmactl->enable) || IS_ERR(dmactl->dyncclk))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
+					   int direction)
+{
+	struct lpass_variant *v = drvdata->variant;
+	int chan = 0;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+					v->rdma_channels);
+
+		if (chan >= v->rdma_channels)
+			return -EBUSY;
+	} else {
+		chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+					v->wrdma_channel_start +
+					v->wrdma_channels,
+					v->wrdma_channel_start);
+
+		if (chan >=  v->wrdma_channel_start + v->wrdma_channels)
+			return -EBUSY;
+	}
+
+	set_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return chan;
+}
+
+static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
+{
+	clear_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return 0;
+}
+
+static int sc7180_init_i2sctl_bitfields(struct lpaif_i2sctl *i2sctl,
+					struct regmap *map, unsigned int reg)
+{
+	struct reg_field loopback = I2SCTL_LOOPBACK_V2_FLD(reg);
+	struct reg_field spken = I2SCTL_SPKEN_V2_FLD(reg);
+	struct reg_field spkmode = I2SCTL_SPKMODE_V2_FLD(reg);
+	struct reg_field spkmono = I2SCTL_SPKMONO_V2_FLD(reg);
+	struct reg_field micen = I2SCTL_MICEN_V2_FLD(reg);
+	struct reg_field micmode = I2SCTL_MICMODE_V2_FLD(reg);
+	struct reg_field micmono = I2SCTL_MICMONO_V2_FLD(reg);
+	struct reg_field wssrc = I2SCTL_WSSRC_V2_FLD(reg);
+	struct reg_field bitwidth = I2SCTL_BITWIDTH_V2_FLD(reg);
+
+	i2sctl->loopback = regmap_field_alloc(map, loopback);
+	i2sctl->spken = regmap_field_alloc(map, spken);
+	i2sctl->spkmode = regmap_field_alloc(map, spkmode);
+	i2sctl->spkmono = regmap_field_alloc(map, spkmono);
+	i2sctl->micen = regmap_field_alloc(map, micen);
+	i2sctl->micmode = regmap_field_alloc(map, micmode);
+	i2sctl->micmono = regmap_field_alloc(map, micmono);
+	i2sctl->wssrc = regmap_field_alloc(map, wssrc);
+	i2sctl->bitwidth = regmap_field_alloc(map, bitwidth);
+
+	if (IS_ERR(i2sctl->loopback) || IS_ERR(i2sctl->spken) ||
+	    IS_ERR(i2sctl->spkmode) || IS_ERR(i2sctl->spkmono) ||
+	    IS_ERR(i2sctl->micen) || IS_ERR(i2sctl->micmode) ||
+	    IS_ERR(i2sctl->micmono) || IS_ERR(i2sctl->wssrc) ||
+	    IS_ERR(i2sctl->bitwidth))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int sc7180_lpass_init(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
+				     sizeof(*drvdata->clks), GFP_KERNEL);
+	drvdata->num_clks = variant->num_clks;
+
+	for (i = 0; i < drvdata->num_clks; i++)
+		drvdata->clks[i].id = variant->clk_name[i];
+
+	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "Failed to get clocks %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "sc7180 clk_enable failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sc7180_lpass_exit(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+
+	return 0;
+}
+
+static struct lpass_variant sc7180_data = {
+	.i2sctrl_reg_base	= 0x1000,
+	.i2sctrl_reg_stride	= 0x1000,
+	.i2s_ports		= 3,
+	.irq_reg_base		= 0x9000,
+	.irq_reg_stride		= 0x1000,
+	.irq_ports		= 3,
+	.rdma_reg_base		= 0xC000,
+	.rdma_reg_stride	= 0x1000,
+	.rdma_channels		= 5,
+	.dmactl_audif_start	= 1,
+	.wrdma_reg_base		= 0x18000,
+	.wrdma_reg_stride	= 0x1000,
+	.wrdma_channel_start	= 5,
+	.wrdma_channels		= 4,
+	.clk_name		= (const char*[]) {
+				   "noc",
+				   "audio-core",
+				   "sysnoc_mport",
+				},
+	.num_clks		= 3,
+	.dai_driver		= sc7180_lpass_cpu_dai_driver,
+	.num_dai		= ARRAY_SIZE(sc7180_lpass_cpu_dai_driver),
+	.dai_osr_clk_names      = (const char *[]) {
+				   "mclk0",
+				   "null",
+				},
+	.dai_bit_clk_names      = (const char *[]) {
+				   "pri_ibit",
+				   "sec_ibit",
+				},
+	.init			= sc7180_lpass_init,
+	.exit			= sc7180_lpass_exit,
+	.alloc_dma_channel	= sc7180_lpass_alloc_dma_channel,
+	.free_dma_channel	= sc7180_lpass_free_dma_channel,
+	.init_i2sctl_fields	= sc7180_init_i2sctl_bitfields,
+	.init_dmactl_fields	= sc7180_init_dmactl_bitfields,
+};
+
+static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
+	{.compatible = "qcom,lpass-cpu-sc7180", .data = &sc7180_data},
+	{}
+};
+
+static struct platform_driver sc7180_lpass_cpu_platform_driver = {
+	.driver = {
+		.name = "sc7180-lpass-cpu",
+		.of_match_table = of_match_ptr(sc7180_lpass_cpu_device_id),
+	},
+	.probe = asoc_qcom_lpass_cpu_platform_probe,
+	.remove = asoc_qcom_lpass_cpu_platform_probe,
+};
+
+module_platform_driver(sc7180_lpass_cpu_platform_driver);
+
+MODULE_DESCRIPTION("SC7180 LPASS CPU DRIVER");
+MODULE_LICENSE("GPL v2");
-- 
('The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project')
