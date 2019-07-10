Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20723649CD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:38:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3098816AD;
	Wed, 10 Jul 2019 17:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3098816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562773099;
	bh=5LOngFvhf/ACzoiVQZOqAuWotHxJVMSlEceS8svBdTg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SatagwYIJClDWYOhFxbwEUBbqckszNDMqYgwhjvnLrizb/jsnipy4ET4gufphTFBb
	 FONTrHsU5fw2R/lofGQbxUeD60ntlQMDuICIwoTSPVH08Sk/oRtb5Om0JQ9JZYEJlF
	 3Bv0KJs3JbTqqEIJxSsqiQ1KtKRdQdRxFp3uxX3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81E13F80322;
	Wed, 10 Jul 2019 17:34:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A0BF80362; Wed, 10 Jul 2019 17:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C05EBF802FB
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C05EBF802FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KAavPYlj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=y5hAYx0uO2lcXHWkfn9ovqJ0biIaAn41SrOHMGEklao=; b=KAavPYljoNSQ
 V7KRHyecqJa92fnJ9Bq3t/bCrYIqH2Hyzg5/L/3ZTUa04wTjecopoNuBRJil82Qdq4RutRa8OKI7Q
 2XmBT6fTDlQpxRG6XpxquSo0BYIB2fEyTFGw4gQ52OSBDkhhUi/3z5A7aI8XEmeZaS5E4yAJ+3Fj8
 03cOA=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcL-00083B-EQ; Wed, 10 Jul 2019 15:34:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2C89AD02D84; Wed, 10 Jul 2019 16:34:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muhmgw2o.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190710153449.2C89AD02D84@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:49 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: simple-card-utils: care no Platform for
	DPCM" to the asoc tree
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

   ASoC: simple-card-utils: care no Platform for DPCM

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 794fcee8da3c0c8a01b08ecad1c181cb0a622868 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 10 Jul 2019 17:01:12 +0900
Subject: [PATCH] ASoC: simple-card-utils: care no Platform for DPCM

commit 34614739988ad ("ASoC: soc-core: support dai_link with
platforms_num != 1") supports multi Platform, and
commit 9f3eb91753451 ("ASoC: simple-card-utils: consider CPU-Platform
possibility") removed no Platform from simple-card.

Multi Platform is now checking both Platform name/of_node are NULL case.
But in normal case, DPCM be doesn't have Platform.

asoc_simple_canonicalize_platform() try to use CPU of_node
to Platform (This is needed for DMAEngine platform case),
but it still might be NULL at DPCM be.

This patch try to use no Platform after that if Platform of_node
is still NULL. It can't probe without this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87muhmgw2o.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card-utils.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index ac8678fe55ff..556b1a789629 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -349,6 +349,13 @@ void asoc_simple_canonicalize_platform(struct snd_soc_dai_link *dai_link)
 	/* Assumes platform == cpu */
 	if (!dai_link->platforms->of_node)
 		dai_link->platforms->of_node = dai_link->cpus->of_node;
+
+	/*
+	 * DPCM BE can be no platform.
+	 * Alloced memory will be waste, but not leak.
+	 */
+	if (!dai_link->platforms->of_node)
+		dai_link->num_platforms = 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_platform);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
