Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB92686DC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 10:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26948169D;
	Mon, 14 Sep 2020 10:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26948169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600071003;
	bh=jTylCyPNxG5BrVSa1GCS8xZ4h+hUtuUXVzLlpMuh/wQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IkpvrtR9dW6OHQnPT7pH9wxSOr051ustIjoiZy0fsU5uY9Z6RDOIb7Ouyounwhdzh
	 yd1mvgC/VyNZGFI1USk0foLE2lkA/sm+c+bvo/u/WAhlE7l7oycswqZSc0gXrqnc0j
	 gnnAFd3rRISqfpcvv1BGfQvszU62a08nbfbTR0Ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA5ECF802E1;
	Mon, 14 Sep 2020 10:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7190FF802E0; Mon, 14 Sep 2020 10:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE521F8015A
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 10:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE521F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="k2M7YTCI"
Received: by mail-pj1-x1041.google.com with SMTP id a9so5080120pjg.1
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wjv7AM8h2QU1K1I/JZG0UZKZmyNTBMTzCWjzUH+khzw=;
 b=k2M7YTCIrKM/0WkCBm4A7HUiZUjSPhzMesKu+vQojt30T2NRC2J7qSS8jlZk9W9x+h
 dTvb5J3Ula347+L6figDAnliwwFTq3OmXJOLJW+N3CefQm4Hw5pQdsAoqS4XIKJ5MBkc
 sEnMVnWFLxe6a387F5IVzEBCni+9jVJPvpzEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjv7AM8h2QU1K1I/JZG0UZKZmyNTBMTzCWjzUH+khzw=;
 b=N427P7kfr88SAjriilkIty4HCxDPSXs8v9h36POqIowREEswdwbYR7h/xX8BqgUIVd
 QWNvy1Q7rbLA5Tto2Zf26WVaZ7iAz6gA19h/Z6HT2greE2Q8MlkWM3NhXMDiyWTNgfQS
 OQzv7+ajF7Ai/9JCILQlB5OJaZvBDFryTFu1uq5XbLrI9HwFQuTSOYo0hgeEZJ6Z8m7Q
 8Xu7MVlhoiY4hJNr3poIT5DXqafwTGAmkhbbOXkP+3ARdTlFoSTSdVxi/BudVYDKb4sb
 GREX6XlDE/tecHXaBOJS/ZNulcCSQ7WtFP0I9FRtIIe4pPSLcJM1M7AFw08NjdiIT5Z1
 9owA==
X-Gm-Message-State: AOAM531wFT5Jrf73Hgbg9OUdFMDvhEOlDLqaCAG7Hv/O8sNDcVbbRh13
 QmUoaCKUT7FnJbt4YOtwrgqS3Q==
X-Google-Smtp-Source: ABdhPJzsjt47G6PDc6AvjCAL657ADxGI4s6Wj63jOtoDN75dcJ2JJ9iJHYbcK2rADqU7KkoPBAUlDw==
X-Received: by 2002:a17:90a:7487:: with SMTP id
 p7mr13077266pjk.189.1600070807971; 
 Mon, 14 Sep 2020 01:06:47 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id mh8sm8084570pjb.32.2020.09.14.01.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 01:06:47 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/3] ASoC: qcom: sc7180: Add machine driver for sound card
 registration
Date: Mon, 14 Sep 2020 16:06:19 +0800
Message-Id: <20200914080619.4178587-4-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200914080619.4178587-1-cychiang@chromium.org>
References: <20200914080619.4178587-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 Ajit Pandey <ajitp@codeaurora.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

From: Ajit Pandey <ajitp@codeaurora.org>

Add new driver to register sound card on sc7180 trogdor board and
do the required configuration for lpass cpu dai and external codecs
connected over MI2S interfaces.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/qcom/Kconfig  |  12 ++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/sc7180.c | 266 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 sound/soc/qcom/sc7180.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a607ace8b089..0459185ee243 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -116,4 +116,16 @@ config SND_SOC_SDM845
 	  SDM845 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
 
+config SND_SOC_SC7180
+	tristate "SoC Machine driver for SC7180 boards"
+	depends on I2C
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_LPASS_SC7180
+	select SND_SOC_MAX98357A
+	select SND_SOC_RT5682_I2C
+	help
+	  To add support for audio on Qualcomm Technologies Inc.
+	  SC7180 SoC-based systems.
+	  Say Y if you want to use audio device on this SoCs.
+
 endif #SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 7972c9479ab0..0cdcbf367ef1 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -17,12 +17,14 @@ snd-soc-storm-objs := storm.o
 snd-soc-apq8016-sbc-objs := apq8016_sbc.o
 snd-soc-apq8096-objs := apq8096.o
 snd-soc-sdm845-objs := sdm845.o
+snd-soc-sc7180-objs := sc7180.o
 snd-soc-qcom-common-objs := common.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
+obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 
 #DSP lib
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
new file mode 100644
index 000000000000..0e90448523b0
--- /dev/null
+++ b/sound/soc/qcom/sc7180.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020, The Linux Foundation. All rights reserved.
+//
+// sc7180.c -- ALSA SoC Machine driver for SC7180
+
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <uapi/linux/input-event-codes.h>
+
+#include "../codecs/rt5682.h"
+#include "common.h"
+#include "lpass.h"
+
+#define DEFAULT_MCLK_RATE		19200000
+#define RT5682_PLL1_FREQ (48000 * 512)
+
+// This will be defined in include/dt-bindings/sound/sc7180-lpass.h
+#define LPASS_DP_RX 2
+
+struct sc7180_snd_data {
+	struct snd_soc_card card;
+	u32 pri_mi2s_clk_count;
+	struct snd_soc_jack hs_jack;
+	struct snd_soc_jack hdmi_jack;
+};
+
+static void sc7180_jack_free(struct snd_jack *jack)
+{
+	struct snd_soc_component *component = jack->private_data;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_jack *jack;
+	int rval;
+
+	rval = snd_soc_card_jack_new(
+			card, "Headset Jack",
+			SND_JACK_HEADSET |
+			SND_JACK_HEADPHONE |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3,
+			&pdata->hs_jack, NULL, 0);
+
+	if (rval < 0) {
+		dev_err(card->dev, "Unable to add Headset Jack\n");
+		return rval;
+	}
+
+	jack = pdata->hs_jack.jack;
+
+	snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	jack->private_data = component;
+	jack->private_free = sc7180_jack_free;
+
+	return snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
+}
+
+static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_jack *jack;
+	int rval;
+
+	rval = snd_soc_card_jack_new(
+			card, "HDMI Jack",
+			SND_JACK_LINEOUT,
+			&pdata->hdmi_jack, NULL, 0);
+
+	if (rval < 0) {
+		dev_err(card->dev, "Unable to add HDMI Jack\n");
+		return rval;
+	}
+
+	jack = pdata->hdmi_jack.jack;
+	jack->private_data = component;
+	jack->private_free = sc7180_jack_free;
+
+	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
+}
+
+static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		return sc7180_headset_init(rtd);
+	case MI2S_SECONDARY:
+		return 0;
+	case LPASS_DP_RX:
+		return sc7180_hdmi_init(rtd);
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sc7180_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		if (++data->pri_mi2s_clk_count == 1) {
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPASS_MCLK0,
+					       DEFAULT_MCLK_RATE,
+					       SNDRV_PCM_STREAM_PLAYBACK);
+		}
+
+		snd_soc_dai_set_fmt(codec_dai,
+				    SND_SOC_DAIFMT_CBS_CFS |
+				    SND_SOC_DAIFMT_NB_NF |
+				    SND_SOC_DAIFMT_I2S);
+
+		/* Configure PLL1 for codec */
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
+					  DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
+		if (ret) {
+			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
+			return ret;
+		}
+
+		/* Configure sysclk for codec */
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+					     RT5682_PLL1_FREQ,
+					     SND_SOC_CLOCK_IN);
+		if (ret)
+			dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
+				ret);
+
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		if (--data->pri_mi2s_clk_count == 0) {
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPASS_MCLK0,
+					       0,
+					       SNDRV_PCM_STREAM_PLAYBACK);
+		}
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		break;
+	}
+}
+
+static const struct snd_soc_ops sc7180_ops = {
+	.startup = sc7180_snd_startup,
+	.shutdown = sc7180_snd_shutdown,
+};
+
+static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static void sc7180_add_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		link->ops = &sc7180_ops;
+		link->init = sc7180_init;
+	}
+}
+
+static int sc7180_snd_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sc7180_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card = &data->card;
+	snd_soc_card_set_drvdata(card, data);
+
+	card->owner = THIS_MODULE,
+	card->dev = dev;
+	card->dapm_widgets = sc7180_snd_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	sc7180_add_ops(card);
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id sc7180_snd_device_id[]  = {
+	{ .compatible = "qcom,sc7180-sndcard-rt5682-m98357-1mic" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
+
+static struct platform_driver sc7180_snd_driver = {
+	.probe = sc7180_snd_platform_probe,
+	.driver = {
+		.name = "msm-snd-sc7180",
+		.of_match_table = sc7180_snd_device_id,
+	},
+};
+module_platform_driver(sc7180_snd_driver);
+
+MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0.618.gf4bc123cb7-goog

