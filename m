Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215C28FB3
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 05:47:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A12D1694;
	Fri, 24 May 2019 05:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A12D1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558669641;
	bh=x+tT+kU67k7etIVSmgg/2JizlbUBR2YXbZLCLlrJXO8=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BQA0KIzE7Zh9w6SJr2FbHBjzHtWg7AGGTRWADBkJHJ9zDzRQldLXtAnsR9AG9qTg6
	 /b+nm2uErdorZgh9SG5hf52yYUgzbQX87Q4Xr7RueqoTDHSDJyNT+eOc8Brf4IBL21
	 SZBpiROQMNsFVL9WsiJir4hXgvgbuLBZo3INdL8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2A9F89633;
	Fri, 24 May 2019 05:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4756F89630; Fri, 24 May 2019 05:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E72F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 05:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E72F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=infradead.org header.i=@infradead.org header.b="ilqI/cDR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KivctEZd29bcxFDatHTQkCC5nkJlOomPusCVubeDICg=; b=ilqI/cDRAtlshwgWVY6/n6GaCe
 ybw/acFU1TXkzfK4bJuLzPso6M7U2CzKRlZW5KpOtfwuPTcMI7zoeVFpYbrTOcRBmug03AmhQhVy5
 wvnlDTTsXb4AvyQgRUh3N1Df7lsWGaPR3dR316khQfU5ut+B2fnae1D390qZxXAD7c3GG65XhXoyH
 s5pxyqxlxsx2O2eksApW4KrCNu3x9mD+PaeCj66mPNxnBMBland/AUboykDk+4PIauZjlDiWzsapl
 U/cHe/+wm9dEn9JaY8k8UKUPratU6ybIB+wmR3YFPuRUccEsFK6K7d7iuz6o7NPEQcWtMQT9HKY/2
 2M7VO+nA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU193-0003IK-8j; Fri, 24 May 2019 03:45:25 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <03640e4f-1f8e-9090-c03b-364918e633d3@infradead.org>
Date: Thu, 23 May 2019 20:45:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2] ASoC: drop COMPILE_TEST for
 sound/soc/intel/boards/ that use X86_INTEL_LPSS
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

From: Randy Dunlap <rdunlap@infradead.org>

This is a partial revert of 164a263bf8d0, which causes build errors
on non-X86 platforms (specifically seen on IA64) when COMPILE_TEST
is set/enabled.

Fixes these build errors (on ia64):
i../sound/soc/intel/boards/bxt_da7219_max98357a.c:19:10: fatal error: asm/cpu_device_id.h: No such file or directory
 #include <asm/cpu_device_id.h>
../sound/soc/intel/boards/bytcr_rt5640.c:31:10: fatal error: asm/cpu_device_id.h: No such file or directory
 #include <asm/cpu_device_id.h>
../sound/soc/intel/boards/bytcr_rt5651.c:33:10: fatal error: asm/cpu_device_id.h: No such file or directory
 #include <asm/cpu_device_id.h>
../sound/soc/intel/boards/cht_bsw_rt5645.c:29:10: fatal error: asm/cpu_device_id.h: No such file or directory
 #include <asm/cpu_device_id.h>
../sound/soc/intel/boards/bytcht_es8316.c:33:10: fatal error: asm/cpu_device_id.h: No such file or directory
 #include <asm/cpu_device_id.h>
../sound/soc/intel/boards/bytcht_da7213.c:26:10: fatal error: asm/platform_sst_audio.h: No such file or directory
 #include <asm/platform_sst_audio.h>

Fixes: 164a263bf8d0 ("ASoC: Intel: Make boards more available for compile test")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/intel/boards/Kconfig |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

--- lnx-52-rc1.orig/sound/soc/intel/boards/Kconfig
+++ lnx-52-rc1/sound/soc/intel/boards/Kconfig
@@ -18,7 +18,7 @@ config SND_SOC_INTEL_HASWELL_MACH
 	tristate "Haswell Lynxpoint"
 	depends on I2C
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_RT5640
 	help
 	  This adds support for the Lynxpoint Audio DSP on Intel(R) Haswell
@@ -35,7 +35,7 @@ config SND_SOC_INTEL_BDW_RT5677_MACH
 	depends on I2C
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
 	depends on GPIOLIB || COMPILE_TEST
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_RT5677
 	help
 	  This adds support for Intel Broadwell platform based boards with
@@ -47,7 +47,7 @@ config SND_SOC_INTEL_BROADWELL_MACH
 	tristate "Broadwell Wildcatpoint"
 	depends on I2C
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_RT286
 	help
 	  This adds support for the Wilcatpoint Audio DSP on Intel(R) Broadwell
@@ -61,7 +61,7 @@ if SND_SOC_INTEL_BAYTRAIL
 config SND_SOC_INTEL_BYT_MAX98090_MACH
 	tristate "Baytrail with MAX98090 codec"
 	depends on I2C
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_MAX98090
 	help
 	  This adds audio driver for Intel Baytrail platform based boards
@@ -72,7 +72,7 @@ config SND_SOC_INTEL_BYT_MAX98090_MACH
 config SND_SOC_INTEL_BYT_RT5640_MACH
 	tristate "Baytrail with RT5640 codec"
 	depends on I2C
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_RT5640
 	help
 	  This adds audio driver for Intel Baytrail platform based boards
@@ -86,7 +86,7 @@ if SND_SST_ATOM_HIFI2_PLATFORM || SND_SO
 config SND_SOC_INTEL_BYTCR_RT5640_MACH
 	tristate "Baytrail and Baytrail-CR with RT5640 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_RT5640
 	help
@@ -98,7 +98,7 @@ config SND_SOC_INTEL_BYTCR_RT5640_MACH
 config SND_SOC_INTEL_BYTCR_RT5651_MACH
 	tristate "Baytrail and Baytrail-CR with RT5651 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_RT5651
 	help
@@ -110,7 +110,7 @@ config SND_SOC_INTEL_BYTCR_RT5651_MACH
 config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 	tristate "Cherrytrail & Braswell with RT5672 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_RT5670
         help
@@ -122,7 +122,7 @@ config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 config SND_SOC_INTEL_CHT_BSW_RT5645_MACH
 	tristate "Cherrytrail & Braswell with RT5645/5650 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_RT5645
 	help
@@ -134,7 +134,7 @@ config SND_SOC_INTEL_CHT_BSW_RT5645_MACH
 config SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH
 	tristate "Cherrytrail & Braswell with MAX98090 & TI codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
 	help
@@ -146,7 +146,7 @@ config SND_SOC_INTEL_CHT_BSW_MAX98090_TI
 config SND_SOC_INTEL_CHT_BSW_NAU8824_MACH
 	tristate "Cherrytrail & Braswell with NAU88L24 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_NAU8824
 	help
@@ -158,7 +158,7 @@ config SND_SOC_INTEL_CHT_BSW_NAU8824_MAC
 config SND_SOC_INTEL_BYT_CHT_DA7213_MACH
 	tristate "Baytrail & Cherrytrail with DA7212/7213 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_DA7213
 	help
@@ -170,7 +170,7 @@ config SND_SOC_INTEL_BYT_CHT_DA7213_MACH
 config SND_SOC_INTEL_BYT_CHT_ES8316_MACH
 	tristate "Baytrail & Cherrytrail with ES8316 codec"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	select SND_SOC_ACPI
 	select SND_SOC_ES8316
 	help
@@ -186,7 +186,7 @@ if SND_SST_ATOM_HIFI2_PLATFORM
 config SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH
 	tristate "Baytrail & Cherrytrail platform with no codec (MinnowBoard MAX, Up)"
 	depends on I2C && ACPI
-	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86_INTEL_LPSS
 	help
 	  This adds support for ASoC machine driver for the MinnowBoard Max or
 	  Up boards and provides access to I2S signals on the Low-Speed
@@ -248,7 +248,7 @@ if SND_SOC_INTEL_APL
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on MFD_INTEL_LPSS
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
