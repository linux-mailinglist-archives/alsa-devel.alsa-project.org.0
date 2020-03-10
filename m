Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679BB18061D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 19:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FCDF82E;
	Tue, 10 Mar 2020 19:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FCDF82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583864508;
	bh=ZjnPkYeZMBvNHVU26S0y5RASSi+rQ7ptj9Q/eltBmDM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GGaDGydcBwtzFy9MuVrSAuKLMjnuHAv+uw3Dx7ssqUhXBKMxAfSTMNPW6XT0u5W87
	 1x1CkKKnAU3QLJvCbun3SsCj24VJKmpEGJhfdHUPOvE8Woq35L2PP5yrv6z9z7HY6T
	 Hx1jHIgydmETBgyaQuTx0PdWRBrUxreLkJRfSHcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 147B9F80123;
	Tue, 10 Mar 2020 19:19:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 882E9F80247; Tue, 10 Mar 2020 19:19:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9BDAAF8021C
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 19:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDAAF8021C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F30530E;
 Tue, 10 Mar 2020 11:19:19 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F573F534;
 Tue, 10 Mar 2020 11:19:18 -0700 (PDT)
Date: Tue, 10 Mar 2020 18:19:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: rt5682-sdw: fix 'defined but not used' pm functions"
 to the asoc tree
In-Reply-To: <20200310163509.14466-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200310163509.14466-4-pierre-louis.bossart@linux.intel.com>
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

   ASoC: rt5682-sdw: fix 'defined but not used' pm functions

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

From 724cc62f7a71e3a04112126806c62d9c639ab92c Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 10 Mar 2020 11:35:09 -0500
Subject: [PATCH] ASoC: rt5682-sdw: fix 'defined but not used' pm functions

Gcc reports the following warnings:

sound/soc/codecs/rt5682-sdw.c:286:12: warning: 'rt5682_dev_resume'
defined but not used [-Wunused-function]
 static int rt5682_dev_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~

sound/soc/codecs/rt5682-sdw.c:273:12: warning: 'rt5682_dev_suspend'
defined but not used [-Wunused-function]
 static int rt5682_dev_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~

Fix by adding maybe_unused as done for other SoundWire codecs

Fixes: 03f6fc6de9192f ('ASoC: rt5682: Add the soundwire support')
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Link: https://lore.kernel.org/r/20200310163509.14466-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 1d6963dd6403..a2d1d3ae1e31 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -270,7 +270,7 @@ static const struct sdw_device_id rt5682_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt5682_id);
 
-static int rt5682_dev_suspend(struct device *dev)
+static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
 
@@ -283,7 +283,7 @@ static int rt5682_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int rt5682_dev_resume(struct device *dev)
+static int __maybe_unused rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-- 
2.20.1

