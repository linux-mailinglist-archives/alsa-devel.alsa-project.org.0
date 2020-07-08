Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA5217F04
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 07:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67628165E;
	Wed,  8 Jul 2020 07:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67628165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594185426;
	bh=OjRGsx+zBlIIIbDhGpVKv/LRJguOuHZK9HO76E8eliE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hihs5EuO9QgnlZEw8MtUcsjM8V0gf1vPL0NAGwdV9RQ8YFzdKCqG6G2wGlkuN+F+J
	 jx4GA+UJO5LoEqKm8NjEdvjOLFEvzWBd7gwd3cnYDpJEbqBChlOo8vygiMEXVJWHnK
	 OZ3j3Zo37re2NFKbjniucqK9xbwRGy6Kh5EOWDSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A92F80161;
	Wed,  8 Jul 2020 07:15:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618F7F8015C; Wed,  8 Jul 2020 07:15:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF139F80150
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 07:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF139F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="kyNyx5Np"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594185313; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DqngTMN8bZvP5c/5P7DMgEaEbgXzsIHVVYA1hFd9HjI=;
 b=kyNyx5Np3HGV5477KR8dTyo8DSyWVRSHDecCC/o7kNyIawQ0RgmhgXlseCWAgdKicqQI+gSt
 NYItTu1BcT6cwDWvUvBCMuvFxHp1HfEfSuFxxjY3WZYtvjjJ56dBI0BAsgCw4YwXCLJHZGn2
 0BH+9q0e48Az5ieVqBo8LjhP5LI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f0556589b7f1f3df7443fe6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 05:15:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A15B1C433A1; Wed,  8 Jul 2020 05:15:04 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 946A2C433C8;
 Wed,  8 Jul 2020 05:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 946A2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND][PATCH v3 7/8] ASoC: qcom: lpass-sc7180: Add platform driver
 for lpass audio
Date: Wed,  8 Jul 2020 10:44:46 +0530
Message-Id: <1594185286-11323-1-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Rohit kumar <rohitkr@codeaurora.org>, Ajit Pandey <ajitp@codeaurora.org>
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

From: Ajit Pandey <ajitp@codeaurora.org>

Add platform driver for configuring sc7180 lpass core I2S and
DMA configuration to support playback & capture to external codecs
connected over primary & secondary MI2S interfaces.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
Resending to update Signed-off mail id.

 sound/soc/qcom/Kconfig        |   5 +
 sound/soc/qcom/Makefile       |   2 +
 sound/soc/qcom/lpass-sc7180.c | 216 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-sc7180.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 0ea4cde..87bec7f 100644
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
index 00000000..dd85a97
--- /dev/null
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -0,0 +1,216 @@
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
+
+	.loopback		= REG_FIELD_ID(0x1000, 17, 17, 3, 0x1000),
+	.spken			= REG_FIELD_ID(0x1000, 16, 16, 3, 0x1000),
+	.spkmode		= REG_FIELD_ID(0x1000, 11, 15, 3, 0x1000),
+	.spkmono		= REG_FIELD_ID(0x1000, 10, 10, 3, 0x1000),
+	.micen			= REG_FIELD_ID(0x1000, 9, 9, 3, 0x1000),
+	.micmode		= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
+	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
+	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
+	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
+
+	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
+	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
+	.rdma_wpscnt		= REG_FIELD_ID(0xC000, 16, 19, 5, 0x1000),
+	.rdma_intf		= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
+	.rdma_fifowm		= REG_FIELD_ID(0xC000, 1, 5, 5, 0x1000),
+	.rdma_enable		= REG_FIELD_ID(0xC000, 0, 0, 5, 0x1000),
+
+	.wrdma_dyncclk		= REG_FIELD_ID(0x18000, 22, 22, 4, 0x1000),
+	.wrdma_bursten		= REG_FIELD_ID(0x18000, 21, 21, 4, 0x1000),
+	.wrdma_wpscnt		= REG_FIELD_ID(0x18000, 17, 20, 4, 0x1000),
+	.wrdma_intf		= REG_FIELD_ID(0x18000, 12, 16, 4, 0x1000),
+	.wrdma_fifowm		= REG_FIELD_ID(0x18000, 1, 5, 4, 0x1000),
+	.wrdma_enable		= REG_FIELD_ID(0x18000, 0, 0, 4, 0x1000),
+
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
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

