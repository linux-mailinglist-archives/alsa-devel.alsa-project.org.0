Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD67BFD7
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 431BE171D;
	Wed, 31 Jul 2019 13:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 431BE171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572750;
	bh=La0IX/HYPwRLEPbM927BAeJ/z98dyBPxTBBzhDkhpZg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r4KJrRTmxdsfC/t6u7vtEIaLMRJFAOQ37XuDbXduqv3Y7T9pb3MswIJmhji5sliPf
	 /nGMWVaNhhac7OHeI5sPHuKR+9oNCTWLWfmZAWn265MMo1QHznxwUIBiI5zm6CJ7cF
	 N1xU0wRIXqBq20L43VHUYsgSvz0nxmHbj0I5lYlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD6BF8048E;
	Wed, 31 Jul 2019 13:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D236EF805A8; Wed, 31 Jul 2019 13:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0220FF80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0220FF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vnOIez94"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=O2ja2OAzjmAC/V30ouL2p8aRfGo68j1FN0+acZgqLhM=; b=vnOIez9494UL
 UvHu0YwbH56mb7AbjpaXo19mK1cXUBcg09WZ2lhXZffvcyhvVIYDjrv2uQ/Uo2Yu4DIw5BVkEgQag
 mn5CKXQpWh3pxUq6JRP15LuNp2pw2AbqAhIt2nXv448dMzfgFOAckCdbe+xdpcL+PhubCm47DmQT1
 9Eu3g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmna-0001kr-F3; Wed, 31 Jul 2019 11:29:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F03582742C99; Wed, 31 Jul 2019 12:29:37 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Andra Danciu <andradanciu1997@gmail.com>
In-Reply-To: <20190731111930.20230-3-andradanciu1997@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112937.F03582742C99@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:37 +0100 (BST)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 kmarinushkin@birdec.tech, m.felsch@pengutronix.de,
 rf@opensource.wolfsonmicro.com, piotrs@opensource.cirrus.com,
 lgirdwood@gmail.com, nh6z@nh6z.net, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, robh+dt@kernel.org, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
 anders.roxell@linaro.org, tiwai@suse.com, daniel.baluta@nxp.com,
 jbrunet@baylibre.com
Subject: [alsa-devel] Applied "ASoC: codecs: Add uda1334 codec driver" to
	the asoc tree
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

The patch

   ASoC: codecs: Add uda1334 codec driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From caa918ef14065b812737f3ee4ac349dcfff196e6 Mon Sep 17 00:00:00 2001
From: Andra Danciu <andradanciu1997@gmail.com>
Date: Wed, 31 Jul 2019 14:19:30 +0300
Subject: [PATCH] ASoC: codecs: Add uda1334 codec driver

The UDA1334BTS supports the I2S-bus data format with word lengths of up
to 24 bits serial data format and has basic features such as de-emphasis
(at 44.1 kHz sampling rate) and mute.

Datasheet can be found at:
https://www.nxp.com/docs/en/data-sheet/UDA1334BTS.pdf

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
Link: https://lore.kernel.org/r/20190731111930.20230-3-andradanciu1997@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig   |   9 ++
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/uda1334.c | 295 +++++++++++++++++++++++++++++++++++++
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
