Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75919AD95
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 12:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EF41679;
	Fri, 23 Aug 2019 12:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EF41679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566557285;
	bh=84szn8hoexZzous/CBqOGoIerPhLzy5WCFU0QrasLyM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JPDcagQQfBWBPAkGSgzPHUDk0z/jlzcsiJXDqLCb7tnqbrtiQvV5vmPyNaM/kCsfF
	 TGH/wc6FFEpPD//Ge75YABhLlm06QczzAnT8TkSqHaW1kJTdj0Ts7k1luhTCCW7eJN
	 8VKPNupPJgLqQdRq09TU4pPU4aTBFay5AXiW4txE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA18F80306;
	Fri, 23 Aug 2019 12:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83481F80306; Fri, 23 Aug 2019 12:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0C24F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 12:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C24F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="b6G2HSuu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4EmsFhEhdGYZTOf6/KRDGTHQpSNZW0fkfUigWejamSU=; b=b6G2HSuuDeCd
 TO2v2sZzPY3PA4+mK7z8P87v1sl8BEhz0RPCTC1fTPO0K6SsNycQJPXMl65yurPU+mwrKvxhBHVvM
 irZOHifNaC6O+98g0UvD86tCDU9WLXhRfSN03RQiIwVZ8L16tu+94zBAEByn6mEu8pepWMre7FS7x
 lqHSs=;
Received: from [92.54.175.117] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i175C-0002tR-Ei; Fri, 23 Aug 2019 10:46:14 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2832CD02CD0; Fri, 23 Aug 2019 11:46:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9uo7lc3.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190823104614.2832CD02CD0@fitzroy.sirena.org.uk>
Date: Fri, 23 Aug 2019 11:46:14 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: rename
	soc_post_component_init() to soc_rtd_init()" to the asoc tree
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

   ASoC: soc-core: rename soc_post_component_init() to soc_rtd_init()

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

From 542694df7511977c3baa6ba855126a0cce883977 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 23 Aug 2019 09:58:32 +0900
Subject: [PATCH] ASoC: soc-core: rename soc_post_component_init() to
 soc_rtd_init()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

From function name point of view, "soc_post_component_init()" sounds
like "component initialize function".
But in reality it is rtd setup function.

This patch renames soc_post_component_init() to soc_rtd_init()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v9uo7lc3.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0af83963289f..3c087b478398 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1340,13 +1340,12 @@ static int soc_probe_component(struct snd_soc_card *card,
 	return ret;
 }
 
-static void rtd_release(struct device *dev)
+static void soc_rtd_release(struct device *dev)
 {
 	kfree(dev);
 }
 
-static int soc_post_component_init(struct snd_soc_pcm_runtime *rtd,
-	const char *name)
+static int soc_rtd_init(struct snd_soc_pcm_runtime *rtd, const char *name)
 {
 	int ret = 0;
 
@@ -1355,7 +1354,7 @@ static int soc_post_component_init(struct snd_soc_pcm_runtime *rtd,
 	if (!rtd->dev)
 		return -ENOMEM;
 	rtd->dev->parent = rtd->card->dev;
-	rtd->dev->release = rtd_release;
+	rtd->dev->release = soc_rtd_release;
 	rtd->dev->groups = soc_dev_attr_groups;
 	dev_set_name(rtd->dev, "%s", name);
 	dev_set_drvdata(rtd->dev, rtd);
@@ -1483,7 +1482,7 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 			return ret;
 	}
 
-	ret = soc_post_component_init(rtd, dai_link->name);
+	ret = soc_rtd_init(rtd, dai_link->name);
 	if (ret)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
