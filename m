Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC3170811
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:52:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1D11689;
	Wed, 26 Feb 2020 19:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1D11689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743124;
	bh=irE/PgADhe/F3YGzuvCbRt11BIFRBrZ7odOJmklIff4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YU5trvo0vGq/O2YM/KztduGy5RJOBYOkWDUsYbMSSPrDmQjapweP063PhVM0TQTtn
	 yiA55P1KDhS9b1DLH3Jv/wXqLVRUuGz37DXYuMEhWC9LijTSx3eauLZrYueJcR/ttu
	 MkQpoXlTIkPlxtlJTosfEckyRThAMvQ8/YMYW57o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9E5F802BC;
	Wed, 26 Feb 2020 19:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A93FF8029A; Wed, 26 Feb 2020 19:47:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C9406F8028F
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9406F8028F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09BFA30E;
 Wed, 26 Feb 2020 10:47:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7169A3F881;
 Wed, 26 Feb 2020 10:47:33 -0800 (PST)
Date: Wed, 26 Feb 2020 18:47:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Applied "ASoC: amd: Add machine driver for Raven based platform" to
 the asoc tree
In-Reply-To: <20200217050515.3847-1-akshu.agrawal@amd.com>
Message-Id: <applied-20200217050515.3847-1-akshu.agrawal@amd.com>
X-Patchwork-Hint: ignore
Cc: , "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, akshu.agrawal@amd.com,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 open list <linux-kernel@vger.kernel.org>
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

The patch

   ASoC: amd: Add machine driver for Raven based platform

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 6b8e4e7db3cd236a2cbb720360fb135087a2ac1d Mon Sep 17 00:00:00 2001
From: Akshu Agrawal <akshu.agrawal@amd.com>
Date: Mon, 17 Feb 2020 10:35:01 +0530
Subject: [PATCH] ASoC: amd: Add machine driver for Raven based platform

Add machine driver for Raven based platform using
RT5682 + MAX9836 + CROS_EC codecs

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
Link: https://lore.kernel.org/r/20200217050515.3847-1-akshu.agrawal@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/Kconfig                |  10 +
 sound/soc/amd/Makefile               |   2 +
 sound/soc/amd/acp3x-rt5682-max9836.c | 334 +++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 sound/soc/amd/acp3x-rt5682-max9836.c

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 5f40517717c4..b29ef1373946 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -26,3 +26,13 @@ config SND_SOC_AMD_ACP3x
 	depends on X86 && PCI
 	help
 	 This option enables ACP v3.x I2S support on AMD platform
+
+config SND_SOC_AMD_RV_RT5682_MACH
+	tristate "AMD RV support for RT5682"
+	select SND_SOC_RT5682
+	select SND_SOC_MAX98357A
+	select SND_SOC_CROS_EC_CODEC
+	select I2C_CROS_EC_TUNNEL
+	depends on SND_SOC_AMD_ACP3x && I2C
+	help
+	 This option enables machine driver for RT5682 and MAX9835.
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index c4ddc6adb6f0..e6f3d9b469f3 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -2,8 +2,10 @@
 acp_audio_dma-objs := acp-pcm-dma.o
 snd-soc-acp-da7219mx98357-mach-objs := acp-da7219-max98357a.o
 snd-soc-acp-rt5645-mach-objs := acp-rt5645.o
+snd-soc-acp-rt5682-mach-objs := acp3x-rt5682-max9836.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP) += acp_audio_dma.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mach.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
+obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
new file mode 100644
index 000000000000..96fbcd29e3ed
--- /dev/null
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec.
+//
+//Copyright 2016 Advanced Micro Devices, Inc.
+
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include <sound/jack.h>
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/acpi.h>
+
+#include "raven/acp3x.h"
+#include "../codecs/rt5682.h"
+
+#define PCO_PLAT_CLK 48000000
+#define RT5682_PLL_FREQ (48000 * 512)
+#define DUAL_CHANNEL		2
+
+static struct snd_soc_jack pco_jack;
+static struct clk *rt5682_dai_wclk;
+static struct clk *rt5682_dai_bclk;
+
+static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_component *component = codec_dai->component;
+
+	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
+
+	/* set rt5682 dai fmt */
+	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
+			| SND_SOC_DAIFMT_NB_NF
+			| SND_SOC_DAIFMT_CBM_CFM);
+	if (ret < 0) {
+		dev_err(rtd->card->dev,
+				"Failed to set rt5682 dai fmt: %d\n", ret);
+		return ret;
+	}
+
+	/* set codec PLL */
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL2, RT5682_PLL2_S_MCLK,
+				  PCO_PLAT_CLK, RT5682_PLL_FREQ);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set rt5682 PLL: %d\n", ret);
+		return ret;
+	}
+
+	/* Set codec sysclk */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
+			RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev,
+			"Failed to set rt5682 SYSCLK: %d\n", ret);
+		return ret;
+	}
+
+	/* Set tdm/i2s1 master bclk ratio */
+	ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+	if (ret < 0) {
+		dev_err(rtd->dev,
+			"Failed to set rt5682 tdm bclk ratio: %d\n", ret);
+		return ret;
+	}
+
+	rt5682_dai_wclk = clk_get(component->dev, "rt5682-dai-wclk");
+	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
+
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				&pco_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int rt5682_clk_enable(struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+
+	/* RT5682 will support only 48K output with 48M mclk */
+	clk_set_rate(rt5682_dai_wclk, 48000);
+	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
+	ret = clk_prepare_enable(rt5682_dai_wclk);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't enable wclk %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static void rt5682_clk_disable(void)
+{
+	clk_disable_unprepare(rt5682_dai_wclk);
+}
+
+static const unsigned int channels[] = {
+	DUAL_CHANNEL,
+};
+
+static const unsigned int rates[] = {
+	48000,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_rates = {
+	.count = ARRAY_SIZE(rates),
+	.list  = rates,
+	.mask = 0,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_channels = {
+	.count = ARRAY_SIZE(channels),
+	.list = channels,
+	.mask = 0,
+};
+
+static int acp3x_5682_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->play_i2s_instance = I2S_SP_INSTANCE;
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+	return rt5682_clk_enable(substream);
+}
+
+static int acp3x_max_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->play_i2s_instance = I2S_BT_INSTANCE;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+	return rt5682_clk_enable(substream);
+}
+
+static int acp3x_ec_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->cap_i2s_instance = I2S_BT_INSTANCE;
+	snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+
+	return rt5682_clk_enable(substream);
+}
+
+static void rt5682_shutdown(struct snd_pcm_substream *substream)
+{
+	rt5682_clk_disable();
+}
+
+static const struct snd_soc_ops acp3x_5682_ops = {
+	.startup = acp3x_5682_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+static const struct snd_soc_ops acp3x_max_play_ops = {
+	.startup = acp3x_max_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+static const struct snd_soc_ops acp3x_ec_cap_ops = {
+	.startup = acp3x_ec_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+SND_SOC_DAILINK_DEF(acp3x_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp3x_i2s_playcap.0")));
+SND_SOC_DAILINK_DEF(acp3x_bt,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp3x_i2s_playcap.2")));
+
+SND_SOC_DAILINK_DEF(rt5682,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
+SND_SOC_DAILINK_DEF(max,
+	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
+SND_SOC_DAILINK_DEF(cros_ec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("GOOG0013:00", "EC Codec I2S RX")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp3x_rv_i2s_dma.0")));
+
+static struct snd_soc_dai_link acp3x_dai_5682_98357[] = {
+	{
+		.name = "acp3x-5682-play",
+		.stream_name = "Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.init = acp3x_5682_init,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &acp3x_5682_ops,
+		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
+	},
+	{
+		.name = "acp3x-max98357-play",
+		.stream_name = "HiFi Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_playback = 1,
+		.ops = &acp3x_max_play_ops,
+		SND_SOC_DAILINK_REG(acp3x_bt, max, platform),
+	},
+	{
+		.name = "acp3x-ec-capture",
+		.stream_name = "Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		.ops = &acp3x_ec_cap_ops,
+		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
+	},
+};
+
+static const struct snd_soc_dapm_widget acp3x_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route acp3x_audio_route[] = {
+	{"Headphone Jack", NULL, "HPOL"},
+	{"Headphone Jack", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"Spk", NULL, "Speaker"},
+};
+
+static const struct snd_kcontrol_new acp3x_mc_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Spk"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_card acp3x_card = {
+	.name = "acp3xalc5682m98357",
+	.owner = THIS_MODULE,
+	.dai_link = acp3x_dai_5682_98357,
+	.num_links = ARRAY_SIZE(acp3x_dai_5682_98357),
+	.dapm_widgets = acp3x_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp3x_widgets),
+	.dapm_routes = acp3x_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(acp3x_audio_route),
+	.controls = acp3x_mc_controls,
+	.num_controls = ARRAY_SIZE(acp3x_mc_controls),
+};
+
+static int acp3x_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *machine;
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(*machine), GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	card = &acp3x_card;
+	acp3x_card.dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_card);
+	if (ret) {
+		dev_err(&pdev->dev,
+				"devm_snd_soc_register_card(%s) failed: %d\n",
+				acp3x_card.name, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static const struct acpi_device_id acp3x_audio_acpi_match[] = {
+	{ "AMDI5682", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
+
+static struct platform_driver acp3x_audio = {
+	.driver = {
+		.name = "acp3x-alc5682-max98357",
+		.acpi_match_table = ACPI_PTR(acp3x_audio_acpi_match),
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = acp3x_probe,
+};
+
+module_platform_driver(acp3x_audio);
+
+MODULE_AUTHOR("akshu.agrawal@amd.com");
+MODULE_DESCRIPTION("ALC5682 & MAX98357 audio support");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

