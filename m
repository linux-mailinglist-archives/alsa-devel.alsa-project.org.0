Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB5441A6F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 12:04:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097D916E4;
	Mon,  1 Nov 2021 12:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097D916E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635764668;
	bh=40pKYOVbUj0skYivS13VhFH84JeHzr6WL+xqG8JKYgc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y/voc9aIRczQFctFSEWtu9FcfhLlCdqpdJCF64q0H3EPNYdCi3suVDpUnzvKKcuP0
	 sMrkRVHXJvfSRPE5E+GUhF81mQ3KzTEwfg7/9my2UVuApmviNBwAbvoaoQPJoWYapz
	 CSgGxhiLcGavPYYv8Inyj1VBycy1UT5fFO+rRdXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC13F8010A;
	Mon,  1 Nov 2021 12:03:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E7FF80269; Mon,  1 Nov 2021 12:03:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8F2FF8010A
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 12:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F2FF8010A
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="230847859"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; d="scan'208";a="230847859"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 04:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; d="scan'208";a="499991490"
Received: from macchian-builder.itwn.intel.com ([10.5.253.158])
 by orsmga008.jf.intel.com with ESMTP; 01 Nov 2021 04:02:56 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: add sof-nau8825 machine driver
Date: Mon,  1 Nov 2021 07:00:50 -0400
Message-Id: <20211101110050.28384-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com, CTLIN0@nuvoton.com,
 vamshi.krishna.gopal@intel.com, sathya.prakash.m.r@intel.com,
 bard.liao@intel.com
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

From: David Lin <CTLIN0@nuvoton.com>

The machine driver is a generic machine driver for SOF with nau8825
codec w or w/o speaker additionally. Depending on the SOC
HDMI, DMIC, Bluetooth offload support are added dynamically.

Only add information related to SOF since the machine driver was
only tested with SOF.

There are currently 4 i2s machine variants of ADL.
This supports the headphone NUA8825(SSP0) alone or with smart or dumb
speakers.
Board 2,3,4 use SSP2 for Bluetooth offload support except board 1.

Board 1 : NAU8825 + RT1019P(SSP2)
Board 2 : NAU8825 + MAX98373(SSP1)
Board 3 : NAU8825 + MAX98360A(SSP1)
Board 4 : NAU8825

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
Co-developed-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
  1. remove hdac_hdmi relevant codes support
  2. remove duplicated max_98360a_dai_link calls. Instead of checking no_amp condition
  3. alter module license name to "GPL"
  4. due to rt1019 non-i2c mode, so change to SND_SOC_RT1015P in KConfig
---
 sound/soc/intel/boards/Kconfig                |  19 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/sof_nau8825.c          | 651 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   |  35 +
 4 files changed, 707 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_nau8825.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 5a225a4ce604..31d2f10672fd 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -526,6 +526,25 @@ config SND_SOC_INTEL_SOF_ES8336_MACH
 	   Say Y if you have such a device.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_SOF_NAU8825_MACH
+	tristate "SOF with nau8825 codec in I2S Mode"
+	depends on I2C && ACPI && GPIOLIB
+	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
+		    (MFD_INTEL_LPSS || COMPILE_TEST))
+	select SND_SOC_NAU8825
+	select SND_SOC_RT1015P
+	select SND_SOC_MAX98373_I2C
+	select SND_SOC_MAX98357A
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	help
+	   This adds support for ASoC machine driver for SOF platforms
+	   with nau8825 codec.
+	   Say Y if you have such a device.
+	   If unsure select "N".
+
 endif ## SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
 
 if (SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK)
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 9ee8ed864f5d..3ea273d27168 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -22,6 +22,7 @@ snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
 snd-soc-sof_rt5682-objs := sof_rt5682.o sof_realtek_common.o
 snd-soc-sof_cs42l42-objs := sof_cs42l42.o
 snd-soc-sof_es8336-objs := sof_es8336.o
+snd-soc-sof_nau8825-objs := sof_nau8825.o sof_realtek_common.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
@@ -44,6 +45,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_ES8336_MACH) += snd-soc-sof_es8336.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_NAU8825_MACH) += snd-soc-sof_nau8825.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
new file mode 100644
index 000000000000..33de043b66c6
--- /dev/null
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -0,0 +1,651 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2021 Intel Corporation.
+// Copyright(c) 2021 Nuvoton Corporation.
+
+/*
+ * Intel SOF Machine Driver with Nuvoton headphone codec NAU8825
+ * and speaker codec RT1019P MAX98360a or MAX98373
+ */
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/dmi.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/sof.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/nau8825.h"
+#include "../common/soc-intel-quirks.h"
+#include "hda_dsp_common.h"
+#include "sof_realtek_common.h"
+#include "sof_maxim_common.h"
+
+#define NAME_SIZE 32
+
+#define SOF_NAU8825_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
+#define SOF_NAU8825_SSP_CODEC_MASK		(GENMASK(2, 0))
+#define SOF_SPEAKER_AMP_PRESENT		BIT(3)
+#define SOF_NAU8825_SSP_AMP_SHIFT		4
+#define SOF_NAU8825_SSP_AMP_MASK		(GENMASK(6, 4))
+#define SOF_NAU8825_SSP_AMP(quirk)	\
+	(((quirk) << SOF_NAU8825_SSP_AMP_SHIFT) & SOF_NAU8825_SSP_AMP_MASK)
+#define SOF_NAU8825_NUM_HDMIDEV_SHIFT		7
+#define SOF_NAU8825_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
+#define SOF_NAU8825_NUM_HDMIDEV(quirk)	\
+	(((quirk) << SOF_NAU8825_NUM_HDMIDEV_SHIFT) & SOF_NAU8825_NUM_HDMIDEV_MASK)
+
+/* BT audio offload: reserve 3 bits for future */
+#define SOF_BT_OFFLOAD_SSP_SHIFT		10
+#define SOF_BT_OFFLOAD_SSP_MASK		(GENMASK(12, 10))
+#define SOF_BT_OFFLOAD_SSP(quirk)	\
+	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
+#define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(13)
+#define SOF_RT1019P_SPEAKER_AMP_PRESENT	BIT(14)
+#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
+
+static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
+
+struct sof_hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+struct sof_card_private {
+	struct clk *mclk;
+	struct snd_soc_jack sof_headset;
+	struct list_head hdmi_pcm_list;
+};
+
+static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct sof_hdmi_pcm *pcm;
+
+	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return -ENOMEM;
+
+	/* dai_link id is 1:1 mapped to the PCM device */
+	pcm->device = rtd->dai_link->id;
+	pcm->codec_dai = dai;
+
+	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+
+	return 0;
+}
+
+static int sof_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	struct snd_soc_jack *jack;
+	int ret;
+
+	/*
+	 * Headset buttons map to the google Reference headset.
+	 * These can be configured by userspace.
+	 */
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->sof_headset, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	jack = &ctx->sof_headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+};
+
+static void sof_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sof_nau8825_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int clk_freq, ret;
+
+	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
+
+	if (clk_freq <= 0) {
+		dev_err(rtd->dev, "get bclk freq failed: %d\n", clk_freq);
+		return -EINVAL;
+	}
+
+	/* Configure clock for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_BLK, 0,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set BCLK clock %d\n", ret);
+		return ret;
+	}
+
+	/* Configure pll for codec */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, clk_freq,
+				  params_rate(params) * 256);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set BCLK: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct snd_soc_ops sof_nau8825_ops = {
+	.hw_params = sof_nau8825_hw_params,
+};
+
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		/* name might be overridden during probe */
+		.name = "0000:00:1f.3"
+	}
+};
+
+static int sof_card_late_probe(struct snd_soc_card *card)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct sof_hdmi_pcm *pcm;
+	int err;
+
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
+
+	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+		/* Disable Left and Right Spk pin after boot */
+		snd_soc_dapm_disable_pin(dapm, "Left Spk");
+		snd_soc_dapm_disable_pin(dapm, "Right Spk");
+		err = snd_soc_dapm_sync(dapm);
+		if (err < 0)
+			return err;
+	}
+
+	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
+}
+
+static const struct snd_kcontrol_new sof_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const struct snd_kcontrol_new speaker_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
+static const struct snd_soc_dapm_widget sof_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_soc_dapm_widget speaker_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_widget dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route sof_map[] = {
+	/* HP jack connectors - unknown if we have jack detection */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+
+	/* other jacks */
+	{ "MIC", NULL, "Headset Mic" },
+};
+
+static const struct snd_soc_dapm_route speaker_map[] = {
+	/* speaker */
+	{ "Spk", NULL, "Speaker" },
+};
+
+static const struct snd_soc_dapm_route dmic_map[] = {
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+};
+
+static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, speaker_widgets,
+					ARRAY_SIZE(speaker_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, speaker_controls,
+					ARRAY_SIZE(speaker_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map,
+				      ARRAY_SIZE(speaker_map));
+
+	if (ret)
+		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	return ret;
+}
+
+static int dmic_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+					ARRAY_SIZE(dmic_widgets));
+	if (ret) {
+		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+				      ARRAY_SIZE(dmic_map));
+
+	if (ret)
+		dev_err(card->dev, "DMic map addition failed: %d\n", ret);
+
+	return ret;
+}
+
+/* sof audio machine driver for nau8825 codec */
+static struct snd_soc_card sof_audio_card_nau8825 = {
+	.name = "nau8825", /* the sof- prefix is added by the core */
+	.owner = THIS_MODULE,
+	.controls = sof_controls,
+	.num_controls = ARRAY_SIZE(sof_controls),
+	.dapm_widgets = sof_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sof_widgets),
+	.dapm_routes = sof_map,
+	.num_dapm_routes = ARRAY_SIZE(sof_map),
+	.fully_routed = true,
+	.late_probe = sof_card_late_probe,
+};
+
+static struct snd_soc_dai_link_component nau8825_component[] = {
+	{
+		.name = "i2c-10508825:00",
+		.dai_name = "nau8825-hifi",
+	}
+};
+
+static struct snd_soc_dai_link_component dmic_component[] = {
+	{
+		.name = "dmic-codec",
+		.dai_name = "dmic-hifi",
+	}
+};
+
+static struct snd_soc_dai_link_component rt1019p_component[] = {
+	{
+		.name = "RTL1019:00",
+		.dai_name = "HiFi",
+	}
+};
+
+static struct snd_soc_dai_link_component dummy_component[] = {
+	{
+		.name = "snd-soc-dummy",
+		.dai_name = "snd-soc-dummy-dai",
+	}
+};
+
+static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
+							  int ssp_codec,
+							  int ssp_amp,
+							  int dmic_be_num,
+							  int hdmi_num)
+{
+	struct snd_soc_dai_link_component *idisp_components;
+	struct snd_soc_dai_link_component *cpus;
+	struct snd_soc_dai_link *links;
+	int i, id = 0;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+			     sof_audio_card_nau8825.num_links, GFP_KERNEL);
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+			     sof_audio_card_nau8825.num_links, GFP_KERNEL);
+	if (!links || !cpus)
+		goto devm_err;
+
+	/* codec SSP */
+	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+					"SSP%d-Codec", ssp_codec);
+	if (!links[id].name)
+		goto devm_err;
+
+	links[id].id = id;
+	links[id].codecs = nau8825_component;
+	links[id].num_codecs = ARRAY_SIZE(nau8825_component);
+	links[id].platforms = platform_component;
+	links[id].num_platforms = ARRAY_SIZE(platform_component);
+	links[id].init = sof_nau8825_codec_init;
+	links[id].exit = sof_nau8825_codec_exit;
+	links[id].ops = &sof_nau8825_ops;
+	links[id].dpcm_playback = 1;
+	links[id].dpcm_capture = 1;
+	links[id].no_pcm = 1;
+	links[id].cpus = &cpus[id];
+	links[id].num_cpus = 1;
+
+	links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+						  "SSP%d Pin",
+						  ssp_codec);
+	if (!links[id].cpus->dai_name)
+		goto devm_err;
+
+	id++;
+
+	/* dmic */
+	if (dmic_be_num > 0) {
+		/* at least we have dmic01 */
+		links[id].name = "dmic01";
+		links[id].cpus = &cpus[id];
+		links[id].cpus->dai_name = "DMIC01 Pin";
+		links[id].init = dmic_init;
+		if (dmic_be_num > 1) {
+			/* set up 2 BE links at most */
+			links[id + 1].name = "dmic16k";
+			links[id + 1].cpus = &cpus[id + 1];
+			links[id + 1].cpus->dai_name = "DMIC16k Pin";
+			dmic_be_num = 2;
+		}
+	}
+
+	for (i = 0; i < dmic_be_num; i++) {
+		links[id].id = id;
+		links[id].num_cpus = 1;
+		links[id].codecs = dmic_component;
+		links[id].num_codecs = ARRAY_SIZE(dmic_component);
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].ignore_suspend = 1;
+		links[id].dpcm_capture = 1;
+		links[id].no_pcm = 1;
+		id++;
+	}
+
+	/* HDMI */
+	if (hdmi_num > 0) {
+		idisp_components = devm_kzalloc(dev,
+						sizeof(struct snd_soc_dai_link_component) *
+						hdmi_num, GFP_KERNEL);
+		if (!idisp_components)
+			goto devm_err;
+	}
+	for (i = 1; i <= hdmi_num; i++) {
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+						"iDisp%d", i);
+		if (!links[id].name)
+			goto devm_err;
+
+		links[id].id = id;
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "iDisp%d Pin", i);
+		if (!links[id].cpus->dai_name)
+			goto devm_err;
+
+		idisp_components[i - 1].name = "ehdaudio0D2";
+		idisp_components[i - 1].dai_name = devm_kasprintf(dev,
+								  GFP_KERNEL,
+								  "intel-hdmi-hifi%d",
+								  i);
+		if (!idisp_components[i - 1].dai_name)
+			goto devm_err;
+
+		links[id].codecs = &idisp_components[i - 1];
+		links[id].num_codecs = 1;
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].init = sof_hdmi_init;
+		links[id].dpcm_playback = 1;
+		links[id].no_pcm = 1;
+		id++;
+	}
+
+	/* speaker amp */
+	if (sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT) {
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+						"SSP%d-Codec", ssp_amp);
+		if (!links[id].name)
+			goto devm_err;
+
+		links[id].id = id;
+		if (sof_nau8825_quirk & SOF_RT1019P_SPEAKER_AMP_PRESENT) {
+			links[id].codecs = rt1019p_component;
+			links[id].num_codecs = ARRAY_SIZE(rt1019p_component);
+			links[id].init = speaker_codec_init;
+		} else if (sof_nau8825_quirk &
+				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+			links[id].codecs = max_98373_components;
+			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
+			links[id].init = max_98373_spk_codec_init;
+			links[id].ops = &max_98373_ops;
+			/* feedback stream */
+			links[id].dpcm_capture = 1;
+		} else if (sof_nau8825_quirk &
+				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+			max_98360a_dai_link(&links[id]);
+		} else {
+			goto devm_err;
+		}
+
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].dpcm_playback = 1;
+		links[id].no_pcm = 1;
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "SSP%d Pin",
+							  ssp_amp);
+		if (!links[id].cpus->dai_name)
+			goto devm_err;
+		id++;
+	}
+
+	/* BT audio offload */
+	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		int port = (sof_nau8825_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+				SOF_BT_OFFLOAD_SSP_SHIFT;
+
+		links[id].id = id;
+		links[id].cpus = &cpus[id];
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "SSP%d Pin", port);
+		if (!links[id].cpus->dai_name)
+			goto devm_err;
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
+		if (!links[id].name)
+			goto devm_err;
+		links[id].codecs = dummy_component;
+		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].dpcm_playback = 1;
+		links[id].dpcm_capture = 1;
+		links[id].no_pcm = 1;
+		links[id].num_cpus = 1;
+	}
+
+	return links;
+devm_err:
+	return NULL;
+}
+
+static int sof_audio_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_link *dai_links;
+	struct snd_soc_acpi_mach *mach;
+	struct sof_card_private *ctx;
+	int dmic_be_num, hdmi_num;
+	int ret, ssp_amp, ssp_codec;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	if (pdev->id_entry && pdev->id_entry->driver_data)
+		sof_nau8825_quirk = (unsigned long)pdev->id_entry->driver_data;
+
+	mach = pdev->dev.platform_data;
+
+	/* A speaker amp might not be present when the quirk claims one is.
+	 * Detect this via whether the machine driver match includes quirk_data.
+	 */
+	if ((sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT) && !mach->quirk_data)
+		sof_nau8825_quirk &= ~SOF_SPEAKER_AMP_PRESENT;
+
+	dev_dbg(&pdev->dev, "sof_nau8825_quirk = %lx\n", sof_nau8825_quirk);
+
+	/* default number of DMIC DAI's */
+	dmic_be_num = 2;
+	hdmi_num = (sof_nau8825_quirk & SOF_NAU8825_NUM_HDMIDEV_MASK) >>
+			SOF_NAU8825_NUM_HDMIDEV_SHIFT;
+	/* default number of HDMI DAI's */
+	if (!hdmi_num)
+		hdmi_num = 3;
+
+	ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
+			SOF_NAU8825_SSP_AMP_SHIFT;
+
+	ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
+
+	/* compute number of dai links */
+	sof_audio_card_nau8825.num_links = 1 + dmic_be_num + hdmi_num;
+
+	if (sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT)
+		sof_audio_card_nau8825.num_links++;
+
+	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
+		max_98373_set_codec_conf(&sof_audio_card_nau8825);
+
+	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+		sof_audio_card_nau8825.num_links++;
+
+	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
+					      dmic_be_num, hdmi_num);
+	if (!dai_links)
+		return -ENOMEM;
+
+	sof_audio_card_nau8825.dai_link = dai_links;
+
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+
+	sof_audio_card_nau8825.dev = &pdev->dev;
+
+	/* set platform name for each dailink */
+	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_nau8825,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(&sof_audio_card_nau8825, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev,
+					  &sof_audio_card_nau8825);
+}
+
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "sof_nau8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+
+	},
+	{
+		.name = "adl_rt1019p_nau8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1019P_SPEAKER_AMP_PRESENT |
+					SOF_NAU8825_SSP_AMP(2) |
+					SOF_NAU8825_NUM_HDMIDEV(4)),
+	},
+	{
+		.name = "adl_max98373_nau8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98373_SPEAKER_AMP_PRESENT |
+					SOF_NAU8825_SSP_AMP(1) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
+	{
+		/* The limitation of length of char array, shorten the name */
+		.name = "adl_mx98360a_nau8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_NAU8825_SSP_AMP(1) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, board_ids);
+
+static struct platform_driver sof_audio = {
+	.probe = sof_audio_probe,
+	.driver = {
+		.name = "sof_nau8825",
+		.pm = &snd_soc_pm_ops,
+	},
+	.id_table = board_ids,
+};
+module_platform_driver(sof_audio)
+
+/* Module information */
+MODULE_DESCRIPTION("SOF Audio Machine driver for NAU8825");
+MODULE_AUTHOR("David Lin <ctlin0@nuvoton.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index f5b21a95d222..98dc41b682cf 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -285,6 +285,11 @@ static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
 	.codecs = {"MX98360A"}
 };
 
+static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
+	.num_codecs = 1,
+	.codecs = {"RTL1019"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.id = "10EC5682",
@@ -310,6 +315,36 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
 	},
+	{
+		.id = "10508825",
+		.drv_name = "adl_rt1019p_nau8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_rt1019p_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-rt1019-nau8825.tplg",
+	},
+	{
+		.id = "10508825",
+		.drv_name = "adl_max98373_nau8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98373_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98373-nau8825.tplg",
+	},
+	{
+		.id = "10508825",
+		.drv_name = "adl_mx98360a_nau8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-mx98360a-nau8825.tplg",
+	},
+	{
+		.id = "10508825",
+		.drv_name = "sof_nau8825",
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-nau8825.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.20.1

