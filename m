Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D54EE16E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0144D1768;
	Mon,  4 Nov 2019 14:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0144D1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874755;
	bh=jWgvJ6nPw0IWBCHlli8Ig+54MJsMI1dCQ7WJTHMFYko=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OmWf3zvNcyyFS7/Z5rJkPlW6G4gSo6eBNgz5WyaiPDIGHvgtBtJ45nbVyhGTlDJn+
	 GlX45S9qHrhaURRnBhYN4GN+D9YR3r7fbU1oSsnkhvpySYtPykFqONk+0v/qBkxzXm
	 CSVHwrU65kyzvzanUXiAPV5ENxYMy/j8v65mU414=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FDF8F8075A;
	Mon,  4 Nov 2019 14:27:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFE4F80671; Mon,  4 Nov 2019 14:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA1BF800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA1BF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nWbrMHwq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IkhfKPvNhloBW28UG3bgthgvBN4ko0mSUSHEscUVn88=; b=nWbrMHwqkX9w
 F/u7FUwEeSMyzDuV6urRO7DF94CYhOdgNhlxTjVtnP53Y3ngK+6kvG6MwlfwTlgR8XOJPZotrllDR
 /i9+gVsjGAhnP0oSWysulvIKekWVvUD/aPYpCgtmtaHPCBGdQUZ7K47Rgdj/DgRp3LvCi7XJH0CSf
 xa2E8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO2-0002ep-H1; Mon, 04 Nov 2019 13:27:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EA9B32743035; Mon,  4 Nov 2019 13:27:13 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Naveen Manohar <naveen.m@intel.com>
In-Reply-To: <20191101171847.26767-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132713.EA9B32743035@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:13 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: boards: Add CML m/c using RT1011
	and RT5682" to the asoc tree
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

   ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 17fe95d6df9320409015e5114309a3c05e31b736 Mon Sep 17 00:00:00 2001
From: Naveen Manohar <naveen.m@intel.com>
Date: Fri, 1 Nov 2019 12:18:47 -0500
Subject: [PATCH] ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682

Machine driver to enable
RT5682 on SSP0, DMIC, HDMI and
RT1011 AMP on SSP1 with
2 CH / 24 bit TDM Playback over 4 individual codecs and
4 CH / 24 bit Capture to provide feedback.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101171847.26767-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig             |  14 +
 sound/soc/intel/boards/Makefile            |   2 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 487 +++++++++++++++++++++
 3 files changed, 503 insertions(+)
 create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 5e0e7dbd1300..e591b058f46e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -423,6 +423,20 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 
+config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
+        tristate "CML with RT1011 and RT5682 in I2S Mode"
+        depends on I2C && ACPI
+        depends on MFD_INTEL_LPSS || COMPILE_TEST
+        select SND_SOC_RT1011
+        select SND_SOC_RT5682
+        select SND_SOC_DMIC
+        select SND_SOC_HDAC_HDMI
+        help
+          This adds support for ASoC machine driver for SOF platform with
+          RT1011 + RT5682 I2S codec.
+          Say Y if you have such a device.
+          If unsure select "N".
+
 endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
 
 endif ## SND_SOC_INTEL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 8bddf379cef1..9ae6544c6f3b 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -18,6 +18,7 @@ snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
 snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o
+snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o hda_dsp_common.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
@@ -47,6 +48,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH) += snd-soc-cml_rt1011_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH) += snd-soc-kbl_da7219_max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH) += snd-soc-kbl_rt5663_max98927.o
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
new file mode 100644
index 000000000000..a22f97234201
--- /dev/null
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -0,0 +1,487 @@
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
+#include "hda_dsp_common.h"
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
+	bool common_hdmi_codec_drv;
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
+	{"TL Ext Spk", NULL, "TL SPO"},
+	{"TR Ext Spk", NULL, "TR SPO"},
+	{"WL Ext Spk", NULL, "WL SPO"},
+	{"WR Ext Spk", NULL, "WR SPO"},
+
+	/* HP jack connectors - unknown if we have jack detection */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+
+	/* other jacks */
+	{ "IN1P", NULL, "Headset Mic" },
+
+	/* DMIC */
+	{"DMic", NULL, "SoC DMIC"},
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
+					RT5682_AD_STEREO1_FILTER,
+					RT5682_CLK_SEL_I2S1_ASRC);
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
+	for (i = 0; i < rtd->num_codecs; i++) {
+		codec_dai = rtd->codec_dais[i];
+
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
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
+
+	if (ctx->common_hdmi_codec_drv)
+		return hda_dsp_hdmi_build_controls(card, component);
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
+
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
+
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
