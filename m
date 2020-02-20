Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73060165F45
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 14:56:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3B816B3;
	Thu, 20 Feb 2020 14:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3B816B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582206965;
	bh=9lFCLhOVRodj8Ld5ZIWhQ/hTVrfF8sQn6WYmCbnM4+k=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sIFmw6L/nBIcGuTtcMXoUKVikpCXDxlaDaRV+olxy7nja0N5g87absU/vBGYREnhg
	 cRRVRJpizDvDUgJO5eb4GmHQAOqydLo0r6IdOPdcEccewm7N6ht6eB1dVK/c4YoKko
	 oxgSJ1uCpxuwZeeEalMCt2zH5dra2mon24Xe3AbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C01EF8014A;
	Thu, 20 Feb 2020 14:54:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6375F80148; Thu, 20 Feb 2020 14:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C3A6BF8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 14:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A6BF8011D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBA5431B;
 Thu, 20 Feb 2020 05:54:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F9673F6CF;
 Thu, 20 Feb 2020 05:54:16 -0800 (PST)
Date: Thu, 20 Feb 2020 13:54:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Applied "ASoC: samsung: Update dependencies for Arizona machine
 drivers" to the asoc tree
In-Reply-To: <20200220125654.7064-1-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200220125654.7064-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com,
 patches@opensource.cirrus.com, rdunlap@infradead.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, s.nawrocki@samsung.com
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

   ASoC: samsung: Update dependencies for Arizona machine drivers

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

From dc7f090d9ab2f36fc404f8d903f806a1b811739e Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 20 Feb 2020 12:56:54 +0000
Subject: [PATCH] ASoC: samsung: Update dependencies for Arizona machine
 drivers

Currently it is possible to get the following bad config:

WARNING: unmet direct dependencies detected for SND_SOC_WM5110
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MFD_WM5110 [=n]

commit ea00d95200d0 ("ASoC: Use imply for SND_SOC_ALL_CODECS")
commit d8dd3f92a6ba ("ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout")

After these two patches the machine drivers still selects the
SND_SOC_WM5110 symbol which doesn't take account of the dependency
added on the MFD_WM5110 symbol, fix this by also adding a dependency on
MFD_WM5110 itself.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200220125654.7064-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 1a0b163ca47b..112911dc271b 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -151,7 +151,7 @@ config SND_SOC_TOBERMORY
 
 config SND_SOC_BELLS
 	tristate "Audio support for Wolfson Bells"
-	depends on MFD_ARIZONA && I2C && SPI_MASTER
+	depends on MFD_ARIZONA && MFD_WM5102 && MFD_WM5110 && I2C && SPI_MASTER
 	depends on MACH_WLF_CRAGG_6410 || COMPILE_TEST
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM5102
@@ -204,7 +204,7 @@ config SND_SOC_ARNDALE
 
 config SND_SOC_SAMSUNG_TM2_WM5110
 	tristate "SoC I2S Audio support for WM5110 on TM2 board"
-	depends on SND_SOC_SAMSUNG && MFD_ARIZONA && I2C && SPI_MASTER
+	depends on SND_SOC_SAMSUNG && MFD_ARIZONA && MFD_WM5110 && I2C && SPI_MASTER
 	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_MAX98504
 	select SND_SOC_WM5110
-- 
2.20.1

