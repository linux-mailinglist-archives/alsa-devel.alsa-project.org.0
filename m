Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44153180621
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 19:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D939C1673;
	Tue, 10 Mar 2020 19:21:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D939C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583864524;
	bh=jfOpWR8BMVQBqDwMqmT/maeOMeYmsNkPQCpMyMstRQM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mHBebhdl1CqM+t0mxFIdCDTN3rN1FOEIy3jK3SYOGDy1337l3Q3CqlEAkJFbzsqL3
	 ZFMBlyQisQQcQX0dDg//eM+VpSGV8wOfV57/4CQiM0H7GN6f5u/8hya1OafU/7D/Y0
	 k6MHaqCny38rRETHeuhozjR6+hv5KwptytgOwqCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5A90F8028C;
	Tue, 10 Mar 2020 19:19:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE74F8028B; Tue, 10 Mar 2020 19:19:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 321F5F80260
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 19:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 321F5F80260
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF54630E;
 Tue, 10 Mar 2020 11:19:23 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33FF73F534;
 Tue, 10 Mar 2020 11:19:23 -0700 (PDT)
Date: Tue, 10 Mar 2020 18:19:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: rt5682: fix unmet dependencies" to the asoc tree
In-Reply-To: <20200310163509.14466-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200310163509.14466-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Oder Chiou <oder_chiou@realtek.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild test robot <lkp@intel.com>
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

   ASoC: rt5682: fix unmet dependencies

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

From 5549ea64799784308cc03313a86dea3de56d48ce Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 10 Mar 2020 11:35:07 -0500
Subject: [PATCH] ASoC: rt5682: fix unmet dependencies

The rt5682 code can be used in I2C or SoundWire mode. When I2C is not
selected, we have the following issue:

WARNING: unmet direct dependencies detected for SND_SOC_RT5682
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] &&
  I2C [=n]
  Selected by [m]:
  - SND_SOC_RT5682_SDW [=m] && SOUND [=m] && !UML && SND [=m] &&
    SND_SOC [=m] && SOUNDWIRE [=m]

Fix by adding SOUNDWIRE as a dependency.

Fixes: 03f6fc6de9192f ('ASoC: rt5682: Add the soundwire support')
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Link: https://lore.kernel.org/r/20200310163509.14466-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6aee70ed43df..78be69e9b618 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1135,7 +1135,7 @@ config SND_SOC_RT5677_SPI
 
 config SND_SOC_RT5682
 	tristate
-	depends on I2C
+	depends on I2C || SOUNDWIRE
 
 config SND_SOC_RT5682_SDW
 	tristate "Realtek RT5682 Codec - SDW"
-- 
2.20.1

