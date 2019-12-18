Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009FE1252F9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D47F168F;
	Wed, 18 Dec 2019 21:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D47F168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700161;
	bh=O94DPV1zqcjvLnFzA1AakYmu365NQXUlATuDpDaWRTc=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=g+0ULBX55jcpDeWc7hTcMV0KpxccOyWzUmIiGv9SgeydG8MR3fX+80j4An/NfmwMQ
	 +oc46fCj0UR0hnmIbQO1IO4aTeMdw1vs4hGofiWVOyExmXSh5v/DAmt0lQft+QGgId
	 R/oe9NtUBO96ZfYzgV3lw7PAJtd9uSPc7oO3feuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAE4F80334;
	Wed, 18 Dec 2019 21:06:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FABBF80308; Wed, 18 Dec 2019 21:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F1A5CF802FE
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A5CF802FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5230612FC;
 Wed, 18 Dec 2019 12:06:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C09CF3F67D;
 Wed, 18 Dec 2019 12:05:59 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
In-Reply-To: <20191218002616.7652-5-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218002616.7652-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vani Ganji <vani.ganji@intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: Add machine driver for
	da7219_max98373" to the asoc tree
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

   ASoC: Intel: Add machine driver for da7219_max98373

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 35dc19ad86fdf6a2af30c10c281e5fe10d45c041 Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Tue, 17 Dec 2019 18:26:12 -0600
Subject: [PATCH] ASoC: Intel: Add machine driver for da7219_max98373

This patch adds sof_da7219_max98373 machine driver.

Tested on JasperLake platform with SOF only.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Vani Ganji <vani.ganji@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218002616.7652-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig                |  18 +
 sound/soc/intel/boards/Makefile               |   3 +
 sound/soc/intel/boards/sof_da7219_max98373.c  | 371 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-jsl-match.c   |   7 +
 4 files changed, 399 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_da7219_max98373.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a8d71b5ed41e..b922596cf1e8 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -474,4 +474,22 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 
 endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
 
+if SND_SOC_SOF_JASPERLAKE
+
+config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
+	tristate "SOF with DA7219 and MAX98373 in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_DA7219
+	select SND_SOC_MAX98373
+	select SND_SOC_DMIC
+	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
+	help
+	  This adds support for ASoC machine driver for SOF platforms
+	  with DA7219 + MAX98373 I2S audio codec.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+endif ## SND_SOC_SOF_JASPERLAKE
+
 endif ## SND_SOC_INTEL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index ba1aa89db09d..5369627fa4c8 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -28,6 +28,7 @@ snd-soc-skl_rt286-objs := skl_rt286.o
 snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o hda_dsp_common.o
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
+snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
@@ -58,3 +59,5 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_RT286_MACH) += snd-soc-skl_rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
+
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
new file mode 100644
index 000000000000..8f44f13d2848
--- /dev/null
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright(c) 2019 Intel Corporation.
+
+/*
+ * Intel SOF Machine driver for DA7219 + MAX98373 codec
+ */
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/da7219.h"
+#include "../../codecs/da7219-aad.h"
+#include "hda_dsp_common.h"
+
+#define DIALOG_CODEC_DAI	"da7219-hifi"
+#define MAX98373_CODEC_DAI	"max98373-aif1"
+#define MAXIM_DEV0_NAME		"i2c-MX98373:00"
+#define MAXIM_DEV1_NAME		"i2c-MX98373:01"
+
+struct hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+struct card_private {
+	struct snd_soc_jack headset;
+	struct list_head hdmi_pcm_list;
+	struct snd_soc_jack hdmi[3];
+};
+
+static int platform_clock_control(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *k, int  event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *codec_dai;
+	int ret = 0;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, DIALOG_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev, "Codec dai not found; Unable to set/unset codec pll\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		ret = snd_soc_dai_set_pll(codec_dai, 0, DA7219_SYSCLK_MCLK,
+					  0, 0);
+		if (ret)
+			dev_err(card->dev, "failed to stop PLL: %d\n", ret);
+	} else if (SND_SOC_DAPM_EVENT_ON(event)) {
+		ret = snd_soc_dai_set_pll(codec_dai, 0, DA7219_SYSCLK_PLL_SRM,
+					  0, DA7219_PLL_FREQ_OUT_98304);
+		if (ret)
+			dev_err(card->dev, "failed to start PLL: %d\n", ret);
+	}
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const struct snd_soc_dapm_widget widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
+			    SND_SOC_DAPM_PRE_PMU),
+};
+
+static const struct snd_soc_dapm_route audio_map[] = {
+	{ "Headphone Jack", NULL, "HPL" },
+	{ "Headphone Jack", NULL, "HPR" },
+
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+
+	{ "MIC", NULL, "Headset Mic" },
+
+	{ "Headphone Jack", NULL, "Platform Clock" },
+	{ "Headset Mic", NULL, "Platform Clock" },
+};
+
+static struct snd_soc_jack headset;
+
+static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	/* Configure sysclk for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 24000000,
+				     SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
+		return ret;
+	}
+
+	/*
+	 * Headset buttons map to the google Reference headset.
+	 * These can be configured by userspace.
+	 */
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3 | SND_JACK_LINEOUT,
+				    &headset, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	jack = &headset;
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+	da7219_aad_jack_det(component, jack);
+
+	return ret;
+}
+
+static int ssp1_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *runtime = substream->private_data;
+	int ret, j;
+
+	for (j = 0; j < runtime->num_codecs; j++) {
+		struct snd_soc_dai *codec_dai = runtime->codec_dais[j];
+
+		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
+			/* vmon_slot_no = 0 imon_slot_no = 1 for TX slots */
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 3, 4, 16);
+			if (ret < 0) {
+				dev_err(runtime->dev, "DEV0 TDM slot err:%d\n", ret);
+				return ret;
+			}
+		}
+		if (!strcmp(codec_dai->component->name, MAXIM_DEV1_NAME)) {
+			/* vmon_slot_no = 2 imon_slot_no = 3 for TX slots */
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC, 3, 4, 16);
+			if (ret < 0) {
+				dev_err(runtime->dev, "DEV1 TDM slot err:%d\n", ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops ssp1_ops = {
+	.hw_params = ssp1_hw_params,
+};
+
+static struct snd_soc_codec_conf max98373_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAXIM_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAXIM_DEV1_NAME),
+		.name_prefix = "Left",
+	},
+};
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
+static int card_late_probe(struct snd_soc_card *card)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_acpi_mach *mach = (card->dev)->platform_data;
+	struct hdmi_pcm *pcm;
+
+	if (mach->mach_params.common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
+				       head);
+		return hda_dsp_hdmi_build_controls(card,
+						   pcm->codec_dai->component);
+	}
+
+	return -EINVAL;
+}
+
+SND_SOC_DAILINK_DEF(ssp0_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
+SND_SOC_DAILINK_DEF(ssp0_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00", DIALOG_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(ssp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
+SND_SOC_DAILINK_DEF(ssp1_amps,
+	DAILINK_COMP_ARRAY(
+	/* Left */	COMP_CODEC(MAXIM_DEV0_NAME, MAX98373_CODEC_DAI),
+	/* Right */	COMP_CODEC(MAXIM_DEV1_NAME, MAX98373_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(dmic_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
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
+SND_SOC_DAILINK_DEF(platform, /* subject to be overridden during probe */
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
+
+static struct snd_soc_dai_link dais[] = {
+	/* Back End DAI links */
+	{
+		.name = "SSP1-Codec",
+		.id = 0,
+		.ignore_pmdown_time = 1,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1, /* IV feedback */
+		.ops = &ssp1_ops,
+		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_amps, platform),
+	},
+	{
+		.name = "SSP0-Codec",
+		.id = 1,
+		.no_pcm = 1,
+		.init = da7219_codec_init,
+		.ignore_pmdown_time = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
+	},
+	{
+		.name = "dmic01",
+		.id = 2,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
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
+};
+
+static struct snd_soc_card card_da7219_m98373 = {
+	.name = "da7219max",
+	.owner = THIS_MODULE,
+	.dai_link = dais,
+	.num_links = ARRAY_SIZE(dais),
+	.controls = controls,
+	.num_controls = ARRAY_SIZE(controls),
+	.dapm_widgets = widgets,
+	.num_dapm_widgets = ARRAY_SIZE(widgets),
+	.dapm_routes = audio_map,
+	.num_dapm_routes = ARRAY_SIZE(audio_map),
+	.codec_conf = max98373_codec_conf,
+	.num_configs = ARRAY_SIZE(max98373_codec_conf),
+	.fully_routed = true,
+	.late_probe = card_late_probe,
+};
+
+static int audio_probe(struct platform_device *pdev)
+{
+	static struct snd_soc_card *card;
+	struct snd_soc_acpi_mach *mach;
+	struct card_private *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
+	if (!ctx)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+	card = (struct snd_soc_card *)pdev->id_entry->driver_data;
+	card->dev = &pdev->dev;
+
+	mach = (&pdev->dev)->platform_data;
+	ret = snd_soc_fixup_dai_links_platform_name(card,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev, card);
+}
+
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "sof_da7219_max98373",
+		.driver_data = (kernel_ulong_t)&card_da7219_m98373,
+	},
+	{ }
+};
+
+static struct platform_driver audio = {
+	.probe = audio_probe,
+	.driver = {
+		.name = "sof_da7219_max98373",
+		.pm = &snd_soc_pm_ops,
+	},
+	.id_table = board_ids,
+};
+module_platform_driver(audio)
+
+/* Module information */
+MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver");
+MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:sof_da7219_max98373");
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 1c68a04f0c6e..ed2b125f6a11 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -10,6 +10,13 @@
 #include <sound/soc-acpi-intel-match.h>
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
+	{
+		.id = "DLGS7219",
+		.drv_name = "sof_da7219_max98373",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.sof_fw_filename = "sof-jsl.ri",
+		.sof_tplg_filename = "sof-jsl-da7219.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
