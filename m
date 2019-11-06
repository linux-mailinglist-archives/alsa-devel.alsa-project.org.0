Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B2F1B1D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1EE516A8;
	Wed,  6 Nov 2019 17:23:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1EE516A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573057462;
	bh=dp5gk0DrzJ/VsV5W13Qhm5eFzPwVPxwRm8Ajn2n6kv0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YZguLB371rpSF9JR2f9WAyfGNaOaC0tJ3waLf72N44I7SLkZQoJaagsUhZ0+ekzQN
	 0UyCLMvshKTnZzZgRmaYrpJhyetnksbFOUoEOsiGij8X4YbskKGWSejnlsTMjQVkUk
	 0C0qivz2G1/DaK0Iuqsiu7GCGd8uNArOLgczk73k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C86F804CF;
	Wed,  6 Nov 2019 17:21:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD8D2F8045F; Wed,  6 Nov 2019 17:21:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D0EF80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D0EF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rO+9zM12"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=f78NGAsQZd9X9rOoew5hlBIqzi9uIN5fCeBFIlwoeCw=; b=rO+9zM122yg3
 VKGe0c9/mx0N5j4FxX6JFkFqBtXiF8tZxw/ATM/uJzXyUDMhsB0eyeRTxOVvKmT4hFWKPxYgRf0rf
 JOrctnCJHv1CUVl7KOo51MnpqVqEB1Co4LMU/JmkP9CS4x3cHXw4bwGYojH3Kvfuxc+ofVqxl1l5i
 hL2uE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSO42-0001oq-Eg; Wed, 06 Nov 2019 16:21:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E42592743044; Wed,  6 Nov 2019 16:21:45 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191106145801.9316-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191106162145.E42592743044@ypsilon.sirena.org.uk>
Date: Wed,  6 Nov 2019 16:21:45 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: fix RIP warning on card
	removal" to the asoc tree
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

   ASoC: soc-core: fix RIP warning on card removal

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From df95a16d2a9626dcfc3f2b3671c9b91fa076c997 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 6 Nov 2019 08:58:01 -0600
Subject: [PATCH] ASoC: soc-core: fix RIP warning on card removal

SOF module load/unload tests show nasty recurring warnings:

WARNING: CPU: 5 PID: 1339 at sound/core/control.c:466
snd_ctl_remove+0xf0/0x100 [snd]
RIP: 0010:snd_ctl_remove+0xf0/0x100 [snd]

This regression was introduced by the removal of the call to
soc_remove_link_components() before soc_card_free() is invoked.

Go back to the initial order but only call
soc_remove_link_components() once.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Fixes: 5a4c9f054ceea ("ASoC: soc-core: snd_soc_unbind_card() cleanup")
GitHub issue: https://github.com/thesofproject/linux/issues/1424
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191106145801.9316-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cc596871ba7f..a7ad81ec59db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1974,6 +1974,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link, *_link;
 
+	/* This should be called before snd_card_free() */
+	soc_remove_link_components(card);
+
 	/* free the ALSA card at first; this syncs with pending operations */
 	if (card->snd_card) {
 		snd_card_free(card->snd_card);
@@ -1982,7 +1985,6 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
-	soc_remove_link_components(card);
 
 	for_each_card_links_safe(card, link, _link)
 		snd_soc_remove_dai_link(card, link);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
