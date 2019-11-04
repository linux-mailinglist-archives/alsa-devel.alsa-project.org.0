Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EAEE143
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F05A1615;
	Mon,  4 Nov 2019 14:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F05A1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874346;
	bh=dgQ6fXutqnFS+zvRwhjD4N0t7UiXRzvdAlhfrVgDiVo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KKUhXdDyiqCH3NDrFLx3kidjFSFXnCNUn7Ash9TCJSh+PskckhcJE2s5SAOcKeAGh
	 +1nct8H5Y6zxEXlPw/10fp4fFR3e0FxkiAEvlsSVvbjMy536/lEHUUAy6fWeFq7dMz
	 uon7tiEZe7dG+kB4vzj5JHywF3ZY3q6lkMVadm44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 422EBF8065D;
	Mon,  4 Nov 2019 14:27:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DAEFF80634; Mon,  4 Nov 2019 14:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E14AF803F4
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E14AF803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GF6O6XBn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=bGIMPCG3mj1lEsP0tUCAF+UDNdCehqpRYCLphYb/Xmk=; b=GF6O6XBng9lG
 Bd/TLNASSyWAzp8UrrZGklXkKwPfVy0AZzt5R/bOLtLtxhZL54PkNCd+4OvrOxhqOVP4V7FCOOC5d
 4AUInMZerbemDZnVUjV7HCs6pDlJqRF5gR+12OEV/mi3A9QUi/s1i4BKXs2wy9fB3KEh+B9X5IN4w
 PnRes=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO0-0002dv-Gn; Mon, 04 Nov 2019 13:27:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F2F892743193; Mon,  4 Nov 2019 13:27:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191101173045.27099-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132711.F2F892743193@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:11 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] Applied "ASoC: Intel: boards: remove select
	SND_HDA_DSP_LOADER" to the asoc tree
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

   ASoC: Intel: boards: remove select SND_HDA_DSP_LOADER

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 9e7301762f6df44bb4a452b6aecbe0f322b370ee Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 1 Nov 2019 12:30:42 -0500
Subject: [PATCH] ASoC: Intel: boards: remove select SND_HDA_DSP_LOADER

This option is only required with the Skylake platform driver, there
is no reason to have this option in machine drivers. This is
e.g. useless for SOF-based solutions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101173045.27099-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index e591b058f46e..c63070c3a250 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -270,7 +270,6 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
-	select SND_HDA_DSP_LOADER
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
 	   with DA7219 + MAX98357A I2S audio codec.
@@ -284,7 +283,6 @@ config SND_SOC_INTEL_BXT_RT298_MACH
 	select SND_SOC_RT298
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
-	select SND_HDA_DSP_LOADER
 	help
 	   This adds support for ASoC machine driver for Broxton platforms
 	   with RT286 I2S audio codec.
@@ -375,7 +373,6 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
-	select SND_HDA_DSP_LOADER
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
 	   with RT5682 + MAX98357A I2S audio codec.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
