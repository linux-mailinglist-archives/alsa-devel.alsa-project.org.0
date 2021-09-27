Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECF4195DF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 16:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04AB016CA;
	Mon, 27 Sep 2021 16:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04AB016CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632751460;
	bh=NNGZLSPMXzi6kjT8OZXIuDTG5ps+KX9K8WyEkjZJrD8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3OkGY0nP2dlofT1G5uwirpEVegkBr81i1AEIUymsqQg+MM75mEhCsKYCjDaQSiGs
	 KiQ0njJND7dcWb+6F4CqJnoXEn7/ZLK3GrNRqi2j2JNIWwwohuxk4chSu1GzxVhEXG
	 sjzK2xjZ+DP+ZblJYZXiUuXQNDs2+Gs8QjGQN380=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70EA0F805AD;
	Mon, 27 Sep 2021 15:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 570C8F80566; Mon, 27 Sep 2021 15:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1D8EF80508
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 15:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D8EF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cH/LFtJB"
Received: by mail-wm1-x334.google.com with SMTP id
 136-20020a1c048e000000b0030d05169e9bso656325wme.4
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyC0f5gaxJzBJgDwCC1ngp1Qx6HSiM2kRzb09fUKRas=;
 b=cH/LFtJBF2gUclQAWWdZzVpt401jZzo5qzM6ANRcU9N05I3+VlgHEzxLGHPUJZc3cM
 7TSyujUbDcQTHWT55GyAjzg9+3xU9m8LcczBfgkXBFC5TcHZltFk2/Ik91ENckv0bTzm
 iGQWak5/ACm1Oy6WEUNSnkex5brbnnfaK8/qXC3ZH2VR8Yk7D3YSDjUc8dJTkHU6BNoL
 hLeJ5GckRuD0Us2+a89X0rba4oX9tHFVXCuifbDWHSM2i3XFKiOs0+2QfJ2i0p6shA1C
 Z14rkz7Qzs8JUaAOkP9P2JBgcrNI2m1dUdCEwCrUbQCfHHyR/KSEVe7XZOaF/7By9wxZ
 prxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyC0f5gaxJzBJgDwCC1ngp1Qx6HSiM2kRzb09fUKRas=;
 b=1SZwz0zi/LRD3n2LVWzUyD9tJUmeO+utXqwKWY31VArH3EAcVrVRHgURvY8eKd09Zj
 5q/tvvxKF7mqO/d977DvhA6k6UTAmRrAGMI98REPjjypcNq6tT5sdFYvNnoGG1L6hXUj
 FSiaBO1B/bkDKl9skOFFXTRqYv+IYhC18sFqYbac0yc34xJX06JKnvEtc0x95TqtrUyX
 o+mHnF/8cdgKgYUUUaxJ7KosYhvtMEIYDuqUBO4jEn/9l4eKNx2rlCclqax7+e3kibDD
 N8Wbdx8srlYQaU9B/xgBDrwhDQ0UuQFFdRJQH+fJBM9S6/pQAm20FGtYuF+n3U0z/STF
 X+uw==
X-Gm-Message-State: AOAM530+jCBeajr0kRI/XiYPk0yXWwS29ZfrQHtVEloNcpUw3D4Pa7bu
 HgUUJCSOf/TxTC+d9sk6kc63Uw==
X-Google-Smtp-Source: ABdhPJxjx2MPDVJ3tNEp6bVVb7iPiQe5M8eTVA1OLoIeAyxy5w1Cz9J6UGo/ZTzq6cMp2satFTyr3g==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr4609539wmi.34.1632751011384; 
 Mon, 27 Sep 2021 06:56:51 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm20485606wrm.9.2021.09.27.06.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 06:56:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v8 20/22] ASoC: qdsp6: audioreach: add q6apm lpass dai support
Date: Mon, 27 Sep 2021 14:55:57 +0100
Message-Id: <20210927135559.738-21-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Add support to Audio port dais on LPASS Audio IP using
existing common q6dsp-lpass-ports.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig                  |   4 +
 sound/soc/qcom/qdsp6/Makefile           |   1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 260 ++++++++++++++++++++++++
 3 files changed, 265 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 2e5625b93b38..d1132c4174db 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -88,9 +88,13 @@ config SND_SOC_QDSP6_APM_DAI
 	tristate
 	select SND_SOC_COMPRESS
 
+config SND_SOC_QDSP6_APM_LPASS_DAI
+	tristate
+
 config SND_SOC_QDSP6_APM
 	tristate
 	select SND_SOC_QDSP6_APM_DAI
+	select SND_SOC_QDSP6_APM_LPASS_DAI
 
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index a4ec7c4d0e48..bdcbfdfa9bd0 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -14,3 +14,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += q6apm-dai.o
+obj-$(CONFIG_SND_SOC_QDSP6_APM_LPASS_DAI) += q6apm-lpass-dais.o
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
new file mode 100644
index 000000000000..ce9e5646d8f3
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Linaro Limited
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include "q6dsp-lpass-ports.h"
+#include "audioreach.h"
+#include "q6apm.h"
+
+#define AUDIOREACH_BE_PCM_BASE	16
+
+struct q6apm_lpass_dai_data {
+	struct q6apm_graph *graph[APM_PORT_MAX];
+	bool is_port_started[APM_PORT_MAX];
+	struct audioreach_module_config module_config[APM_PORT_MAX];
+};
+
+static int q6dma_set_channel_map(struct snd_soc_dai *dai,
+				 unsigned int tx_num, unsigned int *tx_ch_mask,
+				 unsigned int rx_num, unsigned int *rx_ch_mask)
+{
+
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	int ch_mask;
+
+	switch (dai->id) {
+	case WSA_CODEC_DMA_TX_0:
+	case WSA_CODEC_DMA_TX_1:
+	case WSA_CODEC_DMA_TX_2:
+	case VA_CODEC_DMA_TX_0:
+	case VA_CODEC_DMA_TX_1:
+	case VA_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+	case TX_CODEC_DMA_TX_4:
+	case TX_CODEC_DMA_TX_5:
+		if (!tx_ch_mask) {
+			dev_err(dai->dev, "tx slot not found\n");
+			return -EINVAL;
+		}
+
+		if (tx_num > AR_PCM_MAX_NUM_CHANNEL) {
+			dev_err(dai->dev, "invalid tx num %d\n",
+				tx_num);
+			return -EINVAL;
+		}
+		ch_mask = *tx_ch_mask;
+
+		break;
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_2:
+	case RX_CODEC_DMA_RX_3:
+	case RX_CODEC_DMA_RX_4:
+	case RX_CODEC_DMA_RX_5:
+	case RX_CODEC_DMA_RX_6:
+	case RX_CODEC_DMA_RX_7:
+		/* rx */
+		if (!rx_ch_mask) {
+			dev_err(dai->dev, "rx slot not found\n");
+			return -EINVAL;
+		}
+		if (rx_num > APM_PORT_MAX_AUDIO_CHAN_CNT) {
+			dev_err(dai->dev, "invalid rx num %d\n",
+				rx_num);
+			return -EINVAL;
+		}
+		ch_mask = *rx_ch_mask;
+
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid dai id 0x%x\n",
+			__func__, dai->id);
+		return -EINVAL;
+	}
+
+	cfg->active_channels_mask = ch_mask;
+
+	return 0;
+}
+
+static int q6dma_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+
+	cfg->bit_width = params_width(params);
+	cfg->sample_rate = params_rate(params);
+	cfg->num_channels = params_channels(params);
+
+	return 0;
+}
+
+static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	int rc;
+
+	if (!dai_data->is_port_started[dai->id])
+		return;
+	rc = q6apm_graph_stop(dai_data->graph[dai->id]);
+	if (rc < 0)
+		dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+
+	q6apm_graph_close(dai_data->graph[dai->id]);
+	dai_data->is_port_started[dai->id] = false;
+}
+
+static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	struct q6apm_graph *graph;
+	int graph_id = dai->id;
+	int rc;
+
+	/**
+	 * It is recommend to load DSP with source graph first and then sink
+	 * graph, so sequence for playback and capture will be different
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		if (IS_ERR(graph)) {
+			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
+			rc = PTR_ERR(graph);
+			return rc;
+		}
+		dai_data->graph[graph_id] = graph;
+	}
+
+	cfg->direction = substream->stream;
+	rc = q6apm_graph_media_format_pcm(dai_data->graph[dai->id], cfg);
+
+	if (rc) {
+		dev_err(dai->dev, "Failed to set media format %d\n", rc);
+		return rc;
+	}
+
+	rc = q6apm_graph_prepare(dai_data->graph[dai->id]);
+	if (rc) {
+		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
+		return rc;
+	}
+
+	rc = q6apm_graph_start(dai_data->graph[dai->id]);
+	if (rc < 0) {
+		dev_err(dai->dev, "fail to start APM port %x\n", dai->id);
+		return rc;
+	}
+	dai_data->is_port_started[dai->id] = true;
+
+	return 0;
+}
+
+static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct q6apm_graph *graph;
+	int graph_id = dai->id;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		if (IS_ERR(graph)) {
+			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
+			return PTR_ERR(graph);
+		}
+		dai_data->graph[graph_id] = graph;
+	}
+
+	return 0;
+}
+
+static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+
+	cfg->fmt = fmt;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops q6dma_ops = {
+	.prepare	= q6apm_lpass_dai_prepare,
+	.startup	= q6apm_lpass_dai_startup,
+	.shutdown	= q6apm_lpass_dai_shutdown,
+	.set_channel_map  = q6dma_set_channel_map,
+	.hw_params        = q6dma_hw_params,
+};
+
+static const struct snd_soc_dai_ops q6i2s_ops = {
+	.prepare	= q6apm_lpass_dai_prepare,
+	.startup	= q6apm_lpass_dai_startup,
+	.shutdown	= q6apm_lpass_dai_shutdown,
+	.set_channel_map  = q6dma_set_channel_map,
+	.hw_params        = q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
+};
+
+static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
+	.name = "q6apm-be-dai-component",
+	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
+	.be_pcm_base = AUDIOREACH_BE_PCM_BASE,
+	.use_dai_pcm_id = true,
+};
+
+static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
+{
+	struct q6dsp_audio_port_dai_driver_config cfg;
+	struct q6apm_lpass_dai_data *dai_data;
+	struct snd_soc_dai_driver *dais;
+	struct device *dev = &pdev->dev;
+	int num_dais;
+
+	dai_data = devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
+	if (!dai_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, dai_data);
+
+	memset(&cfg, 0, sizeof(cfg));
+	cfg.q6i2s_ops = &q6i2s_ops;
+	cfg.q6dma_ops = &q6dma_ops;
+	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
+
+	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id q6apm_lpass_dai_device_id[] = {
+	{ .compatible = "qcom,q6apm-lpass-dais" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, q6apm_lpass_dai_device_id);
+#endif
+
+static struct platform_driver q6apm_lpass_dai_platform_driver = {
+	.driver = {
+		.name = "q6apm-lpass-dais",
+		.of_match_table = of_match_ptr(q6apm_lpass_dai_device_id),
+	},
+	.probe = q6apm_lpass_dai_dev_probe,
+};
+module_platform_driver(q6apm_lpass_dai_platform_driver);
+
+MODULE_DESCRIPTION("AUDIOREACH APM LPASS dai driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

