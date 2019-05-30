Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7252FB30
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 13:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76AFA950;
	Thu, 30 May 2019 13:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76AFA950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559217232;
	bh=aWZvCMAhQp8NVSqINrig3IAxOzsId3JLa4LzElTGzUU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8cSKV6MEgRCGwDteAeKX+wXPPcQHFs4EXCb18ZfzGDo4km04wgI41mNm5OhA6F6W
	 7B59ZS8Zqky8IbvsTIajv32DYb92c3OmR399HqU9XuOnmS6oIyo+CgYROb25jj6Fya
	 KCwbiogS1LlqBJhcXvPCaRxzNs2lmaoEVRLuQxyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCE7CF8972C;
	Thu, 30 May 2019 13:50:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A01F8972B; Thu, 30 May 2019 13:50:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3B04F80C1B
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 13:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B04F80C1B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 04:50:36 -0700
X-ExtLoop1: 1
Received: from rjcavan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.141.25])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2019 04:50:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 30 May 2019 06:50:12 -0500
Message-Id: <20190530115015.5677-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
References: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: kbuild test robot <lkp@intel.com>, tiwai@suse.de,
 Randy Dunlap <rdunlap@infradead.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/5] ASoc: fix
	sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64
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

skl-ssp-clk.c does not build on IA64 because the driver
uses the common clock interface, so make the driver depend
on COMMON_CLK.

Fixes this build error:
../sound/soc/intel/skylake/skl-ssp-clk.c:26:16: error: field 'hw' has incomplete type
  struct clk_hw hw;
                ^~
[Corrections for SKL support by Pierre Bossart]

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/intel/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index b089ed3bf77f..a3cf47d09816 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -104,6 +104,7 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
 config SND_SOC_INTEL_SKYLAKE
 	tristate "All Skylake/SST Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKL
 	select SND_SOC_INTEL_APL
 	select SND_SOC_INTEL_KBL
@@ -120,6 +121,7 @@ config SND_SOC_INTEL_SKYLAKE
 config SND_SOC_INTEL_SKL
 	tristate "Skylake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel Skylake platform with the DSP enabled
@@ -128,6 +130,7 @@ config SND_SOC_INTEL_SKL
 config SND_SOC_INTEL_APL
 	tristate "Broxton/ApolloLake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel Broxton/ApolloLake platform with the DSP
@@ -136,6 +139,7 @@ config SND_SOC_INTEL_APL
 config SND_SOC_INTEL_KBL
 	tristate "Kabylake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel Kabylake platform with the DSP
@@ -144,6 +148,7 @@ config SND_SOC_INTEL_KBL
 config SND_SOC_INTEL_GLK
 	tristate "GeminiLake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel GeminiLake platform with the DSP
@@ -152,6 +157,7 @@ config SND_SOC_INTEL_GLK
 config SND_SOC_INTEL_CNL
 	tristate "CannonLake/WhiskyLake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel CNL/WHL platform with the DSP
@@ -160,6 +166,7 @@ config SND_SOC_INTEL_CNL
 config SND_SOC_INTEL_CFL
 	tristate "CoffeeLake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel CoffeeLake platform with the DSP
@@ -168,6 +175,7 @@ config SND_SOC_INTEL_CFL
 config SND_SOC_INTEL_CML_H
 	tristate "CometLake-H Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel CometLake-H platform with the DSP
@@ -176,6 +184,7 @@ config SND_SOC_INTEL_CML_H
 config SND_SOC_INTEL_CML_LP
 	tristate "CometLake-LP Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel CometLake-LP platform with the DSP
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
