Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE33003E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 18:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB6C16A3;
	Thu, 30 May 2019 18:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB6C16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559234258;
	bh=mRybab0PiJjGqRJPVgezjvi0EZOqwe0K0vTPhTgZWPY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GXPPuBrdULhX37vThNe9EpJEPeRk66QfXgGk4yxr+0W5S39DagLUys0FZJ0eqhNMr
	 +nN4yl98RD5Y0eQwtJ8T27VRhoLAywZJKQgctxve7iVMv/tgx0ALmB6qYqayUtjuGM
	 EXhxQdRl75LuPGnVSrg5G9cbgszC/L2dTJX+EsM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BADD6F8973D;
	Thu, 30 May 2019 18:33:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFB39F8972B; Thu, 30 May 2019 18:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8ABAF8972A
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 18:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8ABAF8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="m/f3wZRR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FNk7iHv8ZMDvZBIShh3emGPCr2PAJYWpE9zG5mdmD0g=; b=m/f3wZRRJU1z
 3JP5eYpjCLqlUeQw6yivUp2wf/KoweIyvsoyewpQrmqjglEuOzvuBXfRhmJ6t0par9ju6BT/aI/jU
 G2iZ3siWfJor/WxpjT8FUUMde+tnHHPfYhDmExq47eJAgx33vMiA9wBx+8sFboPEY4MvrYJ7JgREV
 QlXH8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hWNzM-0007GQ-UM; Thu, 30 May 2019 16:33:12 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3C8BB440046; Thu, 30 May 2019 17:33:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20190530115015.5677-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190530163312.3C8BB440046@finisterre.sirena.org.uk>
Date: Thu, 30 May 2019 17:33:12 +0100 (BST)
Cc: alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>,
 tiwai@suse.de, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] Applied "ASoc: fix
	sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64" to
	the asoc tree
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

   ASoc: fix sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 2c79eeb1aaf2bf0a6d9bb4732596f7dc147cab4d Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 30 May 2019 06:50:12 -0500
Subject: [PATCH] ASoc: fix sound/soc/intel/skylake/slk-ssp-clk.c build error
 on IA64

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
Signed-off-by: Mark Brown <broonie@kernel.org>
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
