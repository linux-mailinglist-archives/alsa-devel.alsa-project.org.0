Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DE5AF150
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 18:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E41084A;
	Tue,  6 Sep 2022 18:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E41084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483460;
	bh=FE3tpsm8A74tmciqFMEJFS6Gf7ndP5FrJo5Z3o4Xt1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ohWgKs7B+s6NqkUekK7tZVkqXDNuP7mam410CmE9d7LsFJwKFAfn7naSTfsZ/pXk/
	 PBuDx9WXECK26wdKclQDDE81SbD8rPkwPX6Qy1PIgj0u5xvpkZqFN1dZejWTGhNUnj
	 8X4H6cePh5G3oj1iIt8FZrv8l3H/heqtbenQ00Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5038F80551;
	Tue,  6 Sep 2022 18:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13862F8054A; Tue,  6 Sep 2022 18:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58140F804AB
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 18:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58140F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NvHdCPJ7"
Received: by mail-wr1-x432.google.com with SMTP id k9so16419420wri.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Gcq/MNox46vkVaOFbJDKt3RUNde615bJ744Z+6gObTw=;
 b=NvHdCPJ73KUNB2UbRiJ5wwpFt5neFIHBCuJ+40Ggum0J6rI7IzLGmjvoqHfzb8BEgc
 jEtYJXejYb1jaAVGR9Xu5CcQyNce8Cfcm2R1EVDOSLTV/J6jL+6ZmHsvOJaY6NVXAjBD
 nJAjJVyw5+KSRz0VHmbSOOiCWW9tuB/h4Q5cVpcRLpjWpvpVKhBKHrsT5GfP6sWNL3V1
 6b+zyBLN3sFLMrcE87ds4VHg2N81RY76teck0rM+AsighpjaNGVykDF4QV0p9nEIaril
 CrHeyxf2aj03iew8p0f+ZeXoDGXJvBcjyMKYF7/yYWEutGzZJF2RBBE2ilh9YkxVAwxI
 RIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Gcq/MNox46vkVaOFbJDKt3RUNde615bJ744Z+6gObTw=;
 b=OrPpDrUAW3Xy0aXZYIzGmgOyjItxv33evWOzI76M3NJq03/fR/13NRji2yiqCgLtEk
 YSLW4sKs1EaPFHxEwxSv4sKKPzcd3SawA8EHfG8kdDakRCGx+aY2jYVxHAm/BeHnyhcq
 svurxI6OmUXT0rH6lneKW0C405TDbJxXcMCuhXEnu88uKblu5W/bfRvKKASeiVgkXu6z
 anq3iTLYpoORv8O8hSrA3YVc+fqPeLwTYmEL8pEMNtB8rHIyiAEDeg0a+dHoqhXEQrlV
 Xi7etBEsi/zpbptfwSbp+zfQ3UF49yTx44CmxI5nS45BMZb+kDdnwITamF7KcayUOLi+
 eFWw==
X-Gm-Message-State: ACgBeo11q74fb9m/7NhLi4lZRx+HzMZeWaiPxKOhQn9U7U5R8dhevNuQ
 7pSQg5c1W2OAC/gOQLBOuFBVCg==
X-Google-Smtp-Source: AA6agR5PiDR/2k1DUeL7K6n44sJjroc+crFQ950we/ZE/vtD0Tb4/EDWJYijMeIyoL9SUO5ldHZwRA==
X-Received: by 2002:a05:6000:1566:b0:228:b754:186e with SMTP id
 6-20020a056000156600b00228b754186emr5060162wrz.226.1662483318779; 
 Tue, 06 Sep 2022 09:55:18 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b0021eed2414c9sm13775906wrb.40.2022.09.06.09.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 09:55:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 4/4] ASoC: qcom: add machine driver for sc8280xp
Date: Tue,  6 Sep 2022 17:55:08 +0100
Message-Id: <20220906165508.30801-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

Add machine driver for sc8280xp SoC.

This intial supports only includes WSA883x Speakers and WCD938x based headset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig    |  11 +++
 sound/soc/qcom/Makefile   |   2 +
 sound/soc/qcom/sc8280xp.c | 157 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 sound/soc/qcom/sc8280xp.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 750653404ba3..d0e59e07b1fc 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -173,6 +173,17 @@ config SND_SOC_SM8250
 	  SM8250 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
 
+config SND_SOC_SC8280XP
+	tristate "SoC Machine driver for SC8280XP boards"
+	depends on QCOM_APR && SOUNDWIRE
+	depends on COMMON_CLK
+	select SND_SOC_QDSP6
+	select SND_SOC_QCOM_COMMON
+	help
+	  To add support for audio on Qualcomm Technologies Inc.
+	  SC8280XP SoC-based systems.
+	  Say Y if you want to use audio device on this SoCs.
+
 config SND_SOC_SC7180
 	tristate "SoC Machine driver for SC7180 boards"
 	depends on I2C && GPIOLIB
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 8b7b876899a8..8b97172cf990 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -26,6 +26,7 @@ snd-soc-sc7180-objs := sc7180.o
 snd-soc-sc7280-objs := sc7280.o
 snd-soc-sdm845-objs := sdm845.o
 snd-soc-sm8250-objs := sm8250.o
+snd-soc-sc8280xp-objs := sc8280xp.o
 snd-soc-qcom-common-objs := common.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
@@ -33,6 +34,7 @@ obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
 obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
+obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
new file mode 100644
index 000000000000..ade44ad7c585
--- /dev/null
+++ b/sound/soc/qcom/sc8280xp.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/jack.h>
+#include <linux/input-event-codes.h>
+#include "qdsp6/q6afe.h"
+#include "common.h"
+
+#define DRIVER_NAME		"sc8280xp"
+
+struct sc8280xp_snd_data {
+	bool stream_prepared[AFE_PORT_MAX];
+	struct snd_soc_card *card;
+	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
+	struct snd_soc_jack jack;
+	bool jack_setup;
+};
+
+static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+}
+
+static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_interval *rate = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	rate->min = rate->max = 48000;
+	channels->min = 2;
+	channels->max = 2;
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		channels->min = 1;
+		break;
+	default:
+		break;
+	}
+
+
+	return 0;
+}
+
+static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
+}
+
+static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_prepare(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_hw_free(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static const struct snd_soc_ops sc8280xp_be_ops = {
+	.hw_params = sc8280xp_snd_hw_params,
+	.hw_free = sc8280xp_snd_hw_free,
+	.prepare = sc8280xp_snd_prepare,
+};
+
+static void sc8280xp_add_be_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm == 1) {
+			link->init = sc8280xp_snd_init;
+			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
+			link->ops = &sc8280xp_be_ops;
+		}
+	}
+}
+
+static int sc8280xp_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sc8280xp_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+	card->owner = THIS_MODULE;
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
+	sc8280xp_add_be_ops(card);
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "qcom,sc8280xp-sndcard",},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, snd_sc8280xp_dt_match);
+
+static struct platform_driver snd_sc8280xp_driver = {
+	.probe  = sc8280xp_platform_probe,
+	.driver = {
+		.name = "snd-sc8280xp",
+		.of_match_table = snd_sc8280xp_dt_match,
+	},
+};
+module_platform_driver(snd_sc8280xp_driver);
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
+MODULE_DESCRIPTION("SC8280XP ASoC Machine Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

