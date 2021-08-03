Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF73DEEA9
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 15:02:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F05A17E7;
	Tue,  3 Aug 2021 15:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F05A17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995735;
	bh=Ntnki6xQ0Umk+FXPdcmfeTaFtnqgUGzDnoChXMoOJGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShenN2ETh6XYBuZgEqeQ3hCeUQUKtMcJl+XyZiT4xhgr0Jo1XEwSd67vyF3RufTcA
	 L94UpwXUiry4dXOBbFexKdFDF5Z6GYebSWcLU8WhM+1o6GQBHx2P5yAHQEzImKBr3I
	 JQWPXufDensyiVFdFjKHsPUuv5zwe60WYGRzM5SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A002FF80524;
	Tue,  3 Aug 2021 14:54:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF0F3F805A9; Tue,  3 Aug 2021 14:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5252EF8051F
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5252EF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cE1C7WjV"
Received: by mail-wr1-x429.google.com with SMTP id n12so25218650wrr.2
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RCHKhb5XKSwg5gp8+2VEg2OAC9jcZJFGIHFD29kOtw=;
 b=cE1C7WjVqLXWrSc8dTQ+n35ossfhgbDQj9T2kgKqpucS5pmKZHDqX5azkXfle5yyEH
 /HchvDWyY1lYF+IHDyO3Raz0+ffNqOEOfxtLx/FV7NdImEez84gaUcxNL3Sg+Wrzw5n1
 vv8KnZntZLx3dNzifKRQ/j7iXEt7f5ko88XReGl1ndh2mvzTkLGgkAQ7Zdb0dy8JMD8G
 1jqki2oaak5oR7uiOLvvOoUYFlOIchPonAGvSbBHjQyPsEog/DoL7wpjQtXALqCDP57C
 Ai57UYYuQorlgxXpu7vgFmdsFx4sjoBCnh2oF/X/8MP9dWVzSIcq7a/0br7dZFTy/jBI
 HtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RCHKhb5XKSwg5gp8+2VEg2OAC9jcZJFGIHFD29kOtw=;
 b=Eh+inTIuepifk9WyEauUVR4/sGVDOc+YUmQB0tnLRmmLynjeZ5R4Bg2PmvDlRk09Sz
 dPdPzgOchc5J6iid17nqL2aaEVQwpivU5/COyAjrpcsVAi7NIKm4pQ4GfloeG9GE5dVR
 BdpuohwCzqzXBa+5F75Q7LPJDwveXywMjuOhVvpy4oFcY1UcvxTwczqPAqijtF5itckN
 iy0vIQCzXqrBd6fvuKPN8CX3O7HEqBPaD/5elnvwE9AMVcSLVNBZEha0mf4GW7DfmqOH
 sFxVk4FjNtm8A/pij5+Hl7Pg4UyNccE/gQakEmDHaXSVO4LglmVNyagLFxGxpgIA+d8U
 CHIQ==
X-Gm-Message-State: AOAM530lcDAG6mb7vMyXu2M7mucDjJw/Gy9KXWAArBZK9vHUWYXEYStR
 XzeUW7wKRY/jZRSRkfacUfOESA==
X-Google-Smtp-Source: ABdhPJwQ/22mHeQ4QDWDftwiMiWinvvkmpAADSadO9qSQl8n1xrv7S0XdacOcNtqdNGYT6AXsRfgHg==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr23305467wru.309.1627995283428; 
 Tue, 03 Aug 2021 05:54:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 18/20] ASoC: qdsp6: audioreach: add bedai support
Date: Tue,  3 Aug 2021 13:54:09 +0100
Message-Id: <20210803125411.28066-19-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig             |   4 +
 sound/soc/qcom/qdsp6/Makefile      |   2 +
 sound/soc/qcom/qdsp6/q6apm-bedai.c | 266 +++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-bedai.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 4f0fbf2032cc..a2540a28b482 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -106,11 +106,15 @@ config SND_SOC_QDSP6
 config SND_SOC_QDSP6_APM_DAI
 	tristate
 
+config SND_SOC_QDSP6_APM_BEDAI
+	tristate
+
 config SND_SOC_QDSP6_AUDIOREACH
 	tristate "SoC ALSA audio drives for Qualcomm QDSP AUDIOREACH Framework"
 	depends on QCOM_GPR
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_QDSP6_APM_DAI
+	select SND_SOC_QDSP6_APM_BEDAI
 	help
 	 To add support for Qualcomm QDSP6 AudioReach Audio Framework.
 	 This will enable sound soc platform specific audio drivers.
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 3e93911d04fa..d62f85b3f18a 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-ar-objs := audioreach.o q6apm.o topology.o
 snd-apm-dai-objs := q6apm-dai.o
+snd-apm-bedai-objs := q6dsp-audio-ports.o q6apm-bedai.o
 
 snd-afe-dai-objs += q6dsp-audio-ports.o q6afe-dai.o
 snd-afe-clks-objs := q6dsp-audio-clocks.o q6afe-clocks.o
@@ -17,3 +18,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_AUDIOREACH) += snd-ar.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += snd-apm-dai.o
+obj-$(CONFIG_SND_SOC_QDSP6_APM_BEDAI) += snd-apm-bedai.o
diff --git a/sound/soc/qcom/qdsp6/q6apm-bedai.c b/sound/soc/qcom/qdsp6/q6apm-bedai.c
new file mode 100644
index 000000000000..ac72c0eb73db
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6apm-bedai.c
@@ -0,0 +1,266 @@
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
+#include "q6dsp-audio-ports.h"
+#include "audioreach.h"
+#include "q6apm.h"
+
+#define AUDIOREACH_BE_PCM_BASE	16
+
+struct q6apm_bedai_data {
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
+	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	int ch_mask;
+	int rc = 0;
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
+		if (tx_num > PCM_MAX_NUM_CHANNEL) {
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
+	return rc;
+}
+
+static int q6dma_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct snd_soc_dai *dai)
+{
+	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+
+	cfg->bit_width = params_width(params);
+	cfg->sample_rate = params_rate(params);
+	cfg->num_channels = params_channels(params);
+
+	return 0;
+}
+
+static void q6apm_bedai_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
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
+
+}
+
+static int q6apm_bedai_prepare(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	int graph_id = dai->id;
+	int rc;
+	struct q6apm_graph *graph;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		if (IS_ERR(graph)) {
+			dev_err(dai->dev, "Failed to open graph (%d)\n",
+				graph_id);
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
+static int q6apm_bedai_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
+	int graph_id = dai->id;
+	struct q6apm_graph *graph;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		if (IS_ERR(graph)) {
+			dev_err(dai->dev, "Failed to open graph (%d)\n",
+				graph_id);
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
+	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+
+	cfg->fmt = fmt;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops q6dma_ops = {
+	.prepare	= q6apm_bedai_prepare,
+	.startup	= q6apm_bedai_startup,
+	.shutdown	= q6apm_bedai_shutdown,
+	.set_channel_map  = q6dma_set_channel_map,
+	.hw_params        = q6dma_hw_params,
+};
+
+static const struct snd_soc_dai_ops q6i2s_ops = {
+	.prepare	= q6apm_bedai_prepare,
+	.startup	= q6apm_bedai_startup,
+	.shutdown	= q6apm_bedai_shutdown,
+	.set_channel_map  = q6dma_set_channel_map,
+	.hw_params        = q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
+};
+
+static const struct snd_soc_component_driver q6apm_bedai_component = {
+	.name		= "q6apm-be-dai-component",
+	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
+	.be_pcm_base = AUDIOREACH_BE_PCM_BASE,
+	.use_dai_pcm_id = true,
+};
+
+static int q6apm_bedai_dev_probe(struct platform_device *pdev)
+{
+	struct q6dsp_audio_port_dai_driver_config cfg;
+	struct snd_soc_dai_driver *dais;
+	struct q6apm_bedai_data *dai_data;
+	struct device *dev = &pdev->dev;
+	int num_dais;
+
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
+	return devm_snd_soc_register_component(dev, &q6apm_bedai_component,
+					       dais, num_dais);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id q6apm_bedai_device_id[] = {
+	{ .compatible = "qcom,q6apm-bedais" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, q6apm_bedai_device_id);
+#endif
+
+static struct platform_driver q6apm_bedai_platform_driver = {
+	.driver = {
+		.name = "q6apm-bedai",
+		.of_match_table = of_match_ptr(q6apm_bedai_device_id),
+	},
+	.probe = q6apm_bedai_dev_probe,
+};
+module_platform_driver(q6apm_bedai_platform_driver);
+
+MODULE_DESCRIPTION("AUDIOREACH Audio BackEnd dai driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

