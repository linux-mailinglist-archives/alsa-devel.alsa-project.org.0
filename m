Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075C2F957D
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 22:26:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4D41790;
	Sun, 17 Jan 2021 22:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4D41790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610918795;
	bh=U+ZA9VDNq0gqQ5JpykN4mUjaAIBG2ZwBGJLvz9xhJG4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WXlWvi/xlhCaOXI1jlgVoANcGsDzP8fPxfvQdu+B2u3ambrjCpl90Atdou4vZ0/tq
	 wxdA6xDQkSaBHLqiRr4n++Nd+Wlmjuhh3PWAu+cAWb4m735rV74rY8BeqVoDzkUuwZ
	 mbSw+oqVQA7HSHjKvunEHOuGJuk43AsIYijpfRv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0874EF804ED;
	Sun, 17 Jan 2021 22:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7DDEF804EC; Sun, 17 Jan 2021 22:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C415F804E1
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 22:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C415F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gXXUdH0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610918595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3m4u445OGqTlXPC1WZeviOXD9OISfqVJoXd4Gx2kjJc=;
 b=gXXUdH0W+Lkx9lB9KEyRjjKT2ehbhGeuAEJ1Uk3MSOntJFoQI37DGL/db70AWFFkn36Wx8
 vtsiChxaq4gE4h3JPqEOSP3zpPhltJjZ2PWMsKMJV/UTwKJZ4MUYuUVW525Mpx14CpeMf6
 bDDTjQ/cYKmODOFpsqoWu+a4oX5TKz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-s_89OAsdPDWiFkpaMkbjVw-1; Sun, 17 Jan 2021 16:23:11 -0500
X-MC-Unique: s_89OAsdPDWiFkpaMkbjVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C3010054FF;
 Sun, 17 Jan 2021 21:23:09 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AD4110023AE;
 Sun, 17 Jan 2021 21:23:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 5/5] ASoC: Intel: bytcr_wm5102: Add machine driver for
 BYT/WM5102
Date: Sun, 17 Jan 2021 22:22:52 +0100
Message-Id: <20210117212252.206115-6-hdegoede@redhat.com>
In-Reply-To: <20210117212252.206115-1-hdegoede@redhat.com>
References: <20210117212252.206115-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add a new ASoc Machine driver for Intel Baytrail platforms with a
Wolfson Microelectronics WM5102 codec.

This is based on a past contributions [1] from Paulo Sergio Travaglia
<pstglia@gmail.com> based on the Levono kernel [2] combined with
insights in things like the speaker GPIO from the android-x86 android
port for the Lenovo Yoga Tablet 2 1051F/L [3].

[1] https://patchwork.kernel.org/project/alsa-devel/patch/593313f5.3636c80a.50e05.47e9@mx.google.com/
[2] https://github.com/lenovo-yt2-dev/android_kernel_lenovo_baytrail/blob/cm-12.1/sound/soc/intel/board/byt_bl_wm5102.c
[3] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel

The original machine driver from the Android ports was a crude modified
copy of bytcr_rt5640.c adjusted to work with the WM5102 codec.
This version has been extensively reworked to:

1. Remove all rt5640 related quirk handling. to the best of my knowledge
this setup is only used on the Lenovo Yoga Tablet 2 series (8, 10 and 13
inch models) which all use the same setup. So there is no need to deal
with all the variations with which we need to deal on rt5640 boards.

2. Rework clock handling, properly turn off the FLL and the platform-clock
when they are no longer necessary and don't reconfigure the FLL
unnecessarily when it is already running. This fixes a number of:
"Timed out waiting for lock" warnings being logged.

3. Add the GPIO controlled Speaker-VDD regulator as a DAPM_SUPPLY

This only adds the machine driver and ACPI hooks, the BYT-CR detection
quirk which these devices need will be added in a separate patch.

BugLink: https://github.com/thesofproject/linux/issues/2485
Co-authored-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop unnecessary configuring of OPCLK
- Fix error-msg when setting the SYSCLK fails
---
 sound/soc/intel/boards/Kconfig                |  12 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/bytcr_wm5102.c         | 465 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-byt-match.c   |  16 +
 4 files changed, 495 insertions(+)
 create mode 100644 sound/soc/intel/boards/bytcr_wm5102.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b58b9b60d37e..d1d28129a32b 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -111,6 +111,18 @@ config SND_SOC_INTEL_BYTCR_RT5651_MACH
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_BYTCR_WM5102_MACH
+	tristate "Baytrail and Baytrail-CR with WM5102 codec"
+	depends on MFD_ARIZONA && MFD_WM5102 && SPI_MASTER && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_ACPI
+	select SND_SOC_WM5102
+	help
+	  This adds support for ASoC machine driver for Intel(R) Baytrail and Baytrail-CR
+	  platforms with WM5102 audio codec.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 	tristate "Cherrytrail & Braswell with RT5672 codec"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 5f03e484b215..616c5fbab7d5 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -10,6 +10,7 @@ snd-soc-sst-sof-wm8804-objs := sof_wm8804.o
 snd-soc-sst-glk-rt5682_max98357a-objs := glk_rt5682_max98357a.o hda_dsp_common.o
 snd-soc-sst-bytcr-rt5640-objs := bytcr_rt5640.o
 snd-soc-sst-bytcr-rt5651-objs := bytcr_rt5651.o
+snd-soc-sst-bytcr-wm5102-objs := bytcr_wm5102.o
 snd-soc-sst-cht-bsw-rt5672-objs := cht_bsw_rt5672.o
 snd-soc-sst-cht-bsw-rt5645-objs := cht_bsw_rt5645.o
 snd-soc-sst-cht-bsw-max98090_ti-objs := cht_bsw_max98090_ti.o
@@ -51,6 +52,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5650_MACH) += snd-soc-sst-bdw-rt5650-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5677_MACH) += snd-soc-sst-bdw-rt5677-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH) += snd-soc-sst-bytcr-rt5640.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH) += snd-soc-sst-bytcr-rt5651.o
+obj-$(CONFIG_SND_SOC_INTEL_BYTCR_WM5102_MACH) += snd-soc-sst-bytcr-wm5102.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH) += snd-soc-sst-cht-bsw-rt5672.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH) += snd-soc-sst-cht-bsw-rt5645.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH) += snd-soc-sst-cht-bsw-max98090_ti.o
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
new file mode 100644
index 000000000000..f38850eb2eaf
--- /dev/null
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  bytcr_wm5102.c - ASoc Machine driver for Intel Baytrail platforms with a
+ *                   Wolfson Microelectronics WM5102 codec
+ *
+ *  Copyright (C) 2020 Hans de Goede <hdegoede@redhat.com>
+ *  Loosely based on bytcr_rt5640.c which is:
+ *  Copyright (C) 2014-2020 Intel Corp
+ *  Author: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/wm5102.h"
+#include "../atom/sst-atom-controls.h"
+
+#define MCLK_FREQ		25000000
+
+#define WM5102_MAX_SYSCLK_4K	49152000 /* max sysclk for 4K family */
+#define WM5102_MAX_SYSCLK_11025	45158400 /* max sysclk for 11.025K family */
+
+struct byt_wm5102_private {
+	struct clk *mclk;
+	struct gpio_desc *spkvdd_en_gpio;
+};
+
+static int byt_wm5102_spkvdd_power_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(priv->spkvdd_en_gpio,
+				 !!SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static int byt_wm5102_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai, int rate)
+{
+	struct snd_soc_component *codec_component = codec_dai->component;
+	int sr_mult = ((rate % 4000) == 0) ?
+		(WM5102_MAX_SYSCLK_4K / rate) :
+		(WM5102_MAX_SYSCLK_11025 / rate);
+	int ret;
+
+	/* Reset FLL1 */
+	snd_soc_dai_set_pll(codec_dai, WM5102_FLL1_REFCLK, ARIZONA_FLL_SRC_NONE, 0, 0);
+	snd_soc_dai_set_pll(codec_dai, WM5102_FLL1, ARIZONA_FLL_SRC_NONE, 0, 0);
+
+	/* Configure the FLL1 PLL before selecting it */
+	ret = snd_soc_dai_set_pll(codec_dai, WM5102_FLL1, ARIZONA_CLK_SRC_MCLK1,
+				  MCLK_FREQ, rate * sr_mult);
+	if (ret) {
+		dev_err(codec_component->dev, "Error setting PLL: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_sysclk(codec_component, ARIZONA_CLK_SYSCLK,
+					   ARIZONA_CLK_SRC_FLL1, rate * sr_mult,
+					   SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(codec_component->dev, "Error setting SYSCLK: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_SYSCLK,
+				     rate * 512, SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(codec_component->dev, "Error setting clock: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int platform_clock_control(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *codec_dai;
+	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, "wm5102-aif1");
+	if (!codec_dai) {
+		dev_err(card->dev, "Error codec DAI not found\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		ret = clk_prepare_enable(priv->mclk);
+		if (ret) {
+			dev_err(card->dev, "Error enabling MCLK: %d\n", ret);
+			return ret;
+		}
+		ret = byt_wm5102_prepare_and_enable_pll1(codec_dai, 48000);
+		if (ret) {
+			dev_err(card->dev, "Error setting codec sysclk: %d\n", ret);
+			return ret;
+		}
+	} else {
+		/*
+		 * The WM5102 has a separate 32KHz clock for jack-detect
+		 * so we can disable the PLL, followed by disabling the
+		 * platform clock which is the source-clock for the PLL.
+		 */
+		snd_soc_dai_set_pll(codec_dai, WM5102_FLL1, ARIZONA_FLL_SRC_NONE, 0, 0);
+		clk_disable_unprepare(priv->mclk);
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget byt_wm5102_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Internal Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    platform_clock_control, SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("Speaker VDD", SND_SOC_NOPM, 0, 0,
+			    byt_wm5102_spkvdd_power_event,
+			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
+};
+
+static const struct snd_soc_dapm_route byt_wm5102_audio_map[] = {
+	{"Headphone", NULL, "Platform Clock"},
+	{"Headset Mic", NULL, "Platform Clock"},
+	{"Internal Mic", NULL, "Platform Clock"},
+	{"Speaker", NULL, "Platform Clock"},
+
+	{"Speaker", NULL, "SPKOUTLP"},
+	{"Speaker", NULL, "SPKOUTLN"},
+	{"Speaker", NULL, "SPKOUTRP"},
+	{"Speaker", NULL, "SPKOUTRN"},
+	{"Speaker", NULL, "Speaker VDD"},
+
+	{"Headphone", NULL, "HPOUT1L"},
+	{"Headphone", NULL, "HPOUT1R"},
+
+	{"Internal Mic", NULL, "MICBIAS3"},
+	{"IN3L", NULL, "Internal Mic"},
+
+	/*
+	 * The Headset Mix uses MICBIAS1 or 2 depending on if a CTIA/OMTP Headset
+	 * is connected, as the MICBIAS is applied after the CTIA/OMTP cross-switch.
+	 */
+	{"Headset Mic", NULL, "MICBIAS1"},
+	{"Headset Mic", NULL, "MICBIAS2"},
+	{"IN1L", NULL, "Headset Mic"},
+
+	{"AIF1 Playback", NULL, "ssp0 Tx"},
+	{"ssp0 Tx", NULL, "modem_out"},
+
+	{"modem_in", NULL, "ssp0 Rx"},
+	{"ssp0 Rx", NULL, "AIF1 Capture"},
+};
+
+static const struct snd_kcontrol_new byt_wm5102_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	card->dapm.idle_bias_off = true;
+
+	ret = snd_soc_add_card_controls(card, byt_wm5102_controls,
+					ARRAY_SIZE(byt_wm5102_controls));
+	if (ret) {
+		dev_err(card->dev, "Error adding card controls: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The firmware might enable the clock at boot (this information
+	 * may or may not be reflected in the enable clock register).
+	 * To change the rate we must disable the clock first to cover these
+	 * cases. Due to common clock framework restrictions that do not allow
+	 * to disable a clock that has not been enabled, we need to enable
+	 * the clock first.
+	 */
+	ret = clk_prepare_enable(priv->mclk);
+	if (!ret)
+		clk_disable_unprepare(priv->mclk);
+
+	ret = clk_set_rate(priv->mclk, MCLK_FREQ);
+	if (ret) {
+		dev_err(card->dev, "Error setting MCLK rate: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_pcm_stream byt_wm5102_dai_params = {
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.channels_min = 2,
+	.channels_max = 2,
+};
+
+static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+						      SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+							  SNDRV_PCM_HW_PARAM_CHANNELS);
+	int ret;
+
+	/* The DSP will covert the FE rate to 48k, stereo */
+	rate->min = 48000;
+	rate->max = 48000;
+	channels->min = 2;
+	channels->max = 2;
+
+	/* set SSP0 to 16-bit */
+	params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
+
+	/*
+	 * Default mode for SSP configuration is TDM 4 slot, override config
+	 * with explicit setting to I2S 2ch 16-bit. The word length is set with
+	 * dai_set_tdm_slot() since there is no other API exposed
+	 */
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+				  SND_SOC_DAIFMT_I2S     |
+				  SND_SOC_DAIFMT_NB_NF   |
+				  SND_SOC_DAIFMT_CBS_CFS);
+	if (ret) {
+		dev_err(rtd->dev, "Error setting format to I2S: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
+	if (ret) {
+		dev_err(rtd->dev, "Error setting I2S config: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int byt_wm5102_aif1_startup(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_hw_constraint_single(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE, 48000);
+}
+
+static const struct snd_soc_ops byt_wm5102_aif1_ops = {
+	.startup = byt_wm5102_aif1_startup,
+};
+
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(media,
+	DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(deepbuffer,
+	DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(ssp0_port,
+	DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
+
+SND_SOC_DAILINK_DEF(ssp0_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC(
+	/*
+	 * Note there is no need to overwrite the codec-name as is done in
+	 * other bytcr machine drivers, because the codec is a MFD child-dev.
+	 */
+	"wm5102-codec",
+	"wm5102-aif1")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));
+
+static struct snd_soc_dai_link byt_wm5102_dais[] = {
+	[MERR_DPCM_AUDIO] = {
+		.name = "Baytrail Audio Port",
+		.stream_name = "Baytrail Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &byt_wm5102_aif1_ops,
+		SND_SOC_DAILINK_REG(media, dummy, platform),
+
+	},
+	[MERR_DPCM_DEEP_BUFFER] = {
+		.name = "Deep-Buffer Audio Port",
+		.stream_name = "Deep-Buffer Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &byt_wm5102_aif1_ops,
+		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
+	},
+		/* back ends */
+	{
+		/*
+		 * This must be named SSP2-Codec even though this machine driver
+		 * always uses SSP0. Most machine drivers support both and dynamically
+		 * update the dailink to point to SSP0 or SSP2, while keeping the name
+		 * as "SSP2-Codec". The SOF tplg files hardcode the "SSP2-Codec" even
+		 * in the byt-foo-ssp0.tplg versions because the other machine-drivers
+		 * use "SSP2-Codec" even when SSP0 is used.
+		 */
+		.name = "SSP2-Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+						| SND_SOC_DAIFMT_CBS_CFS,
+		.be_hw_params_fixup = byt_wm5102_codec_fixup,
+		.nonatomic = true,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.init = byt_wm5102_init,
+		SND_SOC_DAILINK_REG(ssp0_port, ssp0_codec, platform),
+	},
+};
+
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define SOF_CARD_NAME "bytcht wm5102" /* card name will be 'sof-bytcht wm5102' */
+#define SOF_DRIVER_NAME "SOF"
+
+#define CARD_NAME "bytcr-wm5102"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+
+/* SoC card */
+static struct snd_soc_card byt_wm5102_card = {
+	.owner = THIS_MODULE,
+	.dai_link = byt_wm5102_dais,
+	.num_links = ARRAY_SIZE(byt_wm5102_dais),
+	.dapm_widgets = byt_wm5102_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(byt_wm5102_widgets),
+	.dapm_routes = byt_wm5102_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(byt_wm5102_audio_map),
+	.fully_routed = true,
+};
+
+static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
+{
+	char codec_name[SND_ACPI_I2C_ID_LEN];
+	struct device *dev = &pdev->dev;
+	struct byt_wm5102_private *priv;
+	struct snd_soc_acpi_mach *mach;
+	const char *platform_name;
+	struct acpi_device *adev;
+	struct device *codec_dev;
+	bool sof_parent;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_ATOMIC);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Get MCLK */
+	priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
+	if (IS_ERR(priv->mclk))
+		return dev_err_probe(dev, PTR_ERR(priv->mclk), "getting pmc_plt_clk_3\n");
+
+	/*
+	 * Get speaker VDD enable GPIO:
+	 * 1. Get codec-device-name
+	 * 2. Get codec-device
+	 * 3. Get GPIO from codec-device
+	 */
+	mach = dev->platform_data;
+	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
+	if (!adev) {
+		dev_err(dev, "Error cannot find acpi-dev for codec\n");
+		return -ENOENT;
+	}
+	snprintf(codec_name, sizeof(codec_name), "spi-%s", acpi_dev_name(adev));
+	put_device(&adev->dev);
+
+	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL, codec_name);
+	if (!codec_dev)
+		return -EPROBE_DEFER;
+
+	/* Note no devm_ here since we call gpiod_get on codec_dev rather then dev */
+	priv->spkvdd_en_gpio = gpiod_get(codec_dev, "wlf,spkvdd-ena", GPIOD_OUT_LOW);
+	put_device(codec_dev);
+
+	if (IS_ERR(priv->spkvdd_en_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->spkvdd_en_gpio), "getting spkvdd-GPIO\n");
+
+	/* override platform name, if required */
+	byt_wm5102_card.dev = dev;
+	platform_name = mach->mach_params.platform;
+	ret = snd_soc_fixup_dai_links_platform_name(&byt_wm5102_card, platform_name);
+	if (ret)
+		goto out_put_gpio;
+
+	/* set card and driver name and pm-ops */
+	sof_parent = snd_soc_acpi_sof_parent(dev);
+	if (sof_parent) {
+		byt_wm5102_card.name = SOF_CARD_NAME;
+		byt_wm5102_card.driver_name = SOF_DRIVER_NAME;
+		dev->driver->pm = &snd_soc_pm_ops;
+	} else {
+		byt_wm5102_card.name = CARD_NAME;
+		byt_wm5102_card.driver_name = DRIVER_NAME;
+	}
+
+	snd_soc_card_set_drvdata(&byt_wm5102_card, priv);
+	ret = devm_snd_soc_register_card(dev, &byt_wm5102_card);
+	if (ret) {
+		dev_err_probe(dev, ret, "registering card\n");
+		goto out_put_gpio;
+	}
+
+	platform_set_drvdata(pdev, &byt_wm5102_card);
+	return 0;
+
+out_put_gpio:
+	gpiod_put(priv->spkvdd_en_gpio);
+	return ret;
+}
+
+static int snd_byt_wm5102_mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
+
+	gpiod_put(priv->spkvdd_en_gpio);
+	return 0;
+}
+
+static struct platform_driver snd_byt_wm5102_mc_driver = {
+	.driver = {
+		.name = "bytcr_wm5102",
+	},
+	.probe = snd_byt_wm5102_mc_probe,
+	.remove = snd_byt_wm5102_mc_remove,
+};
+
+module_platform_driver(snd_byt_wm5102_mc_driver);
+
+MODULE_DESCRIPTION("ASoC Baytrail with WM5102 codec machine driver");
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:bytcr_wm5102");
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index c348607b49a5..ec7932549655 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -154,6 +154,22 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 		.sof_fw_filename = "sof-byt.ri",
 		.sof_tplg_filename = "sof-byt-rt5651.tplg",
 	},
+	{
+		.id = "WM510204",
+		.drv_name = "bytcr_wm5102",
+		.fw_filename = "intel/fw_sst_0f28.bin",
+		.board = "bytcr_wm5102",
+		.sof_fw_filename = "sof-byt.ri",
+		.sof_tplg_filename = "sof-byt-wm5102.tplg",
+	},
+	{
+		.id = "WM510205",
+		.drv_name = "bytcr_wm5102",
+		.fw_filename = "intel/fw_sst_0f28.bin",
+		.board = "bytcr_wm5102",
+		.sof_fw_filename = "sof-byt.ri",
+		.sof_tplg_filename = "sof-byt-wm5102.tplg",
+	},
 	{
 		.id = "DLGS7212",
 		.drv_name = "bytcht_da7213",
-- 
2.28.0

