Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630AF45ED82
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F041904;
	Fri, 26 Nov 2021 13:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F041904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928484;
	bh=TzgRMyrNfsG3Lap0tsqg5CgMa5cF5Upw5zF8bkA3EXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OHUSGw9teaOhy/qy0xN3jXVhplaVdfYfQUwgeXl2NT1338sLDhykVIOnGOFgdNOEE
	 kLr9JNC7rm9EILK1na6Ni7AYmoSP6YvNHtwy/Pdh2uhOQvVXjFMv6mH9EbXSooYsiM
	 /FOmIKI9mlnr7662ab72hnbI+HHlxZuLViK6bS/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E75F804FE;
	Fri, 26 Nov 2021 13:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E288F80507; Fri, 26 Nov 2021 13:05:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B29CCF804FF
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B29CCF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="N/Gy6Rl9"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637928328; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gfZjptcsym90LiI9eSUXLufde66rl+YpwpgkCPOjPlE=;
 b=N/Gy6Rl9ukoA46xADQF71DFRxRI9m4R3m20rZAqAmbBUFZMDeCeeYPhyuYIbwiUTRFPY/eFj
 zhQKny9MHew5pr+bOe6TIXPQfhBbUuoUlkbgEHkJA4uj5mNiFPCpqAhQJu6L9jhxF1+K5tN2
 gmS7FYSr5cOXGGdPnhYwfrOD4Uc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61a0cd85db3ac5552a774b1d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 12:05:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9EC46C43618; Fri, 26 Nov 2021 12:05:25 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 83DAAC43617;
 Fri, 26 Nov 2021 12:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 83DAAC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v6 04/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
Date: Fri, 26 Nov 2021 17:34:36 +0530
Message-Id: <1637928282-2819-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Add lpass cpu driver to support audio over codec dma for
ADSP bypass usecase.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 275 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h         |   1 +
 2 files changed, 276 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
new file mode 100644
index 0000000..4462178
--- /dev/null
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 The Linux Foundation. All rights reserved.
+ *
+ * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+enum codec_dma_interfaces {
+	LPASS_CDC_DMA_INTERFACE1 = 1,
+	LPASS_CDC_DMA_INTERFACE2,
+	LPASS_CDC_DMA_INTERFACE3,
+	LPASS_CDC_DMA_INTERFACE4,
+	LPASS_CDC_DMA_INTERFACE5,
+	LPASS_CDC_DMA_INTERFACE6,
+	LPASS_CDC_DMA_INTERFACE7,
+	LPASS_CDC_DMA_INTERFACE8,
+	LPASS_CDC_DMA_INTERFACE9,
+	LPASS_CDC_DMA_INTERFACE10,
+};
+
+static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+				      struct lpaif_dmactl **dmactl, int *id)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+		*dmactl = drvdata->rxtx_rd_dmactl;
+		*id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		*dmactl = drvdata->rxtx_wr_dmactl;
+		*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		break;
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+		*dmactl = drvdata->va_wr_dmactl;
+		*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		break;
+	default:
+		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
+		break;
+	}
+}
+
+static int __lpass_get_codec_dma_intf_type(int dai_id)
+{
+	int ret;
+
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX0:
+	case LPASS_CDC_DMA_VA_TX0:
+		ret = LPASS_CDC_DMA_INTERFACE1;
+		break;
+	case LPASS_CDC_DMA_RX1:
+	case LPASS_CDC_DMA_TX1:
+	case LPASS_CDC_DMA_VA_TX1:
+		ret = LPASS_CDC_DMA_INTERFACE2;
+		break;
+	case LPASS_CDC_DMA_RX2:
+	case LPASS_CDC_DMA_TX2:
+	case LPASS_CDC_DMA_VA_TX2:
+		ret = LPASS_CDC_DMA_INTERFACE3;
+		break;
+	case LPASS_CDC_DMA_RX3:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_VA_TX3:
+		ret = LPASS_CDC_DMA_INTERFACE4;
+		break;
+	case LPASS_CDC_DMA_RX4:
+	case LPASS_CDC_DMA_TX4:
+	case LPASS_CDC_DMA_VA_TX4:
+		ret = LPASS_CDC_DMA_INTERFACE5;
+		break;
+	case LPASS_CDC_DMA_RX5:
+	case LPASS_CDC_DMA_TX5:
+	case LPASS_CDC_DMA_VA_TX5:
+		ret = LPASS_CDC_DMA_INTERFACE6;
+		break;
+	case LPASS_CDC_DMA_RX6:
+	case LPASS_CDC_DMA_TX6:
+	case LPASS_CDC_DMA_VA_TX6:
+		ret = LPASS_CDC_DMA_INTERFACE7;
+		break;
+	case LPASS_CDC_DMA_RX7:
+	case LPASS_CDC_DMA_TX7:
+	case LPASS_CDC_DMA_VA_TX7:
+		ret = LPASS_CDC_DMA_INTERFACE8;
+		break;
+	case LPASS_CDC_DMA_RX8:
+	case LPASS_CDC_DMA_TX8:
+	case LPASS_CDC_DMA_VA_TX8:
+		ret = LPASS_CDC_DMA_INTERFACE9;
+		break;
+	case LPASS_CDC_DMA_RX9:
+		ret  = LPASS_CDC_DMA_INTERFACE10;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
+					    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpaif_dmactl *dmactl = NULL;
+	struct device *dev = soc_runtime->dev;
+	int ret, id, codec_intf;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	codec_intf = __lpass_get_codec_dma_intf_type(dai_id);
+	if (codec_intf < 0) {
+		dev_err(dev, "failed to get codec_intf: %d\n", codec_intf);
+		return codec_intf;
+	}
+
+	__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
+	if (!dmactl) {
+		dev_err(dev, "failed to get dmactl handle for dai_id: %d\n", dai_id);
+		return -EINVAL;
+	}
+
+	ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_intf reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_fs_sel reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_fs_delay reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_pack reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_enable reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	return clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
+}
+
+static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
+				      struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	clk_bulk_disable_unprepare(drvdata->cdc_num_clks, drvdata->cdc_clks);
+}
+
+static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct lpaif_dmactl *dmactl = NULL;
+	unsigned int ret, regval;
+	unsigned int channels = params_channels(params);
+	int id;
+
+	switch (channels) {
+	case 1:
+		regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
+		break;
+	case 2:
+		regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
+		break;
+	case 4:
+		regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
+		break;
+	case 6:
+		regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
+		break;
+	case 8:
+		regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
+		break;
+	default:
+		dev_err(soc_runtime->dev, "invalid PCM config\n");
+		return -EINVAL;
+	}
+
+	__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
+	if (!dmactl) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
+	}
+	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_channel reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
+				    int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct lpaif_dmactl *dmactl;
+	int ret = 0, id;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		__lpass_platform_codec_intf_init(dai, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
+		if (!dmactl) {
+			dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+			return -EINVAL;
+		}
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dmactl codec_enable reg: %d\n", ret);
+			return ret;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, cmd);
+		break;
+	}
+	return ret;
+}
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops = {
+	.startup	= lpass_wcd_daiops_startup,
+	.shutdown	= lpass_wcd_daiops_shutdown,
+	.hw_params	= lpass_wcd_daiops_hw_params,
+	.trigger	= lpass_wcd_daiops_trigger,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_wcd_dai_ops);
+
+MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 4142f12..48602c1 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -403,5 +403,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
 int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
 
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

