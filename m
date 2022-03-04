Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 660394CDEE3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:47:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059D61DF7;
	Fri,  4 Mar 2022 21:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059D61DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646426856;
	bh=8ycMz45PpTPplJLbzFKn/UbdSliuQsIRCXc5sl7nT3U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8PNVQpL5T3l1XeGp8qGm34LDNAybocxE3+6uG6ee8t4MXWRGGF3BLHW2mv3RJkIb
	 G7rUH+p6QbRnTcqs8T0Od6dcCpIEdjtaAXBh6vnEUHqc/113LVYiHUVd1PMJ2LHBAb
	 /p5Iiu4y0WMpLrMLOgQw/rhzfxL3bM7cCRin+J0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EADF80507;
	Fri,  4 Mar 2022 21:45:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B38D4F80224; Fri,  4 Mar 2022 21:45:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BD3BF80139
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BD3BF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eheYzapI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646426751; x=1677962751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ycMz45PpTPplJLbzFKn/UbdSliuQsIRCXc5sl7nT3U=;
 b=eheYzapI4WdduatQ5+6UKEj5Vpo0dpbR0MDltXMyfwwFHHgqNHrsDg40
 7dU5sTdD5wNw8xkKqCVKrcI3uYhTdEA9oAoVHAHcMSdSmLft514NX5Nzb
 8eseB5xzwSzUAR90VDkMOJvy8kEhgATDcQAO3VhNoF86efcKzlAiIetqO
 GOU5DDw9dQux81qH51YnQ6IrB8iq/R8SnvmZCVS+p4PATUbmh3JeQTLB5
 az4uTScxs5y2qlEJh04sKF9vihmUhRrLdyjSTMQnXhvkFg9sG3GQzugJq
 /H4RehJqPmmFM66eSfuFPkMDMdew9zwqZeGd7NKZg/IYwvSv7KOMwY+eg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="314776823"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="314776823"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="640695969"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: boards: remove explicit dependency on
 GPIOLIB when DMIC is used"
Date: Fri,  4 Mar 2022 14:45:30 -0600
Message-Id: <20220304204532.54675-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
References: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

This patch reverts commit 4262ddc2ad63 ("ASoC: Intel: boards: add
explicit dependency on GPIOLIB when DMIC is used") and all follow-up
additions of this dependency.

Now that the DMIC does not depend on GPIOLIB we can simplify again.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 37 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index da59504d2322..b0baf3fce05b 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -242,7 +242,7 @@ if SND_SOC_INTEL_SKL
 
 config SND_SOC_INTEL_SKL_RT286_MACH
 	tristate "SKL with RT286 I2S mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT286
 	select SND_SOC_DMIC
@@ -255,7 +255,7 @@ config SND_SOC_INTEL_SKL_RT286_MACH
 
 config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 	tristate "SKL with NAU88L25 and SSM4567 in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_NAU8825
 	select SND_SOC_SSM4567
@@ -269,7 +269,7 @@ config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 
 config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
 	tristate "SKL with NAU88L25 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_NAU8825
 	select SND_SOC_MAX98357A
@@ -300,7 +300,7 @@ if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A/MAX98390 in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -312,7 +312,7 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_BXT_RT298_MACH
 	tristate "Broxton with RT298 I2S mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT298
 	select SND_SOC_DMIC
@@ -345,7 +345,7 @@ if SND_SOC_INTEL_KBL
 
 config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
 	tristate "KBL with RT5663 and MAX98927 in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
@@ -377,7 +377,7 @@ config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
 
 config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	help
@@ -387,7 +387,7 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 	tristate "KBL with DA7219 and MAX98927 in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98927
@@ -417,7 +417,7 @@ if SND_SOC_SOF_GEMINILAKE
 
 config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -429,7 +429,7 @@ config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	tristate "GLK with RT5682 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_RT5682_I2C
@@ -451,7 +451,6 @@ if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "Skylake+ with HDA Codecs"
 	depends on SND_HDA_CODEC_HDMI
-	depends on GPIOLIB
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_DMIC
@@ -468,7 +467,7 @@ endif ## SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 if SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
 config SND_SOC_INTEL_SOF_RT5682_MACH
 	tristate "SOF with rt5682 codec in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
@@ -537,7 +536,7 @@ config SND_SOC_INTEL_SOF_ES8336_MACH
 
 config SND_SOC_INTEL_SOF_NAU8825_MACH
 	tristate "SOF with nau8825 codec in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
 		    (MFD_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_NAU8825
@@ -560,7 +559,7 @@ if (SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
@@ -571,7 +570,7 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	tristate "CML with RT1011 and RT5682 in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_RT1011
@@ -591,7 +590,7 @@ if SND_SOC_SOF_JASPERLAKE
 
 config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	tristate "SOF with DA7219 and MAX98373/MAX98360A in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
@@ -608,7 +607,7 @@ endif ## SND_SOC_SOF_JASPERLAKE
 
 config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	tristate "SOF with amplifiers in I2S Mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_RT1308
 	select SND_SOC_CS35L41_I2C
@@ -627,7 +626,7 @@ if SND_SOC_SOF_ELKHARTLAKE
 
 config SND_SOC_INTEL_EHL_RT5660_MACH
 	tristate "EHL with RT5660 in I2S mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_RT5660
@@ -643,7 +642,7 @@ if SND_SOC_SOF_INTEL_SOUNDWIRE
 
 config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	tristate "SoundWire generic machine driver"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
-- 
2.30.2

