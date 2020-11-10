Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF782AEABC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE68A174B;
	Wed, 11 Nov 2020 09:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE68A174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081716;
	bh=qxIJoOE4yRvadNrbAiQI0WW0IvQw+0+MyiLVINWS3/c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UAeiSKOlb7EUmOj26ThMc1wjKUvDQLnWP0r+EJldUfYBKkWbSCTZO83PA3KzeLC3O
	 pSLSPTiBSUvPUQ6wsZX3/FXuarQQR2jd7ULxAGkOVRrzG0nZ0z5E8FXNJwo9Kl98yF
	 1h/CmNL4jd6lGMX38PrfjUIaO9kIoaUG2zpQLnXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4922CF8007E;
	Wed, 11 Nov 2020 09:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2651F801EB; Tue, 10 Nov 2020 21:40:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4EEBF800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 21:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4EEBF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s9CKAtgE"
Received: by mail-qv1-xf41.google.com with SMTP id z17so2853913qvy.11
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=D3GfngUwtmgE59vlwMxCwvyVrPP2ypH8DdKdFvh68EI=;
 b=s9CKAtgEZNc7idcEkCl9n5phkaosirtmxS2BHxPTBmejSoL+kyGh8gER9+x/yuSkgH
 uW9FHm+kfAKL6RNyhQhS1qs1DQUlTov+2W6V0itnaJAeWm7b68i1kdl9QEJuV+TNQ097
 /v+k2w0rANOQTsgJ3uCzu/vKusNGn9/JoIvscbBhSkLHit+VzLPz5pYv8DuBTeJLpcC5
 wljGgqfWLPAptMOMw6Sgbq/s5OhPYeXDXnu/UJ/6q8thqV07RBw52j9Ig/PW5uQJ82wk
 5HO/zBJ9f+epbe/SdBDuQRNqq59uTvj9hQUfe/PLeA2rQ++QZBSYzqEOSPPNeNvsQP4A
 phjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=D3GfngUwtmgE59vlwMxCwvyVrPP2ypH8DdKdFvh68EI=;
 b=s6mwb94wirswjFwIV12UzbYvU/kU80gkE9NEm/WRvxiQxZy52ejxzIenoKgsy6N0uH
 8mztidm9dBA9+vwB0pnB7ONp7hEHk4Qw5mwj4AY/usKkMCPniFp7giKaJRX5ReUpXVY6
 icg2bbUZSBKUKx15kk0rdrUak5x+HV+LhFBaR+4BzTCHiAzd3ho8odFbi8+0dZ1sFASO
 sQj/9jgCNy6iTqSOR6sm4bLxk4Xh768i40UQ33GXzOpuLL8jT2Qi896RpYpr2opBfVHW
 Ml9Sgne1AICuhNwEA8gwFQGhglwg0Pvu/qHMb3SCOQe7YBG4ruczivzKsijbBt/+ioUQ
 Vmkg==
X-Gm-Message-State: AOAM530L/nJ0OVyo0q5fq79JSu0JA6d2gZqimlSt01Y4NLXAIP7hsd0p
 qWD+5AJAiEH+o/UfIAYkva4=
X-Google-Smtp-Source: ABdhPJyPAW37iB9XpbCTohIOMaVfW9L7/N7lSqUzYHE8kyflagRWmTIR0RyJ4l7qt2NQBx6C4mDMHQ==
X-Received: by 2002:a0c:b603:: with SMTP id f3mr14367153qve.42.1605040792855; 
 Tue, 10 Nov 2020 12:39:52 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 a85sm6247719qkg.3.2020.11.10.12.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:39:52 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 1/6] ASoC: wm1133-ev1: Remove unused driver
Date: Tue, 10 Nov 2020 17:39:32 -0300
Message-Id: <20201110203937.25684-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 11 Nov 2020 09:00:10 +0100
Cc: nicoleotsuka@gmail.com, shengjiu.wang@nxp.com,
 Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org
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

Since commit c93197b0041d ("ARM: imx: Remove i.MX31 board files"), the 
MACH_MX31ADS_WM1133_EV1 non-DT platform is no longer supported,
so get rid of its machine audio driver too.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig      |  11 --
 sound/soc/fsl/Makefile     |   2 -
 sound/soc/fsl/wm1133-ev1.c | 289 -------------------------------------
 3 files changed, 302 deletions(-)
 delete mode 100644 sound/soc/fsl/wm1133-ev1.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 52a562215008..3ad547193df8 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -239,17 +239,6 @@ config SND_SOC_IMX_SSI
 
 comment "SoC Audio support for Freescale i.MX boards:"
 
-config SND_MXC_SOC_WM1133_EV1
-	tristate "Audio on the i.MX31ADS with WM1133-EV1 fitted"
-	depends on MACH_MX31ADS_WM1133_EV1
-	select SND_SOC_WM8350
-	select SND_SOC_IMX_PCM_FIQ
-	select SND_SOC_IMX_AUDMUX
-	select SND_SOC_IMX_SSI
-	help
-	  Enable support for audio on the i.MX31ADS with the WM1133-EV1
-	  PMIC board with WM8835x fitted.
-
 config SND_SOC_MX27VIS_AIC32X4
 	tristate "SoC audio support for Visstrim M10 boards"
 	depends on MACH_IMX27_VISSTRIM_M10 && I2C
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 2181b7f9f677..8d3e40415050 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -65,7 +65,6 @@ obj-$(CONFIG_SND_SOC_IMX_PCM_DMA) += imx-pcm-dma.o
 snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
 snd-soc-phycore-ac97-objs := phycore-ac97.o
 snd-soc-mx27vis-aic32x4-objs := mx27vis-aic32x4.o
-snd-soc-wm1133-ev1-objs := wm1133-ev1.o
 snd-soc-imx-es8328-objs := imx-es8328.o
 snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
 snd-soc-imx-spdif-objs := imx-spdif.o
@@ -75,7 +74,6 @@ snd-soc-imx-audmix-objs := imx-audmix.o
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_PHYCORE_AC97) += snd-soc-phycore-ac97.o
 obj-$(CONFIG_SND_SOC_MX27VIS_AIC32X4) += snd-soc-mx27vis-aic32x4.o
-obj-$(CONFIG_SND_MXC_SOC_WM1133_EV1) += snd-soc-wm1133-ev1.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) += snd-soc-imx-sgtl5000.o
 obj-$(CONFIG_SND_SOC_IMX_SPDIF) += snd-soc-imx-spdif.o
diff --git a/sound/soc/fsl/wm1133-ev1.c b/sound/soc/fsl/wm1133-ev1.c
deleted file mode 100644
index 99611a037ada..000000000000
--- a/sound/soc/fsl/wm1133-ev1.c
+++ /dev/null
@@ -1,289 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-//  wm1133-ev1.c - Audio for WM1133-EV1 on i.MX31ADS
-//
-//  Copyright (c) 2010 Wolfson Microelectronics plc
-//  Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
-//
-//  Based on an earlier driver for the same hardware by Liam Girdwood.
-
-#include <linux/platform_device.h>
-#include <linux/clk.h>
-#include <linux/module.h>
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "imx-ssi.h"
-#include "../codecs/wm8350.h"
-#include "imx-audmux.h"
-
-/* There is a silicon mic on the board optionally connected via a solder pad
- * SP1.  Define this to enable it.
- */
-#undef USE_SIMIC
-
-struct _wm8350_audio {
-	unsigned int channels;
-	snd_pcm_format_t format;
-	unsigned int rate;
-	unsigned int sysclk;
-	unsigned int bclkdiv;
-	unsigned int clkdiv;
-	unsigned int lr_rate;
-};
-
-/* in order of power consumption per rate (lowest first) */
-static const struct _wm8350_audio wm8350_audio[] = {
-	/* 16bit mono modes */
-	{1, SNDRV_PCM_FORMAT_S16_LE, 8000, 12288000 >> 1,
-	 WM8350_BCLK_DIV_48, WM8350_DACDIV_3, 16,},
-
-	/* 16 bit stereo modes */
-	{2, SNDRV_PCM_FORMAT_S16_LE, 8000, 12288000,
-	 WM8350_BCLK_DIV_48, WM8350_DACDIV_6, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 16000, 12288000,
-	 WM8350_BCLK_DIV_24, WM8350_DACDIV_3, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 32000, 12288000,
-	 WM8350_BCLK_DIV_12, WM8350_DACDIV_1_5, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 48000, 12288000,
-	 WM8350_BCLK_DIV_8, WM8350_DACDIV_1, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 96000, 24576000,
-	 WM8350_BCLK_DIV_8, WM8350_DACDIV_1, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 11025, 11289600,
-	 WM8350_BCLK_DIV_32, WM8350_DACDIV_4, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 22050, 11289600,
-	 WM8350_BCLK_DIV_16, WM8350_DACDIV_2, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 44100, 11289600,
-	 WM8350_BCLK_DIV_8, WM8350_DACDIV_1, 32,},
-	{2, SNDRV_PCM_FORMAT_S16_LE, 88200, 22579200,
-	 WM8350_BCLK_DIV_8, WM8350_DACDIV_1, 32,},
-
-	/* 24bit stereo modes */
-	{2, SNDRV_PCM_FORMAT_S24_LE, 48000, 12288000,
-	 WM8350_BCLK_DIV_4, WM8350_DACDIV_1, 64,},
-	{2, SNDRV_PCM_FORMAT_S24_LE, 96000, 24576000,
-	 WM8350_BCLK_DIV_4, WM8350_DACDIV_1, 64,},
-	{2, SNDRV_PCM_FORMAT_S24_LE, 44100, 11289600,
-	 WM8350_BCLK_DIV_4, WM8350_DACDIV_1, 64,},
-	{2, SNDRV_PCM_FORMAT_S24_LE, 88200, 22579200,
-	 WM8350_BCLK_DIV_4, WM8350_DACDIV_1, 64,},
-};
-
-static int wm1133_ev1_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	int i, found = 0;
-	snd_pcm_format_t format = params_format(params);
-	unsigned int rate = params_rate(params);
-	unsigned int channels = params_channels(params);
-
-	/* find the correct audio parameters */
-	for (i = 0; i < ARRAY_SIZE(wm8350_audio); i++) {
-		if (rate == wm8350_audio[i].rate &&
-		    format == wm8350_audio[i].format &&
-		    channels == wm8350_audio[i].channels) {
-			found = 1;
-			break;
-		}
-	}
-	if (!found)
-		return -EINVAL;
-
-	/* codec FLL input is 14.75 MHz from MCLK */
-	snd_soc_dai_set_pll(codec_dai, 0, 0, 14750000, wm8350_audio[i].sysclk);
-
-	/* TODO: The SSI driver should figure this out for us */
-	switch (channels) {
-	case 2:
-		snd_soc_dai_set_tdm_slot(cpu_dai, 0x3, 0x3, 2, 0);
-		break;
-	case 1:
-		snd_soc_dai_set_tdm_slot(cpu_dai, 0x1, 0x1, 1, 0);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* set MCLK as the codec system clock for DAC and ADC */
-	snd_soc_dai_set_sysclk(codec_dai, WM8350_MCLK_SEL_PLL_MCLK,
-			       wm8350_audio[i].sysclk, SND_SOC_CLOCK_IN);
-
-	/* set codec BCLK division for sample rate */
-	snd_soc_dai_set_clkdiv(codec_dai, WM8350_BCLK_CLKDIV,
-			       wm8350_audio[i].bclkdiv);
-
-	/* DAI is synchronous and clocked with DAC LRCLK & ADC LRC */
-	snd_soc_dai_set_clkdiv(codec_dai,
-			       WM8350_DACLR_CLKDIV, wm8350_audio[i].lr_rate);
-	snd_soc_dai_set_clkdiv(codec_dai,
-			       WM8350_ADCLR_CLKDIV, wm8350_audio[i].lr_rate);
-
-	/* now configure DAC and ADC clocks */
-	snd_soc_dai_set_clkdiv(codec_dai,
-			       WM8350_DAC_CLKDIV, wm8350_audio[i].clkdiv);
-
-	snd_soc_dai_set_clkdiv(codec_dai,
-			       WM8350_ADC_CLKDIV, wm8350_audio[i].clkdiv);
-
-	return 0;
-}
-
-static const struct snd_soc_ops wm1133_ev1_ops = {
-	.hw_params = wm1133_ev1_hw_params,
-};
-
-static const struct snd_soc_dapm_widget wm1133_ev1_widgets[] = {
-#ifdef USE_SIMIC
-	SND_SOC_DAPM_MIC("SiMIC", NULL),
-#endif
-	SND_SOC_DAPM_MIC("Mic1 Jack", NULL),
-	SND_SOC_DAPM_MIC("Mic2 Jack", NULL),
-	SND_SOC_DAPM_LINE("Line In Jack", NULL),
-	SND_SOC_DAPM_LINE("Line Out Jack", NULL),
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-};
-
-/* imx32ads soc_card audio map */
-static const struct snd_soc_dapm_route wm1133_ev1_map[] = {
-
-#ifdef USE_SIMIC
-	/* SiMIC --> IN1LN (with automatic bias) via SP1 */
-	{ "IN1LN", NULL, "Mic Bias" },
-	{ "Mic Bias", NULL, "SiMIC" },
-#endif
-
-	/* Mic 1 Jack --> IN1LN and IN1LP (with automatic bias) */
-	{ "IN1LN", NULL, "Mic Bias" },
-	{ "IN1LP", NULL, "Mic1 Jack" },
-	{ "Mic Bias", NULL, "Mic1 Jack" },
-
-	/* Mic 2 Jack --> IN1RN and IN1RP (with automatic bias) */
-	{ "IN1RN", NULL, "Mic Bias" },
-	{ "IN1RP", NULL, "Mic2 Jack" },
-	{ "Mic Bias", NULL, "Mic2 Jack" },
-
-	/* Line in Jack --> AUX (L+R) */
-	{ "IN3R", NULL, "Line In Jack" },
-	{ "IN3L", NULL, "Line In Jack" },
-
-	/* Out1 --> Headphone Jack */
-	{ "Headphone Jack", NULL, "OUT1R" },
-	{ "Headphone Jack", NULL, "OUT1L" },
-
-	/* Out1 --> Line Out Jack */
-	{ "Line Out Jack", NULL, "OUT2R" },
-	{ "Line Out Jack", NULL, "OUT2L" },
-};
-
-static struct snd_soc_jack hp_jack;
-
-static struct snd_soc_jack_pin hp_jack_pins[] = {
-	{ .pin = "Headphone Jack", .mask = SND_JACK_HEADPHONE },
-};
-
-static struct snd_soc_jack mic_jack;
-
-static struct snd_soc_jack_pin mic_jack_pins[] = {
-	{ .pin = "Mic1 Jack", .mask = SND_JACK_MICROPHONE },
-	{ .pin = "Mic2 Jack", .mask = SND_JACK_MICROPHONE },
-};
-
-static int wm1133_ev1_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
-
-	/* Headphone jack detection */
-	snd_soc_card_jack_new(rtd->card, "Headphone", SND_JACK_HEADPHONE,
-			      &hp_jack, hp_jack_pins, ARRAY_SIZE(hp_jack_pins));
-	wm8350_hp_jack_detect(component, WM8350_JDR, &hp_jack, SND_JACK_HEADPHONE);
-
-	/* Microphone jack detection */
-	snd_soc_card_jack_new(rtd->card, "Microphone",
-			      SND_JACK_MICROPHONE | SND_JACK_BTN_0, &mic_jack,
-			      mic_jack_pins, ARRAY_SIZE(mic_jack_pins));
-	wm8350_mic_jack_detect(component, &mic_jack, SND_JACK_MICROPHONE,
-			       SND_JACK_BTN_0);
-
-	snd_soc_dapm_force_enable_pin(&rtd->card->dapm, "Mic Bias");
-
-	return 0;
-}
-
-
-SND_SOC_DAILINK_DEFS(ev1,
-	DAILINK_COMP_ARRAY(COMP_CPU("imx-ssi.0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm8350-codec.0-0x1a", "wm8350-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("imx-ssi.0")));
-
-static struct snd_soc_dai_link wm1133_ev1_dai = {
-	.name = "WM1133-EV1",
-	.stream_name = "Audio",
-	.init = wm1133_ev1_init,
-	.ops = &wm1133_ev1_ops,
-	.symmetric_rates = 1,
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBM_CFM,
-	SND_SOC_DAILINK_REG(ev1),
-};
-
-static struct snd_soc_card wm1133_ev1 = {
-	.name = "WM1133-EV1",
-	.owner = THIS_MODULE,
-	.dai_link = &wm1133_ev1_dai,
-	.num_links = 1,
-
-	.dapm_widgets = wm1133_ev1_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(wm1133_ev1_widgets),
-	.dapm_routes = wm1133_ev1_map,
-	.num_dapm_routes = ARRAY_SIZE(wm1133_ev1_map),
-};
-
-static struct platform_device *wm1133_ev1_snd_device;
-
-static int __init wm1133_ev1_audio_init(void)
-{
-	int ret;
-	unsigned int ptcr, pdcr;
-
-	/* SSI0 mastered by port 5 */
-	ptcr = IMX_AUDMUX_V2_PTCR_SYN |
-		IMX_AUDMUX_V2_PTCR_TFSDIR |
-		IMX_AUDMUX_V2_PTCR_TFSEL(MX31_AUDMUX_PORT5_SSI_PINS_5) |
-		IMX_AUDMUX_V2_PTCR_TCLKDIR |
-		IMX_AUDMUX_V2_PTCR_TCSEL(MX31_AUDMUX_PORT5_SSI_PINS_5);
-	pdcr = IMX_AUDMUX_V2_PDCR_RXDSEL(MX31_AUDMUX_PORT5_SSI_PINS_5);
-	imx_audmux_v2_configure_port(MX31_AUDMUX_PORT1_SSI0, ptcr, pdcr);
-
-	ptcr = IMX_AUDMUX_V2_PTCR_SYN;
-	pdcr = IMX_AUDMUX_V2_PDCR_RXDSEL(MX31_AUDMUX_PORT1_SSI0);
-	imx_audmux_v2_configure_port(MX31_AUDMUX_PORT5_SSI_PINS_5, ptcr, pdcr);
-
-	wm1133_ev1_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!wm1133_ev1_snd_device)
-		return -ENOMEM;
-
-	platform_set_drvdata(wm1133_ev1_snd_device, &wm1133_ev1);
-	ret = platform_device_add(wm1133_ev1_snd_device);
-
-	if (ret)
-		platform_device_put(wm1133_ev1_snd_device);
-
-	return ret;
-}
-module_init(wm1133_ev1_audio_init);
-
-static void __exit wm1133_ev1_audio_exit(void)
-{
-	platform_device_unregister(wm1133_ev1_snd_device);
-}
-module_exit(wm1133_ev1_audio_exit);
-
-MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
-MODULE_DESCRIPTION("Audio for WM1133-EV1 on i.MX31ADS");
-MODULE_LICENSE("GPL");
-- 
2.17.1

