Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884DA8F1FD
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:20:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36849166A;
	Thu, 15 Aug 2019 19:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36849166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889627;
	bh=mE0637p5ppXjJAolc12JvRhd5ZxtRdrdco0qL/Hx1/o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZJ6Bmogi/hrWfUwA3tDR1FMVuBOa3+7H0kwi4B/3wUoH+TjMolJpYclb4oFEaUfnt
	 k4h1lJQffCeIN001CWe8JGpK7YHfZqWWHrzkLw5RieUfefxAahVGwUI4YS3NRoKf3B
	 cY9jNmQkDMRx7cITeSc9CM5BcTjO12H/VgbPZDNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC1A2F8067A;
	Thu, 15 Aug 2019 19:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DD3F8065A; Thu, 15 Aug 2019 19:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC180F8044C
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC180F8044C
Received: by mail-wr1-f97.google.com with SMTP id p17so2841333wrf.11
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=NI5Qe1HFuvJhUko3WAWVWQ4ZHcggN3EiB1jYxCA21pg=;
 b=CO+pFudeQ65+0NwCW1riRewV3TxZB2+FD8JFWtVgGidqLz78tgGldxySo7Bhqk1t6s
 OPPw3ZZblxlHJQQQGpJATKBQjfXNFKYcBjOXTmLzSjI8Vr/CQqiZsw8lzJJVaBpoD1Rk
 0YCcI7zim7mbMj8xVkvRwruc6XaCCDdO6YnKTdOqAIggm6R3bD1m36lAkpB4QlS4esMH
 o5IdER/KRu1yWH3Lf5vHfN072PMgnFHy1EFVCvBy0uEx7qYgiGx+wGbWmliVVbDUrDti
 GicW0yuHRsVLGEWIpY+++nDk7xi7r07LsAwbbcqlis/rfBkdKxi/XZJBizU82mDIBQ3J
 kn8w==
X-Gm-Message-State: APjAAAVeIOou1Q8vuugNulO8gaxUDMUlhYnTJlDh2et5uXjMe4vNGFlP
 qDclffM+QeWWn0EG6/psC9Z4YXhHD3PLK6IKj6nuUKwNuQ0xy1hHC1AfaswngBHLNw==
X-Google-Smtp-Source: APXvYqyxlxDGTls+sRBrzQoWSiQHEUHruajfbDkI5K6L2fUxrooqZuV4sSO0fPTHNri7A/lv6cN31TufSmwe
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr6741025wrw.151.1565889262704; 
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id a4sm55468wro.12.2019.08.15.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKQ-000514-Cn; Thu, 15 Aug 2019 17:14:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DD8822742B9E; Thu, 15 Aug 2019 18:14:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mac Chiang <mac.chiang@intel.com>
In-Reply-To: <1565851909-13825-1-git-send-email-mac.chiang@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171421.DD8822742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:21 +0100 (BST)
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 mac.chiang@intel.com, Mark Brown <broonie@kernel.org>,
 sathya.prakash.m.r@intel.com, bard.liao@intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: boards: Add Cometlake machine
	driver support" to the asoc tree
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

   ASoC: Intel: boards: Add Cometlake machine driver support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From c643c189f0fec116e75f9661e734545af0e3225e Mon Sep 17 00:00:00 2001
From: Mac Chiang <mac.chiang@intel.com>
Date: Thu, 15 Aug 2019 14:51:49 +0800
Subject: [PATCH] ASoC: Intel: boards: Add Cometlake machine driver support

reuse and add Cometlake support with:
SSP0 for DA7219 headphone codec
SSP1 for MAX98357a speaker amp codec

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/1565851909-13825-1-git-send-email-mac.chiang@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig                | 27 +++++++++++-----
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 31 ++++++++++++++++++-
 .../intel/common/soc-acpi-intel-cnl-match.c   | 12 +++++++
 sound/soc/intel/common/soc-intel-quirks.h     |  5 +++
 4 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4a529cea0190..5c27f7ab4a5f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -256,16 +256,20 @@ config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
 
 endif ## SND_SOC_INTEL_SKL
 
+config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+	tristate
+	select SND_SOC_DA7219
+	select SND_SOC_MAX98357A
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+
 if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_DA7219
-	select SND_SOC_MAX98357A
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_HDA_DSP_LOADER
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
@@ -326,10 +330,7 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_DA7219
-	select SND_SOC_MAX98357A
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	help
 	  This adds support for ASoC Onboard Codec I2S machine driver. This will
 	  create an alsa sound card for DA7219 + MAX98357A I2S audio codec.
@@ -413,4 +414,14 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	   If unsure select "N".
 endif ## SND_SOC_SOF_HDA_COMMON || SND_SOC_SOF_BAYTRAIL
 
+if (SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK)
+
+config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
+	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+
+endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
+
 endif ## SND_SOC_INTEL_MACH
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index c0d865a940dc..ac1dea5f9d11 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -179,10 +179,17 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_component *component = rtd->codec_dai->component;
+	int clk_freq;
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 19200000,
+	if (soc_intel_is_cml())
+		clk_freq = 24000000;
+	else
+		clk_freq = 19200000;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, clk_freq,
 				     SND_SOC_CLOCK_IN);
+
 	if (ret) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
 		return ret;
@@ -683,6 +690,25 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				broxton_dais[i].cpus->dai_name = "SSP2 Pin";
 			}
 		}
+	} else if (soc_intel_is_cml()) {
+		unsigned int i;
+
+		broxton_audio_card.name = "cmlda7219max";
+
+		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
+			/* MAXIM_CODEC is connected to SSP1. */
+			if (!strcmp(broxton_dais[i].codecs->dai_name,
+					BXT_MAXIM_CODEC_DAI)) {
+				broxton_dais[i].name = "SSP1-Codec";
+				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
+			}
+			/* DIALOG_CODEC is connected to SSP0 */
+			else if (!strcmp(broxton_dais[i].codecs->dai_name,
+					BXT_DIALOG_CODEC_DAI)) {
+				broxton_dais[i].name = "SSP0-Codec";
+				broxton_dais[i].cpus->dai_name = "SSP0 Pin";
+			}
+		}
 	}
 
 	/* override plaform name, if required */
@@ -700,6 +726,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id bxt_board_ids[] = {
 	{ .name = "bxt_da7219_max98357a" },
 	{ .name = "glk_da7219_max98357a" },
+	{ .name = "cml_da7219_max98357a" },
 	{ }
 };
 
@@ -720,6 +747,8 @@ MODULE_AUTHOR("Rohit Ainapure <rohit.m.ainapure@intel.com>");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_AUTHOR("Conrad Cooke <conrad.cooke@intel.com>");
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:bxt_da7219_max98357a");
 MODULE_ALIAS("platform:glk_da7219_max98357a");
+MODULE_ALIAS("platform:cml_da7219_max98357a");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 771b0ef21051..985aa366c9e8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs cml_codecs = {
 	.codecs = {"10EC5682"}
 };
 
+static struct snd_soc_acpi_codecs cml_spk_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
@@ -28,6 +33,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "cml_da7219_max98357a",
+		.quirk_data = &cml_spk_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+	},
 	{
 		.id = "MX98357A",
 		.drv_name = "sof_rt5682",
diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index 4718fd3cf636..e6357d306cb8 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -36,6 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
 SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
 SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
 SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
+SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
@@ -110,6 +111,10 @@ static inline bool soc_intel_is_glk(void)
 	return false;
 }
 
+static inline bool soc_intel_is_cml(void)
+{
+	return false;
+}
 #endif
 
  #endif /* _SND_SOC_INTEL_QUIRKS_H */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
