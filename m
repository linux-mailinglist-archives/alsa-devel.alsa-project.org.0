Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5E114A8C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 02:38:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2DE81662;
	Fri,  6 Dec 2019 02:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2DE81662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575596297;
	bh=O9SzYT+bdxO5Uk6FTq0f0IO8nDNBDhywTKUXHWTbM9w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BUJfUJyMMu2/MX4I1OGmtRDY97V4IwI34WDjjM0Ar9+FWwYzCLV0ZuK8oEGcbt28Q
	 HK0pjTafTPcGQ1mFZ5GmB8ToJR3MpAJfAldqe41jcS0BZgPsB/F3Lr6OBcfqsdjJKz
	 xTytdpBQf6os8cPtMyXYY/RRfoYnoivgjKUL9lBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B66F800F6;
	Fri,  6 Dec 2019 02:36:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48730F801F8; Fri,  6 Dec 2019 02:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA65F800F6
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 02:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA65F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FQvi8HjP"
Received: by mail-pf1-x444.google.com with SMTP id x185so2477599pfc.5
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 17:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3v0XhHRMzG9DXzSWBr0O4QMZ0bSMcyF+8m0ZslugrvE=;
 b=FQvi8HjP9bW+GEe7AJX6HCl7kO+CXU3tMpB2bFq/OLPDeaHEgWTWgBI4YcFfA5DkJj
 5BgbPdudcOJV7ib/3sDvoBnm6mjDL0jxsUu6n6gtOFBbZfsxokfBVrNa2MLdxKE0l6da
 +FKX4veYEWtTZiUwDfp+Y5wIj+t1SyrovSjgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3v0XhHRMzG9DXzSWBr0O4QMZ0bSMcyF+8m0ZslugrvE=;
 b=L1Xa+5pDwGoQzKue0tj39BF5VXMrgVEALRCN3kXUC72zYlYEhdg7LYlAWJneOqDDgP
 /o/mooRhofezM9mA8Ij1C44ChShE+aNewSzk+VHypoRBz7v4KrOwlmGowJIuoVm5nfEE
 Nj+b3mtdmWQ2u9n/VdlK/49raXxcCIKO1D3D/9jdv1s6HwYfxSFu1YaIR80AUA96UZEO
 y+v6PsKVFY6Kry9jJfRKnxlzhMdrcFxZNgCZjeawt0NuM1QXjRZQ4EvRLWynpr9mnhQD
 9DfmQGMXax/u+9uwbSzNxghpkac0tm40I7TgECtGsX5GcgeJCdt3Vm1ZMNcITS30JAVx
 m+8g==
X-Gm-Message-State: APjAAAVjEi2llwDfmLdqg9LhkTppLMKpj0ke7R16MulFIzij7zKoXumh
 3fl2MxejcDc4IIWoP6lq0GkuOTJVIg==
X-Google-Smtp-Source: APXvYqyuigaLMeTGxWXgSotek+B84kQ64LQLg+HLzCBU1t7TAzWWA6xR8UIvCGCfolaP3U5BMdTAZw==
X-Received: by 2002:a63:cd06:: with SMTP id i6mr775771pgg.48.1575596181258;
 Thu, 05 Dec 2019 17:36:21 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id u1sm13347759pfn.133.2019.12.05.17.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 17:36:20 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Dec 2019 17:34:06 -0800
Message-Id: <20191206013413.237576-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Bard Liao <bardliao@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>, Jenny TC <jenny.tc@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Hui Wang <hui.wang@canonical.com>,
 Jon Flatley <jflat@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Naveen Manohar <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ben Zhang <benzh@chromium.org>,
 Takashi Iwai <tiwai@suse.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3] ASoC: intel: Add Broadwell rt5650 machine
	driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

Add machine driver for Broadwell + rt5650.

Signed-off-by: Bard Liao <bardliao@realtek.com>
Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Jon Flatley <jflat@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
v2 (Curtis):
* Addressed Pierre's comments
  * Added SOF dependencies
  * Added platform override
  * Fixed Kconfig
* Moved to devm register

v3:
* Removed THIS_MODULE
* Added PM Ops

 sound/soc/intel/boards/Kconfig                |  12 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/bdw-rt5650.c           | 319 ++++++++++++++++++
 .../common/soc-acpi-intel-hsw-bdw-match.c     |   7 +
 4 files changed, 340 insertions(+)
 create mode 100644 sound/soc/intel/boards/bdw-rt5650.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 6c9fd9ad566ed..de613ae5052bf 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -31,6 +31,18 @@ endif ## SND_SOC_INTEL_HASWELL
 
 if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
 
+config SND_SOC_INTEL_BDW_RT5650_MACH
+	tristate "Broadwell with RT5650 codec"
+	depends on I2C
+	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
+	depends on X86_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT5645
+	help
+	  This adds the ASoC machine driver for Intel Broadwell platforms with
+	  the RT5650 codec.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_BDW_RT5677_MACH
 	tristate "Broadwell with RT5677 codec"
 	depends on I2C
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index ba1aa89db09d5..4efb3689503f8 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -2,6 +2,7 @@
 snd-soc-sst-haswell-objs := haswell.o
 snd-soc-sst-byt-rt5640-mach-objs := byt-rt5640.o
 snd-soc-sst-byt-max98090-mach-objs := byt-max98090.o
+snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
 snd-soc-sst-broadwell-objs := broadwell.o
 snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o hda_dsp_common.o
@@ -37,6 +38,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da721
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH) += snd-soc-sst-glk-rt5682_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BROADWELL_MACH) += snd-soc-sst-broadwell.o
+obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5650_MACH) += snd-soc-sst-bdw-rt5650-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5677_MACH) += snd-soc-sst-bdw-rt5677-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH) += snd-soc-sst-bytcr-rt5640.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH) += snd-soc-sst-bytcr-rt5651.o
diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
new file mode 100644
index 0000000000000..274b21680d624
--- /dev/null
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ASoC machine driver for Intel Broadwell platforms with RT5650 codec
+ *
+ * Copyright 2019, The Chromium OS Authors.  All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+
+#include "../common/sst-dsp.h"
+#include "../haswell/sst-haswell-ipc.h"
+
+#include "../../codecs/rt5645.h"
+
+struct bdw_rt5650_priv {
+	struct gpio_desc *gpio_hp_en;
+	struct snd_soc_component *component;
+};
+
+static const struct snd_soc_dapm_widget bdw_rt5650_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("DMIC Pair1", NULL),
+	SND_SOC_DAPM_MIC("DMIC Pair2", NULL),
+};
+
+static const struct snd_soc_dapm_route bdw_rt5650_map[] = {
+	/* Speakers */
+	{"Speaker", NULL, "SPOL"},
+	{"Speaker", NULL, "SPOR"},
+
+	/* Headset jack connectors */
+	{"Headphone", NULL, "HPOL"},
+	{"Headphone", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"IN1N", NULL, "Headset Mic"},
+
+	/* Digital MICs
+	 * DMIC Pair1 are the two DMICs connected on the DMICN1 connector.
+	 * DMIC Pair2 are the two DMICs connected on the DMICN2 connector.
+	 * Facing the camera, DMIC Pair1 are on the left side, DMIC Pair2
+	 * are on the right side.
+	 */
+	{"DMIC L1", NULL, "DMIC Pair1"},
+	{"DMIC R1", NULL, "DMIC Pair1"},
+	{"DMIC L2", NULL, "DMIC Pair2"},
+	{"DMIC R2", NULL, "DMIC Pair2"},
+
+	/* CODEC BE connections */
+	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
+	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
+};
+
+static const struct snd_kcontrol_new bdw_rt5650_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("DMIC Pair1"),
+	SOC_DAPM_PIN_SWITCH("DMIC Pair2"),
+};
+
+
+static struct snd_soc_jack headphone_jack;
+static struct snd_soc_jack mic_jack;
+
+static struct snd_soc_jack_pin headphone_jack_pin = {
+	.pin	= "Headphone",
+	.mask	= SND_JACK_HEADPHONE,
+};
+
+static struct snd_soc_jack_pin mic_jack_pin = {
+	.pin	= "Headset Mic",
+	.mask	= SND_JACK_MICROPHONE,
+};
+
+static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
+			struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+						SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	/* The ADSP will covert the FE rate to 48k, max 4-channels */
+	rate->min = rate->max = 48000;
+	channels->min = 2;
+	channels->max = 4;
+
+	/* set SSP0 to 24 bit */
+	snd_mask_set(&params->masks[SNDRV_PCM_HW_PARAM_FORMAT -
+				    SNDRV_PCM_HW_PARAM_FIRST_MASK],
+				    SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
+static int bdw_rt5650_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int ret;
+
+	/* Workaround: set codec PLL to 19.2MHz that PLL source is
+	 * from MCLK(24MHz) to conform 2.4MHz DMIC clock.
+	 */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5645_PLL1_S_MCLK,
+		24000000, 19200000);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
+		return ret;
+	}
+
+	/* The actual MCLK freq is 24MHz. The codec is told that MCLK is
+	 * 24.576MHz to satisfy the requirement of rl6231_get_clk_info.
+	 * ASRC is enabled on AD and DA filters to ensure good audio quality.
+	 */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1, 24576000,
+		SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct snd_soc_ops bdw_rt5650_ops = {
+	.hw_params = bdw_rt5650_hw_params,
+};
+
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+static int bdw_rt5650_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	struct sst_pdata *pdata = dev_get_platdata(component->dev);
+	struct sst_hsw *broadwell = pdata->dsp;
+	int ret;
+
+	/* Set ADSP SSP port settings
+	 * clock_divider = 4 means BCLK = MCLK/5 = 24MHz/5 = 4.8MHz
+	 */
+	ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
+		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
+		SST_HSW_DEVICE_TDM_CLOCK_MASTER, 4);
+	if (ret < 0) {
+		dev_err(rtd->dev, "error: failed to set device config\n");
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static int bdw_rt5650_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct bdw_rt5650_priv *bdw_rt5650 =
+		snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int ret;
+
+	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
+	 * The ASRC clock source is clk_i2s1_asrc.
+	 */
+	rt5645_sel_asrc_clk_src(component,
+				RT5645_DA_STEREO_FILTER |
+				RT5645_DA_MONO_L_FILTER |
+				RT5645_DA_MONO_R_FILTER |
+				RT5645_AD_STEREO_FILTER |
+				RT5645_AD_MONO_L_FILTER |
+				RT5645_AD_MONO_R_FILTER,
+				RT5645_CLK_SEL_I2S1_ASRC);
+
+	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0xF, 4, 24);
+
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
+		return ret;
+	}
+
+	/* Create and initialize headphone jack */
+	if (snd_soc_card_jack_new(rtd->card, "Headphone Jack",
+			SND_JACK_HEADPHONE, &headphone_jack,
+			&headphone_jack_pin, 1)) {
+		dev_err(component->dev, "Can't create headphone jack\n");
+	}
+
+	/* Create and initialize mic jack */
+	if (snd_soc_card_jack_new(rtd->card, "Mic Jack", SND_JACK_MICROPHONE,
+			&mic_jack, &mic_jack_pin, 1)) {
+		dev_err(component->dev, "Can't create mic jack\n");
+	}
+
+	rt5645_set_jack_detect(component, &headphone_jack, &mic_jack, NULL);
+
+	bdw_rt5650->component = component;
+
+	return 0;
+}
+
+/* broadwell digital audio interface glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(fe,
+	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
+
+SND_SOC_DAILINK_DEF(be,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
+
+static struct snd_soc_dai_link bdw_rt5650_dais[] = {
+	/* Front End DAI links */
+	{
+		.name = "System PCM",
+		.stream_name = "System Playback",
+		.dynamic = 1,
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+		.init = bdw_rt5650_rtd_init,
+#endif
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(fe, dummy, platform),
+	},
+
+	/* Back End DAI links */
+	{
+		/* SSP0 - Codec */
+		.name = "Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.ignore_suspend = 1,
+		.ignore_pmdown_time = 1,
+		.be_hw_params_fixup = broadwell_ssp0_fixup,
+		.ops = &bdw_rt5650_ops,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.init = bdw_rt5650_init,
+		SND_SOC_DAILINK_REG(dummy, be, dummy),
+	},
+};
+
+/* ASoC machine driver for Broadwell DSP + RT5650 */
+static struct snd_soc_card bdw_rt5650_card = {
+	.name = "bdw-rt5650",
+	.owner = THIS_MODULE,
+	.dai_link = bdw_rt5650_dais,
+	.num_links = ARRAY_SIZE(bdw_rt5650_dais),
+	.dapm_widgets = bdw_rt5650_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(bdw_rt5650_widgets),
+	.dapm_routes = bdw_rt5650_map,
+	.num_dapm_routes = ARRAY_SIZE(bdw_rt5650_map),
+	.controls = bdw_rt5650_controls,
+	.num_controls = ARRAY_SIZE(bdw_rt5650_controls),
+	.fully_routed = true,
+};
+
+static int bdw_rt5650_probe(struct platform_device *pdev)
+{
+	struct bdw_rt5650_priv *bdw_rt5650;
+	struct snd_soc_acpi_mach *mach;
+	int ret;
+
+	bdw_rt5650_card.dev = &pdev->dev;
+
+	/* Allocate driver private struct */
+	bdw_rt5650 = devm_kzalloc(&pdev->dev, sizeof(struct bdw_rt5650_priv),
+		GFP_KERNEL);
+	if (!bdw_rt5650)
+		return -ENOMEM;
+
+	/* override plaform name, if required */
+	mach = (&pdev->dev)->platform_data;
+	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt5650_card,
+						    mach->mach_params.platform);
+
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(&bdw_rt5650_card, bdw_rt5650);
+
+	return devm_snd_soc_register_card(&pdev->dev, &bdw_rt5650_card);
+}
+
+static struct platform_driver bdw_rt5650_audio = {
+	.probe = bdw_rt5650_probe,
+	.driver = {
+		.name = "bdw-rt5650",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(bdw_rt5650_audio)
+
+/* Module information */
+MODULE_AUTHOR("Ben Zhang <benzh@chromium.org>");
+MODULE_DESCRIPTION("Intel Broadwell RT5650 machine driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:bdw-rt5650");
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index 34eb0baaa9517..35958553652ec 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -29,6 +29,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt286.tplg",
 	},
+	{
+		.id = "10EC5650",
+		.drv_name = "bdw-rt5650",
+		.fw_filename = "intel/IntcSST2.bin",
+		.sof_fw_filename = "sof-bdw.ri",
+		.sof_tplg_filename = "sof-bdw-rt5650.tplg",
+	},
 	{
 		.id = "RT5677CE",
 		.drv_name = "bdw-rt5677",
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
