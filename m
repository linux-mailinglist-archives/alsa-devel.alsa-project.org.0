Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7DA7BF31
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A900D16FF;
	Wed, 31 Jul 2019 13:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A900D16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572197;
	bh=xxtT8+3MF/jSep8PQ2JnT5yQZpiL6jpXcCVAFF2gtfQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s1fW8bu2K4PFiWb1bnlAwSHCLvmis76EzWIy8qHdVd/lcKoufZeK6V8gm7v7G7HW/
	 3lx5JUNQQxerFtExP4vwt550uA9zx6osJOM4TlXb97dm+qSijPNsms7eVYfPPeaATe
	 ekcS8KHSsSwGN9JWTx3MjxP44YoLldKTjgzHqzD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D50DF80528;
	Wed, 31 Jul 2019 13:20:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE75F80483; Wed, 31 Jul 2019 13:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D357BF80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D357BF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="siwyzn1h"
Received: by mail-wr1-x444.google.com with SMTP id x4so16083697wrt.6
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=249Tk7pJLhkH6dKEkJPPjfgArbiJqypC5jRcZzcgcv4=;
 b=siwyzn1hd+ANkqVt2/KMyUOMusnyUtFRj/sVQ2MzgddSDf/s9FP10LSZD5No+bxt7j
 6A6lI9eyUHF0FNxkrBbCYKsmMTTK0ZTURSLpS+dHyU9/3mFaXX0qCIqNAN2MOZS586lB
 Fc9Y6u57f1a7x1T8ODnRlsogjWsw/dP/mRDxRvuShoVICg6sMShCHc/3dHicvMGEYXvR
 g7wC6LGtuoI5mmYhCbRRG7ghIZdP0GLxpFF0WpAiOe7fJV8G/cVXGNtcO9f880pLcTnN
 f9Aguiu8TTNgYdSkioKoRh09PzIzWtO1rNd6A4Burj0PWTEsyU4cNMdQH8ggkijIO6G0
 ceAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=249Tk7pJLhkH6dKEkJPPjfgArbiJqypC5jRcZzcgcv4=;
 b=lffiELqar0aUvDxpIGsWiSdlg3icGhvoWY9/JOaPEo+nurM6wLw7adecidNg2wo+Dz
 ryBuVLmm5MNWYTdi9is4RE4AmtwCIzpRwEBoz7lVVahD08IhA6FxVVUpbNWkZVUxA5pZ
 dNtoxt+VzqDPvqf5Y1owE5C/J7JR29poDuGeaoU1kEZUbv+IE/umIKPXfD9hLxFX6FmQ
 xcPD2WJ1B595q7iYib7Rk8gXJtoCSAc30bfcHKN/5+vgWqamF5WvoeSKuVICc5DrJjll
 ReSdxcj+22X0nz3m1eyrQS0MdA58WyL/RgX0d7+Hp+U5Q22/h6DeQMndqSgFa+VffeAY
 YgPA==
X-Gm-Message-State: APjAAAVqd4f6VY94CBk6/hN2enqUFVulM6yx7my2Cb6iAsZK7rdbqcgP
 WHfK7tSOi/8A5TzsbSkmaiI=
X-Google-Smtp-Source: APXvYqwZcDJk/YfJ8qxOLYiLjYl2vIfbhOAIwxf+wLhU1k2gxzwk63JhT2KvzW2jwNVGuFOt1vU4dQ==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr59063488wrs.36.1564571987783; 
 Wed, 31 Jul 2019 04:19:47 -0700 (PDT)
Received: from localhost.localdomain ([212.146.100.6])
 by smtp.gmail.com with ESMTPSA id b8sm88035205wmh.46.2019.07.31.04.19.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:19:47 -0700 (PDT)
From: Andra Danciu <andradanciu1997@gmail.com>
To: broonie@kernel.org
Date: Wed, 31 Jul 2019 14:19:30 +0300
Message-Id: <20190731111930.20230-3-andradanciu1997@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190731111930.20230-1-andradanciu1997@gmail.com>
References: <20190731111930.20230-1-andradanciu1997@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 daniel.baluta@nxp.com, kmarinushkin@birdec.tech, m.felsch@pengutronix.de,
 piotrs@opensource.cirrus.com, tiwai@suse.com, nh6z@nh6z.net,
 lgirdwood@gmail.com, paul@crapouillou.net, vkoul@kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, anders.roxell@linaro.org,
 rf@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: codecs: Add uda1334 codec driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The UDA1334BTS supports the I2S-bus data format with word lengths of up
to 24 bits serial data format and has basic features such as de-emphasis
(at 44.1 kHz sampling rate) and mute.

Datasheet can be found at:
https://www.nxp.com/docs/en/data-sheet/UDA1334BTS.pdf

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
---
 sound/soc/codecs/Kconfig   |   9 ++
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/uda1334.c | 295 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 306 insertions(+)
 create mode 100644 sound/soc/codecs/uda1334.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index da4c1ae89742..89238343e34d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -199,6 +199,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_TS3A227E if I2C
 	select SND_SOC_TWL4030 if TWL4030_CORE
 	select SND_SOC_TWL6040 if TWL6040_CORE
+	select SND_SOC_UDA1334 if GPIOLIB
 	select SND_SOC_UDA134X
 	select SND_SOC_UDA1380 if I2C
 	select SND_SOC_WCD9335 if SLIMBUS
@@ -1207,6 +1208,14 @@ config SND_SOC_TWL4030
 config SND_SOC_TWL6040
 	tristate
 
+config SND_SOC_UDA1334
+	tristate "NXP UDA1334 DAC"
+	depends on GPIOLIB
+	help
+	  The UDA1334 is an NXP audio codec, supports the I2S-bus data format
+	  and has basic features such as de-emphasis (at 44.1 kHz sampling
+	  rate) and mute.
+
 config SND_SOC_UDA134X
        tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 9230016b0f9f..c498373dcc5f 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -212,6 +212,7 @@ snd-soc-tscs454-objs := tscs454.o
 snd-soc-ts3a227e-objs := ts3a227e.o
 snd-soc-twl4030-objs := twl4030.o
 snd-soc-twl6040-objs := twl6040.o
+snd-soc-uda1334-objs := uda1334.o
 snd-soc-uda134x-objs := uda134x.o
 snd-soc-uda1380-objs := uda1380.o
 snd-soc-wcd9335-objs := wcd-clsh-v2.o wcd9335.o
@@ -494,6 +495,7 @@ obj-$(CONFIG_SND_SOC_TSCS454)	+= snd-soc-tscs454.o
 obj-$(CONFIG_SND_SOC_TS3A227E)	+= snd-soc-ts3a227e.o
 obj-$(CONFIG_SND_SOC_TWL4030)	+= snd-soc-twl4030.o
 obj-$(CONFIG_SND_SOC_TWL6040)	+= snd-soc-twl6040.o
+obj-$(CONFIG_SND_SOC_UDA1334)	+= snd-soc-uda1334.o
 obj-$(CONFIG_SND_SOC_UDA134X)	+= snd-soc-uda134x.o
 obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
new file mode 100644
index 000000000000..21ab8c5487ba
--- /dev/null
+++ b/sound/soc/codecs/uda1334.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// uda1334.c  --  UDA1334 ALSA SoC Audio driver
+//
+// Based on WM8523 ALSA SoC Audio driver written by Mark Brown
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of_device.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/initval.h>
+
+#define UDA1334_NUM_RATES 6
+
+/* codec private data */
+struct uda1334_priv {
+	struct gpio_desc *mute;
+	struct gpio_desc *deemph;
+	unsigned int sysclk;
+	unsigned int rate_constraint_list[UDA1334_NUM_RATES];
+	struct snd_pcm_hw_constraint_list rate_constraint;
+};
+
+static const struct snd_soc_dapm_widget uda1334_dapm_widgets[] = {
+SND_SOC_DAPM_DAC("DAC", "Playback", SND_SOC_NOPM, 0, 0),
+SND_SOC_DAPM_OUTPUT("LINEVOUTL"),
+SND_SOC_DAPM_OUTPUT("LINEVOUTR"),
+};
+
+static const struct snd_soc_dapm_route uda1334_dapm_routes[] = {
+	{ "LINEVOUTL", NULL, "DAC" },
+	{ "LINEVOUTR", NULL, "DAC" },
+};
+
+static int uda1334_put_deemph(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
+	int deemph = ucontrol->value.integer.value[0];
+
+	if (deemph > 1)
+		return -EINVAL;
+
+	gpiod_set_value_cansleep(uda1334->deemph, deemph);
+
+	return 0;
+};
+
+static int uda1334_get_deemph(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = gpiod_get_value_cansleep(uda1334->deemph);
+	if (ret < 0)
+		return -EINVAL;
+
+	ucontrol->value.integer.value[0] = ret;
+
+	return 0;
+};
+
+static const struct snd_kcontrol_new uda1334_snd_controls[] = {
+	SOC_SINGLE_BOOL_EXT("Playback Deemphasis Switch", 0,
+			    uda1334_get_deemph, uda1334_put_deemph),
+};
+
+static const struct {
+	int value;
+	int ratio;
+} lrclk_ratios[UDA1334_NUM_RATES] = {
+	{ 1, 128 },
+	{ 2, 192 },
+	{ 3, 256 },
+	{ 4, 384 },
+	{ 5, 512 },
+	{ 6, 768 },
+};
+
+static int uda1334_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
+
+	/*
+	 * The set of sample rates that can be supported depends on the
+	 * MCLK supplied to the CODEC - enforce this.
+	 */
+	if (!uda1334->sysclk) {
+		dev_err(component->dev,
+			"No MCLK configured, call set_sysclk() on init\n");
+		return -EINVAL;
+	}
+
+	snd_pcm_hw_constraint_list(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE,
+				   &uda1334->rate_constraint);
+
+	gpiod_set_value_cansleep(uda1334->mute, 1);
+
+	return 0;
+}
+
+static void uda1334_shutdown(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
+
+	gpiod_set_value_cansleep(uda1334->mute, 0);
+}
+
+static int uda1334_set_dai_sysclk(struct snd_soc_dai *codec_dai,
+				  int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
+	unsigned int val;
+	int i, j = 0;
+
+	uda1334->sysclk = freq;
+
+	uda1334->rate_constraint.count = 0;
+	for (i = 0; i < ARRAY_SIZE(lrclk_ratios); i++) {
+		val = freq / lrclk_ratios[i].ratio;
+		/*
+		 * Check that it's a standard rate since core can't
+		 * cope with others and having the odd rates confuses
+		 * constraint matching.
+		 */
+
+		switch (val) {
+		case 8000:
+		case 32000:
+		case 44100:
+		case 48000:
+		case 64000:
+		case 88200:
+		case 96000:
+			dev_dbg(component->dev, "Supported sample rate: %dHz\n",
+				val);
+			uda1334->rate_constraint_list[j++] = val;
+			uda1334->rate_constraint.count++;
+			break;
+		default:
+			dev_dbg(component->dev, "Skipping sample rate: %dHz\n",
+				val);
+		}
+	}
+
+	/* Need at least one supported rate... */
+	if (uda1334->rate_constraint.count == 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int uda1334_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	fmt &= (SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_INV_MASK |
+		SND_SOC_DAIFMT_MASTER_MASK);
+
+	if (fmt != (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+		    SND_SOC_DAIFMT_CBS_CFS)) {
+		dev_err(codec_dai->dev, "Invalid DAI format\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int uda1334_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(dai->component);
+
+	if (uda1334->mute)
+		gpiod_set_value_cansleep(uda1334->mute, mute);
+
+	return 0;
+}
+
+#define UDA1334_RATES SNDRV_PCM_RATE_8000_96000
+
+#define UDA1334_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+static const struct snd_soc_dai_ops uda1334_dai_ops = {
+	.startup	= uda1334_startup,
+	.shutdown	= uda1334_shutdown,
+	.set_sysclk	= uda1334_set_dai_sysclk,
+	.set_fmt	= uda1334_set_fmt,
+	.mute_stream	= uda1334_mute_stream,
+};
+
+static struct snd_soc_dai_driver uda1334_dai = {
+	.name = "uda1334-hifi",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = UDA1334_RATES,
+		.formats = UDA1334_FORMATS,
+	},
+	.ops = &uda1334_dai_ops,
+};
+
+static int uda1334_probe(struct snd_soc_component *component)
+{
+	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
+
+	uda1334->rate_constraint.list = &uda1334->rate_constraint_list[0];
+	uda1334->rate_constraint.count =
+		ARRAY_SIZE(uda1334->rate_constraint_list);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_component_dev_uda1334 = {
+	.probe			= uda1334_probe,
+	.controls		= uda1334_snd_controls,
+	.num_controls		= ARRAY_SIZE(uda1334_snd_controls),
+	.dapm_widgets		= uda1334_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(uda1334_dapm_widgets),
+	.dapm_routes		= uda1334_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(uda1334_dapm_routes),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct of_device_id uda1334_of_match[] = {
+	{ .compatible = "nxp,uda1334" },
+	{ /* sentinel*/ }
+};
+MODULE_DEVICE_TABLE(of, uda1334_of_match);
+
+static int uda1334_codec_probe(struct platform_device *pdev)
+{
+	struct uda1334_priv *uda1334;
+	int ret;
+
+	uda1334 = devm_kzalloc(&pdev->dev, sizeof(struct uda1334_priv),
+			       GFP_KERNEL);
+	if (!uda1334)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, uda1334);
+
+	uda1334->mute = devm_gpiod_get(&pdev->dev, "nxp,mute", GPIOD_OUT_LOW);
+	if (IS_ERR(uda1334->mute)) {
+		ret = PTR_ERR(uda1334->mute);
+		dev_err(&pdev->dev, "Failed to get mute line: %d\n", ret);
+		return ret;
+	}
+
+	uda1334->deemph = devm_gpiod_get(&pdev->dev, "nxp,deemph", GPIOD_OUT_LOW);
+	if (IS_ERR(uda1334->deemph)) {
+		ret = PTR_ERR(uda1334->deemph);
+		dev_err(&pdev->dev, "Failed to get deemph line: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &soc_component_dev_uda1334,
+					      &uda1334_dai, 1);
+	if (ret < 0)
+		dev_err(&pdev->dev, "Failed to register component: %d\n", ret);
+
+	return ret;
+}
+
+static struct platform_driver uda1334_codec_driver = {
+	.probe		= uda1334_codec_probe,
+	.driver		= {
+		.name	= "uda1334-codec",
+		.of_match_table = uda1334_of_match,
+	},
+};
+module_platform_driver(uda1334_codec_driver);
+
+MODULE_DESCRIPTION("ASoC UDA1334 driver");
+MODULE_AUTHOR("Andra Danciu <andradanciu1997@gmail.com>");
+MODULE_ALIAS("platform:uda1334-codec");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
