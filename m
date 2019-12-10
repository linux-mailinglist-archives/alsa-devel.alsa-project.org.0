Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE171189E7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D6A7166F;
	Tue, 10 Dec 2019 14:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D6A7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984832;
	bh=u3gEP4z7rYrmaYDK6fhnpii/Ec5KaejvTZIXmFQUbKA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gI0p+ndBQijq/2WCErxB0dxyHVaPX4Mew4zSpST2HkiY68F+CMPu+v5G0uCKo65LG
	 HRwgWRTyXw74yivSUOTtRskHT643B7MdRrvMiPhOswSgi9UoxhdA+gIu0VKC/gsuam
	 2xNYtjwhnHSASFRzfHTp16b/PE/Krrfl7Hpp5K/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB673F80317;
	Tue, 10 Dec 2019 14:23:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 511CCF802FE; Tue, 10 Dec 2019 14:23:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1008CF802E8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1008CF802E8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26C23328;
 Tue, 10 Dec 2019 05:23:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B2173F52E;
 Tue, 10 Dec 2019 05:23:06 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eexdyq6p.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87eexdyq6p.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove
	snd_soc_disconnect_sync()" to the asoc tree
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

   ASoC: soc-core: remove snd_soc_disconnect_sync()

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

From b553bd238da23041bf39110e58ee80f8efe034e0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 10 Dec 2019 09:33:50 +0900
Subject: [PATCH] ASoC: soc-core: remove snd_soc_disconnect_sync()

Sound card disconnecting operation was needed when "sound driver" was
unbinded without unbinding "sound card".
In such case, sound driver should be stopped even though it was
playbacking/capturing. Otherwise clock open/close counter mismatch happen.

One headache was that we can't skip unbind in error case because unbind
operation doesn't check return value from each drivers.
snd_soc_disconnect_sync() was added for these purpose, and Renesas
sound card only is used it.

But now, ALSA SoC automatically disconnect sound card when sound driver
was unbinded. Thus, snd_soc_disconnect_sync() is no longer needed.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87eexdyq6p.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c |  2 --
 sound/soc/soc-core.c     | 12 ------------
 2 files changed, 14 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index d20f03dfdee6..6aac25095218 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1819,8 +1819,6 @@ static int rsnd_remove(struct platform_device *pdev)
 	};
 	int ret = 0, i;
 
-	snd_soc_disconnect_sync(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
 
 	for_each_rsnd_dai(rdai, priv, i) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9483bfe17260..0d436a2560e4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1444,18 +1444,6 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_disconnect_sync(struct device *dev)
-{
-	struct snd_soc_component *component =
-			snd_soc_lookup_component(dev, NULL);
-
-	if (!component || !component->card)
-		return;
-
-	snd_card_disconnect_sync(component->card->snd_card);
-}
-EXPORT_SYMBOL_GPL(snd_soc_disconnect_sync);
-
 static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
 				struct snd_soc_pcm_runtime *rtd)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
