Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27211182
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71E8D16B5;
	Thu,  2 May 2019 04:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71E8D16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764363;
	bh=YgiJKCexRrrYRqe9dj7tnCf5Yeiqv3/4xisGQ5jGa3E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jOVJ2IHA4N3YQ8Zps7Rb/ZtwGh3Q4TQD2jHYB+yvDUFL35WGDs3o48G1s3UXtHxps
	 f7Ud1aLjPO0VmQE26PLmspAEXlCfeTda36rE+EI/1WX8so7iNpTMybhpdC9C+3fiUR
	 geYjFeKab+At4aRGfJ0t4vCOtr7mGURzWwwoojo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8700AF8978A;
	Thu,  2 May 2019 04:19:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD0DCF89756; Thu,  2 May 2019 04:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC8B3F89736
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC8B3F89736
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bkNrjEiR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vMmz/OQ7KXETmu1iZa32zcKcsR93xHlkZmG6T2K5HPc=; b=bkNrjEiRo/Ad
 DsG0XwggRvGB3z2l3yETGU4LsxvCf33/4mN2pAq8i+sX33JmLV7g2uhYTqRDRdNXj10+78JY/APnY
 PTE8/TAqYSVdWUd+WoSa0Z2fDOcdtGDEpYw9AEiM9MHM3Z+gmvHE1+KI/ErzKnvsmBlXQ1sk3kyjf
 yEj9I=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Iu-0005s8-Co; Thu, 02 May 2019 02:18:32 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 32CFC441D3B; Thu,  2 May 2019 03:18:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20190410163800.31376-1-broonie@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190502021826.32CFC441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:26 +0100 (BST)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: Make boards more available for
	compile test" to the asoc tree
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

   ASoC: Intel: Make boards more available for compile test

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 164a263bf8d003e4cbb197d52b74d26df72604d7 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Wed, 10 Apr 2019 17:38:00 +0100
Subject: [PATCH] ASoC: Intel: Make boards more available for compile test

The Intel boards have very strict dependencies which make them less
available for compile test than is desirable, with requirements for
specific drivers that are only needed at runtime but not at build time.
Relax this a bit if COMPILE_TEST is enabled to improve build coverage
for these drivers.

Signed-off-by: Mark Brown <broonie@kernel.org>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig | 79 +++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index bf6d7a11f94a..fa0c88311559 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -16,7 +16,9 @@ if SND_SOC_INTEL_HASWELL
 
 config SND_SOC_INTEL_HASWELL_MACH
 	tristate "Haswell Lynxpoint"
-	depends on X86_INTEL_LPSS && I2C && I2C_DESIGNWARE_PLATFORM
+	depends on I2C
+	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5640
 	help
 	  This adds support for the Lynxpoint Audio DSP on Intel(R) Haswell
@@ -30,7 +32,10 @@ if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
 
 config SND_SOC_INTEL_BDW_RT5677_MACH
 	tristate "Broadwell with RT5677 codec"
-	depends on X86_INTEL_LPSS && I2C && I2C_DESIGNWARE_PLATFORM && GPIOLIB
+	depends on I2C
+	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5677
 	help
 	  This adds support for Intel Broadwell platform based boards with
@@ -40,7 +45,9 @@ config SND_SOC_INTEL_BDW_RT5677_MACH
 
 config SND_SOC_INTEL_BROADWELL_MACH
 	tristate "Broadwell Wildcatpoint"
-	depends on X86_INTEL_LPSS && I2C && I2C_DESIGNWARE_PLATFORM
+	depends on I2C
+	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT286
 	help
 	  This adds support for the Wilcatpoint Audio DSP on Intel(R) Broadwell
@@ -53,7 +60,8 @@ if SND_SOC_INTEL_BAYTRAIL
 
 config SND_SOC_INTEL_BYT_MAX98090_MACH
 	tristate "Baytrail with MAX98090 codec"
-	depends on X86_INTEL_LPSS && I2C
+	depends on I2C
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_MAX98090
 	help
 	  This adds audio driver for Intel Baytrail platform based boards
@@ -63,7 +71,8 @@ config SND_SOC_INTEL_BYT_MAX98090_MACH
 
 config SND_SOC_INTEL_BYT_RT5640_MACH
 	tristate "Baytrail with RT5640 codec"
-	depends on X86_INTEL_LPSS && I2C
+	depends on I2C
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5640
 	help
 	  This adds audio driver for Intel Baytrail platform based boards
@@ -76,7 +85,8 @@ if SND_SST_ATOM_HIFI2_PLATFORM || SND_SOC_SOF_BAYTRAIL
 
 config SND_SOC_INTEL_BYTCR_RT5640_MACH
 	tristate "Baytrail and Baytrail-CR with RT5640 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5640
 	help
@@ -87,7 +97,8 @@ config SND_SOC_INTEL_BYTCR_RT5640_MACH
 
 config SND_SOC_INTEL_BYTCR_RT5651_MACH
 	tristate "Baytrail and Baytrail-CR with RT5651 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5651
 	help
@@ -98,7 +109,8 @@ config SND_SOC_INTEL_BYTCR_RT5651_MACH
 
 config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 	tristate "Cherrytrail & Braswell with RT5672 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5670
         help
@@ -109,7 +121,8 @@ config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 
 config SND_SOC_INTEL_CHT_BSW_RT5645_MACH
 	tristate "Cherrytrail & Braswell with RT5645/5650 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5645
 	help
@@ -120,7 +133,8 @@ config SND_SOC_INTEL_CHT_BSW_RT5645_MACH
 
 config SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH
 	tristate "Cherrytrail & Braswell with MAX98090 & TI codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
 	help
@@ -131,7 +145,8 @@ config SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH
 
 config SND_SOC_INTEL_CHT_BSW_NAU8824_MACH
 	tristate "Cherrytrail & Braswell with NAU88L24 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_NAU8824
 	help
@@ -142,7 +157,8 @@ config SND_SOC_INTEL_CHT_BSW_NAU8824_MACH
 
 config SND_SOC_INTEL_BYT_CHT_DA7213_MACH
 	tristate "Baytrail & Cherrytrail with DA7212/7213 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_DA7213
 	help
@@ -153,7 +169,8 @@ config SND_SOC_INTEL_BYT_CHT_DA7213_MACH
 
 config SND_SOC_INTEL_BYT_CHT_ES8316_MACH
 	tristate "Baytrail & Cherrytrail with ES8316 codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_ES8316
 	help
@@ -168,7 +185,8 @@ if SND_SST_ATOM_HIFI2_PLATFORM
 
 config SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH
 	tristate "Baytrail & Cherrytrail platform with no codec (MinnowBoard MAX, Up)"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	help
 	  This adds support for ASoC machine driver for the MinnowBoard Max or
 	  Up boards and provides access to I2S signals on the Low-Speed
@@ -184,7 +202,8 @@ if SND_SOC_INTEL_SKL
 
 config SND_SOC_INTEL_SKL_RT286_MACH
 	tristate "SKL with RT286 I2S mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT286
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
@@ -196,7 +215,8 @@ config SND_SOC_INTEL_SKL_RT286_MACH
 
 config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 	tristate "SKL with NAU88L25 and SSM4567 in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_NAU8825
 	select SND_SOC_SSM4567
 	select SND_SOC_DMIC
@@ -209,7 +229,8 @@ config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 
 config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
 	tristate "SKL with NAU88L25 and MAX98357A in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_NAU8825
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
@@ -226,7 +247,8 @@ if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
@@ -240,7 +262,8 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_BXT_RT298_MACH
 	tristate "Broxton with RT298 I2S mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT298
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
@@ -257,7 +280,8 @@ if SND_SOC_INTEL_KBL
 
 config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
 	tristate "KBL with RT5663 and MAX98927 in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
 	select SND_SOC_DMIC
@@ -271,7 +295,8 @@ config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
 
 config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
         tristate "KBL with RT5663, RT5514 and MAX98927 in I2S Mode"
-        depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
         depends on SPI
         select SND_SOC_RT5663
         select SND_SOC_RT5514
@@ -286,7 +311,8 @@ config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
 
 config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
@@ -298,7 +324,8 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 	tristate "KBL with DA7219 and MAX98927 in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98927
 	select SND_SOC_MAX98373
@@ -312,7 +339,8 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 
 config SND_SOC_INTEL_KBL_RT5660_MACH
 	tristate "KBL with RT5660 in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5660
 	select SND_SOC_HDAC_HDMI
 	help
@@ -326,7 +354,8 @@ if SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	tristate "GLK with RT5682 and MAX98357A in I2S Mode"
-	depends on MFD_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5682
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
