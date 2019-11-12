Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205BF991A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:50:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B641670;
	Tue, 12 Nov 2019 19:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B641670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584641;
	bh=a0WFc6/PCiiLhWsQWOJQWNeyl9vZpotWHSvaMR7Ht4I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=H7ogiC63gsBJfgaiNN7nv8tkLxCNMS3nwsEbhb23v1yTpOpm0IrLtvQbe4L4vqsPv
	 RVSM8RUSu18+xMHZ66Q7d5mwjQSCAykR0F0B66mdY9quCe1kfZUMHKGSTsEf5eqf8e
	 +lrIqdjfktKlHvOSnud51a68n+Rl6hN733mkAVVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16ADAF8063A;
	Tue, 12 Nov 2019 19:47:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F90BF80633; Tue, 12 Nov 2019 19:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1AD0F80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1AD0F80144
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fuMkg0Jq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=53THnnU3j8u+XAfIfA5XhU+83AbuWWqKWvk/Bqku7Ek=; b=fuMkg0JqC8Se
 B3uty1yNPI7XcBA0L7Gu8+bFibGO8IAvy1gDiN+BuIVNCnJj6fKNkC15yFMMK3MfC7jinMvp8fDIf
 UPgNcW9r2HdhRGSpT2C993xoWGZpt8NPyHRuqiwDifqEbokfr/OtWCofK958wV9jvev5ZK1vg4GZF
 ewwzA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC4-00004t-HS; Tue, 12 Nov 2019 18:47:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 09C8827429D2; Tue, 12 Nov 2019 18:47:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pni5hkx1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184712.09C8827429D2@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:11 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge
	snd_soc_remove_dai_link() and soc_unbind_dai_link()" to the
	asoc tree
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

   ASoC: soc-core: merge snd_soc_remove_dai_link() and soc_unbind_dai_link()

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

From da704f26ba376bd93ac5234fa4605c4a8e4a5648 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:38 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_soc_remove_dai_link() and
 soc_unbind_dai_link()

We don't need to separete snd_soc_remove_dai_link() and
soc_unbind_dai_link() anymore. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pni5hkx1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 52 ++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8add98431881..d80d485f46d1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1049,15 +1049,36 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return 0;
 }
 
-static void soc_unbind_dai_link(struct snd_soc_card *card,
-				struct snd_soc_dai_link *dai_link)
+/**
+ * snd_soc_remove_dai_link - Remove a DAI link from the list
+ * @card: The ASoC card that owns the link
+ * @dai_link: The DAI link to remove
+ *
+ * This function removes a DAI link from the ASoC card's link list.
+ *
+ * For DAI links previously added by topology, topology should
+ * remove them by using the dobj embedded in the link.
+ */
+void snd_soc_remove_dai_link(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
 
+	lockdep_assert_held(&client_mutex);
+
+	/*
+	 * Notify the machine driver for extra destruction
+	 */
+	if (card->remove_dai_link)
+		card->remove_dai_link(card, dai_link);
+
+	list_del(&dai_link->list);
+
 	rtd = snd_soc_get_pcm_runtime(card, dai_link->name);
 	if (rtd)
 		soc_free_pcm_runtime(rtd);
 }
+EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
 
 /**
  * snd_soc_add_dai_link - Add a DAI link dynamically
@@ -1434,33 +1455,6 @@ void snd_soc_disconnect_sync(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_disconnect_sync);
 
-/**
- * snd_soc_remove_dai_link - Remove a DAI link from the list
- * @card: The ASoC card that owns the link
- * @dai_link: The DAI link to remove
- *
- * This function removes a DAI link from the ASoC card's link list.
- *
- * For DAI links previously added by topology, topology should
- * remove them by using the dobj embedded in the link.
- */
-void snd_soc_remove_dai_link(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_link)
-{
-	lockdep_assert_held(&client_mutex);
-
-	/*
-	 * Notify the machine driver for extra destruction
-	 */
-	if (card->remove_dai_link)
-		card->remove_dai_link(card, dai_link);
-
-	list_del(&dai_link->list);
-
-	soc_unbind_dai_link(card, dai_link);
-}
-EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
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
