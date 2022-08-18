Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D859851D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F242167F;
	Thu, 18 Aug 2022 15:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F242167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660831217;
	bh=FE3tpsm8A74tmciqFMEJFS6Gf7ndP5FrJo5Z3o4Xt1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTref0Q4VGyfBZS9KtZlTQqiiDM5RY4d4X+Ki+8TCN6I3rl613KYvlPhRgVIJoe0U
	 oamgndeukMc4dngqrvYfEejKK/s1KVqnhMW0QNhv7aFQObeeoEJE7qMuq27C5YUSQx
	 2SBziLEoRVQfgfE8pbl9ccJStbzrV1vg/FfZxnAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55AF7F804CF;
	Thu, 18 Aug 2022 15:58:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30D3DF804CF; Thu, 18 Aug 2022 15:58:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93512F800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93512F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vibrq/2f"
Received: by mail-wm1-x331.google.com with SMTP id j26so886507wms.0
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Gcq/MNox46vkVaOFbJDKt3RUNde615bJ744Z+6gObTw=;
 b=vibrq/2fUjIPeQmnS8Wbkek4U1KafGvM4qnOqHHMjx4LGO4buuVGkR99I6+2aZ64cd
 A6RlbZqaJuxcDWYUAo4Bfem+tcPTb3Ujpf9havVi3NF3ce47CEU6kSwzqBLDvEplVOhk
 8v44EFu5Lwh1pXKCSrbD8jUpRS4s3HpKRCMKYDutEo36/TVLLWTzxSwjON0Yt6bjy6rv
 x/rONf+/NTsLBvBwrK5F8+XVC1zvvA7O7QJ0zx9Xjc4ZrHDeOFdRlFk0DFnfmMdXTqbm
 Kg82D8W49a4YEhCwqt/wYS9rtZSUuGgBq+piNOfLosmC92UX8DW83Bnhyr06qRdtUYWf
 Sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Gcq/MNox46vkVaOFbJDKt3RUNde615bJ744Z+6gObTw=;
 b=rTdiymf2QSOLOakAufg2Dg6g5+vqjyrNUigGd19vYPoL1ZiQFMHGjsTBPoxP3X2cl+
 dLLRRLlDNt6X3Baz6uZxvX3QGsMeXQ3m4O2x3U+l70cThSvMioXq+3L8VRQcL0zyWJHC
 21H6Bul+bkSzz8QKsWY7SsWmlEYoEtfrLnELr8+EcZ2NDhOfOkCO7TS4sXd4y9lpyehW
 JNXIQYAiN2e4hSR8q7+dYmUaXCyZ24ffwFeNhnlg75YOufP6atS5KcDtMMXvxK3q7alz
 rjochlOt48Qrj6JRVm7DvMhsHUrY7CvI09437OTd37GOsn+3oZ5njAQiydXZcFg6N8s7
 Qh9w==
X-Gm-Message-State: ACgBeo1ln4jHsfhE6f/PuU/U3+IyXfevTRo0RQY46VftGPUtaoCMd4ZL
 MPT2cdQsGWOhT4oX3+BytWGiOg==
X-Google-Smtp-Source: AA6agR5HZvb+LPA0TRoJ4TB+2kKBbHlhPtSE0eJcSYtCLA+B+YFQ7wuqrn3u92SMEyiK36J/aC0aiA==
X-Received: by 2002:a05:600c:358f:b0:3a6:145:3500 with SMTP id
 p15-20020a05600c358f00b003a601453500mr2090836wmq.64.1660831113185; 
 Thu, 18 Aug 2022 06:58:33 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm5335937wme.8.2022.08.18.06.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:58:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/3] ASoC: qcom: add machine driver for sc8280xp
Date: Thu, 18 Aug 2022 14:58:17 +0100
Message-Id: <20220818135817.10142-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
References: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

