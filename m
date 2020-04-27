Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3131BAA7E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 18:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66487169F;
	Mon, 27 Apr 2020 18:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66487169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588006489;
	bh=0KOeXOTHrsWiBGHEzMy5NFSPTH/kD8MVYY/6PPpn1Qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=haMOf/19FCqXMuVquxhpfcYfZKQhnuSSULLEJOTQvnuTnFO0a1nfLw6Zffb6GcNEG
	 2d8FnXKF1m/9wDVgedOPSau8KWaTp69KII7zyhDmNPtObk7puf0uevZ0SV27dpgwWI
	 oc/QBYbWurMaOAm9QU8uCpIE53LswW/cDugD5y1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE613F8027D;
	Mon, 27 Apr 2020 18:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F6FF8027D; Mon, 27 Apr 2020 18:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C118F80217
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 18:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C118F80217
IronPort-SDR: JwXpAaQ3yEcjSF+VpVgICynNGiwJ67IniRguAY1COt9gH+xL8KWdKC/P/fwbNY07lvVuKgwOJb
 of6Laz20aqDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 09:52:11 -0700
IronPort-SDR: gwXNGgtSuJmrJRZWpYm9fFgCAoq74ilqTwTtJ5GCTM53rBovnIqk/TIkkBFHvuG65+eeRXIdlC
 /WYxyGUQvOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="248925566"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2020 09:52:11 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: boards: add explicit dependency on GPIOLIB
 when DMIC is used
Date: Mon, 27 Apr 2020 09:52:08 -0700
Message-Id: <20200427165211.23463-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
References: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

SND_SOC_DMIC depends on GPIOLIB, so let's add the dependency before
selecting SND_SOC_DMIC.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c57bc6d0f145..3ee7c006a860 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -243,7 +243,7 @@ if SND_SOC_INTEL_SKL
 
 config SND_SOC_INTEL_SKL_RT286_MACH
 	tristate "SKL with RT286 I2S mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT286
 	select SND_SOC_DMIC
@@ -256,7 +256,7 @@ config SND_SOC_INTEL_SKL_RT286_MACH
 
 config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 	tristate "SKL with NAU88L25 and SSM4567 in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_NAU8825
 	select SND_SOC_SSM4567
@@ -270,7 +270,7 @@ config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 
 config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
 	tristate "SKL with NAU88L25 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_NAU8825
 	select SND_SOC_MAX98357A
@@ -299,7 +299,7 @@ if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -311,7 +311,7 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_BXT_RT298_MACH
 	tristate "Broxton with RT298 I2S mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT298
 	select SND_SOC_DMIC
@@ -328,7 +328,7 @@ if SND_SOC_INTEL_KBL
 
 config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
 	tristate "KBL with RT5663 and MAX98927 in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
@@ -370,7 +370,7 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 	tristate "KBL with DA7219 and MAX98927 in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98927
@@ -400,7 +400,7 @@ if SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK
 
 config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -412,7 +412,7 @@ config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	tristate "GLK with RT5682 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT5682
@@ -432,6 +432,7 @@ if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "SKL/KBL/BXT/APL with HDA Codecs"
 	depends on SND_HDA_CODEC_HDMI
+	depends on GPIOLIB
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
@@ -446,7 +447,7 @@ endif ## SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 if SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
 config SND_SOC_INTEL_SOF_RT5682_MACH
 	tristate "SOF with rt5682 codec in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on (SND_SOC_SOF_HDA_LINK && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	depends on SND_HDA_CODEC_HDMI
@@ -480,7 +481,7 @@ if (SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
@@ -491,7 +492,7 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	tristate "CML with RT1011 and RT5682 in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT1011
@@ -510,7 +511,7 @@ if SND_SOC_SOF_JASPERLAKE
 
 config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	tristate "SOF with DA7219 and MAX98373/MAX98360A in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_DA7219
@@ -528,7 +529,7 @@ if SND_SOC_SOF_ELKHARTLAKE
 
 config SND_SOC_INTEL_EHL_RT5660_MACH
 	tristate "EHL with RT5660 in I2S mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT5660
@@ -543,7 +544,7 @@ if SND_SOC_SOF_INTEL_SOUNDWIRE
 
 config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	tristate "SoundWire generic machine driver"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
-- 
2.17.1

