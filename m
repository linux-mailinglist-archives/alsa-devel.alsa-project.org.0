Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467CF193314
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF8861679;
	Wed, 25 Mar 2020 22:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF8861679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173163;
	bh=VbNhBOxifWBkyR8n1qu5Bev6b2pUxM/oCDfoSYBFU9o=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Cxhfc685uToTib3hluUwW3vFapO22rWQtd/uq1Lnp62/m1iOsC0l4r++ZWNy4DKQq
	 R3X/5i0hixDnXAoVl8OMwfYf2I9wdadsGMdTP7WgN4gzImGapv+dM2xfbZkI+2Egg4
	 MKLtQ7TEhjmOFD3GCyh50GjsHzIBqodEmJQ7gRDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C16F7F802BC;
	Wed, 25 Mar 2020 22:49:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE315F80273; Wed, 25 Mar 2020 22:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 20AF4F8028B
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20AF4F8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0B9D31B;
 Wed, 25 Mar 2020 14:33:47 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DA5C3F71E;
 Wed, 25 Mar 2020 14:33:42 -0700 (PDT)
Date: Wed, 25 Mar 2020 21:33:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy
 components" to the asoc tree
In-Reply-To: <20200325131611.545-4-cezary.rojewski@intel.com>
Message-Id: <applied-20200325131611.545-4-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux@dominikbrodowski.net, tiwai@suse.com
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

   ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy components

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

From f25e203070e5b12e4db366ee99b86f33a968f1ae Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Wed, 25 Mar 2020 14:16:11 +0100
Subject: [PATCH] ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy
 components

Recent series of patches targeting broadwell boards, while enabling
SOF, changed behavior for non-SOF solutions. In essence replacing
platform 'dummy' with actual 'platform' causes redundant stream
initialization to occur during audio start. hw_params for haswell-pcm
destroys initial stream right after its creation - only to recreate it
again from proceed from there.

While harmless so far, this flow isn't right and should be corrected.
The actual need for dummy components for SSP0 link is questionable but
that issue is subject for another series.

Fixes: a40acc6bfceb ("ASoC: Intel: bdw-rt5650: change cpu_dai and platform components for SOF")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325131611.545-4-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bdw-rt5650.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 1a302436d450..6cff603d4656 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -226,9 +226,6 @@ SND_SOC_DAILINK_DEF(be,
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
-#else
-SND_SOC_DAILINK_DEF(ssp0_port,
-	    DAILINK_COMP_ARRAY(COMP_DUMMY()));
 #endif
 
 static struct snd_soc_dai_link bdw_rt5650_dais[] = {
@@ -264,7 +261,11 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+		SND_SOC_DAILINK_REG(dummy, be, dummy),
+#else
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
+#endif
 	},
 };
 
-- 
2.20.1

