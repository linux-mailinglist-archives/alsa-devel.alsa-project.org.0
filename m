Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5103B422940
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7568416A0;
	Tue,  5 Oct 2021 15:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7568416A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633442162;
	bh=/0CQs/fe7xqdWbixDjAGTfALs0wiveUuqOb85GL/vhA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QJBYXtDdyNeDVeBMaQLkYVfxxL2ulxCo2OZIxT2Pht8K49JQv5pF07y0YJfTVIA8P
	 WDs01nRA+hhqfIMxwLRN/bII6dZXjW3G33B377YgGd3dOcliOZjcm1BRNxAC0xKQmp
	 SH7DlWWRLGpwpywe2sDB2iIkZrjwNGPdHMjATISA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C01DF80507;
	Tue,  5 Oct 2021 15:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34882F804FF; Tue,  5 Oct 2021 15:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FF53F804FC
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF53F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="DaqGn9EW"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633442035; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LoFLksT4o0qpr+J3pryTXZQNgdb6OQ9Z70gGpScbhWE=;
 b=DaqGn9EWloGyrNu2dyJylQfx5TFWCS+8ZWkREfVrbuzk4qm1ZE9EMT8NnYfEC6TGoDEwD4QD
 sciEhuM4nTZeYXb+6qc9yPVAd5xxwhqCVsl74n3IdEcdiR8WjzOjW8ez/vPV/AEx8Zdqd5IS
 2saOp30CAH/yltgB8Tf5Rt9biCM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 615c58e730ce13d2b4c53da5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:53:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD02FC359E1; Tue,  5 Oct 2021 13:53:43 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CA9F8C4163F;
 Tue,  5 Oct 2021 13:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CA9F8C4163F
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
Subject: [PATCH v2 4/9] ASoC: qcom: Add lpass CPU driver for codec dma control
Date: Tue,  5 Oct 2021 19:22:49 +0530
Message-Id: <1633441974-15353-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org>
References: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org>
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
 sound/soc/qcom/lpass-cdc-dma.c | 209 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h         |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
new file mode 100644
index 0000000..0a1c7dc
--- /dev/null
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -0,0 +1,209 @@
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
+static void __get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+					struct lpaif_dmactl **dmactl, int *id)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	int dir = substream->stream;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		*dmactl = drvdata->rxtx_rd_dmactl;
+		*id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			*dmactl = drvdata->rxtx_wr_dmactl;
+			*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			*dmactl = drvdata->va_wr_dmactl;
+			*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+}
+
+static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *dmactl;
+	int dir = substream->stream;
+	int ret, id, codec_intf;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		codec_intf = LPASS_CDC_DMA_RX0_INTERFACE;
+	else
+		codec_intf = LPASS_CDC_DMA_INTERFACE(dai_id);
+
+	__get_dmactl_handle(substream, dai, &dmactl, &id);
+
+	ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_intf reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_fs_sel reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_fs_delay reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_pack reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_enable reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
+	if (ret) {
+		dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	clk_bulk_disable_unprepare(drvdata->cdc_num_clks, drvdata->cdc_clks);
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
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int ret, regval;
+	unsigned int channels = params_channels(params);
+	int id;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	__get_dmactl_handle(substream, dai, &dmactl, &id);
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
+			"error writing to dmactl codec_channel reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int ret = 0, id;
+
+	__get_dmactl_handle(substream, dai, &dmactl, &id);
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
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dmactl codec_enable reg: %d\n", ret);
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

