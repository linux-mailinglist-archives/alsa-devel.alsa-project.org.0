Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099EBD809
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 08:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92ED616CC;
	Wed, 25 Sep 2019 07:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92ED616CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569391217;
	bh=4ufPFDOamc7I/7fcZ946nIw/PcJUCQbf3ov4j1j4Beo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UcsGAf1+sc4g7hDW0CLSPpnIPNFcaMcPFKCd65X+ikwjYr3nEWnFQqx281Lq7NKDd
	 euxuCZruAD5mpDWS7MhnQ4asHgf4JUpABwJ5mOAw7+HUDtKiYLItZIs9QL4+yMycEX
	 Ip/XNmjNRHX5Qht0N/5rgAlCwlJDFD/4PkBGm3pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B752F805DF;
	Wed, 25 Sep 2019 07:57:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D399CF804CA; Wed, 25 Sep 2019 07:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A05F802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 07:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A05F802BD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 22:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,546,1559545200"; d="scan'208";a="213935569"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.177])
 by fmsmga004.fm.intel.com with ESMTP; 24 Sep 2019 22:57:32 -0700
From: sathya.prakash.m.r@intel.com
To: alsa-devel@alsa-project.org
Date: Wed, 25 Sep 2019 11:33:09 +0530
Message-Id: <1569391390-15328-2-git-send-email-sathya.prakash.m.r@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569391390-15328-1-git-send-email-sathya.prakash.m.r@intel.com>
References: <1569391390-15328-1-git-send-email-sathya.prakash.m.r@intel.com>
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v3 1/2] ASoC: Intel: boards: Add CML m/c using
	RT1011 and RT5682
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

From: Naveen Manohar <naveen.m@intel.com>

Machine driver to enable
RT5682 on SSP0, DMIC, HDMI and
RT1011 AMP on SSP1 with
2 CH / 24 bit TDM Playback over 4 individual codecs and
4 CH / 24 bit Capture to provide feedback.

Changes from V1: adressed minor comments of V1

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
---
 sound/soc/intel/boards/Kconfig             |  18 ++
 sound/soc/intel/boards/Makefile            |   2 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 473 +++++++++++++++++++++++++++++
 3 files changed, 493 insertions(+)
 create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 50bf149818b5..6c41aa5e78c0 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -382,6 +382,24 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 
 endif ## SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
 
+if SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
+
+config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
+	tristate "CML with RT1011 and RT5682 in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT1011
+	select SND_SOC_RT5682
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+	help
+	   This adds support for ASoC machine driver for SOF platform with
+	   RT1011 + RT5682 I2S codec.
+	   Say Y if you have such a device.
+	   If unsure select "N".
+
+endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
+
 if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 6445f90ea542..848a2684535f 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -18,6 +18,7 @@ snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
 snd-soc-sof_rt5682-objs := sof_rt5682.o
+snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
@@ -47,6 +48,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH) += cml_rt1011_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH) += snd-soc-kbl_da7219_max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH) += snd-soc-kbl_rt5663_max98927.o
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
new file mode 100644
index 000000000000..1e257daea488
--- /dev/null
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright(c) 2019 Intel Corporation.
+
+/*
+ * Intel Cometlake I2S Machine driver for RT1011 + RT5682 codec
+ */
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/dmi.h>
+#include <linux/slab.h>
+#include <asm/cpu_device_id.h>
+#include <linux/acpi.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/rt5682.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/rt1011.h"
+#include "../../codecs/rt5682.h"
+#include "../../codecs/hdac_hdmi.h"
+
+/* The platform clock outputs 24Mhz clock to codec as I2S MCLK */
+#define CML_PLAT_CLK	24000000
+#define CML_RT1011_CODEC_DAI "rt1011-aif"
+#define CML_RT5682_CODEC_DAI "rt5682-aif1"
+#define NAME_SIZE 32
+
+static struct snd_soc_jack hdmi_jack[3];
+
+struct hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+struct card_private {
+	char codec_name[SND_ACPI_I2C_ID_LEN];
+	struct snd_soc_jack headset;
+	struct list_head hdmi_pcm_list;
+};
+
+static const struct snd_kcontrol_new cml_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
+};
+
+static const struct snd_soc_dapm_widget cml_rt1011_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("WL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("WR Ext Spk", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
+	/*speaker*/
+	{ "TL Ext Spk", NULL, "TL SPO" },
+	{ "TR Ext Spk", NULL, "TR SPO" },
+	{ "WL Ext Spk", NULL, "WL SPO" },
+	{ "WR Ext Spk", NULL, "WR SPO" },
+
+	/* HP jack connectors - unknown if we have jack detection */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+
+	/* other jacks */
+	{ "IN1P", NULL, "Headset Mic" },
+
+	/* DMIC */
+	{ "DMic", NULL, "SoC DMIC" },
+};
+
+static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	/* need to enable ASRC function for 24MHz mclk rate */
+	rt5682_sel_asrc_clk_src(component, RT5682_DA_STEREO1_FILTER |
+				RT5682_AD_STEREO1_FILTER,
+				RT5682_CLK_SEL_I2S1_ASRC);
+
+	/*
+	 * Headset buttons map to the google Reference headset.
+	 * These can be configured by userspace.
+	 */
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->headset, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	jack = &ctx->headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret)
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+
+	return ret;
+};
+
+static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int clk_id, clk_freq, pll_out, ret;
+
+	clk_id = RT5682_PLL1_S_MCLK;
+	clk_freq = CML_PLAT_CLK;
+
+	pll_out = params_rate(params) * 512;
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	if (ret < 0)
+		dev_warn(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
+
+	/* Configure sysclk for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+				     pll_out, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_warn(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+
+	/*
+	 * slot_width should be equal or large than data length, set them
+	 * be the same
+	 */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0, 0x0, 2,
+				       params_width(params));
+	if (ret < 0)
+		dev_warn(rtd->dev, "set TDM slot err:%d\n", ret);
+	return ret;
+}
+
+static int cml_rt1011_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_card *card = rtd->card;
+	int srate, i, ret = 0;
+
+	srate = params_rate(params);
+
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		/* 100 Fs to drive 24 bit data */
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
+					  100 * srate, 256 * srate);
+		if (ret < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai,
+					     RT1011_FS_SYS_PRE_S_PLL1,
+					     256 * srate, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+
+		/*
+		 * Codec TDM is configured as 24 bit capture/ playback.
+		 * 2 CH PB is done over 4 codecs - 2 Woofers and 2 Tweeters.
+		 * The Left woofer and tweeter plays the Left playback data
+		 * and  similar by the Right.
+		 * Hence 2 codecs (1 T and 1 W pair) share same Rx slot.
+		 * The feedback is captured for each codec individually.
+		 * Hence all 4 codecs use 1 Tx slot each for feedback.
+		 */
+		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       0x4, 0x1, 4, 24);
+			if (ret < 0)
+				break;
+		}
+		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:02")) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       0x1, 0x1, 4, 24);
+			if (ret < 0)
+				break;
+		}
+		/* TDM Rx slot 2 is used for Right Woofer & Tweeters pair */
+		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       0x8, 0x2, 4, 24);
+			if (ret < 0)
+				break;
+		}
+		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:03")) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       0x2, 0x2, 4, 24);
+			if (ret < 0)
+				break;
+		}
+	}
+	if (ret < 0)
+		dev_err(rtd->dev,
+			"set codec TDM slot for %s failed with error %d\n",
+			codec_dai->component->name, ret);
+	return ret;
+}
+
+static struct snd_soc_ops cml_rt5682_ops = {
+	.hw_params = cml_rt5682_hw_params,
+};
+
+static const struct snd_soc_ops cml_rt1011_ops = {
+	.hw_params = cml_rt1011_hw_params,
+};
+
+static int sof_card_late_probe(struct snd_soc_card *card)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = NULL;
+	char jack_name[NAME_SIZE];
+	struct hdmi_pcm *pcm;
+	int ret, i = 0;
+
+	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		component = pcm->codec_dai->component;
+		snprintf(jack_name, sizeof(jack_name),
+			 "HDMI/DP, pcm=%d Jack", pcm->device);
+		ret = snd_soc_card_jack_new(card, jack_name,
+					    SND_JACK_AVOUT, &hdmi_jack[i],
+					    NULL, 0);
+		if (ret)
+			return ret;
+
+		ret = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
+					  &hdmi_jack[i]);
+		if (ret < 0)
+			return ret;
+
+		i++;
+	}
+	if (!component)
+		return -EINVAL;
+
+	return hdac_hdmi_jack_port_init(component, &card->dapm);
+}
+
+static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct hdmi_pcm *pcm;
+
+	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return -ENOMEM;
+
+	pcm->device = dai->id;
+	pcm->codec_dai = dai;
+
+	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+
+	return 0;
+}
+
+/* Cometlake digital audio interface glue - connects codec <--> CPU */
+
+SND_SOC_DAILINK_DEF(ssp0_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
+SND_SOC_DAILINK_DEF(ssp0_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00",
+				CML_RT5682_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(ssp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
+SND_SOC_DAILINK_DEF(ssp1_codec,
+	DAILINK_COMP_ARRAY(
+	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
+	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI),
+	/* TL */ COMP_CODEC("i2c-10EC1011:02", CML_RT1011_CODEC_DAI),
+	/* TR */ COMP_CODEC("i2c-10EC1011:03", CML_RT1011_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(dmic_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+
+SND_SOC_DAILINK_DEF(dmic16k_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
+SND_SOC_DAILINK_DEF(dmic_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(idisp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
+SND_SOC_DAILINK_DEF(idisp1_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
+
+SND_SOC_DAILINK_DEF(idisp2_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
+SND_SOC_DAILINK_DEF(idisp2_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
+
+SND_SOC_DAILINK_DEF(idisp3_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
+SND_SOC_DAILINK_DEF(idisp3_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
+
+static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
+	/* Back End DAI links */
+	{
+		/* SSP0 - Codec */
+		.name = "SSP0-Codec",
+		.id = 0,
+		.init = cml_rt5682_codec_init,
+		.ignore_pmdown_time = 1,
+		.ops = &cml_rt5682_ops,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
+	},
+	{
+		.name = "dmic01",
+		.id = 1,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
+	},
+	{
+		.name = "dmic16k",
+		.id = 2,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	},
+	{
+		.name = "iDisp1",
+		.id = 3,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
+	},
+	{
+		.name = "iDisp2",
+		.id = 4,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
+	},
+	{
+		.name = "iDisp3",
+		.id = 5,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
+	},
+	{
+		/*
+		 * SSP1 - Codec : added to end of list ensuring
+		 * reuse of common topologies for other end points
+		 * and changing only SSP1's codec
+		 */
+		.name = "SSP1-Codec",
+		.id = 6,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1, /* Capture stream provides Feedback */
+		.no_pcm = 1,
+		.ops = &cml_rt1011_ops,
+		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
+	},
+};
+
+static struct snd_soc_codec_conf rt1011_conf[] = {
+	{
+		.dev_name = "i2c-10EC1011:00",
+		.name_prefix = "WL",
+	},
+	{
+		.dev_name = "i2c-10EC1011:01",
+		.name_prefix = "WR",
+	},
+	{
+		.dev_name = "i2c-10EC1011:02",
+		.name_prefix = "TL",
+	},
+	{
+		.dev_name = "i2c-10EC1011:03",
+		.name_prefix = "TR",
+	},
+};
+
+/* Cometlake audio machine driver for RT1011 and RT5682 */
+static struct snd_soc_card snd_soc_card_cml = {
+	.name = "cml_rt1011_rt5682",
+	.dai_link = cml_rt1011_rt5682_dailink,
+	.num_links = ARRAY_SIZE(cml_rt1011_rt5682_dailink),
+	.codec_conf = rt1011_conf,
+	.num_configs = ARRAY_SIZE(rt1011_conf),
+	.dapm_widgets = cml_rt1011_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cml_rt1011_rt5682_widgets),
+	.dapm_routes = cml_rt1011_rt5682_map,
+	.num_dapm_routes = ARRAY_SIZE(cml_rt1011_rt5682_map),
+	.controls = cml_controls,
+	.num_controls = ARRAY_SIZE(cml_controls),
+	.fully_routed = true,
+	.late_probe = sof_card_late_probe,
+};
+
+static int snd_cml_rt1011_probe(struct platform_device *pdev)
+{
+	struct card_private *ctx;
+	struct snd_soc_acpi_mach *mach;
+	const char *platform_name;
+	int ret;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
+	if (!ctx)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+	mach = (&pdev->dev)->platform_data;
+	snd_soc_card_cml.dev = &pdev->dev;
+	platform_name = mach->mach_params.platform;
+
+	/* set platform name for each dailink */
+	ret = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cml,
+						    platform_name);
+	if (ret)
+		return ret;
+	snd_soc_card_set_drvdata(&snd_soc_card_cml, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cml);
+}
+
+static struct platform_driver snd_cml_rt1011_rt5682_driver = {
+	.probe = snd_cml_rt1011_probe,
+	.driver = {
+		.name = "cml_rt1011_rt5682",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(snd_cml_rt1011_rt5682_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("Cometlake Audio Machine driver - RT1011 and RT5682 in I2S mode");
+MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
+MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:cml_rt1011_rt5682");
-- 
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
