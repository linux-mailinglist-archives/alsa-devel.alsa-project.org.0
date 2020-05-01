Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3B1C18F8
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 17:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA64169E;
	Fri,  1 May 2020 17:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA64169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588345690;
	bh=f82jcnrdKEhSdP6LnqAMBPyGNyqXss8ibDMUxDAsiLc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PzmBNaTjWj+noU9aKwt+O5tUi/x7ypf6BpdPk/5CG9xLe8zUL8E843qsRPIS4oj2C
	 1r81UparrMcwm5C5Y/VwhLV5eS3MlANN11OFs5fJZzzLGQoPu7bGOmEadG5TjQGJqq
	 pd3JYBkYVE1CZAEEAtby0UKbGBQDgI7+2aXG08Jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C547F80232;
	Fri,  1 May 2020 17:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FAADF8022B; Fri,  1 May 2020 17:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62FFF800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 17:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62FFF800B6
IronPort-SDR: JiPA6gkTF6FNeiknr7ShsYmGc/CX427QyyYbtt/jrmoNFd5/zAFyxlvIwtH3+TTt0N1Pc43R5X
 1xoO+KWCmHfQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 08:06:20 -0700
IronPort-SDR: prVyQO44Iaew582P+8N5Xb3BMNoPv983ML5O2l+z+cLpnRDOMWJeM3oqW6Zz1UbrljmNCjJXAh
 FMua6Zd6XpMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="368462120"
Received: from srodrig5-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.111.158])
 by fmsmga001.fm.intel.com with ESMTP; 01 May 2020 08:06:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: boards: sof-wm8804: support for Hifiberry
 Digiplus boards
Date: Fri,  1 May 2020 10:06:11 -0500
Message-Id: <20200501150611.15395-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Add a new machine driver to interface with WM8804. The code is based
on settings found in sound/soc/bcm/hifiberry-digi.c in the Raspberry
PI tree.

Tested on Up2 with Digi+ IO (capture+playback) and Digi+ PRO (playback
with two local oscillators supported). The codec is clock master in
both cases.

Capture support has known clocking restrictions: the transmitter needs
to be active for the clock recovery, the "Tx Source" mixer set to
"S/PDIF RX". Playback will only work while capture is active.

When Capture is not desired, or when there is no RX connector, the "Tx
Source" mixer should be set to "AIF"

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      |  15 ++
 sound/soc/intel/boards/Makefile     |   2 +
 sound/soc/intel/boards/sof_wm8804.c | 298 ++++++++++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_wm8804.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3ee7c006a860..91ce347b3a45 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -324,6 +324,21 @@ config SND_SOC_INTEL_BXT_RT298_MACH
 
 endif ## SND_SOC_INTEL_APL
 
+if SND_SOC_SOF_APOLLOLAKE
+
+config SND_SOC_INTEL_SOF_WM8804_MACH
+	tristate "SOF with Wolfson/Cirrus WM8804 codec"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_WM8804_I2C
+	help
+	  This adds support for ASoC machine driver for Intel platforms
+	  with the Wolfson/Cirrus WM8804 I2S audio codec.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
+endif ## SND_SOC_SOF_APOLLOLAKE
+
 if SND_SOC_INTEL_KBL
 
 config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 98bf42463a1b..ddee0ea4032c 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -8,6 +8,7 @@ snd-soc-sst-broadwell-objs := broadwell.o
 snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o hda_dsp_common.o
 snd-soc-sst-bxt-rt298-objs := bxt_rt298.o hda_dsp_common.o
 snd-soc-sst-sof-pcm512x-objs := sof_pcm512x.o hda_dsp_common.o
+snd-soc-sst-sof-wm8804-objs := sof_wm8804.o
 snd-soc-sst-glk-rt5682_max98357a-objs := glk_rt5682_max98357a.o hda_dsp_common.o
 snd-soc-sst-bytcr-rt5640-objs := bytcr_rt5640.o
 snd-soc-sst-bytcr-rt5651-objs := bytcr_rt5651.o
@@ -44,6 +45,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_MAX98090_MACH) += snd-soc-sst-byt-max98090-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH) += snd-soc-sst-sof-pcm512x.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_WM8804_MACH) += snd-soc-sst-sof-wm8804.o
 obj-$(CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH) += snd-soc-sst-glk-rt5682_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BROADWELL_MACH) += snd-soc-sst-broadwell.o
 obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5650_MACH) += snd-soc-sst-bdw-rt5650-mach.o
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
new file mode 100644
index 000000000000..d182b685ca9b
--- /dev/null
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2020, Intel Corporation
+/*
+ * sof-wm8804.c - ASoC machine driver for Up and Up2 board
+ * based on WM8804/Hifiberry Digi+
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/wm8804.h"
+
+struct sof_card_private {
+	struct gpio_desc *gpio_44;
+	struct gpio_desc *gpio_48;
+	int sample_rate;
+};
+
+#define SOF_WM8804_UP2_QUIRK			BIT(0)
+
+static unsigned long sof_wm8804_quirk;
+
+static int sof_wm8804_quirk_cb(const struct dmi_system_id *id)
+{
+	sof_wm8804_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_wm8804_quirk_table[] = {
+	{
+		.callback = sof_wm8804_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UP-APL01"),
+		},
+		.driver_data = (void *)SOF_WM8804_UP2_QUIRK,
+	},
+	{}
+};
+
+static int sof_wm8804_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *codec = codec_dai->component;
+	const int sysclk = 27000000; /* This is fixed on this board */
+	int samplerate;
+	long mclk_freq;
+	int mclk_div;
+	int sampling_freq;
+	bool clk_44;
+	int ret;
+
+	samplerate = params_rate(params);
+	if (samplerate == ctx->sample_rate)
+		return 0;
+
+	ctx->sample_rate = 0;
+
+	if (samplerate <= 96000) {
+		mclk_freq = samplerate * 256;
+		mclk_div = WM8804_MCLKDIV_256FS;
+	} else {
+		mclk_freq = samplerate * 128;
+		mclk_div = WM8804_MCLKDIV_128FS;
+	}
+
+	switch (samplerate) {
+	case 32000:
+		sampling_freq = 0x03;
+		break;
+	case 44100:
+		sampling_freq = 0x00;
+		break;
+	case 48000:
+		sampling_freq = 0x02;
+		break;
+	case 88200:
+		sampling_freq = 0x08;
+		break;
+	case 96000:
+		sampling_freq = 0x0a;
+		break;
+	case 176400:
+		sampling_freq = 0x0c;
+		break;
+	case 192000:
+		sampling_freq = 0x0e;
+		break;
+	default:
+		dev_err(rtd->card->dev,
+			"unsupported samplerate %d\n", samplerate);
+		return -EINVAL;
+	}
+
+	if (samplerate % 16000)
+		clk_44 = true; /* use 44.1 kHz root frequency */
+	else
+		clk_44 = false;
+
+	if (!(IS_ERR_OR_NULL(ctx->gpio_44) ||
+	      IS_ERR_OR_NULL(ctx->gpio_48))) {
+		/*
+		 * ensure both GPIOs are LOW first, then drive the
+		 * relevant one to HIGH
+		 */
+		if (clk_44) {
+			gpiod_set_value_cansleep(ctx->gpio_48, !clk_44);
+			gpiod_set_value_cansleep(ctx->gpio_44, clk_44);
+		} else {
+			gpiod_set_value_cansleep(ctx->gpio_44, clk_44);
+			gpiod_set_value_cansleep(ctx->gpio_48, !clk_44);
+		}
+	}
+
+	snd_soc_dai_set_clkdiv(codec_dai, WM8804_MCLK_DIV, mclk_div);
+	snd_soc_dai_set_pll(codec_dai, 0, 0, sysclk, mclk_freq);
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8804_TX_CLKSRC_PLL,
+				     sysclk, SND_SOC_CLOCK_OUT);
+	if (ret < 0) {
+		dev_err(rtd->card->dev,
+			"Failed to set WM8804 SYSCLK: %d\n", ret);
+		return ret;
+	}
+
+	/* set sampling frequency status bits */
+	snd_soc_component_update_bits(codec, WM8804_SPDTX4, 0x0f,
+				      sampling_freq);
+
+	ctx->sample_rate = samplerate;
+
+	return 0;
+}
+
+/* machine stream operations */
+static struct snd_soc_ops sof_wm8804_ops = {
+	.hw_params = sof_wm8804_hw_params,
+};
+
+SND_SOC_DAILINK_DEF(ssp5_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP5 Pin")));
+
+SND_SOC_DAILINK_DEF(ssp5_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-1AEC8804:00", "wm8804-spdif")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:0e.0")));
+
+static struct snd_soc_dai_link dailink[] = {
+	/* back ends */
+	{
+		.name = "SSP5-Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.nonatomic = true,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &sof_wm8804_ops,
+		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
+	},
+};
+
+/* SoC card */
+static struct snd_soc_card sof_wm8804_card = {
+	.name = "wm8804", /* sof- prefix added automatically */
+	.owner = THIS_MODULE,
+	.dai_link = dailink,
+	.num_links = ARRAY_SIZE(dailink),
+};
+
+ /* i2c-<HID>:00 with HID being 8 chars */
+static char codec_name[SND_ACPI_I2C_ID_LEN];
+
+/*
+ * to control the HifiBerry Digi+ PRO, it's required to toggle GPIO to
+ * select the clock source. On the Up2 board, this means
+ * Pin29/BCM5/Linux GPIO 430 and Pin 31/BCM6/ Linux GPIO 404.
+ *
+ * Using the ACPI device name is not very nice, but since we only use
+ * the value for the Up2 board there is no risk of conflict with other
+ * platforms.
+ */
+
+static struct gpiod_lookup_table up2_gpios_table = {
+	/* .dev_id is set during probe */
+	.table = {
+		GPIO_LOOKUP("INT3452:01", 73, "BCM-GPIO5", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT3452:01", 74, "BCM-GPIO6", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static int sof_wm8804_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct snd_soc_acpi_mach *mach;
+	struct sof_card_private *ctx;
+	struct acpi_device *adev;
+	int dai_index = 0;
+	int ret;
+	int i;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	mach = pdev->dev.platform_data;
+	card = &sof_wm8804_card;
+	card->dev = &pdev->dev;
+
+	dmi_check_system(sof_wm8804_quirk_table);
+
+	if (sof_wm8804_quirk & SOF_WM8804_UP2_QUIRK) {
+		up2_gpios_table.dev_id = dev_name(&pdev->dev);
+		gpiod_add_lookup_table(&up2_gpios_table);
+
+		/*
+		 * The gpios are required for specific boards with
+		 * local oscillators, and optional in other cases.
+		 * Since we can't identify when they are needed, use
+		 * the GPIO as non-optional
+		 */
+
+		ctx->gpio_44 = devm_gpiod_get(&pdev->dev, "BCM-GPIO5",
+					      GPIOD_OUT_LOW);
+		if (IS_ERR(ctx->gpio_44)) {
+			ret = PTR_ERR(ctx->gpio_44);
+			dev_err(&pdev->dev,
+				"could not get BCM-GPIO5: %d\n",
+				ret);
+			return ret;
+		}
+
+		ctx->gpio_48 = devm_gpiod_get(&pdev->dev, "BCM-GPIO6",
+					      GPIOD_OUT_LOW);
+		if (IS_ERR(ctx->gpio_48)) {
+			ret = PTR_ERR(ctx->gpio_48);
+			dev_err(&pdev->dev,
+				"could not get BCM-GPIO6: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/* fix index of codec dai */
+	for (i = 0; i < ARRAY_SIZE(dailink); i++) {
+		if (!strcmp(dailink[i].codecs->name, "i2c-1AEC8804:00")) {
+			dai_index = i;
+			break;
+		}
+	}
+
+	/* fixup codec name based on HID */
+	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
+	if (adev) {
+		snprintf(codec_name, sizeof(codec_name),
+			 "%s%s", "i2c-", acpi_dev_name(adev));
+		put_device(&adev->dev);
+		dailink[dai_index].codecs->name = codec_name;
+	}
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev, card);
+}
+
+static int sof_wm8804_remove(struct platform_device *pdev)
+{
+	if (sof_wm8804_quirk & SOF_WM8804_UP2_QUIRK)
+		gpiod_remove_lookup_table(&up2_gpios_table);
+	return 0;
+}
+
+static struct platform_driver sof_wm8804_driver = {
+	.driver = {
+		.name = "sof-wm8804",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = sof_wm8804_probe,
+	.remove = sof_wm8804_remove,
+};
+module_platform_driver(sof_wm8804_driver);
+
+MODULE_DESCRIPTION("ASoC Intel(R) SOF + WM8804 Machine driver");
+MODULE_AUTHOR("Pierre-Louis Bossart");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:sof-wm8804");

base-commit: e8e7ef43c73328276e1d446b02ae16006742ebb1
-- 
2.20.1

