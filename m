Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD0CC23A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 19:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 805D01691;
	Fri,  4 Oct 2019 19:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 805D01691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570211898;
	bh=lakVTLyokueuSULpqxY+AE2gjX0sBk+2Qob7/BMpHm0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VgppLxca3AfzymjTYk9u+W4fXm/Q9HjJSYMbQ4hZ8c/MIN98l8UqTAHgevEQs/fbX
	 wHEnOKDNDW5O6zTcRc6qSS1nlSyBsak4EMyQvSQN4+I798yULQhWiDnzG30/fphJ57
	 MhKGG06ukkiLeiBiexsV38pMCPHuFiNCOcNTHT54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F24F8065B;
	Fri,  4 Oct 2019 19:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 972D2F804CB; Fri,  4 Oct 2019 19:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 510A4F803D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 19:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510A4F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pZ6/MkUj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cS+jo8LBA03xYK7fm14UrQ0XyQr5XUe/O4gHWm3YGTQ=; b=pZ6/MkUjCz+c
 1PdZb86uvJR/5tGO4sdMf0dNENHbkFCrRA63hlQHB3v1o9Jr7539m0+u6K2EUJGE8TZ+RDdNRQyqZ
 n3nWNx2oB8JMtxYToxG0lURpI7NAyYOOFnENYgD2nYK3CkmzV1Z4jCwUEUdCG/K1rMyyGxgK5oX3u
 dDde8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGRkp-0003uv-Ld; Fri, 04 Oct 2019 17:52:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2E1F72741EF0; Fri,  4 Oct 2019 18:52:35 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zl7bu1r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175235.2E1F72741EF0@ypsilon.sirena.org.uk>
Date: Fri,  4 Oct 2019 18:52:35 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove
	soc_remove_dai_links()" to the asoc tree
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

   ASoC: soc-core: remove soc_remove_dai_links()

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

From 7ce6088f60624805a8d3127185e2830e299849f1 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:22:40 +0900
Subject: [PATCH] ASoC: soc-core: remove soc_remove_dai_links()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

soc_cleanup_card_resources() (a) which is paired function of
snd_soc_instantiate_card() (A) is calling soc_remove_dai_links() (*)
to remove card related resources, but it is breaking
add/remove balance (B)(b)(C)(c)(D)(d), in other words
these should be called from soc_cleanup_card_resources() (a)
from balance point of view.

More headacke is that it is using original removing method for
dai_link even though we already have snd_soc_remove_dai_link()
which is the function for it (d).

This patch removes snd_soc_remove_dai_links() and balance up code.

	static void soc_remove_dai_links(...)
	{
		...
(b)		soc_remove_link_dais(card);
(c)		soc_remove_link_components(card);

		for_each_card_links_safe(card, link, _link) {
			...
			/* it should use snd_soc_remove_dai_link() here */
(d)			list_del(&link->list);
		}
	}

(a)	static int soc_cleanup_card_resources(...)
	{
		...

		/* remove and free each DAI */
(*)		soc_remove_dai_links(card);
		...
	}

(A)	static int snd_soc_instantiate_card(struct snd_soc_card *card)
	{
		...
		/* add predefined DAI links to the list */
		for_each_card_prelinks(card, i, dai_link)
(B)			snd_soc_add_dai_link(card, dai_link);
		...
		/* probe all components used by DAI links on this card */
(C)		ret = soc_probe_link_components(card);
		...
		/* probe all DAI links on this card */
(D)		ret = soc_probe_link_dais(card);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875zl7bu1r.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b16a94228091..a34000d08856 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1275,23 +1275,6 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 	return 0;
 }
 
-static void soc_remove_dai_links(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link, *_link;
-
-	soc_remove_link_dais(card);
-
-	soc_remove_link_components(card);
-
-	for_each_card_links_safe(card, link, _link) {
-		if (link->dobj.type == SND_SOC_DOBJ_DAI_LINK)
-			dev_warn(card->dev, "Topology forgot to remove link %s?\n",
-				link->name);
-
-		list_del(&link->list);
-	}
-}
-
 static int soc_init_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *link)
 {
@@ -1924,6 +1907,8 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 
 static void soc_cleanup_card_resources(struct snd_soc_card *card)
 {
+	struct snd_soc_dai_link *link, *_link;
+
 	/* free the ALSA card at first; this syncs with pending operations */
 	if (card->snd_card) {
 		snd_card_free(card->snd_card);
@@ -1931,7 +1916,12 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	}
 
 	/* remove and free each DAI */
-	soc_remove_dai_links(card);
+	soc_remove_link_dais(card);
+	soc_remove_link_components(card);
+
+	for_each_card_links_safe(card, link, _link)
+		snd_soc_remove_dai_link(card, link);
+
 	soc_remove_pcm_runtimes(card);
 
 	/* remove auxiliary devices */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
