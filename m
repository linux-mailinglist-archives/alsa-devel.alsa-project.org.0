Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2AF0AD2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8EE1677;
	Wed,  6 Nov 2019 01:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8EE1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998513;
	bh=8hkihyd7ewfu5l5hZVRfKN/kkhRU17vN1CTZPIgujpw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aHjDhmZnAOmUbzELkJO06vwLS0kLoVbNdd6F1QAxWoBOdglGCwtjNSFfMnWeLP8yG
	 lpnYSXKrA6QcNfyYCf0U/PdRR1jUZdkfDggGB1m4wBvSa05676PY7Ld+SI4puu7IpY
	 15jXvLMWEctXo4y1wPyqmgFfkm9Q7szZjydtJAnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A78BDF80724;
	Wed,  6 Nov 2019 00:51:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4056AF8065A; Wed,  6 Nov 2019 00:51:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F733F80600
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F733F80600
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aJGLWBjC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=f/0Z2GXPEBFdgqHAlbSWqrhn29kVVj3SutcONxpaZPc=; b=aJGLWBjCLq0q
 PMocop1EcglND3py+kgLmcGeVc1U27ymFcmYt0mblpuG2BjZPkLKQX07Imj3FAUwHlpvOWj/3BH31
 3MhwF7xUQr4DkgiT1582badhmLsUQqcPjZ3puN6WIP9OkMQlrOGS0P/I83SfdVrkwMKy4nAuQkH1J
 B+tF4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bb-00081w-RM; Tue, 05 Nov 2019 23:51:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 562612741915; Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sou3jnn.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235123.562612741915@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: call soc_bind_dai_link()
	under snd_soc_add_dai_link()" to the asoc tree
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

   ASoC: soc-core: call soc_bind_dai_link() under snd_soc_add_dai_link()

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

From 6b1dff0266a30df16846a20d1109ab25b985f0d7 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:20 +0900
Subject: [PATCH] ASoC: soc-core: call soc_bind_dai_link() under
 snd_soc_add_dai_link()

If we focus to soc_bind_dai_link() at snd_soc_instantiate_card(),
we will notice very complex operation.

static int snd_soc_instantiate_card(...)
{
	...
	/*
	 * (1) Bind dai_link via card pre-linked dai_link
	 *
	 * Bind dai_link via card pre-linked.
	 * 1 dai_link will be 1 rtd, and connected to card.
	 * for_each_card_prelinks() is for card pre-linked dai_link.
	 *
	 * Image
	 *
	 * card
	 * - rtd(A)
	 * - rtd(A)
	 */
	for_each_card_prelinks(card, i, dai_link) {
		ret = soc_bind_dai_link(card, dai_link);
		...
	}
	...
	/*
	 * (2) Connect card pre-linked dai_link to card list
	 *
	 * Connect all card pre-linked dai_link to *card list*.
	 * Here, (A) means from card pre-linked.
	 *
	 * Image
	 *
	 * card		card list
	 *  - rtd(A)	 - dai_link(A)
	 *  - rtd(A)	 - dai_link(A)
	 *  - ...	 - ...
	 */
	for_each_card_prelinks(card, i, dai_link) {
		ret = snd_soc_add_dai_link(card, dai_link);
		...
	}
	...
	/*
	 * (3) Probe binded component
	 *
	 * Each rtd has many components.
	 * Here probes each rtd connected components.
	 * rtd(A) in Image is the probe target.
	 *
	 * During this component probe, topology may add new dai_link to
	 * *card list* by using snd_soc_add_dai_link() which is
	 * used at (2).
	 * Here, (B) means from topology
	 *
	 * Image
	 *
	 * card		card list
	 *  - rtd(A)	 - dai_link(A)
	 *  - rtd(A)	 - dai_link(A)
	 *  - ...	 - ...
	 *		 - dai_link(B)
	 *		 - dai_link(B)
	 */
	ret = soc_probe_link_components(card);
	...

	/*
	 * (4) Bind dai_link again
	 *
	 * Bind dai_link again for topology.
	 * Note, (1) used for_each_card_prelinks(),
	 * here is using  for_each_card_links()
	 *
	 * This means from card list.
	 * As Image indicating, it has dai_link(A) (from card pre-link)
	 * and dai_link(B) (from topology).
	 * main target here is dai_link(B).
	 * soc_bind_dai_link() ignores already used
	 * dai_link (= dai_link(A))
	 *
	 * Image
	 *
	 * card		card list
	 *  - rtd(A)	 - dai_link(A)
	 *  - rtd(A)	 - dai_link(A)
	 *  - ...	 - ...
	 *  - rtd(B)	 - dai_link(B)
	 *  - rtd(B)	 - dai_link(B)
	 */
	for_each_card_links(card, dai_link) {
		ret = soc_bind_dai_link(card, dai_link);
		...
	}
	...
}

As you see above, it is doing very complex method.
The problem is binding dai_link via "card pre-linked" (= (1)) and
"topology added dai_link" (= (3)) are separated.
The code can be simple if we can bind dai_link when dai_link
is connected to *card list*.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/878sou3jnn.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3cc36c2d99da..e8ff6f2f58ba 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1409,6 +1409,8 @@ EXPORT_SYMBOL_GPL(snd_soc_disconnect_sync);
 int snd_soc_add_dai_link(struct snd_soc_card *card,
 		struct snd_soc_dai_link *dai_link)
 {
+	int ret;
+
 	if (dai_link->dobj.type
 	    && dai_link->dobj.type != SND_SOC_DOBJ_DAI_LINK) {
 		dev_err(card->dev, "Invalid dai link type %d\n",
@@ -1424,6 +1426,10 @@ int snd_soc_add_dai_link(struct snd_soc_card *card,
 	if (dai_link->dobj.type && card->add_dai_link)
 		card->add_dai_link(card, dai_link);
 
+	ret = soc_bind_dai_link(card, dai_link);
+	if (ret < 0)
+		return ret;
+
 	/* see for_each_card_links */
 	list_add_tail(&dai_link->list, &card->dai_link_list);
 
@@ -1996,13 +2002,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
 
-	/* bind DAIs */
-	for_each_card_prelinks(card, i, dai_link) {
-		ret = soc_bind_dai_link(card, dai_link);
-		if (ret != 0)
-			goto probe_end;
-	}
-
 	/* bind aux_devs too */
 	ret = soc_bind_aux_dev(card);
 	if (ret < 0)
@@ -2060,16 +2059,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	if (ret < 0)
 		goto probe_end;
 
-	/*
-	 * Find new DAI links added during probing components and bind them.
-	 * Components with topology may bring new DAIs and DAI links.
-	 */
-	for_each_card_links(card, dai_link) {
-		ret = soc_bind_dai_link(card, dai_link);
-		if (ret)
-			goto probe_end;
-	}
-
 	/* probe all DAI links on this card */
 	ret = soc_probe_link_dais(card);
 	if (ret < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
