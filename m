Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9799EF5
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:36:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAE386F;
	Thu, 22 Aug 2019 20:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAE386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566498994;
	bh=YNYcRFRSibBNEk6DvIXsFkJ5awyaWl4gVNsoAM7ROEc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=K4nH73IXsV/j6+ACuMx0IO7N1SwnS2m3LZ1v+4zmN/RW9JUZdwEGCFRGwAjhAbV0M
	 B2UMeQEj5YAUknD94pUKtv+JfBTTyxGCrICg/iaUo2YgO2WNBDR3tOZjxqAMrc+QPo
	 H8DWe/BliS1eIWQlYIxu3F9TBxC6EXR5KVSJ7X6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C690F803F3;
	Thu, 22 Aug 2019 20:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA542F805FD; Thu, 22 Aug 2019 20:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D4CDF804CB
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D4CDF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DMwK3zli"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=97zSV9eAWW5sCqu1n0VCbffgpgotZUvc3CFvtJZCpI4=; b=DMwK3zliJtiu
 4R2SpFDJdv+fozl+6uhpfRO1lR7Shwg+qXTDrxtQQ8LI6VmKC8DeHR3iJDN0gUCw4YXB3LESlJXl8
 zoOMSNZrg5zoFW+YdM2nULZHRFxvVFZn5Ro0tdVeYX/W9hMhPQxabUsQZbJhOBDz9ldiAftPeAA/U
 BNKL4=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtR-0007fZ-8s; Thu, 22 Aug 2019 18:33:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id E471BD02CD1; Thu, 22 Aug 2019 19:32:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rxg1lda.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183256.E471BD02CD1@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:56 +0100 (BST)
Cc: Sridharan@sirena.org.uk, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Ranjani <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: soc_cleanup_card_resources()
	become void" to the asoc tree
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

   ASoC: soc-core: soc_cleanup_card_resources() become void

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

From a4de83a385670c22c31e9bbb726595a447b32ba4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 20 Aug 2019 14:05:10 +0900
Subject: [PATCH] ASoC: soc-core: soc_cleanup_card_resources() become void

There is no need to check return value for
soc_cleanup_card_resources(). Let't makes it as void.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/871rxg1lda.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0ed6576bfef4..1be069c2ac8d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1885,7 +1885,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 	}
 }
 
-static int soc_cleanup_card_resources(struct snd_soc_card *card)
+static void soc_cleanup_card_resources(struct snd_soc_card *card)
 {
 	/* free the ALSA card at first; this syncs with pending operations */
 	if (card->snd_card) {
@@ -1906,8 +1906,6 @@ static int soc_cleanup_card_resources(struct snd_soc_card *card)
 	/* remove the card */
 	if (card->remove)
 		card->remove(card);
-
-	return 0;
 }
 
 static int snd_soc_instantiate_card(struct snd_soc_card *card)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
