Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91E84D70
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A78641671;
	Wed,  7 Aug 2019 15:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A78641671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565184918;
	bh=5hw9eAxnixUnXuB74Wdpen6wpPdJU3/bE7pp4qJCCKs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mrWARDRjzEbI8SdxZe944dIINGfqqueLYzRghqcFhatuzfLYOd84n1bwxJ7ZFO9NX
	 C2gvoaaZ43K7ds6hW6UlNXaoX/rGofHwnTZpCHBVFJR1NHnOBM33v3uCT4tW7QULai
	 em420d9rBRH4BUYZKG0kYCLm+15fLKcYeSBgfDn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74565F80636;
	Wed,  7 Aug 2019 15:31:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43BBAF8053A; Wed,  7 Aug 2019 15:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C7BF80227
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C7BF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="N5BaaN64"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/Z3ymyRry+tH6iFU1YY+UP4rf09vGIZhzFoWELvWoTM=; b=N5BaaN64UngD
 pK9g3dy7KMdC2Ra67MEiftzn4f7A5Jyx9ZVixqAmA2NjlW1BPYG/P8nfsj47T9hy7zDthVNW+H4eR
 AESKitmmPYERRW4Jf4Fh5Y+ANALiidqy6nWA2Okk8kvYLygump+A279K7U1q704vsZCh7ZmNwfOzp
 UEss8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1g-0007fI-Nv; Wed, 07 Aug 2019 13:30:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 18F042743057; Wed,  7 Aug 2019 14:30:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h86tahp2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133048.18F042743057@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:48 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: reuse rtdcom at
	snd_soc_rtdcom_add()" to the asoc tree
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

   ASoC: soc-core: reuse rtdcom at snd_soc_rtdcom_add()

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

From 32d2c172fe88705058310635a732259c0a98e89b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 7 Aug 2019 10:30:47 +0900
Subject: [PATCH] ASoC: soc-core: reuse rtdcom at snd_soc_rtdcom_add()

snd_soc_rtdcom_add() is using both "rtdcom" and "new_rtdcom" as
variable name, but these are not used at same time.
Let's reuse rtdcom.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87h86tahp2.wl-kuninori.morimoto.gx@renesas.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e176b972e4e6..d12054ab8741 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -274,7 +274,6 @@ static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 			      struct snd_soc_component *component)
 {
 	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_rtdcom_list *new_rtdcom;
 
 	for_each_rtdcom(rtd, rtdcom) {
 		/* already connected */
@@ -282,14 +281,14 @@ static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 			return 0;
 	}
 
-	new_rtdcom = kmalloc(sizeof(*new_rtdcom), GFP_KERNEL);
-	if (!new_rtdcom)
+	rtdcom = kmalloc(sizeof(*rtdcom), GFP_KERNEL);
+	if (!rtdcom)
 		return -ENOMEM;
 
-	new_rtdcom->component = component;
-	INIT_LIST_HEAD(&new_rtdcom->list);
+	rtdcom->component = component;
+	INIT_LIST_HEAD(&rtdcom->list);
 
-	list_add_tail(&new_rtdcom->list, &rtd->component_list);
+	list_add_tail(&rtdcom->list, &rtd->component_list);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
