Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84518184C6C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C365183B;
	Fri, 13 Mar 2020 17:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C365183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116768;
	bh=Tcuwa+w+UcIViZ7ipgOjxe/t/aFCKXG0ADcsS8nAVUM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TViMTLEBObNAl4YVLcuhwciDu8EXnMJ1QMVhRFOzAkC2aNmT1jMmTfcAJ5IsE0lYF
	 kA8qVp+goQp0AMdy4J1WcAQSQ2i5z2poN4W9qxcyws0QKnyOyp9jyo6145Cmfexqyv
	 sWT+OAGCy6q3CLPx8i7nCsqcKoaayc07UTkEpMcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC423F80323;
	Fri, 13 Mar 2020 17:19:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B3DF802E8; Fri, 13 Mar 2020 17:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F28C2F802EC
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F28C2F802EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B89FEC;
 Fri, 13 Mar 2020 09:18:06 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 766A13F6CF;
 Fri, 13 Mar 2020 09:18:05 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "ASoC: Intel: boards: drop reverse deps for
 SND_HDA_CODEC_HDMI" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild test robot <lkp@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: Intel: boards: drop reverse deps for SND_HDA_CODEC_HDMI

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

From 5c82813ce43e3a2017c43b32a57dc7a8802d9ad4 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 12 Mar 2020 14:48:50 -0500
Subject: [PATCH] ASoC: Intel: boards: drop reverse deps for SND_HDA_CODEC_HDMI

Having a reverse dependency to a config that has its own additional
dependencies, is generally not recommended. And this applies to
select statements for SND_HDA_CODEC_HDMI, e.g. the case where SND_HDA
and SND_SOC_SOF_HDA are built as modules, but the machine driver is
built-in, leading to compile errors (reported as
i386-randconfig-e003-20200206).

Give up on trying to define different dependencies based on SOF/SST
selection, and simply add a "depends on" for SND_HDA_CODEC_HDMI. This
fixes the issue with randconfigs. Only downside is that SND_HDA_CODEC_HDMI
may be built unnecessarily in some cases, but this seems like the lesser
evil.

Fixes: aa2b4a5 ('ASoC: Intel: boards: fix incorrect HDMI Kconfig dependency')
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312194859.4051-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 755e1de19df9..67d85a7be559 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -289,7 +289,6 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_HDAC_HDMI
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -302,6 +301,7 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
@@ -402,6 +402,7 @@ config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
@@ -413,10 +414,10 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	tristate "GLK with RT5682 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT5682
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
@@ -430,7 +431,7 @@ if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "SKL/KBL/BXT/APL with HDA Codecs"
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
@@ -448,9 +449,9 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on I2C && ACPI
 	depends on (SND_SOC_SOF_HDA_LINK && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for SOF platforms
@@ -490,11 +491,11 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	tristate "CML with RT1011 and RT5682 in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT1011
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	help
 	  This adds support for ASoC machine driver for SOF platform with
 	  RT1011 + RT5682 I2S codec.
@@ -509,10 +510,10 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	tristate "SOF with DA7219 and MAX98373 in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98373
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with DA7219 + MAX98373 I2S audio codec.
-- 
2.20.1

