Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C437247D23
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 05:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF51E16F7;
	Tue, 18 Aug 2020 05:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF51E16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597722812;
	bh=Sx4M/K/XV1mJOvw3voiPBOt3RFmLhAK2Dg/jAqRSo5w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNIClVURUwTsTA+XykoGSOjCOnrtM0pbdrsOv64S9XhyaB86utye69dgv6zuvS2FM
	 hLB5FW2SayZxRxGv6oYARZZnz7gO7m8W47BEoiJvHCQ9So0V0UedP+NLR82aTrxYLK
	 8Qwd2bh1iwUKvt6AjpSqj1h/3JBh992VDO2vU3GY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 304BAF802E0;
	Tue, 18 Aug 2020 05:51:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21B89F802DF; Tue, 18 Aug 2020 05:51:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEB04F802C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 05:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB04F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fFplalD0"
Received: by mail-pg1-x543.google.com with SMTP id m34so9111571pgl.11
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 20:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXcyzgpA0O3bb7a8a920U2T7CsYtwR4Ii0WCR468L8w=;
 b=fFplalD0iHrxteK60yQp8uhq82RIySlnPh3iyLrKubsfeJc7iRY98wsUhx8lr77AFK
 xAs8N1cTcPZlSa90BhJizjw/zwjcjc29KTXqhEm6zYD8KwtpUH6wWip+oqlpQBVqFIRb
 PcL9M3A2FW6ky0doCGS7GJDm7oNKrv3cbs61s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXcyzgpA0O3bb7a8a920U2T7CsYtwR4Ii0WCR468L8w=;
 b=gmEPgzr8WKJys77+Do3DL3SCEe631Qqbtums59j8zQJOTF9ZU+0ISqGDchllBoD2Cq
 ANiGwJdFknW84TKm/cSvRPCgAvw2JA+Rry5qkb8oAz9bOy/pcDpD/7QG9U7K5MUtiESF
 Z/oyxAbaXNK2v38N1q3jRKbRYJzOyrL56knOJuxPz99Li0dFJr+QFLY68fD73bvke+8b
 PfumRbLRqXrqGvIGtrQKCCkjMRHFY+S336nok2dt/RAemznOfAkmq7el3F+aV+ChGBH6
 71twAstUBDBH30zXACznFs5W4ZzB7LkOuLMQQ/5WTeiY8ZPqZI8Y7NUDCX7JUUCSFQMz
 gSNQ==
X-Gm-Message-State: AOAM5313+j7NgZlLiM/Qzb04Qg97msm8vSr8QU1mpIghHopy9ErRwHv6
 L678xbqdpTJ2Q1fyO1djLmD8iw==
X-Google-Smtp-Source: ABdhPJykyc+8el7jwwAy4NzOPDj1/2JfxP76jnqiF6sOfqoP20iyaEQUeebqVt363z1fyaSc37dSTg==
X-Received: by 2002:aa7:9a88:: with SMTP id w8mr13097421pfi.88.1597722677762; 
 Mon, 17 Aug 2020 20:51:17 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id b185sm21922658pfg.71.2020.08.17.20.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 20:51:17 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] ASoC: qcom: sc7180: Add machine driver for sound card
 registration
Date: Tue, 18 Aug 2020 11:50:28 +0800
Message-Id: <20200818035028.2265197-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200818035028.2265197-1-cychiang@chromium.org>
References: <20200818035028.2265197-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Patrick Lai <plai@codeaurora.org>, Ajit Pandey <ajitp@codeaurora.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/qcom/Kconfig  |  12 ++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/sc7180.c | 244 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 sound/soc/qcom/sc7180.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 5d6b2466a2f2..54aa2ede229c 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -110,3 +110,15 @@ config SND_SOC_SDM845
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SDM845 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
+
+config SND_SOC_SC7180
+	tristate "SoC Machine driver for SC7180 boards"
+	depends on SND_SOC_QCOM
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_LPASS_SC7180
+	select SND_SOC_MAX98357A
+	select SND_SOC_RT5682
+	help
+	 To add support for audio on Qualcomm Technologies Inc.
+	 SC7180 SoC-based systems.
+	 Say Y if you want to use audio device on this SoCs.
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 41b2c7a23a4d..3f6275d90526 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -15,12 +15,14 @@ snd-soc-storm-objs := storm.o
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
index 000000000000..7849376f63ba
--- /dev/null
+++ b/sound/soc/qcom/sc7180.c
@@ -0,0 +1,244 @@
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
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <uapi/linux/input-event-codes.h>
+
+#include "../codecs/rt5682.h"
+#include "common.h"
+#include "lpass.h"
+
+#define DEFAULT_SAMPLE_RATE_48K		48000
+#define DEFAULT_MCLK_RATE		19200000
+#define RT5682_PLL1_FREQ (48000 * 512)
+
+struct sc7180_snd_data {
+	struct snd_soc_jack jack;
+	u32 pri_mi2s_clk_count;
+};
+
+static void sc7180_jack_free(struct snd_jack *jack)
+{
+	struct snd_soc_component *component = jack->private_data;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sc7180_headset_init(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_jack *jack;
+	int rval;
+
+	rval = snd_soc_card_jack_new(
+			card, "Headset Jack",
+			SND_JACK_HEADSET |
+			SND_JACK_HEADPHONE |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3,
+			&pdata->jack, NULL, 0);
+
+	if (rval < 0) {
+		dev_err(card->dev, "Unable to add Headset Jack\n");
+		return rval;
+	}
+
+	jack = pdata->jack.jack;
+
+	snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	jack->private_data = component;
+	jack->private_free = sc7180_jack_free;
+
+	rval = snd_soc_component_set_jack(component,
+					  &pdata->jack, NULL);
+	if (rval != 0 && rval != -EOPNOTSUPP) {
+		dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+		return rval;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_aux_dev sc7180_headset_dev = {
+	.dlc = COMP_EMPTY(),
+	.init = sc7180_headset_init,
+};
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
+static struct snd_soc_card sc7180_card = {
+	.owner = THIS_MODULE,
+	.aux_dev = &sc7180_headset_dev,
+	.num_aux_devs = 1,
+	.dapm_widgets = sc7180_snd_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
+};
+
+static int sc7180_parse_aux_of(struct device *dev)
+{
+	sc7180_headset_dev.dlc.of_node = of_parse_phandle(
+			dev->of_node, "aux-dev", 0);
+
+	if (!sc7180_headset_dev.dlc.of_node)
+		return -EINVAL;
+	return 0;
+}
+
+static void sc7180_add_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link)
+		link->ops = &sc7180_ops;
+}
+
+static int sc7180_snd_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &sc7180_card;
+	struct sc7180_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card->dev = dev;
+
+	ret = qcom_snd_parse_of(card);
+	if (ret) {
+		dev_err(dev, "Error parsing OF data\n");
+		return ret;
+	}
+
+	snd_soc_card_set_drvdata(card, data);
+
+	sc7180_add_ops(card);
+
+	ret = sc7180_parse_aux_of(dev);
+	if (ret) {
+		dev_err(dev, "Failed to parse OF for jack device\n");
+		return ret;
+	}
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id sc7180_snd_device_id[]  = {
+	{ .compatible = "qcom,sc7180-sndcard" },
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
2.28.0.220.ged08abb693-goog

