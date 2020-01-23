Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0D146825
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 13:37:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC111689;
	Thu, 23 Jan 2020 13:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC111689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579783067;
	bh=dWGF20PXLRPXhW4G2xkpO7M5EF3oahBG5FYdHPLXtoQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FQbFv1Z3x/rP/YC+ryCWcSRmN3j3Dyd0ZO2EEZ3BmtmEAKtCQSF5xR72wkNxUPDVh
	 QHy56H3QRfccDfSbaZDGq4N2DT0IOIZeAcGJsXzBlfGWJucIWaTSdzVeTJAhGGQUHC
	 eDUVjWDfIoM9N9brJIBiG5XzI40kvWwy2o/qD52s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA107F800BA;
	Thu, 23 Jan 2020 13:36:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 007FBF801D9; Thu, 23 Jan 2020 13:36:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 261B8F800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 13:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261B8F800BA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EB90328;
 Thu, 23 Jan 2020 04:35:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3C563F6C4;
 Thu, 23 Jan 2020 04:35:55 -0800 (PST)
Date: Thu, 23 Jan 2020 12:35:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhegl3oz.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87zhegl3oz.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove null_snd_soc_ops" to
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

   ASoC: soc-core: remove null_snd_soc_ops

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From d8e2e0d2491e78f3f7b451c3a93ba29950efe2cf Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 22 Jan 2020 09:45:00 +0900
Subject: [PATCH] ASoC: soc-core: remove null_snd_soc_ops

All rtd->dai_link callback functions are controlled by soc_rtd_xxxx(),
and checking rtd->dai_link->ops.
We don't need to have null_snd_soc_ops anymore.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87zhegl3oz.wl-kuninori.morimoto.gx@renesas.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f969a3b8c82b..068d809c349a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -342,8 +342,6 @@ struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
 
-static const struct snd_soc_ops null_snd_soc_ops;
-
 struct snd_soc_pcm_runtime
 *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_link)
@@ -488,8 +486,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 */
 	rtd->card = card;
 	rtd->dai_link = dai_link;
-	if (!rtd->dai_link->ops)
-		rtd->dai_link->ops = &null_snd_soc_ops;
 
 	/* see for_each_card_rtds */
 	list_add_tail(&rtd->list, &card->rtd_list);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
