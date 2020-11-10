Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C911B2AEABD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:02:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6620316FB;
	Wed, 11 Nov 2020 09:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6620316FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081756;
	bh=/s1XBt6JnHqSEERTdDoE4han1RG84/uE65RPPLmbZYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBy2mf5AGLgG6ktqQRfN6vjj3E5A4WsO01SYjXIm1+3+5/bL9pj8oH2E5j6V2aq5+
	 i8A6FE+tu4bpk9wNVswMnqhEl6d8nOjqS9X96HINOKNyWvvhWkxdOauumfkJlnEQwP
	 +8PVXY1zpaMmwwQIhOIkI4sPYM9XWMFBIRVpp6aQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B936CF804BC;
	Wed, 11 Nov 2020 09:00:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 164F2F801EC; Tue, 10 Nov 2020 21:40:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8B61F80161
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 21:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B61F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U8QCCJuD"
Received: by mail-qk1-x743.google.com with SMTP id d28so7785194qka.11
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0BhFQkk+xqT8cvoEkZlAELF5s3crrOAnqt3l+TnmqOM=;
 b=U8QCCJuDqaLowcF/g1yxZqM1MKp2aI7umfrgPqTDPfTu4Is6yKl4vftb0E3xQnUu88
 nQx9QrwUBPDUhphOtmu9sGS2Y42xjIsFQnJCh2AiZbMGgQZ5bEVU3yPgTBQiLcOD65B7
 /blvQtWykLP8NfhVCI+MnscZuhcRHRK4B92dXqg7Wu782jwU4I9n20CgiuHIQmI4Uoj0
 tTCon/wiQaoFqjGbh5X9BgZggke/GJkKo29QiK1n2OLkEVOEWrGLbTjUwoRiXrWXFr0E
 EQUYkxTVxry3af+qFnQ8asHXsxp5Z5T4JCgw9M7QOashPhQpIUffzWDrWziTRNE10mwo
 b11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0BhFQkk+xqT8cvoEkZlAELF5s3crrOAnqt3l+TnmqOM=;
 b=Qz2am//IVvb7ngNnqhKoCbbL/2FYSjvo2idJcE1+uuQeQePW0usfYyws4cwF80aQg9
 +ry5qACrJ6AVJluYa0GaERxSeqg2AzWlM+M1jYQG94uqJsRQgHzO6BIDh8I97TFO/v91
 Fj8DoqUiNuJEPIwm/7R6R5XYq2nTfKEO82I7yN/97DM7w2B2PjOAlcLjF78YO1Y7kc8V
 5X1hM/9HjdAkUqWRetf02+OSyYN9r0h7KsDxiEtTL4OET3c88mcix2D4w5/mfJ2zSMca
 V/WYhAYodFynWgZz7rIbcnNr79fmuQwDdShPEAZx0gLRDR7WYJmlYLp5IOjxNwKiVWr0
 Lk2A==
X-Gm-Message-State: AOAM533Y+ZeSKriNPcNMP9RiiSXUXDbwcW0PichMMIVFVMoozhVXwNkv
 HXioo8TlRTTkreSelpNkyFk=
X-Google-Smtp-Source: ABdhPJxnbm/cAyDpkSGjRewI7sY8BVIcMhzDhk8CibdIn99eNGboG1MgpX0PyaE5jtg/TjUjCQM+qQ==
X-Received: by 2002:a05:620a:c07:: with SMTP id
 l7mr22173588qki.9.1605040795408; 
 Tue, 10 Nov 2020 12:39:55 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 a85sm6247719qkg.3.2020.11.10.12.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:39:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 2/6] ASoC: mx27vis-aic32x4: Remove unused driver
Date: Tue, 10 Nov 2020 17:39:33 -0300
Message-Id: <20201110203937.25684-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110203937.25684-1-festevam@gmail.com>
References: <20201110203937.25684-1-festevam@gmail.com>
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

Since commit 879c0e5e0ac7 ("ARM: imx: Remove i.MX27 board files"), the 
MACH_IMX27_VISSTRIM_M10 non-DT platform is no longer supported,
so get rid of its machine audio driver too.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig           |  11 --
 sound/soc/fsl/Makefile          |   2 -
 sound/soc/fsl/mx27vis-aic32x4.c | 214 --------------------------------
 3 files changed, 227 deletions(-)
 delete mode 100644 sound/soc/fsl/mx27vis-aic32x4.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 3ad547193df8..c18ec9310aa7 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -239,17 +239,6 @@ config SND_SOC_IMX_SSI
 
 comment "SoC Audio support for Freescale i.MX boards:"
 
-config SND_SOC_MX27VIS_AIC32X4
-	tristate "SoC audio support for Visstrim M10 boards"
-	depends on MACH_IMX27_VISSTRIM_M10 && I2C
-	select SND_SOC_TLV320AIC32X4
-	select SND_SOC_IMX_PCM_DMA
-	select SND_SOC_IMX_AUDMUX
-	select SND_SOC_IMX_SSI
-	help
-	  Say Y if you want to add support for SoC audio on Visstrim SM10
-	  board with TLV320AIC32X4 codec.
-
 config SND_SOC_PHYCORE_AC97
 	tristate "SoC Audio support for Phytec phyCORE (and phyCARD) boards"
 	depends on MACH_PCM043 || MACH_PCA100
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 8d3e40415050..5c6058f414be 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_SND_SOC_IMX_PCM_DMA) += imx-pcm-dma.o
 # i.MX Machine Support
 snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
 snd-soc-phycore-ac97-objs := phycore-ac97.o
-snd-soc-mx27vis-aic32x4-objs := mx27vis-aic32x4.o
 snd-soc-imx-es8328-objs := imx-es8328.o
 snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
 snd-soc-imx-spdif-objs := imx-spdif.o
@@ -73,7 +72,6 @@ snd-soc-imx-audmix-objs := imx-audmix.o
 
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_PHYCORE_AC97) += snd-soc-phycore-ac97.o
-obj-$(CONFIG_SND_SOC_MX27VIS_AIC32X4) += snd-soc-mx27vis-aic32x4.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) += snd-soc-imx-sgtl5000.o
 obj-$(CONFIG_SND_SOC_IMX_SPDIF) += snd-soc-imx-spdif.o
diff --git a/sound/soc/fsl/mx27vis-aic32x4.c b/sound/soc/fsl/mx27vis-aic32x4.c
deleted file mode 100644
index 8d3b1897370b..000000000000
--- a/sound/soc/fsl/mx27vis-aic32x4.c
+++ /dev/null
@@ -1,214 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// mx27vis-aic32x4.c
-//
-// Copyright 2011 Vista Silicon S.L.
-//
-// Author: Javier Martin <javier.martin@vista-silicon.com>
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/device.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/platform_data/asoc-mx27vis.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <sound/soc-dapm.h>
-#include <sound/tlv.h>
-#include <asm/mach-types.h>
-
-#include "../codecs/tlv320aic32x4.h"
-#include "imx-ssi.h"
-#include "imx-audmux.h"
-
-#define MX27VIS_AMP_GAIN	0
-#define MX27VIS_AMP_MUTE	1
-
-static int mx27vis_amp_gain;
-static int mx27vis_amp_mute;
-static int mx27vis_amp_gain0_gpio;
-static int mx27vis_amp_gain1_gpio;
-static int mx27vis_amp_mutel_gpio;
-static int mx27vis_amp_muter_gpio;
-
-static int mx27vis_aic32x4_hw_params(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
-				     25000000, SND_SOC_CLOCK_OUT);
-	if (ret) {
-		pr_err("%s: failed setting codec sysclk\n", __func__);
-		return ret;
-	}
-
-	ret = snd_soc_dai_set_sysclk(cpu_dai, IMX_SSP_SYS_CLK, 0,
-				SND_SOC_CLOCK_IN);
-	if (ret) {
-		pr_err("can't set CPU system clock IMX_SSP_SYS_CLK\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mx27vis_aic32x4_snd_ops = {
-	.hw_params	= mx27vis_aic32x4_hw_params,
-};
-
-static int mx27vis_amp_set(struct snd_kcontrol *kcontrol,
-			    struct snd_ctl_elem_value *ucontrol)
-{
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	int value = ucontrol->value.integer.value[0];
-	unsigned int reg = mc->reg;
-	int max = mc->max;
-
-	if (value > max)
-		return -EINVAL;
-
-	switch (reg) {
-	case MX27VIS_AMP_GAIN:
-		gpio_set_value(mx27vis_amp_gain0_gpio, value & 1);
-		gpio_set_value(mx27vis_amp_gain1_gpio, value >> 1);
-		mx27vis_amp_gain = value;
-		break;
-	case MX27VIS_AMP_MUTE:
-		gpio_set_value(mx27vis_amp_mutel_gpio, value & 1);
-		gpio_set_value(mx27vis_amp_muter_gpio, value >> 1);
-		mx27vis_amp_mute = value;
-		break;
-	}
-	return 0;
-}
-
-static int mx27vis_amp_get(struct snd_kcontrol *kcontrol,
-			    struct snd_ctl_elem_value *ucontrol)
-{
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	unsigned int reg = mc->reg;
-
-	switch (reg) {
-	case MX27VIS_AMP_GAIN:
-		ucontrol->value.integer.value[0] = mx27vis_amp_gain;
-		break;
-	case MX27VIS_AMP_MUTE:
-		ucontrol->value.integer.value[0] = mx27vis_amp_mute;
-		break;
-	}
-	return 0;
-}
-
-/* From 6dB to 24dB in steps of 6dB */
-static const DECLARE_TLV_DB_SCALE(mx27vis_amp_tlv, 600, 600, 0);
-
-static const struct snd_kcontrol_new mx27vis_aic32x4_controls[] = {
-	SOC_DAPM_PIN_SWITCH("External Mic"),
-	SOC_SINGLE_EXT_TLV("LO Ext Boost", MX27VIS_AMP_GAIN, 0, 3, 0,
-		       mx27vis_amp_get, mx27vis_amp_set, mx27vis_amp_tlv),
-	SOC_DOUBLE_EXT("LO Ext Mute Switch", MX27VIS_AMP_MUTE, 0, 1, 1, 0,
-		       mx27vis_amp_get, mx27vis_amp_set),
-};
-
-static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
-	SND_SOC_DAPM_MIC("External Mic", NULL),
-};
-
-static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
-	{"Mic Bias", NULL, "External Mic"},
-	{"IN1_R", NULL, "Mic Bias"},
-	{"IN2_R", NULL, "Mic Bias"},
-	{"IN3_R", NULL, "Mic Bias"},
-	{"IN1_L", NULL, "Mic Bias"},
-	{"IN2_L", NULL, "Mic Bias"},
-	{"IN3_L", NULL, "Mic Bias"},
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_CPU("imx-ssi.0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic32x4.0-0018",
-				      "tlv320aic32x4-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("imx-ssi.0")));
-
-static struct snd_soc_dai_link mx27vis_aic32x4_dai = {
-	.name		= "tlv320aic32x4",
-	.stream_name	= "TLV320AIC32X4",
-	.dai_fmt	= SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBM_CFM,
-	.ops		= &mx27vis_aic32x4_snd_ops,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static struct snd_soc_card mx27vis_aic32x4 = {
-	.name		= "visstrim_m10-audio",
-	.owner		= THIS_MODULE,
-	.dai_link	= &mx27vis_aic32x4_dai,
-	.num_links	= 1,
-	.controls	= mx27vis_aic32x4_controls,
-	.num_controls	= ARRAY_SIZE(mx27vis_aic32x4_controls),
-	.dapm_widgets	= aic32x4_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(aic32x4_dapm_widgets),
-	.dapm_routes	= aic32x4_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(aic32x4_dapm_routes),
-};
-
-static int mx27vis_aic32x4_probe(struct platform_device *pdev)
-{
-	struct snd_mx27vis_platform_data *pdata = pdev->dev.platform_data;
-	int ret;
-
-	if (!pdata) {
-		dev_err(&pdev->dev, "No platform data supplied\n");
-		return -EINVAL;
-	}
-
-	mx27vis_amp_gain0_gpio = pdata->amp_gain0_gpio;
-	mx27vis_amp_gain1_gpio = pdata->amp_gain1_gpio;
-	mx27vis_amp_mutel_gpio = pdata->amp_mutel_gpio;
-	mx27vis_amp_muter_gpio = pdata->amp_muter_gpio;
-
-	mx27vis_aic32x4.dev = &pdev->dev;
-	ret = devm_snd_soc_register_card(&pdev->dev, &mx27vis_aic32x4);
-	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
-			ret);
-		return ret;
-	}
-
-	/* Connect SSI0 as clock slave to SSI1 external pins */
-	imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
-			IMX_AUDMUX_V1_PCR_SYN |
-			IMX_AUDMUX_V1_PCR_TFSDIR |
-			IMX_AUDMUX_V1_PCR_TCLKDIR |
-			IMX_AUDMUX_V1_PCR_TFCSEL(MX27_AUDMUX_PPCR1_SSI_PINS_1) |
-			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_PPCR1_SSI_PINS_1)
-	);
-	imx_audmux_v1_configure_port(MX27_AUDMUX_PPCR1_SSI_PINS_1,
-			IMX_AUDMUX_V1_PCR_SYN |
-			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0)
-	);
-
-	return ret;
-}
-
-static struct platform_driver mx27vis_aic32x4_audio_driver = {
-	.driver = {
-		.name = "mx27vis",
-	},
-	.probe = mx27vis_aic32x4_probe,
-};
-
-module_platform_driver(mx27vis_aic32x4_audio_driver);
-
-MODULE_AUTHOR("Javier Martin <javier.martin@vista-silicon.com>");
-MODULE_DESCRIPTION("ALSA SoC AIC32X4 mx27 visstrim");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:mx27vis");
-- 
2.17.1

