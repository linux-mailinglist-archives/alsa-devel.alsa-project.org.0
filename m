Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6993B374319
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151B81775;
	Wed,  5 May 2021 18:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151B81775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233516;
	bh=W67LCtOcb9JaGZ+UGyR44Eka0X/sl1b7Tok/mhFee0c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrbvSNT9tvysYNKN5x/LxD+vhd8WDXDonmeDMPXi4t7DblvY2Jl6Cs75Z8SvMkLF/
	 nLaIUNjYJKqiw9IIJ8X0503dUdPFwZ5KEOngDZtuoILNnL5bGF0ecArfS9FHBR4A0A
	 Z3HBbS7Jvv3mMr+S0W/jNoaNdFXHunnA/T6WF6mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B68F805EE;
	Wed,  5 May 2021 18:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 122B6F805D9; Wed,  5 May 2021 18:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122DBF805B6
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122DBF805B6
IronPort-SDR: XcufewyVhJxeS3tT435X8IPyBsLm0hWSEkoQpLhmPcyXWKqNB0+NTJG3ejVR26zZN7z36Mt6Sm
 +AvnNtI/Cbvg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219210"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219210"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:29 -0700
IronPort-SDR: n3H8/mPlXyze1JSaseHkGSSsyX6Ifs/oPEuAY1aRlY8aYW6kb+TRmPfa4IaRHIowiDBP3qcid9
 7UJerKHrqKHQ==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800065"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/13] ASoC: Intel: add sof-cs42l42 machine driver
Date: Wed,  5 May 2021 11:37:04 -0500
Message-Id: <20210505163705.305616-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

The machine driver is a generic machine driver for SOF with cs42l42
I2C codec. It currently supports Maxim MAX98357A speker amp on GLK
but is extensible for other apms and platforms.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  18 +-
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/sof_cs42l42.c          | 509 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-glk-match.c   |  10 +
 4 files changed, 538 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/sof_cs42l42.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ceeb618bd950..eef5f4ac87c5 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -479,6 +479,23 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	   Say Y if you have such a device.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_SOF_CS42L42_MACH
+	tristate "SOF with cs42l42 codec in I2S Mode"
+	depends on I2C && ACPI
+	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
+		    (MFD_INTEL_LPSS || COMPILE_TEST))
+	select SND_SOC_CS42L42
+	select SND_SOC_MAX98357A
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	help
+	   This adds support for ASoC machine driver for SOF platforms
+	   with cs42l42 codec.
+	   Say Y if you have such a device.
+	   If unsure select "N".
+
 config SND_SOC_INTEL_SOF_PCM512x_MACH
 	tristate "SOF with TI PCM512x codec"
 	depends on I2C && ACPI
@@ -591,5 +608,4 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 
 endif
 
-
 endif ## SND_SOC_INTEL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 855296e8dfb8..ed21b82a4cf6 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -20,6 +20,7 @@ snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
 snd-soc-sof_rt5682-objs := sof_rt5682.o sof_realtek_common.o
+snd-soc-sof_cs42l42-objs := sof_cs42l42.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
@@ -40,6 +41,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
 			sof_sdw_dmic.o sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
new file mode 100644
index 000000000000..1b46ff4d3acb
--- /dev/null
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2021 Intel Corporation.
+
+/*
+ * Intel SOF Machine Driver with Cirrus Logic CS42L42 Codec
+ * and speaker codec MAX98357A
+ */
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/dmi.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <dt-bindings/sound/cs42l42.h>
+#include "../../codecs/hdac_hdmi.h"
+#include "../common/soc-intel-quirks.h"
+#include "hda_dsp_common.h"
+#include "sof_maxim_common.h"
+
+#define NAME_SIZE 32
+
+#define SOF_CS42L42_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
+#define SOF_CS42L42_SSP_CODEC_MASK		(GENMASK(2, 0))
+#define SOF_SPEAKER_AMP_PRESENT			BIT(3)
+#define SOF_CS42L42_SSP_AMP_SHIFT		4
+#define SOF_CS42L42_SSP_AMP_MASK		(GENMASK(6, 4))
+#define SOF_CS42L42_SSP_AMP(quirk)	\
+	(((quirk) << SOF_CS42L42_SSP_AMP_SHIFT) & SOF_CS42L42_SSP_AMP_MASK)
+#define SOF_CS42L42_NUM_HDMIDEV_SHIFT		7
+#define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
+#define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
+	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
+#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(10)
+
+/* Default: SSP2 */
+static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
+
+struct sof_hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_jack hdmi_jack;
+	int device;
+};
+
+struct sof_card_private {
+	struct snd_soc_jack headset_jack;
+	struct list_head hdmi_pcm_list;
+	bool common_hdmi_codec_drv;
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
+static int sof_cs42l42_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_jack *jack = &ctx->headset_jack;
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
+				    jack, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+};
+
+static void sof_cs42l42_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sof_cs42l42_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int clk_freq, ret;
+
+	clk_freq = 3072000; /* BCLK freq */
+
+	/* Configure sysclk for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+				     clk_freq, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+
+	return ret;
+}
+
+static const struct snd_soc_ops sof_cs42l42_ops = {
+	.hw_params = sof_cs42l42_hw_params,
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
+	struct snd_soc_component *component = NULL;
+	char jack_name[NAME_SIZE];
+	struct sof_hdmi_pcm *pcm;
+	int err;
+
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
+
+	if (ctx->common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
+				       head);
+		component = pcm->codec_dai->component;
+		return hda_dsp_hdmi_build_controls(card, component);
+	}
+
+	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		component = pcm->codec_dai->component;
+		snprintf(jack_name, sizeof(jack_name),
+			 "HDMI/DP, pcm=%d Jack", pcm->device);
+		err = snd_soc_card_jack_new(card, jack_name,
+					    SND_JACK_AVOUT, &pcm->hdmi_jack,
+					    NULL, 0);
+
+		if (err)
+			return err;
+
+		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
+					  &pcm->hdmi_jack);
+		if (err < 0)
+			return err;
+	}
+
+	return hdac_hdmi_jack_port_init(component, &card->dapm);
+}
+
+static const struct snd_kcontrol_new sof_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget sof_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_widget dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route sof_map[] = {
+	/* HP jack connectors - unknown if we have jack detection */
+	{"Headphone Jack", NULL, "HP"},
+
+	/* other jacks */
+	{"HS", NULL, "Headset Mic"},
+};
+
+static const struct snd_soc_dapm_route dmic_map[] = {
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+};
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
+/* sof audio machine driver for cs42l42 codec */
+static struct snd_soc_card sof_audio_card_cs42l42 = {
+	.name = "cs42l42", /* the sof- prefix is added by the core */
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
+static struct snd_soc_dai_link_component cs42l42_component[] = {
+	{
+		.name = "i2c-10134242:00",
+		.dai_name = "cs42l42",
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
+			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	if (!links || !cpus)
+		goto devm_err;
+
+	/* speaker amp */
+	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT) {
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+						"SSP%d-Codec", ssp_amp);
+		if (!links[id].name)
+			goto devm_err;
+
+		links[id].id = id;
+
+		if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
+			max_98357a_dai_link(&links[id]);
+		} else {
+			dev_err(dev, "no amp defined\n");
+			goto devm_err;
+		}
+
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].dpcm_playback = 1;
+		links[id].no_pcm = 1;
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
+
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "SSP%d Pin",
+							  ssp_amp);
+		if (!links[id].cpus->dai_name)
+			goto devm_err;
+
+		id++;
+	}
+
+	/* codec SSP */
+	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+					"SSP%d-Codec", ssp_codec);
+	if (!links[id].name)
+		goto devm_err;
+
+	links[id].id = id;
+	links[id].codecs = cs42l42_component;
+	links[id].num_codecs = ARRAY_SIZE(cs42l42_component);
+	links[id].platforms = platform_component;
+	links[id].num_platforms = ARRAY_SIZE(platform_component);
+	links[id].init = sof_cs42l42_init;
+	links[id].exit = sof_cs42l42_exit;
+	links[id].ops = &sof_cs42l42_ops;
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
+		sof_cs42l42_quirk = (unsigned long)pdev->id_entry->driver_data;
+
+	mach = pdev->dev.platform_data;
+
+	if (soc_intel_is_glk()) {
+		dmic_be_num = 1;
+		hdmi_num = 3;
+	} else {
+		dmic_be_num = 2;
+		hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
+			 SOF_CS42L42_NUM_HDMIDEV_SHIFT;
+		/* default number of HDMI DAI's */
+		if (!hdmi_num)
+			hdmi_num = 3;
+	}
+
+	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
+
+	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
+			SOF_CS42L42_SSP_AMP_SHIFT;
+
+	ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
+
+	/* compute number of dai links */
+	sof_audio_card_cs42l42.num_links = 1 + dmic_be_num + hdmi_num;
+
+	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT)
+		sof_audio_card_cs42l42.num_links++;
+
+	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
+					      dmic_be_num, hdmi_num);
+	if (!dai_links)
+		return -ENOMEM;
+
+	sof_audio_card_cs42l42.dai_link = dai_links;
+
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+
+	sof_audio_card_cs42l42.dev = &pdev->dev;
+
+	/* set platform name for each dailink */
+	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_cs42l42,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
+
+	snd_soc_card_set_drvdata(&sof_audio_card_cs42l42, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev,
+					  &sof_audio_card_cs42l42);
+}
+
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "glk_cs4242_max98357a",
+		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98357A_SPEAKER_AMP_PRESENT |
+					SOF_CS42L42_SSP_AMP(1)),
+	},
+	{ }
+};
+
+static struct platform_driver sof_audio = {
+	.probe = sof_audio_probe,
+	.driver = {
+		.name = "sof_cs42l42",
+		.pm = &snd_soc_pm_ops,
+	},
+	.id_table = board_ids,
+};
+module_platform_driver(sof_audio)
+
+/* Module information */
+MODULE_DESCRIPTION("SOF Audio Machine driver for CS42L42");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:sof_cs42l42");
+MODULE_ALIAS("platform:glk_cs4242_max98357a");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 6ceaab19ccb6..20ef855ff18d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -40,6 +40,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_fw_filename = "sof-glk.ri",
 		.sof_tplg_filename = "sof-glk-rt5682.tplg",
 	},
+	{
+		.id = "10134242",
+		.drv_name = "glk_cs4242_max98357a",
+		.fw_filename = "intel/dsp_fw_glk.bin",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &glk_codecs,
+		.sof_fw_filename = "sof-glk.ri",
+		.sof_tplg_filename = "sof-glk-cs42l42.tplg",
+	},
+
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_glk_machines);
-- 
2.25.1

