Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5FA2AEAC1
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:03:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF19E174A;
	Wed, 11 Nov 2020 09:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF19E174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081802;
	bh=Z46iWDISLyhoyV+pAaGBaDXeiVvGLl89l/WHRK54/0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CeLJFMBn7TJD0BX/ccNJZYr2WhqGfBuseqZmzuzfJjjMSIWgLvAVV7qsFoJcG7Y2F
	 r53BmxKbgOa8ryEHD+j1ATuo954uEJOHzlg2XI6QBO2rscjLbHs25QcFeQnyEoaLXZ
	 L1+oa5rubxrSY09OL5dr3LSQVKC+4S+G7bqelrIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C56C0F804CA;
	Wed, 11 Nov 2020 09:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09B5F801EC; Tue, 10 Nov 2020 21:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E893F800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 21:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E893F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R8yaUoM1"
Received: by mail-qv1-xf42.google.com with SMTP id ek7so2807129qvb.6
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h7cs6VDv0AZyNaHLZgSULO/30hYoEQXnsrwdJJCbc7w=;
 b=R8yaUoM1wy3PuHCjprlrlzPUaUE/UWVwFBTHc6WR8ixXe6vtBSekKsuaf4JbplCKGC
 OxogGISvEjIDS7V2WE5zqWEulhsfkzO0p7xmgLsx7jksz3ldGUFMh+xhaY6+gY5wLE1P
 9XcH8ofG1IJpRU4EYwNTrIFZhP+2wjtxQS6oRhSKblzMQvr422jhxK+RQAXqBaI6HFs0
 dg8Ljj6OkwFzE2D6P+2je94JKH3BssnVonyA6PiumyNRxx07dti3VIe0Mk1TzSUIBQUd
 bOn/eE9Zz9Q+vrAz8f8dTAkBuH4Q4odUO24AhGnkDOTqkaaGJp16O+pQ1NB2SA8u4SzN
 J96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h7cs6VDv0AZyNaHLZgSULO/30hYoEQXnsrwdJJCbc7w=;
 b=I+sRU9V0wfPvoEUoV4zOraUUqAvrm4Wb4LSZ9bggiUcdoqPRcmX9OyeqFh38S3yROw
 tOT8cdJgnooKDIQZtNa5i6MqALxgn+kwWOPrQ4yMtAg/MoVSINURYUS1gGz4HoiSfCOh
 0fZnfxVeZ836cDPw8b02B3hKhfcFJQM77JTRxzLtGdQxOW9Oxn+Lmq6cb3u+t8NXz53f
 7ILE17O1uSdakjt09T4NlDmA/eywm7ttqi1NS+tk12v24GeCT0Q7s2A/9Ivk6jO/CzHK
 E4hlWR/udOkzlH4fwfae0jrCYDP1W3BbI6DUgwZAPpabqF9KS5Tcur6kT7496do0DNZx
 ze+A==
X-Gm-Message-State: AOAM531MZ9MdUT2/z8f023101+7lnNBvE+QbHv0AEz7bF02wWoIiDL1/
 88MAzmqSC172vSmWMWd/SDk=
X-Google-Smtp-Source: ABdhPJzps+6UdwhCnY1LAOO8bUSDgrfhsED3OZRucMn2XiffaiqqSEtaWxJg8Z8ehSzX6umjn4fDJQ==
X-Received: by 2002:a0c:b207:: with SMTP id x7mr21664251qvd.39.1605040800506; 
 Tue, 10 Nov 2020 12:40:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 a85sm6247719qkg.3.2020.11.10.12.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:39:59 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 4/6] ASoC: imx-mc13783: Remove unused driver
Date: Tue, 10 Nov 2020 17:39:35 -0300
Message-Id: <20201110203937.25684-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110203937.25684-1-festevam@gmail.com>
References: <20201110203937.25684-1-festevam@gmail.com>
X-Mailman-Approved-At: Wed, 11 Nov 2020 09:00:11 +0100
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

The imx-mc13783 was used on imx27-pdk and imx31-pdk non-DT platforms.

Since 5.10-rc1, i.MX has been converted to a DT-only platform and all
board files are gone.

Remove the imx-mc13783 audio machine driver as there is no user at all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig       |   8 --
 sound/soc/fsl/Makefile      |   2 -
 sound/soc/fsl/imx-mc13783.c | 156 ------------------------------------
 3 files changed, 166 deletions(-)
 delete mode 100644 sound/soc/fsl/imx-mc13783.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 63be2bf5b509..1536c6d411fa 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -283,14 +283,6 @@ config SND_SOC_IMX_SPDIF
 	  Say Y if you want to add support for SoC audio on an i.MX board with
 	  a S/DPDIF.
 
-config SND_SOC_IMX_MC13783
-	tristate "SoC Audio support for I.MX boards with mc13783"
-	depends on MFD_MC13XXX && ARM
-	select SND_SOC_IMX_SSI
-	select SND_SOC_IMX_AUDMUX
-	select SND_SOC_MC13783
-	select SND_SOC_IMX_PCM_DMA
-
 config SND_SOC_FSL_ASOC_CARD
 	tristate "Generic ASoC Sound Card with ASRC support"
 	depends on OF && I2C
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 12755058f877..5637ebbe8ab2 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -66,12 +66,10 @@ snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
 snd-soc-imx-es8328-objs := imx-es8328.o
 snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
 snd-soc-imx-spdif-objs := imx-spdif.o
-snd-soc-imx-mc13783-objs := imx-mc13783.o
 snd-soc-imx-audmix-objs := imx-audmix.o
 
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) += snd-soc-imx-sgtl5000.o
 obj-$(CONFIG_SND_SOC_IMX_SPDIF) += snd-soc-imx-spdif.o
-obj-$(CONFIG_SND_SOC_IMX_MC13783) += snd-soc-imx-mc13783.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMIX) += snd-soc-imx-audmix.o
diff --git a/sound/soc/fsl/imx-mc13783.c b/sound/soc/fsl/imx-mc13783.c
deleted file mode 100644
index d9dca7bbcae3..000000000000
--- a/sound/soc/fsl/imx-mc13783.c
+++ /dev/null
@@ -1,156 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// imx-mc13783.c  --  SoC audio for imx based boards with mc13783 codec
-//
-// Copyright 2012 Philippe Retornaz, <philippe.retornaz@epfl.ch>
-//
-// Heavly based on phycore-mc13783:
-// Copyright 2009 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/device.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <sound/soc-dapm.h>
-#include <asm/mach-types.h>
-
-#include "../codecs/mc13783.h"
-#include "imx-ssi.h"
-#include "imx-audmux.h"
-
-#define FMT_SSI (SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | \
-		SND_SOC_DAIFMT_CBM_CFM)
-
-static int imx_mc13783_hifi_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 4, 16);
-	if (ret)
-		return ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, MC13783_CLK_CLIA, 26000000, 0);
-	if (ret)
-		return ret;
-
-	return snd_soc_dai_set_tdm_slot(cpu_dai, 0x3, 0x3, 2, 16);
-}
-
-static const struct snd_soc_ops imx_mc13783_hifi_ops = {
-	.hw_params = imx_mc13783_hifi_hw_params,
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_CPU("imx-ssi.0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("mc13783-codec", "mc13783-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("imx-ssi.0")));
-
-static struct snd_soc_dai_link imx_mc13783_dai_mc13783[] = {
-	{
-		.name = "MC13783",
-		.stream_name	 = "Sound",
-		.ops		 = &imx_mc13783_hifi_ops,
-		.symmetric_rates = 1,
-		.dai_fmt 	 = FMT_SSI,
-		SND_SOC_DAILINK_REG(hifi),
-	},
-};
-
-static const struct snd_soc_dapm_widget imx_mc13783_widget[] = {
-	SND_SOC_DAPM_MIC("Mic", NULL),
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-static const struct snd_soc_dapm_route imx_mc13783_routes[] = {
-	{"Speaker", NULL, "LSP"},
-	{"Headphone", NULL, "HSL"},
-	{"Headphone", NULL, "HSR"},
-
-	{"MC1LIN", NULL, "MC1 Bias"},
-	{"MC2IN", NULL, "MC2 Bias"},
-	{"MC1 Bias", NULL, "Mic"},
-	{"MC2 Bias", NULL, "Mic"},
-};
-
-static struct snd_soc_card imx_mc13783 = {
-	.name		= "imx_mc13783",
-	.owner		= THIS_MODULE,
-	.dai_link	= imx_mc13783_dai_mc13783,
-	.num_links	= ARRAY_SIZE(imx_mc13783_dai_mc13783),
-	.dapm_widgets	= imx_mc13783_widget,
-	.num_dapm_widgets = ARRAY_SIZE(imx_mc13783_widget),
-	.dapm_routes	= imx_mc13783_routes,
-	.num_dapm_routes = ARRAY_SIZE(imx_mc13783_routes),
-};
-
-static int imx_mc13783_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	imx_mc13783.dev = &pdev->dev;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, &imx_mc13783);
-	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
-			ret);
-		return ret;
-	}
-
-	if (machine_is_mx31_3ds() || machine_is_mx31moboard()) {
-		imx_audmux_v2_configure_port(MX31_AUDMUX_PORT4_SSI_PINS_4,
-			IMX_AUDMUX_V2_PTCR_SYN,
-			IMX_AUDMUX_V2_PDCR_RXDSEL(MX31_AUDMUX_PORT1_SSI0) |
-			IMX_AUDMUX_V2_PDCR_MODE(1) |
-			IMX_AUDMUX_V2_PDCR_INMMASK(0xfc));
-		imx_audmux_v2_configure_port(MX31_AUDMUX_PORT1_SSI0,
-			IMX_AUDMUX_V2_PTCR_SYN |
-			IMX_AUDMUX_V2_PTCR_TFSDIR |
-			IMX_AUDMUX_V2_PTCR_TFSEL(MX31_AUDMUX_PORT4_SSI_PINS_4) |
-			IMX_AUDMUX_V2_PTCR_TCLKDIR |
-			IMX_AUDMUX_V2_PTCR_TCSEL(MX31_AUDMUX_PORT4_SSI_PINS_4) |
-			IMX_AUDMUX_V2_PTCR_RFSDIR |
-			IMX_AUDMUX_V2_PTCR_RFSEL(MX31_AUDMUX_PORT4_SSI_PINS_4) |
-			IMX_AUDMUX_V2_PTCR_RCLKDIR |
-			IMX_AUDMUX_V2_PTCR_RCSEL(MX31_AUDMUX_PORT4_SSI_PINS_4),
-			IMX_AUDMUX_V2_PDCR_RXDSEL(MX31_AUDMUX_PORT4_SSI_PINS_4));
-	} else if (machine_is_mx27_3ds()) {
-		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
-			IMX_AUDMUX_V1_PCR_SYN |
-			IMX_AUDMUX_V1_PCR_TFSDIR |
-			IMX_AUDMUX_V1_PCR_TCLKDIR |
-			IMX_AUDMUX_V1_PCR_RFSDIR |
-			IMX_AUDMUX_V1_PCR_RCLKDIR |
-			IMX_AUDMUX_V1_PCR_TFCSEL(MX27_AUDMUX_HPCR3_SSI_PINS_4) |
-			IMX_AUDMUX_V1_PCR_RFCSEL(MX27_AUDMUX_HPCR3_SSI_PINS_4) |
-			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR3_SSI_PINS_4)
-		);
-		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR3_SSI_PINS_4,
-			IMX_AUDMUX_V1_PCR_SYN |
-			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0)
-		);
-	}
-
-	return ret;
-}
-
-static struct platform_driver imx_mc13783_audio_driver = {
-	.driver = {
-		.name = "imx_mc13783",
-	},
-	.probe = imx_mc13783_probe,
-};
-
-module_platform_driver(imx_mc13783_audio_driver);
-
-MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
-MODULE_AUTHOR("Philippe Retornaz <philippe.retornaz@epfl.ch");
-MODULE_DESCRIPTION("imx with mc13783 codec ALSA SoC driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx_mc13783");
-- 
2.17.1

