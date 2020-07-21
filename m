Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B5227D88
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1CA16B6;
	Tue, 21 Jul 2020 12:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1CA16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595328471;
	bh=JJ5Jj2j5K12rmqkoryI8LXz3d6YDy0BcvkFkH5kbvcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgYLH0cp4Z4VUH2R/pfzxDaxikbCShYmv90FM7tw+jTu1VKLwSxXrysSmapgm2LKc
	 8I6dQ7cSQQjL9PDlFf1tXkMQtO4P4Q71r7K1wpEpB6BPSRrQKeJUrdzd580I74uJWg
	 nOL2kaweXjR0giNabi1pXQuq229+6T53fJzDnTd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 250CAF802DC;
	Tue, 21 Jul 2020 12:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37F60F802DB; Tue, 21 Jul 2020 12:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C3A7F802C4
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 12:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C3A7F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="abLrAPV9"
Received: by mail-pj1-x1043.google.com with SMTP id f16so1484150pjt.0
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDJLDeFuaBAPWHpLQmQokPMT6076h5p06m/DspkpTsY=;
 b=abLrAPV9fsIfIWSQBcxFscxJCcQ7ZH5c/fCFbwkte8wRj76xMNR8ZoSt1GmbVsxV8h
 eBHxsitplVKskHYpZEDl17JSC2ali6H11XCWulqd0RJwwndIszAHlqdxiJYz6SHtwngH
 2gwmIHj0oAUTS7VRhXWqZCZjH9Oznlg2+P8kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDJLDeFuaBAPWHpLQmQokPMT6076h5p06m/DspkpTsY=;
 b=tHcObxgNERXcI1nIk7mCvX78h+3iRMdwuo8zAQMorM5fQMvrycDfyiRqxkLOU4XRC4
 Zp9ClzaRJsgcDwe3k+JX8Iy/KvfScqiyTiLMeYvuw6EoO7vpIRCXRbcuyRXVX8IQM0fX
 K4UhzQBi6KUc8Me74snsY1M34tG4/M7vq4YNN2fcBu374Y4+GlZ5u4HAKy/YEPKNPS3/
 AtJQK2IlP8D6G8TtMuMNClbdlQT3L3se2lkdqKZ74heyfTqO+19nkaJnPFiz43pw9m+q
 1AZ7dFsDvtQk5YxUfnapuOAFr/24MkXovLyciLOp7Dqf/6s81Tl/dIVcHjKQ3VEYkUKz
 GIiw==
X-Gm-Message-State: AOAM530fDdOgSj/U0Rc2VGEwegy32sUChRAA2hWNusAZ0DsVSJo5ZUTW
 2dgFqnNWIv9ndaGO6j7YrZkNSw==
X-Google-Smtp-Source: ABdhPJxNt/5s2M08ymtavmN9Auwni0IC7ZfhXsxz3IR4vS8G9NhjtRMrDmXkAg05Q4nyNmP1zlverg==
X-Received: by 2002:a17:90a:d086:: with SMTP id
 k6mr4206180pju.171.1595328290634; 
 Tue, 21 Jul 2020 03:44:50 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id 193sm19738149pfz.85.2020.07.21.03.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 03:44:50 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound card
 registration
Date: Tue, 21 Jul 2020 18:44:22 +0800
Message-Id: <20200721104422.369368-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200721104422.369368-1-cychiang@chromium.org>
References: <20200721104422.369368-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 dianders@chromium.org, Ajit Pandey <ajitp@codeaurora.org>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/qcom/Kconfig  |  11 ++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/sc7180.c | 380 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 sound/soc/qcom/sc7180.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cfca0f730c61..1b02f521f355 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -109,3 +109,14 @@ config SND_SOC_SDM845
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SDM845 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
+
+config SND_SOC_SC7180
+	tristate "SoC Machine driver for SC7180 boards"
+	depends on SND_SOC_QCOM
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
index 000000000000..3beb2b129d01
--- /dev/null
+++ b/sound/soc/qcom/sc7180.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+//Copyright (c) 2020, The Linux Foundation. All rights reserved.
+//
+//sc7180.c -- ALSA SoC Machine driver for SC7180
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
+static int sc7180_headset_init(struct snd_soc_component *component);
+
+static struct snd_soc_aux_dev sc7180_headset_dev = {
+	.dlc = COMP_EMPTY(),
+	.init = sc7180_headset_init,
+};
+
+struct sc7180_snd_data {
+	struct snd_soc_jack jack;
+	struct snd_soc_card *card;
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
+
+static unsigned int primary_dai_fmt = SND_SOC_DAIFMT_CBS_CFS |
+				      SND_SOC_DAIFMT_NB_NF |
+				      SND_SOC_DAIFMT_I2S;
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
+		snd_soc_dai_set_fmt(codec_dai, primary_dai_fmt);
+
+		/* Configure PLL1 for codec */
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
+					  DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
+		if (ret < 0) {
+			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
+			return ret;
+		}
+
+		/* Configure sysclk for codec */
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+					     RT5682_PLL1_FREQ,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0)
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
+static int sc7180_parse_of(struct snd_soc_card *card)
+{
+	struct device_node *np;
+	struct device_node *codec = NULL;
+	struct device_node *platform = NULL;
+	struct device_node *cpu = NULL;
+	struct device *dev = card->dev;
+	struct snd_soc_dai_link *link;
+	struct of_phandle_args args;
+	struct snd_soc_dai_link_component *dlc;
+	int ret, num_links;
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(dev, "Error parsing card name: %d\n", ret);
+		return ret;
+	}
+
+	/* DAPM routes */
+	if (of_property_read_bool(dev->of_node, "audio-routing")) {
+		ret = snd_soc_of_parse_audio_routing(card,
+						     "audio-routing");
+		if (ret)
+			return ret;
+	}
+
+	/* headset aux dev. */
+	sc7180_headset_dev.dlc.of_node = of_parse_phandle(
+			dev->of_node, "aux-dev", 0);
+	if (!sc7180_headset_dev.dlc.of_node) {
+		dev_err(dev,
+			"Property 'aux-dev' missing/invalid\n");
+		return -EINVAL;
+	}
+
+	/* Populate links */
+	num_links = of_get_child_count(dev->of_node);
+
+	/* Allocate the DAI link array */
+	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link),
+				      GFP_KERNEL);
+	if (!card->dai_link)
+		return -ENOMEM;
+
+	card->num_links = num_links;
+	link = card->dai_link;
+
+	for_each_child_of_node(dev->of_node, np) {
+		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc)
+			return -ENOMEM;
+
+		link->cpus	= &dlc[0];
+		link->platforms	= &dlc[1];
+
+		link->num_cpus		= 1;
+		link->num_platforms	= 1;
+
+		ret = of_property_read_string(np, "link-name", &link->name);
+		if (ret) {
+			dev_err(card->dev,
+				"error getting codec dai_link name\n");
+			goto err;
+		}
+
+		link->playback_only = of_property_read_bool(np,
+							    "playback_only");
+		link->capture_only = of_property_read_bool(np,
+							   "capture_only");
+
+		if (link->playback_only && link->capture_only) {
+			dev_err(card->dev,
+				"getting both playback and capture only\n");
+			goto err;
+		}
+
+		cpu = of_get_child_by_name(np, "cpu");
+		codec = of_get_child_by_name(np, "codec");
+
+		if (!cpu) {
+			dev_err(dev, "%s: Can't find cpu DT node\n",
+				link->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = of_parse_phandle_with_args(cpu, "sound-dai",
+						 "#sound-dai-cells", 0, &args);
+		if (ret) {
+			dev_err(card->dev, "%s: error getting cpu phandle\n",
+				link->name);
+			goto err;
+		}
+		link->cpus->of_node = args.np;
+		link->id = args.args[0];
+
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		if (ret) {
+			dev_err(card->dev, "%s: error getting cpu dai name\n",
+				link->name);
+			goto err;
+		}
+
+		if (codec) {
+			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+			if (ret < 0) {
+				dev_err(card->dev, "%s: codec dai not found\n",
+					link->name);
+				goto err;
+			}
+		} else {
+			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
+			if (!dlc)
+				return -ENOMEM;
+
+			link->codecs	 = dlc;
+			link->num_codecs = 1;
+
+			link->codecs->dai_name = "snd-soc-dummy-dai";
+			link->codecs->name = "snd-soc-dummy";
+		}
+
+		link->platforms->of_node = link->cpus->of_node;
+		link->stream_name = link->name;
+		link->ops = &sc7180_ops;
+		link++;
+
+		of_node_put(cpu);
+		of_node_put(codec);
+	}
+
+	return 0;
+err:
+	of_node_put(np);
+	of_node_put(cpu);
+	of_node_put(codec);
+	of_node_put(platform);
+	return ret;
+}
+
+static int sc7180_snd_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sc7180_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = &sc7180_card;
+
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card->dapm_widgets = sc7180_snd_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
+	card->dev = dev;
+	dev_set_drvdata(dev, card);
+	ret = sc7180_parse_of(card);
+	if (ret) {
+		dev_err(dev, "Error parsing OF data\n");
+		return ret;
+	}
+
+	data->card = card;
+	snd_soc_card_set_drvdata(card, data);
+
+	ret = snd_soc_register_card(card);
+	if (ret) {
+		dev_err(dev, "Sound card registration failed\n");
+		return ret;
+	}
+	return ret;
+}
+
+static int sc7180_snd_platform_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
+
+	snd_soc_unregister_card(card);
+	return 0;
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
+	.remove = sc7180_snd_platform_remove,
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
2.28.0.rc0.105.gf9edc3c819-goog

