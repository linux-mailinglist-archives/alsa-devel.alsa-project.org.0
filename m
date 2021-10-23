Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DAA438302
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 11:58:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3F21696;
	Sat, 23 Oct 2021 11:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3F21696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634983108;
	bh=/oRtS6svZGKbCs5b/yptXCPE122Pe6mQ0F2ID73Khes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X//mj2enPl3WnGA8jTBXdatJ8ywb+q3t0gPCl3mqZoG0z/jZVcAf9njGwGqyJmeTO
	 CKXR3HaNXouj3qzYvrwGG5noSGpqBRE9SSlla4TXZR58Tmv2oLA90P07f/mREPeZk2
	 sWcOzBKbUw8qfWrJ90rwIOBxr+/8jgTvn3No9/Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C859FF804E7;
	Sat, 23 Oct 2021 11:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22A90F8051F; Sat, 23 Oct 2021 11:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D16EF80525
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 11:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D16EF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="KlM5yC7n"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634982927; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AtTvjPseYQSSIESbE8O4oVM1PipYc+BXPEA/OE9A9Ng=;
 b=KlM5yC7n3kPQvDzzbiBZFZy7OmHVasj1VvhbQ/lWhqBdEd/h/Mo7h/NB5s67gSZyXAcFbhdl
 b3jd48N6Fao919vsRhdy9GvuN+mr/ZG8AgHFT9ugRDECi2dRJXHrcQ7KciY0wibQuFxSBjTr
 PaCSAQ6z369zR3OBFmWv2Q0Dlww=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6173dc048e67b5f04e1aca05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Oct 2021 09:55:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D35B3C4363F; Sat, 23 Oct 2021 09:55:15 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 11C7CC43638;
 Sat, 23 Oct 2021 09:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 11C7CC43638
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
Subject: [PATCH v3 09/10] ASoC: qcom: lpass-sc7280: Add platform driver for
 lpass audio
Date: Sat, 23 Oct 2021 15:24:01 +0530
Message-Id: <1634982842-7477-10-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
References: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
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

Add platform driver for configuring sc7280 lpass core I2S and
DMA configuration to support playback & capture to external codecs
connected over secondary MI2S interface and soundwire interface.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass-sc7280.c | 599 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 599 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
new file mode 100644
index 0000000..f73d374
--- /dev/null
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -0,0 +1,599 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ *
+ * lpass-sc7180.c -- ALSA SoC platform-machine driver for QTi LPASS
+ */
+
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include <dt-bindings/sound/sc7180-lpass.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static struct snd_soc_dai_driver sc7280_lpass_cpu_dai_driver[] = {
+	{
+		.id = LPASS_CDC_DMA_RX0,
+		.name = "CDC DMA RX",
+		.playback = {
+			.stream_name = "WCD Playback",
+			.formats		= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min		= 48000,
+			.rate_max		= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_wcd_dai_ops,
+	},
+	{
+		.id = LPASS_CDC_DMA_TX3,
+		.name = "CDC DMA TX",
+		.capture = {
+			.stream_name = "WCD Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min		= 48000,
+			.rate_max		= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_wcd_dai_ops,
+	},
+
+	{
+		.id = MI2S_SECONDARY,
+		.name = "Secondary MI2S",
+		.playback = {
+			.stream_name = "Secondary MI2S Playback",
+			.formats		= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min		= 48000,
+			.rate_max		= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
+		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
+	},
+	{
+		.id = LPASS_DP_RX,
+		.name = "Hdmi",
+		.playback = {
+			.stream_name = "DP Playback",
+			.formats		= SNDRV_PCM_FMTBIT_S24,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min		= 48000,
+			.rate_max		= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_lpass_hdmi_dai_ops,
+	},
+	{
+		.id = LPASS_CDC_DMA_VA_TX0,
+		.name = "CDC DMA VA",
+		.capture = {
+			.stream_name = "DMIC Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_lpass_wcd_dai_ops,
+	},
+};
+
+static int sc7280_lpass_alloc_dma_channel(struct lpass_data *drvdata,
+				int direction, unsigned int dai_id)
+{
+	struct lpass_variant *v = drvdata->variant;
+	int chan = 0;
+
+	if (dai_id == LPASS_CDC_DMA_RX0 ||
+	dai_id == LPASS_CDC_DMA_TX3) {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
+									v->rxtx_rdma_channels);
+
+			if (chan >= v->rxtx_rdma_channels)
+				return -EBUSY;
+		} else {
+			chan = find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
+							v->rxtx_wrdma_channel_start +
+							v->rxtx_wrdma_channels,
+							v->rxtx_wrdma_channel_start);
+
+			if (chan >=	 v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
+				return -EBUSY;
+		}
+
+		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
+	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(&drvdata->va_dma_ch_bit_map,
+									v->va_rdma_channels);
+
+			if (chan >= v->va_rdma_channels)
+				return -EBUSY;
+		} else {
+			chan = find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
+							v->va_wrdma_channel_start +
+							v->va_wrdma_channels,
+							v->va_wrdma_channel_start);
+
+			if (chan >=	 v->va_wrdma_channel_start + v->va_wrdma_channels)
+				return -EBUSY;
+		}
+
+		set_bit(chan, &drvdata->va_dma_ch_bit_map);
+	} else if (dai_id == LPASS_DP_RX) {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(&drvdata->hdmi_dma_ch_bit_map,
+									v->hdmi_rdma_channels);
+
+			if (chan >= v->hdmi_rdma_channels)
+				return -EBUSY;
+		}
+		set_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
+	} else {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+									v->rdma_channels);
+
+			if (chan >= v->rdma_channels)
+				return -EBUSY;
+		} else {
+			chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+							v->wrdma_channel_start +
+							v->wrdma_channels,
+							v->wrdma_channel_start);
+
+			if (chan >=	 v->wrdma_channel_start + v->wrdma_channels)
+				return -EBUSY;
+		}
+		set_bit(chan, &drvdata->dma_ch_bit_map);
+	}
+	return chan;
+}
+
+static int sc7280_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
+{
+	if (dai_id == LPASS_CDC_DMA_RX0 ||
+		dai_id == LPASS_CDC_DMA_TX3)
+		clear_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
+	else if (dai_id == LPASS_CDC_DMA_VA_TX0)
+		clear_bit(chan, &drvdata->va_dma_ch_bit_map);
+	else if (dai_id == LPASS_DP_RX)
+		clear_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
+	else
+		clear_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return 0;
+}
+
+static int lpass_sc7280_pds_enable(struct platform_device *pdev)
+{
+	int ret;
+	int i;
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device **pds = variant->proxy_pds;
+	size_t pd_count = variant->proxy_pd_count;
+
+	for (i = 0; i < pd_count; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = pm_runtime_get_sync(pds[i]);
+		if (ret < 0) {
+			pm_runtime_put_noidle(pds[i]);
+			dev_pm_genpd_set_performance_state(pds[i], 0);
+			goto unroll_pd_votes;
+		}
+	}
+	pds = variant->active_pds;
+	pd_count = variant->active_pd_count;
+
+	for (i = 0; i < pd_count; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = pm_runtime_get_sync(pds[i]);
+		if (ret < 0) {
+			pm_runtime_put_noidle(pds[i]);
+			dev_pm_genpd_set_performance_state(pds[i], 0);
+			goto unroll_pd_votes;
+		}
+	}
+	return 0;
+
+unroll_pd_votes:
+	for (i--; i >= 0; i--) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+	return ret;
+};
+
+static void lpass_sc7280_pds_disable(struct platform_device *pdev)
+{
+	int i;
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device **pds = variant->proxy_pds;
+	size_t pd_count = variant->proxy_pd_count;
+
+	for (i = 0; i < pd_count; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+
+	pds = variant->active_pds;
+	pd_count = variant->active_pd_count;
+
+	for (i = 0; i < pd_count; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+}
+
+static int lpass_sc7280_pds_attach(struct platform_device *pdev)
+{
+	int ret;
+	int i;
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	const char * const *pd_names =	variant->proxy_pd_names;
+	struct device **devs = variant->proxy_pds;
+	size_t num_pds = variant->proxy_pd_count;
+
+	if (!pd_names)
+		return 0;
+
+	/* Handle single power domain */
+	if (dev->pm_domain) {
+		devs[0] = dev;
+		pm_runtime_enable(dev);
+		return 1;
+	}
+
+	for (i = 0; i < num_pds; i++) {
+		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
+		if (IS_ERR_OR_NULL(devs[i])) {
+			ret = PTR_ERR(devs[i]) ? : -ENODATA;
+			goto unroll_attach;
+		}
+	}
+
+	pd_names = variant->active_pd_names;
+	devs = variant->active_pds;
+	num_pds = variant->active_pd_count;
+	for (i = 0; i < num_pds; i++) {
+		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
+		if (IS_ERR_OR_NULL(devs[i])) {
+			ret = PTR_ERR(devs[i]) ? : -ENODATA;
+			goto unroll_attach;
+		}
+	}
+	return 0;
+
+unroll_attach:
+	for (i--; i >= 0; i--)
+		dev_pm_domain_detach(devs[i], false);
+
+	return ret;
+};
+
+static void lpass_sc7280_pds_detach(struct platform_device *pdev)
+{
+	int i;
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	struct device **pds = variant->proxy_pds;
+	size_t pd_count = variant->proxy_pd_count;
+
+	/* Handle single power domain */
+	if (dev->pm_domain && pd_count) {
+		pm_runtime_disable(dev);
+		return;
+	}
+
+	for (i = 0; i < pd_count; i++)
+		dev_pm_domain_detach(pds[i], false);
+
+	pds = variant->active_pds;
+	pd_count = variant->active_pd_count;
+
+	/* Handle single power domain */
+	if (dev->pm_domain && pd_count) {
+		pm_runtime_disable(dev);
+		return;
+	}
+
+	for (i = 0; i < pd_count; i++)
+		dev_pm_domain_detach(pds[i], false);
+}
+
+static int sc7280_lpass_pds_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = lpass_sc7280_pds_attach(pdev);
+	if (ret) {
+		dev_err(dev, "Failed to attach power domains %d\n", ret);
+		return ret;
+	}
+	ret = lpass_sc7280_pds_enable(pdev);
+	if (ret) {
+		lpass_sc7280_pds_detach(pdev);
+		dev_err(dev, "Failed to enable power domains %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void sc7280_lpass_pds_exit(struct platform_device *pdev)
+{
+	lpass_sc7280_pds_disable(pdev);
+	lpass_sc7280_pds_detach(pdev);
+}
+
+static int sc7280_lpass_init(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
+					sizeof(*drvdata->clks), GFP_KERNEL);
+	drvdata->num_clks = variant->num_clks;
+
+	drvdata->aon_cc_audio_hm_h = devm_clk_get(dev, "lpass_aon_cc_audio_hm_h_clk");
+	if (IS_ERR(drvdata->aon_cc_audio_hm_h))
+		return PTR_ERR(drvdata->aon_cc_audio_hm_h);
+	drvdata->core_cc_sysnoc_mport_core = devm_clk_get(dev,
+					"lpass_core_cc_sysnoc_mport_core_clk");
+	if (IS_ERR(drvdata->core_cc_sysnoc_mport_core))
+		return PTR_ERR(drvdata->core_cc_sysnoc_mport_core);
+
+	ret = sc7280_lpass_pds_init(pdev);
+	if (ret) {
+		dev_err(dev, "sc7280 power domains init failed\n");
+		return ret;
+	}
+	clk_prepare_enable(drvdata->aon_cc_audio_hm_h);
+	clk_prepare_enable(drvdata->core_cc_sysnoc_mport_core);
+	return 0;
+}
+
+static int sc7280_lpass_exit(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(drvdata->core_cc_sysnoc_mport_core);
+	clk_disable_unprepare(drvdata->aon_cc_audio_hm_h);
+
+	sc7280_lpass_pds_exit(pdev);
+	return 0;
+}
+
+static struct lpass_variant sc7280_data = {
+	.i2sctrl_reg_base		= 0x1000,
+	.i2sctrl_reg_stride		= 0x1000,
+	.i2s_ports			= 3,
+	.irq_reg_base			= 0x9000,
+	.irq_reg_stride			= 0x1000,
+	.irq_ports			= 3,
+	.rdma_reg_base			= 0xC000,
+	.rdma_reg_stride		= 0x1000,
+	.rdma_channels			= 5,
+	.rxtx_rdma_reg_base		= 0xC000,
+	.rxtx_rdma_reg_stride		= 0x1000,
+	.rxtx_rdma_channels		= 8,
+	.hdmi_rdma_reg_base		= 0x64000,
+	.hdmi_rdma_reg_stride		= 0x1000,
+	.hdmi_rdma_channels		= 4,
+	.dmactl_audif_start		= 1,
+	.wrdma_reg_base			= 0x18000,
+	.wrdma_reg_stride		= 0x1000,
+	.wrdma_channel_start		= 5,
+	.wrdma_channels			= 4,
+	.rxtx_irq_reg_base		= 0x9000,
+	.rxtx_irq_reg_stride		= 0x1000,
+	.rxtx_irq_ports			= 3,
+	.rxtx_wrdma_reg_base		= 0x18000,
+	.rxtx_wrdma_reg_stride		= 0x1000,
+	.rxtx_wrdma_channel_start	= 5,
+	.rxtx_wrdma_channels		= 6,
+	.va_wrdma_reg_base		= 0x18000,
+	.va_wrdma_reg_stride		= 0x1000,
+	.va_wrdma_channel_start		= 5,
+	.va_wrdma_channels		= 3,
+	.va_irq_reg_base		= 0x9000,
+	.va_irq_reg_stride		= 0x1000,
+	.va_irq_ports			= 3,
+
+	.loopback			= REG_FIELD_ID(0x1000, 17, 17, 3, 0x1000),
+	.spken				= REG_FIELD_ID(0x1000, 16, 16, 3, 0x1000),
+	.spkmode			= REG_FIELD_ID(0x1000, 11, 15, 3, 0x1000),
+	.spkmono			= REG_FIELD_ID(0x1000, 10, 10, 3, 0x1000),
+	.micen				= REG_FIELD_ID(0x1000, 9, 9, 3, 0x1000),
+	.micmode			= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
+	.micmono			= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
+	.wssrc				= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
+	.bitwidth			= REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
+
+	.rdma_dyncclk			= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
+	.rdma_bursten			= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
+	.rdma_wpscnt			= REG_FIELD_ID(0xC000, 16, 19, 5, 0x1000),
+	.rdma_intf			= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
+	.rdma_fifowm			= REG_FIELD_ID(0xC000, 1, 5, 5, 0x1000),
+	.rdma_enable			= REG_FIELD_ID(0xC000, 0, 0, 5, 0x1000),
+
+	.rxtx_rdma_enable		= REG_FIELD_ID(0xC000, 0, 0, 7, 0x1000),
+	.rxtx_rdma_fifowm		= REG_FIELD_ID(0xC000, 1, 11, 7, 0x1000),
+	.rxtx_rdma_intf			= REG_FIELD_ID(0xC000, 12, 15, 7, 0x1000),
+	.rxtx_rdma_wpscnt		= REG_FIELD_ID(0xC000, 16, 19, 7, 0x1000),
+	.rxtx_rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 7, 0x1000),
+	.rxtx_rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 7, 0x1000),
+
+	.rxtx_rdma_codec_ch		= REG_FIELD_ID(0xC050, 0, 7, 7, 0x1000),
+	.rxtx_rdma_codec_intf		= REG_FIELD_ID(0xC050, 16, 19, 7, 0x1000),
+	.rxtx_rdma_codec_fs_delay	= REG_FIELD_ID(0xC050, 21, 24, 7, 0x1000),
+	.rxtx_rdma_codec_fs_sel		= REG_FIELD_ID(0xC050, 25, 27, 7, 0x1000),
+	.rxtx_rdma_codec_pack		= REG_FIELD_ID(0xC050, 29, 29, 5, 0x1000),
+	.rxtx_rdma_codec_enable		= REG_FIELD_ID(0xC050, 30, 30, 7, 0x1000),
+
+	.rxtx_wrdma_enable		= REG_FIELD_ID(0x18000, 0, 0, 5, 0x1000),
+	.rxtx_wrdma_fifowm		= REG_FIELD_ID(0x18000, 1, 11, 5, 0x1000),
+	.rxtx_wrdma_intf		= REG_FIELD_ID(0x18000, 12, 16, 5, 0x1000),
+	.rxtx_wrdma_wpscnt		= REG_FIELD_ID(0x18000, 17, 20, 5, 0x1000),
+	.rxtx_wrdma_bursten		= REG_FIELD_ID(0x18000, 21, 21, 5, 0x1000),
+	.rxtx_wrdma_dyncclk		= REG_FIELD_ID(0x18000, 22, 22, 5, 0x1000),
+
+	.rxtx_wrdma_codec_ch		= REG_FIELD_ID(0x18050, 0, 7, 5, 0x1000),
+	.rxtx_wrdma_codec_intf		= REG_FIELD_ID(0x18050, 16, 19, 5, 0x1000),
+	.rxtx_wrdma_codec_fs_delay	= REG_FIELD_ID(0x18050, 21, 24, 5, 0x1000),
+	.rxtx_wrdma_codec_fs_sel	= REG_FIELD_ID(0x18050, 25, 27, 5, 0x1000),
+	.rxtx_wrdma_codec_pack		= REG_FIELD_ID(0x18050, 29, 29, 5, 0x1000),
+	.rxtx_wrdma_codec_enable	= REG_FIELD_ID(0x18050, 30, 30, 5, 0x1000),
+
+	.va_wrdma_enable		= REG_FIELD_ID(0x18000, 0, 0, 5, 0x1000),
+	.va_wrdma_fifowm		= REG_FIELD_ID(0x18000, 1, 11, 5, 0x1000),
+	.va_wrdma_intf			= REG_FIELD_ID(0x18000, 12, 16, 5, 0x1000),
+	.va_wrdma_wpscnt		= REG_FIELD_ID(0x18000, 17, 20, 5, 0x1000),
+	.va_wrdma_bursten		= REG_FIELD_ID(0x18000, 21, 21, 5, 0x1000),
+	.va_wrdma_dyncclk		= REG_FIELD_ID(0x18000, 22, 22, 5, 0x1000),
+
+	.va_wrdma_codec_ch		= REG_FIELD_ID(0x18050, 0, 7, 5, 0x1000),
+	.va_wrdma_codec_intf		= REG_FIELD_ID(0x18050, 16, 19, 5, 0x1000),
+	.va_wrdma_codec_fs_delay	= REG_FIELD_ID(0x18050, 21, 24, 5, 0x1000),
+	.va_wrdma_codec_fs_sel		= REG_FIELD_ID(0x18050, 25, 27, 5, 0x1000),
+	.va_wrdma_codec_pack		= REG_FIELD_ID(0x18050, 29, 29, 5, 0x1000),
+	.va_wrdma_codec_enable		= REG_FIELD_ID(0x18050, 30, 30, 5, 0x1000),
+
+	.hdmi_tx_ctl_addr		= 0x1000,
+	.hdmi_legacy_addr		= 0x1008,
+	.hdmi_vbit_addr			= 0x610c0,
+	.hdmi_ch_lsb_addr		= 0x61048,
+	.hdmi_ch_msb_addr		= 0x6104c,
+	.ch_stride			= 0x8,
+	.hdmi_parity_addr		= 0x61034,
+	.hdmi_dmactl_addr		= 0x61038,
+	.hdmi_dma_stride		= 0x4,
+	.hdmi_DP_addr			= 0x610c8,
+	.hdmi_sstream_addr		= 0x6101c,
+	.hdmi_irq_reg_base		= 0x63000,
+	.hdmi_irq_ports			= 1,
+
+	.hdmi_rdma_dyncclk		= REG_FIELD_ID(0x64000, 14, 14, 4, 0x1000),
+	.hdmi_rdma_bursten		= REG_FIELD_ID(0x64000, 13, 13, 4, 0x1000),
+	.hdmi_rdma_burst8		= REG_FIELD_ID(0x64000, 15, 15, 4, 0x1000),
+	.hdmi_rdma_burst16		= REG_FIELD_ID(0x64000, 16, 16, 4, 0x1000),
+	.hdmi_rdma_dynburst		= REG_FIELD_ID(0x64000, 18, 18, 4, 0x1000),
+	.hdmi_rdma_wpscnt		= REG_FIELD_ID(0x64000, 10, 12, 4, 0x1000),
+	.hdmi_rdma_fifowm		= REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
+	.hdmi_rdma_enable		= REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
+
+	.sstream_en			= REG_FIELD(0x6101c, 0, 0),
+	.dma_sel			= REG_FIELD(0x6101c, 1, 2),
+	.auto_bbit_en			= REG_FIELD(0x6101c, 3, 3),
+	.layout				= REG_FIELD(0x6101c, 4, 4),
+	.layout_sp			= REG_FIELD(0x6101c, 5, 8),
+	.set_sp_on_en			= REG_FIELD(0x6101c, 10, 10),
+	.dp_audio			= REG_FIELD(0x6101c, 11, 11),
+	.dp_staffing_en			= REG_FIELD(0x6101c, 12, 12),
+	.dp_sp_b_hw_en			= REG_FIELD(0x6101c, 13, 13),
+
+	.mute				= REG_FIELD(0x610c8, 0, 0),
+	.as_sdp_cc			= REG_FIELD(0x610c8, 1, 3),
+	.as_sdp_ct			= REG_FIELD(0x610c8, 4, 7),
+	.aif_db4			= REG_FIELD(0x610c8, 8, 15),
+	.frequency			= REG_FIELD(0x610c8, 16, 21),
+	.mst_index			= REG_FIELD(0x610c8, 28, 29),
+	.dptx_index			= REG_FIELD(0x610c8, 30, 31),
+
+	.soft_reset			= REG_FIELD(0x1000, 31, 31),
+	.force_reset			= REG_FIELD(0x1000, 30, 30),
+
+	.use_hw_chs			= REG_FIELD(0x61038, 0, 0),
+	.use_hw_usr			= REG_FIELD(0x61038, 1, 1),
+	.hw_chs_sel			= REG_FIELD(0x61038, 2, 4),
+	.hw_usr_sel			= REG_FIELD(0x61038, 5, 6),
+
+	.replace_vbit			= REG_FIELD(0x610c0, 0, 0),
+	.vbit_stream			= REG_FIELD(0x610c0, 1, 1),
+
+	.legacy_en			=  REG_FIELD(0x1008, 0, 0),
+	.calc_en			=  REG_FIELD(0x61034, 0, 0),
+	.lsb_bits			=  REG_FIELD(0x61048, 0, 31),
+	.msb_bits			=  REG_FIELD(0x6104c, 0, 31),
+
+
+	.clk_name			= (const char*[]) {
+							"lpass_aon_cc_audio_hm_h_clk",
+							"lpass_core_cc_sysnoc_mport_core_clk"
+						},
+	.num_clks				= 2,
+	.cdc_dma_clk_names		= (const char*[]) {
+								"lpass_audio_cc_codec_mem0_clk",
+								"lpass_audio_cc_codec_mem1_clk",
+								"lpass_audio_cc_codec_mem2_clk",
+								"lpass_aon_cc_va_mem0_clk"
+							},
+	.cdc_dma_num_clks				= 4,
+	.dai_driver				= sc7280_lpass_cpu_dai_driver,
+	.num_dai				= ARRAY_SIZE(sc7280_lpass_cpu_dai_driver),
+	.dai_osr_clk_names		= (const char *[]) {
+							   "null",
+							   "null"
+							},
+	.dai_bit_clk_names		= (const char *[]) {
+								"null",
+								"lpass_core_cc_ext_if0_ibit_clk",
+								"lpass_core_cc_ext_if1_ibit_clk"
+							},
+	.active_pd_names = (const char*[]){
+		NULL
+	},
+	.active_pd_count = 0,
+	.proxy_pd_names = (const char*[]){
+		"lcx",
+		NULL
+	},
+	.proxy_pd_count = 1,
+	.init					= sc7280_lpass_init,
+	.exit					= sc7280_lpass_exit,
+	.alloc_dma_channel		= sc7280_lpass_alloc_dma_channel,
+	.free_dma_channel		= sc7280_lpass_free_dma_channel,
+};
+
+static const struct of_device_id sc7280_lpass_cpu_device_id[] = {
+	{.compatible = "qcom,sc7280-lpass-cpu", .data = &sc7280_data},
+	{}
+};
+MODULE_DEVICE_TABLE(of, sc7280_lpass_cpu_device_id);
+
+static struct platform_driver sc7280_lpass_cpu_platform_driver = {
+	.driver = {
+		.name = "sc7280-lpass-cpu",
+		.of_match_table = of_match_ptr(sc7280_lpass_cpu_device_id),
+	},
+	.probe = asoc_qcom_lpass_cpu_platform_probe,
+	.remove = asoc_qcom_lpass_cpu_platform_remove,
+	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
+};
+
+module_platform_driver(sc7280_lpass_cpu_platform_driver);
+
+MODULE_DESCRIPTION("SC7280 LPASS CPU DRIVER");
+MODULE_LICENSE("GPL v2");
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

