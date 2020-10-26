Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF0A299373
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 18:11:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B3116BD;
	Mon, 26 Oct 2020 18:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B3116BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603732304;
	bh=BEmrPDU4/Qp3V3YOptvdDF2XrV9EJ1BPXRfEaselq78=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agNo4lisNQH6FHe/LJkR3SGdLHkgYnRk4orj9uF1eKSXEVlgkIvze35m8XK/xtGdQ
	 9RF90DfmPAlSp8uY6g5KZWGfh+DSD9Jgw7Ig2nL6RKklUYMx4wzsBK0BX5cJe3Ejsv
	 t5HFz9JHFiSiMy9KFZknD46wrqWi69bY6a6cQ+Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EAEEF80276;
	Mon, 26 Oct 2020 18:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F34D7F8025E; Mon, 26 Oct 2020 18:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 780C3F80212
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 18:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780C3F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nn6ZgeQn"
Received: by mail-wr1-x444.google.com with SMTP id n6so13498904wrm.13
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRUE6uAh5erOgzhAmZUD/lWQAfes5L6DiZUe9zh/gxQ=;
 b=nn6ZgeQnM2dzxDtWcEo3cD3muN1MPnW7xxAgw0MdQaQ5/cCvc3a8nfijUqX+YnUr1l
 /Sz+rYIfZGwBIZQxd7nhyZPVCLTILbnWEqEL1b+0bqSZ6/e0rtjFkHQMBLocDOKYnjnT
 vBEgTJm8EqdqQ4RPWtC3u97p6DvQRlnLZ1D+OukGLkRW4gkXMvjKi2Jbn66grN4gbnqa
 W46jAEoGTC+yGHNp9/MXhO8UywTEu1bW2Hnx97gTjopDW/KPnOAyZPwYCQw8gHbpdtCm
 l1rONw/he+Ms+9HAu1HwS/oanKRJtBYFcAqGhRlyoEb5jmfDb9AdhRPw0EXU9AKpztef
 LgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRUE6uAh5erOgzhAmZUD/lWQAfes5L6DiZUe9zh/gxQ=;
 b=RdCtWGPSCCoyIavcmPwYuYaFJWKQqMNasVfUC1T+UMZ6IUrxJDxT8EjJafK8Tw0jCk
 N1ZmDEDXb3ystM49+JhVXjJXjmzJpZ6W5+w0AvcL9up0l95zjTNTUYtAdrJdyI+vb6bG
 rLOYNMBm35VEN11A432a1Bsg94B2Dd3ioAvMOyxQPdX6o+WWO5+uOjquGeoserzeA3lw
 Gp7ha+WYERfxGg4k0gm3+qeSxEmUOOcdI7SlSfzkhMHKB74L4UkPl7SotiykGIfGqFHZ
 3xFS4391+XG/P3AtcbazgQsOxuZJ8LBXekDvshYU5bSLoZhItLzba48Ta3tSOZz8Iz43
 aSqQ==
X-Gm-Message-State: AOAM533bVKx1ZSrUpm4iBn21XriJ8oyMzdsMm7qX/ewN7HDCku25+1lJ
 wnBf9jy9hYoLWngxIlJ+LFtW9A==
X-Google-Smtp-Source: ABdhPJxkVIFyw1Jgvnui9n/a9KCedJXKM1Ndg/etoojRDrAAR/EDPJ2ts0Rn9ou4VJwfXWvll+WVzQ==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr19135023wru.356.1603732194103; 
 Mon, 26 Oct 2020 10:09:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u133sm23136174wmb.6.2020.10.26.10.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:09:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 2/2] ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
Date: Mon, 26 Oct 2020 17:09:47 +0000
Message-Id: <20201026170947.10567-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
References: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
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

Add support to Qualcomm Robotics RB5 Development Kit based on
QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers
with onboard DMIC connected to internal LPASS codec via WSA
and VA macros respectively.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig  |  11 ++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/sm8250.c | 228 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 241 insertions(+)
 create mode 100644 sound/soc/qcom/sm8250.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 2696ffcba880..484cad31da25 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -127,4 +127,15 @@ config SND_SOC_SDM845
 	  SDM845 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
 
+config SND_SOC_SM8250
+	tristate "SoC Machine driver for SM8250 boards"
+	depends on QCOM_APR && SOUNDWIRE
+	depends on COMMON_CLK
+	select SND_SOC_QDSP6
+	select SND_SOC_QCOM_COMMON
+	help
+	  To add support for audio on Qualcomm Technologies Inc.
+	  SM8250 SoC-based systems.
+	  Say Y if you want to use audio device on this SoCs.
+
 endif #SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 0bd90d74e3db..effa4b3f58fa 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -19,12 +19,14 @@ snd-soc-storm-objs := storm.o
 snd-soc-apq8016-sbc-objs := apq8016_sbc.o
 snd-soc-apq8096-objs := apq8096.o
 snd-soc-sdm845-objs := sdm845.o
+snd-soc-sm8250-objs := sm8250.o
 snd-soc-qcom-common-objs := common.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
+obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 
 #DSP lib
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
new file mode 100644
index 000000000000..7d43de6d909f
--- /dev/null
+++ b/sound/soc/qcom/sm8250.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include <linux/soundwire/sdw.h>
+#include "qdsp6/q6afe.h"
+#include "common.h"
+
+#define DRIVER_NAME		"sm8250"
+#define MI2S_BCLK_RATE		1536000
+#define MAX_SDW_STREAMS		16
+
+struct sm8250_snd_data {
+	bool stream_prepared[MAX_SDW_STREAMS];
+	struct snd_soc_card *card;
+	struct sdw_stream_runtime *sruntime[MAX_SDW_STREAMS];
+};
+
+static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	return 0;
+}
+
+static int sm8250_snd_startup(struct snd_pcm_substream *substream)
+{
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case TERTIARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime;
+	int i;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
+						      substream->stream);
+			if (sruntime != ERR_PTR(-ENOTSUPP))
+				pdata->sruntime[cpu_dai->id] = sruntime;
+		}
+		break;
+	}
+
+	return 0;
+
+}
+
+static int sm8250_snd_wsa_dma_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	int ret;
+
+	if (!sruntime)
+		return 0;
+
+	if (data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
+	}
+
+	ret = sdw_prepare_stream(sruntime);
+	if (ret)
+		return ret;
+
+	/**
+	 * NOTE: there is a strict hw requirement about the ordering of port
+	 * enables and actual WSA881x PA enable. PA enable should only happen
+	 * after soundwire ports are enabled if not DC on the line is
+	 * accumulated resulting in Click/Pop Noise
+	 * PA enable/mute are handled as part of codec DAPM and digital mute.
+	 */
+
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	data->stream_prepared[cpu_dai->id]  = true;
+
+	return ret;
+}
+
+static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		return sm8250_snd_wsa_dma_prepare(substream);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		if (sruntime && data->stream_prepared[cpu_dai->id]) {
+			sdw_disable_stream(sruntime);
+			sdw_deprepare_stream(sruntime);
+			data->stream_prepared[cpu_dai->id] = false;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops sm8250_be_ops = {
+	.startup = sm8250_snd_startup,
+	.hw_params = sm8250_snd_hw_params,
+	.hw_free = sm8250_snd_hw_free,
+	.prepare = sm8250_snd_prepare,
+};
+
+static void sm8250_add_be_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm == 1) {
+			link->be_hw_params_fixup = sm8250_be_hw_params_fixup;
+			link->ops = &sm8250_be_ops;
+		}
+	}
+}
+
+static int sm8250_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sm8250_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card->dev = dev;
+	dev_set_drvdata(dev, card);
+	snd_soc_card_set_drvdata(card, data);
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	card->driver_name = DRIVER_NAME;
+	sm8250_add_be_ops(card);
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id snd_sm8250_dt_match[] = {
+	{.compatible = "qcom,sdm8250"},
+	{.compatible = "qcom,qrb5165-rb5"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, snd_sm8250_dt_match);
+
+static struct platform_driver snd_sm8250_driver = {
+	.probe  = sm8250_platform_probe,
+	.driver = {
+		.name = "snd-sm8250",
+		.of_match_table = snd_sm8250_dt_match,
+	},
+};
+module_platform_driver(snd_sm8250_driver);
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
+MODULE_DESCRIPTION("SM8250 ASoC Machine Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

