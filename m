Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374B17A636
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:18:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA63167A;
	Thu,  5 Mar 2020 14:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA63167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583414287;
	bh=HH0JA2evtYkdoGmZXwc4Ql9f8IaDIrL7YTIjj9V8pU4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=faR5WU1lHwAqRpcu5IfNPtMDXLftgnW59nskn+kdP3Zq5GJJGIrldY69KAlwL5eXK
	 Jy56cQHrelT5FGUpKPv/R+RfiMCww17VsB+O+txfEUHxetePH7YXi5eIu12UOAUxSl
	 OEWfYaWDFnWzThfyOA7qlTCwuCGZfmkulfOKa/Ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5177F8027B;
	Thu,  5 Mar 2020 14:15:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 867E7F80266; Thu,  5 Mar 2020 14:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 10100F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10100F800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 523F61FB;
 Thu,  5 Mar 2020 05:15:29 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9DDC3F6CF;
 Thu,  5 Mar 2020 05:15:28 -0800 (PST)
Date: Thu, 05 Mar 2020 13:15:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: remove duplicate be check from
 dpcm_add_paths()" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: remove duplicate be check from dpcm_add_paths()

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

From 6e02feb0d2663c1b7caa5e271c2a60e219f0ca07 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 27 Feb 2020 10:54:48 +0900
Subject: [PATCH] ASoC: soc-pcm: remove duplicate be check from
 dpcm_add_paths()

dpcm_add_paths() checks returned be from dpcm_get_be()

	static int dpcm_add_paths(...)
	{
		...
		for_each_dapm_widgets(list, i, widget) {
			...
			be = dpcm_get_be(...);
			...
			/* make sure BE is a real BE */
=>			if (!be->dai_link->no_pcm)
				continue;
			...
		}
		...
	}

But, dpcm_get_be() itself is checking it already.

	dpcm_get_be(...)
	{
		...
		for_each_card_rtds(card, be) {
=>			if (!be->dai_link->no_pcm)
				continue;
			...
			if (...)
=>				return be;
		}

		return NULL
	}

This patch removes duplicate check

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87lfoo7q1j.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c27eb4d5e4c..e3a2c4f7757b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1690,10 +1690,6 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 			continue;
 		}
 
-		/* make sure BE is a real BE */
-		if (!be->dai_link->no_pcm)
-			continue;
-
 		/* don't connect if FE is not running */
 		if (!fe->dpcm[stream].runtime && !fe->fe_compr)
 			continue;
-- 
2.20.1

