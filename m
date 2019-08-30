Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CBA35FC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C65167F;
	Fri, 30 Aug 2019 13:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C65167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567165668;
	bh=y+iDU71iqyNtSXKn0GtSKGRnv506jpsgengN6pwD+yo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p5FN8y/HR7PrsUWAWSlr0W+h7SJSJK8eGHdgrljfElE04mKudA+0+Fp5cGqeSirH5
	 nAp3eyhbvkMukdurrOD/ZwkUDiwXH8h03bR3odSmsNerW4psZwhbUHL3y0R0/kb6Ez
	 i8eEGMMNlXkSc045Qt3KBl+6bQUAdpsA4p0QK+q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF72F805FF;
	Fri, 30 Aug 2019 13:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9F4CF805F5; Fri, 30 Aug 2019 13:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7598F800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7598F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HzBfUHiW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/u21Yi9w8sfz2o1BnA3bhqU2LzbCx7nl17xXA043Pls=; b=HzBfUHiWb3v0
 HpuHrZ8o0RrELz7URm0b9Cq1fmygDaszbYY/Whwz6QrjqeudONo7P2YXoM31DZQSZCt8TNTNxQu/+
 Qy0rC8c7Dt+wO2ttG94PvA/32JzHpg79H3FHuB6Pi3vw1YJb+/AXsE3+f/iR+aVhaynDz/NP6xikD
 GP3B0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3fLC-0006IS-4w; Fri, 30 Aug 2019 11:45:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A30672742B61; Fri, 30 Aug 2019 12:45:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190829214213.11653-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190830114517.A30672742B61@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 12:45:17 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [alsa-devel] Applied "ASoC: SOF/Intel: fix selection of
	SND_INTEL_NHTL" to the asoc tree
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

   ASoC: SOF/Intel: fix selection of SND_INTEL_NHTL

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

From 37638af8135c44e9c9e4b2744eadfd3839efc023 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 29 Aug 2019 16:42:13 -0500
Subject: [PATCH] ASoC: SOF/Intel: fix selection of SND_INTEL_NHTL

We should only select SND_INTEL_NHLT when ACPI is defined. This was
done for the legacy HDAudio driver but not for DSP-enabled cases,
leading to compilation errors with randconfig.

Fix by aligning on the same solution.

For the Skylake driver this is overkill since there is a top-level
dependency on ACPI, but it doesn't hurt and it's better to have
consistency.

Fixes: 68b953aeb50d9 ('ASoC: SOF: Intel: hda: fixup HDaudio topology name with DMIC number')
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190829214213.11653-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/Kconfig     | 2 +-
 sound/soc/sof/intel/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index a3ec17fd63cd..01c99750212a 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -215,7 +215,7 @@ config SND_SOC_INTEL_SKYLAKE_COMMON
 	select SND_SOC_INTEL_SST
 	select SND_SOC_HDAC_HDA if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
 	select SND_SOC_ACPI_INTEL_MATCH
-	select SND_INTEL_NHLT
+	select SND_INTEL_NHLT if ACPI
 	help
 	  If you have a Intel Skylake/Broxton/ApolloLake/KabyLake/
 	  GeminiLake or CannonLake platform with the DSP enabled in the BIOS
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 889b6202d054..479ba249e219 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -286,7 +286,7 @@ config SND_SOC_SOF_HDA
 	tristate
 	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
 	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
-	select SND_INTEL_NHLT
+	select SND_INTEL_NHLT if ACPI
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
