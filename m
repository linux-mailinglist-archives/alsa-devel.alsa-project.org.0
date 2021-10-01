Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997D41EBC6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 13:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E493516E6;
	Fri,  1 Oct 2021 13:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E493516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633087498;
	bh=Y22uA0sf/qZE20Cz4EXcslHixgdb37pJys3Rhifibtg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTyObcATrvPMcyhxX5/Sb9wOERDzJbHNuqR674HsYa9dmPeG7OfOAjgH9NCp7YlWy
	 XZKAnIKBqTdigWigRTmqfXIsUR5jLh2ihYKYJ/NbmjolLfQe9YCouOGq+0LIotqare
	 lomMfV2fVfAdRCbmfdVgguOLAVMrkS8el7hHL/H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76797F804FF;
	Fri,  1 Oct 2021 13:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE018F804FE; Fri,  1 Oct 2021 13:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC362F804F1
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 13:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC362F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="gXO/radh"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633087340; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rME+nC0m199ZmuTpRVmVeo/Ci0Dmiq/V1rCel24i118=;
 b=gXO/radh/qFfTve4P/pCS2yOjMlQjSU/Eg4cXFBxiJNnGlPXJfwCXOSw2AE09GGcz02JmhGG
 cMV7KqNnOFZ0yUWYWpcxZLblk89IFWdvo1KQumgIjz0e96Ottqfur9M5G20aBM202VAtBPxl
 17el0LtNZou50wQndLJYZ7XIKh0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6156ef6747d64efb6d230c52 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 11:22:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7B40EC4361B; Fri,  1 Oct 2021 11:22:15 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76998C4338F;
 Fri,  1 Oct 2021 11:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 76998C4338F
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
Subject: [PATCH 4/8] ASoC: qcom: Add lapss CPU driver for codec dma control
Date: Fri,  1 Oct 2021 16:51:28 +0530
Message-Id: <1633087292-1378-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
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

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 263 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h         |   1 +
 2 files changed, 264 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
new file mode 100644
index 0000000..56b3791
--- /dev/null
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 The Linux Foundation. All rights reserved.
+ *
+ * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
+	int dir = substream->stream;
+	int ret, id;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rxtx_rd_dmactl;
+		map = drvdata->rxtx_lpaif_map;
+		id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			dmactl = drvdata->rxtx_wr_dmactl;
+			map = drvdata->rxtx_lpaif_map;
+			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			dmactl = drvdata->va_wr_dmactl;
+			map = drvdata->va_lpaif_map;
+			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = regmap_fields_write(dmactl->codec_intf, id, LPASS_CDC_DMA_RX0_INTERFACE);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+	    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl codec_fs_delay reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl codec_pack reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+
+	} else {
+		ret = regmap_fields_write(dmactl->codec_intf, id, LPASS_CDC_DMA_INTERFACE(dai_id));
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_intf reg field: %d\n", ret);
+			return ret;
+		}
+	    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_fs_sel reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_fs_delay reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_pack reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_enable reg field: %d\n", ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	int ret, i;
+
+	for (i = 0; i < drvdata->cdc_num_clks; i++) {
+		ret = clk_prepare_enable(drvdata->cdc_dma_clks[i]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	int i;
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	for (i = 0; i < drvdata->cdc_num_clks; i++)
+		clk_disable_unprepare(drvdata->cdc_dma_clks[i]);
+}
+
+static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpaif_dmactl *dmactl;
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	struct regmap *map;
+	int dir = substream->stream;
+	unsigned int ret, regval;
+	unsigned int channels = params_channels(params);
+	int id;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rxtx_rd_dmactl;
+		map = drvdata->rxtx_lpaif_map;
+		id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			dmactl = drvdata->rxtx_wr_dmactl;
+			map = drvdata->rxtx_lpaif_map;
+			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			dmactl = drvdata->va_wr_dmactl;
+			map = drvdata->va_lpaif_map;
+			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
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
+	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to rdmactl codec_channel reg field: %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
+
+static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	int dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int ret = 0, id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rxtx_rd_dmactl;
+		map = drvdata->rxtx_lpaif_map;
+		id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			dmactl = drvdata->rxtx_wr_dmactl;
+			map = drvdata->rxtx_lpaif_map;
+			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			dmactl = drvdata->va_wr_dmactl;
+			map = drvdata->va_lpaif_map;
+			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		__lpass_platform_codec_intf_init(dai, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+
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
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 058b42d..e0ea698 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -418,5 +418,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
 int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
 
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

