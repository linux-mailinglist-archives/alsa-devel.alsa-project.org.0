Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6532FB41
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 13:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78908166F;
	Thu, 30 May 2019 13:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78908166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559217342;
	bh=TYlbYVsl6I9Lpv2zM/Q7nA5rd2U/8085+VwbyTQBS/Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHd+r7/GfpnkoBBa0JvcMkcX0Ax2D5P8TktqwgZhZ8uwOtv5pfTDd1CBM6c01zdGk
	 iqFtxgU5/LTnpzcPZ7TYlGsrnp44tGj1XlCa4Q5/u+CeE3BP+vMhNyXWFOh/VWYzWm
	 h4Vg87D9+NQWCW8HQGczN8aI0gFIoESOdJNP7Qns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D97F8973E;
	Thu, 30 May 2019 13:50:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E3BDF80C1B; Thu, 30 May 2019 13:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F50BF896EB
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 13:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F50BF896EB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 04:50:38 -0700
X-ExtLoop1: 1
Received: from rjcavan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.141.25])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2019 04:50:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 30 May 2019 06:50:14 -0500
Message-Id: <20190530115015.5677-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
References: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/5] ASoC: Intel: boards: Add COMPILE_TEST for
	new machine drivers
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

We recently added COMPILE_TEST but new machine drivers were not
updated. Fix.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 59e366edc16b..7f6e9546e10c 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -157,7 +157,8 @@ config SND_SOC_INTEL_CHT_BSW_NAU8824_MACH
 
 config SND_SOC_INTEL_BYT_CHT_CX2072X_MACH
 	tristate "Baytrail & Cherrytrail with CX2072X codec"
-	depends on X86_INTEL_LPSS && I2C && ACPI
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_CX2072X
 	help
@@ -398,8 +399,8 @@ if SND_SOC_SOF_HDA_COMMON || SND_SOC_SOF_BAYTRAIL
 config SND_SOC_INTEL_SOF_RT5682_MACH
 	tristate "SOF with rt5682 codec in I2S Mode"
 	depends on I2C && ACPI
-	depends on (SND_SOC_SOF_HDA_COMMON && MFD_INTEL_LPSS) ||\
-		   (SND_SOC_SOF_BAYTRAIL && X86_INTEL_LPSS)
+	depends on (SND_SOC_SOF_HDA_COMMON && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
+		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI if SND_SOC_SOF_HDA_COMMON
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
