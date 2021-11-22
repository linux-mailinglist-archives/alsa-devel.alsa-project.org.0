Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0BF458DCF
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 12:48:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3692C1698;
	Mon, 22 Nov 2021 12:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3692C1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637581737;
	bh=fiD0XGMmO2DOcaXX0tWdg7dlYL6Ly7SGLidteCXeoMM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BayiA89lsVypF0oV8eg5wXfwl5Y2zcfl7wTUelz5+4H8GTPSMwNRmh+JXlI9i0+9d
	 k/jL/LlSPEKdoZkavVJAg9XzKx8uBwK/EWQZb1N/Ohgpc92iMjV2ExZojgxN/BckLP
	 9ZwhJ/WHFY7Y5kaVz6qn234qxGr6WVEVLZrzJnMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC90F804B4;
	Mon, 22 Nov 2021 12:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD04FF8032D; Mon, 22 Nov 2021 12:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03F84F801F7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 12:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F84F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="ii0au4O0"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637581628; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=KBQpZI7kIIzMB3lNMGlFv11xZUIHJZu6j14KzS8IKww=;
 b=ii0au4O0WMaP1taYDMUtx1Ru8pv+n1R9Ka1k6zMBuX+p+czG+BZTMCVd8XJ2T6rc1owjC5wT
 //3aI8AuuA90be8mFLZR4Xtwn0DVlimvNMNhLbbRLy8tpIb8FTRmYuXsg46uzTZod1A0yBmh
 fpGB7aLhvcf+MtHfl45lElLbizI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 619b83394fca5da46d6ea5f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 11:47:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1C6D7C4361A; Mon, 22 Nov 2021 11:47:05 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 58589C43617;
 Mon, 22 Nov 2021 11:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 58589C43617
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
Subject: [PATCH v5 06/10] ASoC: qcom: Add support for codec dma driver
Date: Mon, 22 Nov 2021 17:16:35 +0530
Message-Id: <1637581599-24120-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
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

Upadate lpass cpu and platform driver to support audio over codec dma
in ADSP bypass use case.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/common.c         |  39 ++++
 sound/soc/qcom/common.h         |   1 +
 sound/soc/qcom/lpass-cpu.c      |  60 +++++-
 sound/soc/qcom/lpass-platform.c | 424 ++++++++++++++++++++++++++++++++++++++--
 4 files changed, 508 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 09af007..26d3752 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -4,6 +4,7 @@
 
 #include <linux/module.h>
 #include "common.h"
+#include "lpass.h"
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
@@ -169,4 +170,42 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL(qcom_snd_parse_of);
 
+bool is_cdc_dma_port(int dai_id)
+{
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_RX1:
+	case LPASS_CDC_DMA_RX2:
+	case LPASS_CDC_DMA_RX3:
+	case LPASS_CDC_DMA_RX4:
+	case LPASS_CDC_DMA_RX5:
+	case LPASS_CDC_DMA_RX6:
+	case LPASS_CDC_DMA_RX7:
+	case LPASS_CDC_DMA_RX8:
+	case LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_TX0:
+	case LPASS_CDC_DMA_TX1:
+	case LPASS_CDC_DMA_TX2:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_TX4:
+	case LPASS_CDC_DMA_TX5:
+	case LPASS_CDC_DMA_TX6:
+	case LPASS_CDC_DMA_TX7:
+	case LPASS_CDC_DMA_TX8:
+	case LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_VA_TX1:
+	case LPASS_CDC_DMA_VA_TX2:
+	case LPASS_CDC_DMA_VA_TX3:
+	case LPASS_CDC_DMA_VA_TX4:
+	case LPASS_CDC_DMA_VA_TX5:
+	case LPASS_CDC_DMA_VA_TX6:
+	case LPASS_CDC_DMA_VA_TX7:
+	case LPASS_CDC_DMA_VA_TX8:
+		return true;
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(is_cdc_dma_port);
+
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index f05c05b..a8fea4c 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,5 +7,6 @@
 #include <sound/soc.h>
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
+bool is_cdc_dma_port(int dai_id);
 
 #endif
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 3bd9eb3..9e6656c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -17,6 +17,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include "lpass-lpaif-reg.h"
+#include "common.h"
 #include "lpass.h"
 
 #define LPASS_CPU_MAX_MI2S_LINES	4
@@ -857,7 +858,9 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 		}
 		if (id == LPASS_DP_RX) {
 			data->hdmi_port_enable = 1;
-		} else {
+		} else if (is_cdc_dma_port(id))
+			data->codec_dma_enable = 1;
+		else {
 			data->mi2s_playback_sd_mode[id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
 							    "qcom,playback-sd-lines");
@@ -872,6 +875,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata;
 	struct device_node *dsp_of_node;
+	struct resource *res;
 	struct lpass_variant *variant;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
@@ -897,6 +901,58 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	of_lpass_cpu_parse_dai_data(dev, drvdata);
 
+	drvdata->num_clks =  variant->num_clks;
+	if (drvdata->codec_dma_enable) {
+		drvdata->rxtx_lpaif =
+				devm_platform_ioremap_resource_byname(pdev, "lpass-rxtx-lpaif");
+		if (IS_ERR(drvdata->rxtx_lpaif))
+			return PTR_ERR(drvdata->rxtx_lpaif);
+
+		drvdata->va_lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-va-lpaif");
+		if (IS_ERR(drvdata->va_lpaif))
+			return PTR_ERR(drvdata->va_lpaif);
+
+		lpass_rxtx_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
+					variant->rxtx_wrdma_channels +
+					variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
+
+		drvdata->rxtx_lpaif_map = devm_regmap_init_mmio(dev, drvdata->rxtx_lpaif,
+					&lpass_rxtx_regmap_config);
+		if (IS_ERR(drvdata->rxtx_lpaif_map)) {
+			dev_err(dev, "error initializing rxtx regmap: %ld\n",
+				PTR_ERR(drvdata->rxtx_lpaif_map));
+			return PTR_ERR(drvdata->rxtx_lpaif_map);
+		}
+		lpass_va_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
+					variant->va_wrdma_channels +
+					variant->va_wrdma_channel_start, LPASS_CDC_DMA_VA_TX0);
+
+		drvdata->va_lpaif_map = devm_regmap_init_mmio(dev, drvdata->va_lpaif,
+					&lpass_va_regmap_config);
+		if (IS_ERR(drvdata->va_lpaif_map)) {
+			dev_err(dev, "error initializing va regmap: %ld\n",
+				PTR_ERR(drvdata->va_lpaif_map));
+			return PTR_ERR(drvdata->va_lpaif_map);
+		}
+		drvdata->cdc_clks = devm_kcalloc(dev, variant->cdc_dma_num_clks,
+					sizeof(*drvdata->cdc_clks), GFP_KERNEL);
+		drvdata->cdc_num_clks =  variant->cdc_dma_num_clks;
+
+		for (i = 0; i < drvdata->cdc_num_clks; i++)
+			drvdata->cdc_clks[i].id = variant->cdc_dma_clk_names[i];
+
+		ret = devm_clk_bulk_get(dev, drvdata->cdc_num_clks, drvdata->cdc_clks);
+		if (ret) {
+			dev_err(dev, "Failed to get clocks %d\n", ret);
+			return ret;
+		}
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
+		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
+		drvdata->va_cdc_dma_lpm_buf = res->start;
+	}
 	drvdata->lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-lpaif");
 	if (IS_ERR(drvdata->lpaif))
 		return PTR_ERR(drvdata->lpaif);
@@ -939,7 +995,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	for (i = 0; i < variant->num_dai; i++) {
 		dai_id = variant->dai_driver[i].id;
-		if (dai_id == LPASS_DP_RX)
+		if (dai_id == LPASS_DP_RX || is_cdc_dma_port(dai_id))
 			continue;
 
 		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 59c0884..4b79908 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -14,12 +14,15 @@
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "lpass-lpaif-reg.h"
+#include "common.h"
 #include "lpass.h"
 
 #define DRV_NAME "lpass-platform"
 
 #define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
 #define LPASS_PLATFORM_PERIODS		2
+#define LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE (24 * 1024)
+#define LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE (12 * 1024)
 
 static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
 	.info			=	SNDRV_PCM_INFO_MMAP |
@@ -45,6 +48,103 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
 	.fifo_size		=	0,
 };
 
+static const struct snd_pcm_hardware lpass_platform_rxtx_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE,
+	.period_bytes_max	=	LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.period_bytes_min	=	LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.periods_min		=	LPASS_PLATFORM_PERIODS,
+	.periods_max		=	LPASS_PLATFORM_PERIODS,
+	.fifo_size		=	0,
+};
+
+static const struct snd_pcm_hardware lpass_platform_va_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE,
+	.period_bytes_max	=	LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.period_bytes_min	=	LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.periods_min		=	LPASS_PLATFORM_PERIODS,
+	.periods_max		=	LPASS_PLATFORM_PERIODS,
+	.fifo_size		=	0,
+};
+
+static int lpass_platform_alloc_rxtx_dmactl_fields(struct device *dev,
+					 struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
+	int rval;
+
+	drvdata->rxtx_rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					  GFP_KERNEL);
+	if (drvdata->rxtx_rd_dmactl == NULL)
+		return -ENOMEM;
+
+	drvdata->rxtx_wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					  GFP_KERNEL);
+	if (drvdata->rxtx_wr_dmactl == NULL)
+		return -ENOMEM;
+
+	rd_dmactl = drvdata->rxtx_rd_dmactl;
+	wr_dmactl = drvdata->rxtx_wr_dmactl;
+
+	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
+					    &v->rxtx_rdma_intf, 15);
+	if (rval)
+		return rval;
+
+	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
+					    &v->rxtx_wrdma_intf, 15);
+}
+
+static int lpass_platform_alloc_va_dmactl_fields(struct device *dev,
+					 struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *wr_dmactl;
+
+	drvdata->va_wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					  GFP_KERNEL);
+	if (drvdata->va_wr_dmactl == NULL)
+		return -ENOMEM;
+
+	wr_dmactl = drvdata->va_wr_dmactl;
+
+	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
+					    &v->va_wrdma_intf, 15);
+}
+
+
 static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
@@ -126,22 +226,43 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	if (cpu_dai->driver->id == LPASS_DP_RX) {
 		map = drvdata->hdmiif_map;
 		drvdata->hdmi_substream[dma_ch] = substream;
+	} else if (dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) {
+		map = drvdata->rxtx_lpaif_map;
+		drvdata->rxtx_substream[dma_ch] = substream;
+	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+		map = drvdata->va_lpaif_map;
+		drvdata->va_substream[dma_ch] = substream;
 	} else {
 		map = drvdata->lpaif_map;
 		drvdata->substream[dma_ch] = substream;
 	}
 	data->dma_ch = dma_ch;
-	ret = regmap_write(map,
-			LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
-	if (ret) {
-		dev_err(soc_runtime->dev,
-			"error writing to rdmactl reg: %d\n", ret);
-		return ret;
+	if (!(dai_id == LPASS_CDC_DMA_RX0 ||
+		dai_id == LPASS_CDC_DMA_TX3 ||
+		dai_id == LPASS_CDC_DMA_VA_TX0)) {
+		ret = regmap_write(map, LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
 	}
-	snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
-
-	runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
 
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		snd_soc_set_runtime_hwparams(substream, &lpass_platform_rxtx_hardware);
+		runtime->dma_bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
+		break;
+	case LPASS_CDC_DMA_VA_TX0:
+		snd_soc_set_runtime_hwparams(substream, &lpass_platform_va_hardware);
+		runtime->dma_bytes = lpass_platform_va_hardware.buffer_bytes_max;
+		break;
+	default:
+		snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
+		runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
+		break;
+	}
 	ret = snd_pcm_hw_constraint_integer(runtime,
 			SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0) {
@@ -168,6 +289,10 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	data = runtime->private_data;
 	if (dai_id == LPASS_DP_RX)
 		drvdata->hdmi_substream[data->dma_ch] = NULL;
+	else if (dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3)
+		drvdata->rxtx_substream[data->dma_ch] = NULL;
+	else if (dai_id == LPASS_CDC_DMA_VA_TX0)
+		drvdata->va_substream[data->dma_ch] = NULL;
 	else
 		drvdata->substream[data->dma_ch] = NULL;
 	if (v->free_dma_channel)
@@ -198,14 +323,27 @@ static void __get_lpaif_handle(struct snd_pcm_substream *substream,
 		if (dai_id == LPASS_DP_RX) {
 			l_dmactl = drvdata->hdmi_rd_dmactl;
 			l_map = drvdata->hdmiif_map;
+		} else if (dai_id == LPASS_CDC_DMA_RX0) {
+			l_map = drvdata->rxtx_lpaif_map;
+			l_dmactl = drvdata->rxtx_rd_dmactl;
 		} else {
 			l_dmactl = drvdata->rd_dmactl;
 			l_map = drvdata->lpaif_map;
 		}
 	} else {
-		l_dmactl = drvdata->wr_dmactl;
-		l_id = pcm_data->dma_ch - v->wrdma_channel_start;
-		l_map = drvdata->lpaif_map;
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			l_dmactl = drvdata->rxtx_wr_dmactl;
+			l_map = drvdata->rxtx_lpaif_map;
+			l_id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			l_dmactl = drvdata->va_wr_dmactl;
+			l_map = drvdata->va_lpaif_map;
+			l_id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		} else {
+			l_dmactl = drvdata->wr_dmactl;
+			l_id = pcm_data->dma_ch - v->wrdma_channel_start;
+			l_map = drvdata->lpaif_map;
+		}
 	}
 	if (dmactl)
 		*dmactl = l_dmactl;
@@ -256,6 +394,10 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	}
 
 	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_VA_TX0:
+		break;
 	case LPASS_DP_RX:
 		ret = regmap_fields_write(dmactl->burst8, id,
 							LPAIF_DMACTL_BURSTEN_INCR4);
@@ -380,6 +522,10 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
 
 	if (dai_id == LPASS_DP_RX)
 		map = drvdata->hdmiif_map;
+	else if (dai_id == LPASS_CDC_DMA_RX0 ||
+		dai_id == LPASS_CDC_DMA_TX3 ||
+		dai_id == LPASS_CDC_DMA_VA_TX0)
+		return 0;
 	else
 		map = drvdata->lpaif_map;
 
@@ -434,6 +580,16 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 		return ret;
 	}
 
+	if (dai_id == LPASS_CDC_DMA_RX0 ||
+		dai_id == LPASS_CDC_DMA_TX3 ||
+		dai_id == LPASS_CDC_DMA_VA_TX0) {
+		ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
+				ret, id);
+			return ret;
+		}
+	}
 	ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
@@ -476,6 +632,22 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return ret;
 		}
 		switch (dai_id) {
+		case LPASS_CDC_DMA_RX0:
+		case LPASS_CDC_DMA_TX3:
+		case LPASS_CDC_DMA_VA_TX0:
+			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg field: %d\n", ret);
+				return ret;
+			}
+			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
+			val_irqclr = LPAIF_IRQ_ALL(ch);
+
+			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = LPAIF_IRQ_ALL(ch);
+			break;
 		case LPASS_DP_RX:
 			ret = regmap_fields_write(dmactl->dyncclk, id,
 					 LPAIF_DMACTL_DYNCLK_ON);
@@ -540,6 +712,24 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return ret;
 		}
 		switch (dai_id) {
+		case LPASS_CDC_DMA_RX0:
+		case LPASS_CDC_DMA_TX3:
+		case LPASS_CDC_DMA_VA_TX0:
+			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg field: %d\n", ret);
+				return ret;
+			}
+
+			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
+			val_irqclr = LPAIF_IRQ_ALL(ch);
+
+			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = LPAIF_IRQ_ALL(ch);
+
+		break;
 		case LPASS_DP_RX:
 			ret = regmap_fields_write(dmactl->dyncclk, id,
 					 LPAIF_DMACTL_DYNCLK_OFF);
@@ -619,6 +809,38 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
 }
 
+static int lpass_platform_cdc_dma_mmap(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct vm_area_struct *vma)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned long size, offset;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	size = vma->vm_end - vma->vm_start;
+	offset = vma->vm_pgoff << PAGE_SHIFT;
+	return io_remap_pfn_range(vma, vma->vm_start,
+			(runtime->dma_addr + offset) >> PAGE_SHIFT,
+			size, vma->vm_page_prot);
+
+}
+
+static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream,
+				      struct vm_area_struct *vma)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dai_id == LPASS_CDC_DMA_RX0 ||
+		dai_id == LPASS_CDC_DMA_TX3 ||
+		dai_id == LPASS_CDC_DMA_VA_TX0) {
+		return lpass_platform_cdc_dma_mmap(component, substream, vma);
+	}
+	return 0;
+}
+
 static irqreturn_t lpass_dma_interrupt_handler(
 			struct snd_pcm_substream *substream,
 			struct lpass_data *drvdata,
@@ -635,6 +857,14 @@ static irqreturn_t lpass_dma_interrupt_handler(
 
 	mask = LPAIF_IRQ_ALL(chan);
 	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_VA_TX0:
+		map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
+				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;
+		reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
+		val = 0;
+		break;
 	case LPASS_DP_RX:
 		map = drvdata->hdmiif_map;
 		reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
@@ -758,18 +988,112 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
 				return rv;
 		}
 	}
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
+{
+	struct lpass_data *drvdata = data;
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int irqs;
+	int rv, chan;
+
+	rv = regmap_read(drvdata->rxtx_lpaif_map,
+			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_RX0), &irqs);
+	if (rv)
+		return IRQ_NONE;
+	/* Handle per channel interrupts */
+	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
+		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
+			rv = lpass_dma_interrupt_handler(
+						drvdata->rxtx_substream[chan],
+						drvdata, chan, irqs);
+			if (rv != IRQ_HANDLED)
+				return rv;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
+{
+	struct lpass_data *drvdata = data;
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int irqs;
+	int rv, chan;
 
+	rv = regmap_read(drvdata->va_lpaif_map,
+			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST,
+			LPASS_CDC_DMA_VA_TX0), &irqs);
+	if (rv)
+		return IRQ_NONE;
+	/* Handle per channel interrupts */
+	for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
+		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
+			rv = lpass_dma_interrupt_handler(
+						drvdata->va_substream[chan],
+						drvdata, chan, irqs);
+			if (rv != IRQ_HANDLED)
+				return rv;
+		}
+	}
 	return IRQ_HANDLED;
 }
 
+static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
+			struct snd_pcm *pcm, int dai_id)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+	int ret;
+
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
+		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	else
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+
+	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	buf = &substream->dma_buffer;
+	buf->dev.dev = pcm->card->dev;
+	buf->private_data = NULL;
+
+	/* Assign Codec DMA buffer pointers */
+	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
+	if (dai_id == LPASS_CDC_DMA_RX0) {
+		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
+	} else if (dai_id == LPASS_CDC_DMA_TX3) {
+		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
+		buf->addr = drvdata->va_cdc_dma_lpm_buf;
+	}
+
+	buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
+
+	return 0;
+}
+
 static int lpass_platform_pcm_new(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *soc_runtime)
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	unsigned int dai_id = cpu_dai->driver->id;
+
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-					    component->dev, size);
+	if (is_cdc_dma_port(dai_id))
+		return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
+	else
+		return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+						component->dev, size);
 }
 
 static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
@@ -804,6 +1128,22 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 	return regcache_sync(map);
 }
 
+int lpass_platform_copy(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream, int channel,
+			 unsigned long pos, void __user *buf, unsigned long bytes)
+{
+	struct snd_pcm_runtime *rt = substream->runtime;
+
+	unsigned char *dma_buf = rt->dma_area + pos +
+				channel * (rt->dma_bytes / rt->channels);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return copy_from_user_toio(dma_buf, buf, bytes);
+	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return copy_to_user_fromio(buf, dma_buf, bytes);
+
+	return 0;
+}
 
 static const struct snd_soc_component_driver lpass_component_driver = {
 	.name		= DRV_NAME,
@@ -814,9 +1154,11 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.prepare	= lpass_platform_pcmops_prepare,
 	.trigger	= lpass_platform_pcmops_trigger,
 	.pointer	= lpass_platform_pcmops_pointer,
+	.mmap		= lpass_platform_pcmops_mmap,
 	.pcm_construct	= lpass_platform_pcm_new,
 	.suspend		= lpass_platform_pcmops_suspend,
 	.resume			= lpass_platform_pcmops_resume,
+	.copy_user		= lpass_platform_copy,
 
 };
 
@@ -854,6 +1196,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (drvdata->codec_dma_enable) {
+		ret = regmap_write(drvdata->rxtx_lpaif_map,
+			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_TX3), 0x0);
+		if (ret) {
+			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_write(drvdata->va_lpaif_map,
+			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_VA_TX0), 0x0);
+		if (ret) {
+			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
+			return ret;
+		}
+		drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
+		if (drvdata->rxtxif_irq < 0)
+			return -ENODEV;
+
+		ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
+				lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
+				"lpass-irq-rxtxif", drvdata);
+		if (ret) {
+			dev_err(&pdev->dev, "rxtx irq request failed: %d\n", ret);
+			return ret;
+		}
+
+		ret = lpass_platform_alloc_rxtx_dmactl_fields(&pdev->dev,
+						 drvdata->rxtx_lpaif_map);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"error initializing rxtx dmactl fields: %d\n", ret);
+			return ret;
+		}
+
+		drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
+		if (drvdata->vaif_irq < 0)
+			return -ENODEV;
+
+		ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
+				lpass_platform_vaif_irq, IRQF_TRIGGER_RISING,
+				"lpass-irq-vaif", drvdata);
+		if (ret) {
+			dev_err(&pdev->dev, "va irq request failed: %d\n", ret);
+			return ret;
+		}
+
+		ret = lpass_platform_alloc_va_dmactl_fields(&pdev->dev,
+						 drvdata->va_lpaif_map);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"error initializing va dmactl fields: %d\n", ret);
+			return ret;
+		}
+	}
+
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
 		if (drvdata->hdmiif_irq < 0)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

