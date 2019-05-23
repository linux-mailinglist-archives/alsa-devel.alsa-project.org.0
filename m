Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7118274E3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 06:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678211671;
	Thu, 23 May 2019 06:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678211671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558584074;
	bh=i5mZCfzKDlI8trvobM8yqy42Q8kVmaheq25XNUqHcSE=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z5bMWCBTENupWgTROn9/jnh2C9oc956tfr+8gHPZeZfrGK2cLvARCfZzvm6NHzQq3
	 yCb8EmLH+ZHRxpMRQQcOqQJaKI0N5T39cH3MwlAGAPpjBNzISHA/Amm9QRFs2Gwm0k
	 fAodqFFPHSs12cWAfHM496zcuZdY2WwMW0R4mSyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D153F89718;
	Thu, 23 May 2019 05:59:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7307F89715; Thu, 23 May 2019 05:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C1CF8970D
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 05:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C1CF8970D
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=infradead.org header.i=@infradead.org header.b="TZQYSYwF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aDbPF9xZkOXagZBfL9B86UzehHLgcKweWKApD3cNhgw=; b=TZQYSYwFFkRnA3tn3Kgv68bUY
 phomhkujcgbsK/ybnpYmJnH1dX9cpjYhNmaDAKqRZpRXa8C2xRsFx97c0UyAJm4E2etVVysjNaoWs
 FproNuhyat+3Skkm0BGgkbgI+kTX1gTkIRunxQx6o0nkpMAc4ojEMPDaEMO4x8pEt9oliF97HkQ6o
 lbGFFrU+XnkaM6HbvjpsfP7z3Osecy6Uy1zhznQZF2zJIt2eoZ1MfbyuikhuMhCrBxwfAVo0Lnjfu
 qZsqFsiY9ZbX2mR2IwfRMkJvtCSxDOEbcOVXyJD5SsEwOSFUK//erX62YYLVhqk+PmaijSSuOerXr
 rna1j3v9Q==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTesU-00058P-CB; Thu, 23 May 2019 03:58:50 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <46dc0767-bb21-2b98-90f2-34dd4bcad7c0@infradead.org>
Date: Wed, 22 May 2019 20:58:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: sound/soc/intel/boards: limit some
 drivers to X86 since headers are only in arch/x86/
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

Several drivers in sound/soc/intel/boards/ #include header files
that only exist in arch/x86/include/asm.  This causes build errors,
so make these drivers depend on X86.

Fixes these build errors (on ia64):

../sound/soc/intel/boards/bxt_da7219_max98357a.c:19:10: fatal error: asm/cpu_device_id.h: No such file or directory
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

And more drivers determined by:
> grep "include.*asm.cpu_device_id.h" *.c
bxt_da7219_max98357a.c:#include <asm/cpu_device_id.h>
bytcht_es8316.c:#include <asm/cpu_device_id.h>
bytcr_rt5640.c:#include <asm/cpu_device_id.h>
bytcr_rt5651.c:#include <asm/cpu_device_id.h>
cht_bsw_rt5645.c:#include <asm/cpu_device_id.h>
sof_rt5682.c:#include <asm/cpu_device_id.h>
  and
> grep "include.*asm.platform_sst_audio.h" *.c
bytcht_da7213.c:#include <asm/platform_sst_audio.h>
bytcht_es8316.c:#include <asm/platform_sst_audio.h>

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/intel/boards/Kconfig |    6 ++++++
 1 file changed, 6 insertions(+)

--- lnx-52-rc1.orig/sound/soc/intel/boards/Kconfig
+++ lnx-52-rc1/sound/soc/intel/boards/Kconfig
@@ -87,6 +87,7 @@ config SND_SOC_INTEL_BYTCR_RT5640_MACH
 	tristate "Baytrail and Baytrail-CR with RT5640 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86
 	select SND_SOC_ACPI
 	select SND_SOC_RT5640
 	help
@@ -99,6 +100,7 @@ config SND_SOC_INTEL_BYTCR_RT5651_MACH
 	tristate "Baytrail and Baytrail-CR with RT5651 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86
 	select SND_SOC_ACPI
 	select SND_SOC_RT5651
 	help
@@ -123,6 +125,7 @@ config SND_SOC_INTEL_CHT_BSW_RT5645_MACH
 	tristate "Cherrytrail & Braswell with RT5645/5650 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86
 	select SND_SOC_ACPI
 	select SND_SOC_RT5645
 	help
@@ -159,6 +162,7 @@ config SND_SOC_INTEL_BYT_CHT_DA7213_MACH
 	tristate "Baytrail & Cherrytrail with DA7212/7213 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86
 	select SND_SOC_ACPI
 	select SND_SOC_DA7213
 	help
@@ -171,6 +175,7 @@ config SND_SOC_INTEL_BYT_CHT_ES8316_MACH
 	tristate "Baytrail & Cherrytrail with ES8316 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on X86
 	select SND_SOC_ACPI
 	select SND_SOC_ES8316
 	help
@@ -249,6 +254,7 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on X86
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
