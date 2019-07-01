Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A175610290
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 00:41:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3750C16AF;
	Wed,  1 May 2019 00:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3750C16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556664107;
	bh=CmEjPkZeWNB6gEeF3Mos46md7qnzhhz20/OYJ4orVdg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+rwoubiEwhypPBBvE9PSnsyOBdA6r+iKFMU3jzN4KVJzX0lc50jNezktqHZ3ZWon
	 fc7lng11BxlqZuT1Fe0pYRrtGSBzeXnn5S2o4+jRQsmv6Jmk6aj4+zBc+Hf38NwhKX
	 CC76PrvvfnWA6H/unNwle87KHf9iPy0SPl19AIlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41617F89727;
	Wed,  1 May 2019 00:38:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53379F8971A; Wed,  1 May 2019 00:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF8CF896AA
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 00:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF8CF896AA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 15:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="147124126"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by orsmga003.jf.intel.com with ESMTP; 30 Apr 2019 15:38:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 17:37:44 -0500
Message-Id: <20190430223744.3863-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430223744.3863-1-pierre-louis.bossart@linux.intel.com>
References: <20190430223744.3863-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/3] ASoC: Intel: add sof-rt5682 machine driver
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

From: Bard liao <yung-chuan.liao@linux.intel.com>

The machine driver is a generic machine driver for SOF with rt5682
codec. it currently supports BYT/CHT/ICL/CML. Depending on the SOC
hdmi/speaker and DMIC support are added dynamically.

Only add information related to SOF since the machine driver was
only tested with SOF.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  16 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/sof_rt5682.c           | 563 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-byt-match.c   |   6 +
 .../intel/common/soc-acpi-intel-cht-match.c   |   6 +
 .../intel/common/soc-acpi-intel-cnl-match.c   |  19 +
 .../intel/common/soc-acpi-intel-icl-match.c   |   6 +
 7 files changed, 618 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_rt5682.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index bf6d7a11f94a..61cb398d544f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -354,4 +354,20 @@ config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 
 endif ## SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
+if SND_SOC_SOF_HDA_COMMON || SND_SOC_SOF_BAYTRAIL
+config SND_SOC_INTEL_SOF_RT5682_MACH
+	tristate "SOF with rt5682 codec in I2S Mode"
+	depends on I2C && ACPI
+	depends on (SND_SOC_SOF_HDA_COMMON && MFD_INTEL_LPSS) ||\
+		   (SND_SOC_SOF_BAYTRAIL && X86_INTEL_LPSS)
+	select SND_SOC_RT5682
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI if SND_SOC_SOF_HDA_COMMON
+	help
+	   This adds support for ASoC machine driver for SOF platforms
+	   with rt5682 codec.
+	   Say Y if you have such a device.
+	   If unsure select "N".
+endif ## SND_SOC_SOF_HDA_COMMON || SND_SOC_SOF_BAYTRAIL
+
 endif ## SND_SOC_INTEL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index bf072ea299b7..451b3bd7d9c5 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -16,6 +16,7 @@ snd-soc-sst-cht-bsw-nau8824-objs := cht_bsw_nau8824.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
@@ -26,6 +27,7 @@ snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
 
+obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_RT5640_MACH) += snd-soc-sst-byt-rt5640-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_MAX98090_MACH) += snd-soc-sst-byt-max98090-mach.o
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
new file mode 100644
index 000000000000..f28fb98cc306
--- /dev/null
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright(c) 2019 Intel Corporation.
+
+/*
+ * Intel SOF Machine Driver with Realtek rt5682 Codec
+ * and speaker codec MAX98357A
+ */
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/dmi.h>
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/rt5682.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/rt5682.h"
+#include "../../codecs/hdac_hdmi.h"
+
+#define NAME_SIZE 32
+
+#define SOF_RT5682_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
+#define SOF_RT5682_SSP_CODEC_MASK			(GENMASK(2, 0))
+#define SOF_RT5682_MCLK_EN			BIT(3)
+#define SOF_RT5682_MCLK_24MHZ			BIT(4)
+#define SOF_SPEAKER_AMP_PRESENT		BIT(5)
+#define SOF_RT5682_SSP_AMP(quirk)		((quirk) & GENMASK(8, 6))
+#define SOF_RT5682_SSP_AMP_MASK			(GENMASK(8, 6))
+#define SOF_RT5682_SSP_AMP_SHIFT		6
+
+/* Default: MCLK on, MCLK 19.2M, SSP0  */
+static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0);
+
+static int is_legacy_cpu;
+
+static struct snd_soc_jack sof_hdmi[3];
+
+struct sof_hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+struct sof_card_private {
+	struct snd_soc_jack sof_headset;
+	struct list_head hdmi_pcm_list;
+};
+
+static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
+{
+	sof_rt5682_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_rt5682_quirk_table[] = {
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "WhiskeyLake Client"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(1)),
+	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Hatch"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
+	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0)),
+	},
+	{}
+};
+
+static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = rtd->codec_dai;
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
+static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	/* need to enable ASRC function for 24MHz mclk rate */
+	if ((sof_rt5682_quirk & SOF_RT5682_MCLK_EN) &&
+	    (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)) {
+		rt5682_sel_asrc_clk_src(component, RT5682_DA_STEREO1_FILTER |
+					RT5682_AD_STEREO1_FILTER,
+					RT5682_CLK_SEL_I2S1_ASRC);
+	}
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
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
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
+static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int clk_id, clk_freq, pll_out, ret;
+
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+		clk_id = RT5682_PLL1_S_MCLK;
+		if (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)
+			clk_freq = 24000000;
+		else
+			clk_freq = 19200000;
+	} else {
+		clk_id = RT5682_PLL1_S_BCLK1;
+		clk_freq = params_rate(params) * 50;
+	}
+
+	pll_out = params_rate(params) * 512;
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	if (ret < 0)
+		dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
+
+	/* Configure sysclk for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+				     pll_out, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+
+	/*
+	 * slot_width should equal or large than data length, set them
+	 * be the same
+	 */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0, 0x0, 2,
+				       params_width(params));
+	if (ret < 0) {
+		dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct snd_soc_ops sof_rt5682_ops = {
+	.hw_params = sof_rt5682_hw_params,
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
+	int err = 0;
+	int i = 0;
+
+	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
+	if (is_legacy_cpu)
+		return 0;
+
+	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		component = pcm->codec_dai->component;
+		snprintf(jack_name, sizeof(jack_name),
+			 "HDMI/DP, pcm=%d Jack", pcm->device);
+		err = snd_soc_card_jack_new(card, jack_name,
+					    SND_JACK_AVOUT, &sof_hdmi[i],
+					    NULL, 0);
+
+		if (err)
+			return err;
+
+		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
+					  &sof_hdmi[i]);
+		if (err < 0)
+			return err;
+
+		i++;
+	}
+	if (!component)
+		return -EINVAL;
+
+	return hdac_hdmi_jack_port_init(component, &card->dapm);
+}
+
+static const struct snd_kcontrol_new sof_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
+static const struct snd_soc_dapm_widget sof_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route sof_map[] = {
+	/* HP jack connectors - unknown if we have jack detection */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+
+	/* other jacks */
+	{ "IN1P", NULL, "Headset Mic" },
+
+};
+
+static const struct snd_soc_dapm_route speaker_map[] = {
+	/* speaker */
+	{ "Spk", NULL, "Speaker" },
+};
+
+static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map,
+				      ARRAY_SIZE(speaker_map));
+
+	if (ret)
+		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	return ret;
+}
+
+/* sof audio machine driver for rt5682 codec */
+static struct snd_soc_card sof_audio_card_rt5682 = {
+	.name = "sof_rt5682",
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
+static const struct x86_cpu_id legacy_cpi_ids[] = {
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT }, /* Baytrail */
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_AIRMONT }, /* Cherrytrail */
+	{}
+};
+
+static struct snd_soc_dai_link_component rt5682_component[] = {
+	{
+		.name = "i2c-10EC5682:00",
+		.dai_name = "rt5682-aif1",
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
+static struct snd_soc_dai_link_component max98357a_component[] = {
+	{
+		.name = "MX98357A:00",
+		.dai_name = "HiFi",
+	}
+};
+
+static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
+							  int ssp_codec,
+							  int ssp_amp,
+							  int dmic_num,
+							  int hdmi_num)
+{
+	struct snd_soc_dai_link_component *idisp_components;
+	struct snd_soc_dai_link *links;
+	int i, id = 0;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+			     sof_audio_card_rt5682.num_links, GFP_KERNEL);
+	if (!links)
+		goto devm_err;
+
+	/* codec SSP */
+	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+					"SSP%d-Codec", ssp_codec);
+	if (!links[id].name)
+		goto devm_err;
+
+	links[id].id = id;
+	links[id].codecs = rt5682_component;
+	links[id].num_codecs = ARRAY_SIZE(rt5682_component);
+	links[id].platforms = platform_component;
+	links[id].num_platforms = ARRAY_SIZE(platform_component);
+	links[id].init = sof_rt5682_codec_init;
+	links[id].ops = &sof_rt5682_ops;
+	links[id].nonatomic = true;
+	links[id].dpcm_playback = 1;
+	links[id].dpcm_capture = 1;
+	links[id].no_pcm = 1;
+	if (is_legacy_cpu) {
+		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"ssp%d-port",
+							ssp_codec);
+		if (!links[id].cpu_dai_name)
+			goto devm_err;
+	} else {
+		/*
+		 * Currently, On SKL+ platforms MCLK will be turned off in sof
+		 * runtime suspended, and it will go into runtime suspended
+		 * right after playback is stop. However, rt5682 will output
+		 * static noise if sysclk turns off during playback. Set
+		 * ignore_pmdown_time to power down rt5682 immediately and
+		 * avoid the noise.
+		 * It can be removed once we can control MCLK by driver.
+		 */
+		links[id].ignore_pmdown_time = 1;
+		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"SSP%d Pin",
+							ssp_codec);
+		if (!links[id].cpu_dai_name)
+			goto devm_err;
+	}
+	id++;
+
+	/* dmic */
+	for (i = 1; i <= dmic_num; i++) {
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+						"dmic%02d", i);
+		if (!links[id].name)
+			goto devm_err;
+
+		links[id].id = id;
+		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"DMIC%02d Pin", i);
+		if (!links[id].cpu_dai_name)
+			goto devm_err;
+
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
+				   sizeof(struct snd_soc_dai_link_component) *
+				   hdmi_num, GFP_KERNEL);
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
+		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"iDisp%d Pin", i);
+		if (!links[id].cpu_dai_name)
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
+	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT) {
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
+						"SSP%d-Codec", ssp_amp);
+		if (!links[id].name)
+			goto devm_err;
+
+		links[id].id = id;
+		links[id].codecs = max98357a_component;
+		links[id].num_codecs = ARRAY_SIZE(max98357a_component);
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].init = speaker_codec_init,
+		links[id].nonatomic = true;
+		links[id].dpcm_playback = 1;
+		links[id].no_pcm = 1;
+		if (is_legacy_cpu) {
+			links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								"ssp%d-port",
+								ssp_amp);
+			if (!links[id].cpu_dai_name)
+				goto devm_err;
+
+		} else {
+			links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								"SSP%d Pin",
+								ssp_amp);
+			if (!links[id].cpu_dai_name)
+				goto devm_err;
+		}
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
+	int dmic_num, hdmi_num;
+	int ret, ssp_amp, ssp_codec;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
+	if (!ctx)
+		return -ENOMEM;
+
+	if (x86_match_cpu(legacy_cpi_ids)) {
+		is_legacy_cpu = 1;
+		dmic_num = 0;
+		hdmi_num = 0;
+		/* default quirk for legacy cpu */
+		sof_rt5682_quirk = SOF_RT5682_SSP_CODEC(2);
+	} else {
+		dmic_num = 1;
+		hdmi_num = 3;
+	}
+
+	dmi_check_system(sof_rt5682_quirk_table);
+
+	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
+
+	ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
+			SOF_RT5682_SSP_AMP_SHIFT;
+
+	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
+
+	/* compute number of dai links */
+	sof_audio_card_rt5682.num_links = 1 + dmic_num + hdmi_num;
+	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
+		sof_audio_card_rt5682.num_links++;
+
+	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
+					      dmic_num, hdmi_num);
+	if (!dai_links)
+		return -ENOMEM;
+
+	sof_audio_card_rt5682.dai_link = dai_links;
+
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+
+	sof_audio_card_rt5682.dev = &pdev->dev;
+	mach = (&pdev->dev)->platform_data;
+
+	/* set platform name for each dailink */
+	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_rt5682,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(&sof_audio_card_rt5682, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev,
+					  &sof_audio_card_rt5682);
+}
+
+static struct platform_driver sof_audio = {
+	.probe = sof_audio_probe,
+	.driver = {
+		.name = "sof_rt5682",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(sof_audio)
+
+/* Module information */
+MODULE_DESCRIPTION("SOF Audio Machine driver");
+MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
+MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:sof_rt5682");
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index fe812a909db4..0cfab247876a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -185,6 +185,12 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 		.sof_fw_filename = "sof-byt.ri",
 		.sof_tplg_filename = "sof-byt-es8316.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "sof_rt5682",
+		.sof_fw_filename = "sof-byt.ri",
+		.sof_tplg_filename = "sof-byt-rt5682.tplg",
+	},
 	/* some Baytrail platforms rely on RT5645, use CHT machine driver */
 	{
 		.id = "10EC5645",
diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index deafd87cc764..ff9c31a39ad4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -160,6 +160,12 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_fw_filename = "sof-cht.ri",
 		.sof_tplg_filename = "sof-cht-rt5640.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "sof_rt5682",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-rt5682.tplg",
+	},
 	/* some CHT-T platforms rely on RT5651, use Baytrail machine driver */
 	{
 		.id = "10EC5651",
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index a914dd238d0a..df7c52cad5c3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -14,6 +14,11 @@ static struct skl_machine_pdata cnl_pdata = {
 	.use_tplg_pcm = true,
 };
 
+static struct snd_soc_acpi_codecs cml_codecs = {
+	.num_codecs = 1,
+	.codecs = {"10EC5682"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
@@ -23,6 +28,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "sof_rt5682",
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt5682.tplg",
+	},
+	{
+		.id = "MX98357A",
+		.drv_name = "sof_rt5682",
+		.quirk_data = &cml_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
+	},
+
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index e5a6be5bc0ee..0b430b9b3673 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -23,6 +23,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt274.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "sof_rt5682",
+		.sof_fw_filename = "sof-icl.ri",
+		.sof_tplg_filename = "sof-icl-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_icl_machines);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
