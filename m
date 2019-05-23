Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7E27EC4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:51:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C28B1688;
	Thu, 23 May 2019 15:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C28B1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558619482;
	bh=5l0vcGoPC8cvn7ZX+vnZskpyUPXsX81s92aWhgUYBzg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Zehfbowbz1GvxGotoLqsajwwQcGyone7mrz9TV5yIIpToAh+I1Q/y7ys+n7tvcEtq
	 A02LxHdXwAhl0ZfVAtXpkPYVDCAYsr8/HCvzWqC0+KtDIHCTgv2HP+dAmbif9kdn9D
	 3X4lXHiXLvlw/QW4NJ6wDbzjPGw/cTtfU/N+sNvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C10EF89725;
	Thu, 23 May 2019 15:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A09F89728; Thu, 23 May 2019 15:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1563F89674
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 15:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1563F89674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dgedhSmW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=BEsWW3tObmtHw0I13UjpMzY4FhTuF2qFnERFGaC0br4=; b=dgedhSmWut/G
 2cbDuqMlCae8PmB9iscKaRK/5Sms64btQcL++/ubbOFTY535Jk+97Dl5kDKLdmTl8a9PLkE7I93Yq
 RWB2okFmgdrR5vfcWrAio35imTrGU2Trbut/ImD6FaMZYhjqYG2/cqMDgzz2HSIsjeT9BaLfzYA64
 PdClQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTo5Z-0000ED-UD; Thu, 23 May 2019 13:48:58 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 569E51126D24; Thu, 23 May 2019 14:48:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20190521062653.734-3-tiwai@suse.de>
X-Patchwork-Hint: ignore
Message-Id: <20190523134854.569E51126D24@debutante.sirena.org.uk>
Date: Thu, 23 May 2019 14:48:54 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: Add machine driver for CX2072X
	on BYT/CHT platforms" to the asoc tree
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

   ASoC: Intel: Add machine driver for CX2072X on BYT/CHT platforms

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 3917da94f787e6c907e440653ead0c666a71379e Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 21 May 2019 08:26:53 +0200
Subject: [PATCH] ASoC: Intel: Add machine driver for CX2072X on BYT/CHT
 platforms

This is an implementation of a machine driver needed for Conexant
CX2072X codec on Intel Baytrail and Cherrytrail platforms.  The
current patch is based on the initial work by Pierre-Louis Bossart and
the other Intel machine drivers.

The jack detection support (driven via the standard GPIO) was added on
top of the original work.

Tested with ASUS E200HA laptop.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=115531
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig                |  11 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/bytcht_cx2072x.c       | 262 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-byt-match.c   |   8 +
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 5 files changed, 291 insertions(+)
 create mode 100644 sound/soc/intel/boards/bytcht_cx2072x.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index e39473a6a5d9..59e366edc16b 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -155,6 +155,17 @@ config SND_SOC_INTEL_CHT_BSW_NAU8824_MACH
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_BYT_CHT_CX2072X_MACH
+	tristate "Baytrail & Cherrytrail with CX2072X codec"
+	depends on X86_INTEL_LPSS && I2C && ACPI
+	select SND_SOC_ACPI
+	select SND_SOC_CX2072X
+	help
+	  This adds support for ASoC machine driver for Intel(R) Baytrail &
+	  Cherrytrail platforms with Conexant CX2072X audio codec.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_BYT_CHT_DA7213_MACH
 	tristate "Baytrail & Cherrytrail with DA7212/7213 codec"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 451b3bd7d9c5..6445f90ea542 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -13,6 +13,7 @@ snd-soc-sst-cht-bsw-rt5672-objs := cht_bsw_rt5672.o
 snd-soc-sst-cht-bsw-rt5645-objs := cht_bsw_rt5645.o
 snd-soc-sst-cht-bsw-max98090_ti-objs := cht_bsw_max98090_ti.o
 snd-soc-sst-cht-bsw-nau8824-objs := cht_bsw_nau8824.o
+snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH) += snd-soc-sst-cht-bsw-rt5672.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH) += snd-soc-sst-cht-bsw-rt5645.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH) += snd-soc-sst-cht-bsw-max98090_ti.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH) += snd-soc-sst-cht-bsw-nau8824.o
+obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
new file mode 100644
index 000000000000..b21b0e7f981a
--- /dev/null
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ASoC DPCM Machine driver for Baytrail / Cherrytrail platforms with
+// CX2072X codec
+//
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <asm/platform_sst_audio.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/cx2072x.h"
+#include "../atom/sst-atom-controls.h"
+
+static const struct snd_soc_dapm_widget byt_cht_cx2072x_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Ext Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route byt_cht_cx2072x_audio_map[] = {
+	/* External Speakers: HFL, HFR */
+	{"Headphone", NULL, "PORTA"},
+	{"Ext Spk", NULL, "PORTG"},
+	{"PORTC", NULL, "Int Mic"},
+	{"PORTD", NULL, "Headset Mic"},
+
+	{"Playback", NULL, "ssp2 Tx"},
+	{"ssp2 Tx", NULL, "codec_out0"},
+	{"ssp2 Tx", NULL, "codec_out1"},
+	{"codec_in0", NULL, "ssp2 Rx"},
+	{"codec_in1", NULL, "ssp2 Rx"},
+	{"ssp2 Rx", NULL, "Capture"},
+};
+
+static const struct snd_kcontrol_new byt_cht_cx2072x_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Ext Spk"),
+};
+
+static struct snd_soc_jack byt_cht_cx2072x_headset;
+
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin byt_cht_cx2072x_headset_pins[] = {
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+};
+
+static const struct acpi_gpio_params byt_cht_cx2072x_headset_gpios;
+static const struct acpi_gpio_mapping byt_cht_cx2072x_acpi_gpios[] = {
+	{ "headset-gpios", &byt_cht_cx2072x_headset_gpios, 1 },
+	{},
+};
+
+static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *codec = rtd->codec_dai->component;
+	int ret;
+
+	if (devm_acpi_dev_add_driver_gpios(codec->dev,
+					   byt_cht_cx2072x_acpi_gpios))
+		dev_warn(rtd->dev, "Unable to add GPIO mapping table\n");
+
+	card->dapm.idle_bias_off = true;
+
+	/* set the default PLL rate, the clock is handled by the codec driver */
+	ret = snd_soc_dai_set_sysclk(rtd->codec_dai, CX2072X_MCLK_EXTERNAL_PLL,
+				     19200000, SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(rtd->dev, "Could not set sysclk\n");
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(card, "Headset",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0,
+				    &byt_cht_cx2072x_headset,
+				    byt_cht_cx2072x_headset_pins,
+				    ARRAY_SIZE(byt_cht_cx2072x_headset_pins));
+	if (ret)
+		return ret;
+
+	snd_soc_component_set_jack(codec, &byt_cht_cx2072x_headset, NULL);
+
+	snd_soc_dai_set_bclk_ratio(rtd->codec_dai, 50);
+
+	return ret;
+}
+
+static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	int ret;
+
+	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	/* set SSP2 to 24-bit */
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	/*
+	 * Default mode for SSP configuration is TDM 4 slot, override config
+	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
+	 * dai_set_tdm_slot() since there is no other API exposed
+	 */
+	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+				SND_SOC_DAIFMT_I2S     |
+				SND_SOC_DAIFMT_NB_NF   |
+				SND_SOC_DAIFMT_CBS_CFS);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 24);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int byt_cht_cx2072x_aif1_startup(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_hw_constraint_single(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE, 48000);
+}
+
+static struct snd_soc_ops byt_cht_cx2072x_aif1_ops = {
+	.startup = byt_cht_cx2072x_aif1_startup,
+};
+
+static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
+	[MERR_DPCM_AUDIO] = {
+		.name = "Audio Port",
+		.stream_name = "Audio",
+		.cpu_dai_name = "media-cpu-dai",
+		.codec_dai_name = "snd-soc-dummy-dai",
+		.codec_name = "snd-soc-dummy",
+		.platform_name = "sst-mfld-platform",
+		.nonatomic = true,
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &byt_cht_cx2072x_aif1_ops,
+	},
+	[MERR_DPCM_DEEP_BUFFER] = {
+		.name = "Deep-Buffer Audio Port",
+		.stream_name = "Deep-Buffer Audio",
+		.cpu_dai_name = "deepbuffer-cpu-dai",
+		.codec_dai_name = "snd-soc-dummy-dai",
+		.codec_name = "snd-soc-dummy",
+		.platform_name = "sst-mfld-platform",
+		.nonatomic = true,
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &byt_cht_cx2072x_aif1_ops,
+	},
+	/* back ends */
+	{
+		.name = "SSP2-Codec",
+		.id = 0,
+		.cpu_dai_name = "ssp2-port",
+		.platform_name = "sst-mfld-platform",
+		.no_pcm = 1,
+		.codec_dai_name = "cx2072x-hifi",
+		.codec_name = "i2c-14F10720:00",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+					      | SND_SOC_DAIFMT_CBS_CFS,
+		.init = byt_cht_cx2072x_init,
+		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
+		.nonatomic = true,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+	},
+};
+
+/* SoC card */
+static struct snd_soc_card byt_cht_cx2072x_card = {
+	.name = "bytcht-cx2072x",
+	.owner = THIS_MODULE,
+	.dai_link = byt_cht_cx2072x_dais,
+	.num_links = ARRAY_SIZE(byt_cht_cx2072x_dais),
+	.dapm_widgets = byt_cht_cx2072x_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(byt_cht_cx2072x_widgets),
+	.dapm_routes = byt_cht_cx2072x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(byt_cht_cx2072x_audio_map),
+	.controls = byt_cht_cx2072x_controls,
+	.num_controls = ARRAY_SIZE(byt_cht_cx2072x_controls),
+};
+
+static char codec_name[SND_ACPI_I2C_ID_LEN];
+
+static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct acpi_device *adev;
+	int dai_index = 0;
+	int i, ret;
+
+	byt_cht_cx2072x_card.dev = &pdev->dev;
+	mach = dev_get_platdata(&pdev->dev);
+
+	/* fix index of codec dai */
+	for (i = 0; i < ARRAY_SIZE(byt_cht_cx2072x_dais); i++) {
+		if (!strcmp(byt_cht_cx2072x_dais[i].codec_name,
+			    "i2c-14F10720:00")) {
+			dai_index = i;
+			break;
+		}
+	}
+
+	/* fixup codec name based on HID */
+	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
+	if (adev) {
+		snprintf(codec_name, sizeof(codec_name), "i2c-%s",
+			 acpi_dev_name(adev));
+		put_device(&adev->dev);
+		byt_cht_cx2072x_dais[dai_index].codec_name = codec_name;
+	}
+
+	/* override plaform name, if required */
+	ret = snd_soc_fixup_dai_links_platform_name(&byt_cht_cx2072x_card,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(&pdev->dev, &byt_cht_cx2072x_card);
+}
+
+static struct platform_driver snd_byt_cht_cx2072x_driver = {
+	.driver = {
+		.name = "bytcht_cx2072x",
+	},
+	.probe = snd_byt_cht_cx2072x_probe,
+};
+module_platform_driver(snd_byt_cht_cx2072x_driver);
+
+MODULE_DESCRIPTION("ASoC Intel(R) Baytrail/Cherrytrail Machine driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:bytcht_cx2072x");
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index 0cfab247876a..9cc7b17e0b10 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -217,6 +217,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 		.sof_fw_filename = "sof-byt.ri",
 		.sof_tplg_filename = "sof-byt-max98090.tplg",
 	},
+	{
+		.id = "14F10720",
+		.drv_name = "bytcht_cx2072x",
+		.fw_filename = "intel/fw_sst_0f28.bin",
+		.board = "bytcht_cx2072x",
+		.sof_fw_filename = "sof-byt.ri",
+		.sof_tplg_filename = "sof-byt-cx2072x.tplg",
+	},
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)
 	/*
 	 * This is always last in the table so that it is selected only when
diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index ff9c31a39ad4..6d0755f1353a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -175,6 +175,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_fw_filename = "sof-cht.ri",
 		.sof_tplg_filename = "sof-cht-rt5651.tplg",
 	},
+	{
+		.id = "14F10720",
+		.drv_name = "bytcht_cx2072x",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "bytcht_cx2072x",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-cx2072x.tplg",
+	},
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)
 	/*
 	 * This is always last in the table so that it is selected only when
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
