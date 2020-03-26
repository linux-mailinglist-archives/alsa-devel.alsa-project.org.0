Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8119473D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:13:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464A91665;
	Thu, 26 Mar 2020 20:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464A91665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585250008;
	bh=YYyOWLP8tyPsNmFcriLMMo1ASAi/gAQeqJtLDHLDU24=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=J4JkCcfCYhOFMrQ9gOITPfGpasnG+z1vkY/9z6Igpim0NeqSKUNodpjHtokR51B48
	 MfkB7AKcRL/ZLYQqJEL537IxpN8ubZvh3QzBPtKq5BCe3/xuBoJUscZT01Cy32b3Jf
	 D/Odk3r9RHQE7oHauUAxXPGUIYYIRr0m3xm5qJDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FFCF80316;
	Thu, 26 Mar 2020 20:05:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88CC5F80315; Thu, 26 Mar 2020 20:05:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D1D4F802FE
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1D4F802FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D40537FA;
 Thu, 26 Mar 2020 12:05:37 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 586DC3F71F;
 Thu, 26 Mar 2020 12:05:37 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
Subject: Applied "ASoC: Intel: Make glk+rt5682 echo ref dynamic" to the asoc
 tree
In-Reply-To: <20200325213245.28247-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325213245.28247-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: Intel: Make glk+rt5682 echo ref dynamic

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

From d60b55c9edaed31e8e0c961f42237dcb5c83deb8 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Wed, 25 Mar 2020 16:32:42 -0500
Subject: [PATCH] ASoC: Intel: Make glk+rt5682 echo ref dynamic

Without the dynamic flag to allow runtime routing, the card cannot
probe on chromebooks because SOF is constantly waiting for the link.
Adding flag back to allow upstream kernels to work on rt5682 based
chromebooks since SOF can now ignore the hard coded front end.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325213245.28247-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index ea1de8b3f3cd..3c576b33b9c6 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -409,6 +409,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.init = NULL,
 		.capture_only = 1,
 		.nonatomic = 1,
+		.dynamic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_REF_CP] = {
-- 
2.20.1

