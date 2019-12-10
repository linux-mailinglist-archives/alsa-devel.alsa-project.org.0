Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBAF1189D2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:29:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1234D1661;
	Tue, 10 Dec 2019 14:28:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1234D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984588;
	bh=jJAkEPiZhH86pSrAp6ez1O75ibpCMPCAGIltDmUXbCE=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HerBcwb1GnQPUjrX3Jfeg3mNVqOPgZ9TE2x8nvtEVpKXK3s9SYl4QO5ZuS0N6A9bS
	 khGIYCd04jt2mKwmU0oh/73iCQyMqamr9WAIPlj67PCTpXJx7LJXML62SML/6JoDJy
	 wzUzjJ4zspIkkatdX9m39JnTx3xnQMrtSmka+/Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 013E7F802BC;
	Tue, 10 Dec 2019 14:23:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856C6F80290; Tue, 10 Dec 2019 14:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C660AF80278
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C660AF80278
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05FB3113E;
 Tue, 10 Dec 2019 05:22:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79E7F3F52E;
 Tue, 10 Dec 2019 05:22:51 -0800 (PST)
Date: Tue, 10 Dec 2019 13:22:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zipyq5s.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-875zipyq5s.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: rename
	snd_soc_remove_dai_link() to snd_soc_remove_pcm_runtime()" to
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

   ASoC: soc-core: rename snd_soc_remove_dai_link() to snd_soc_remove_pcm_runtime()

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

From 50cd9b5317d5593d0a33f4227f56ddcc1bf66604 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 10 Dec 2019 09:34:23 +0900
Subject: [PATCH] ASoC: soc-core: rename snd_soc_remove_dai_link() to
 snd_soc_remove_pcm_runtime()

Now soc-core and soc-topology is using snd_soc_remove_dai_link().
It removes pcm_runtime (= rtd) and disconnect it from card.
The purpose is removing pcm_runtime, not dai_link.
This patch renames function name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/875zipyq5s.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  4 ++--
 sound/soc/soc-core.c     | 29 +++++++++++------------------
 sound/soc/soc-topology.c |  4 +++-
 3 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index b223b2d39950..3923178ad050 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1325,8 +1325,8 @@ void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link);
 
 int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			    struct snd_soc_dai_link *dai_link);
-void snd_soc_remove_dai_link(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_link);
+void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
+				struct snd_soc_pcm_runtime *rtd);
 
 struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index af9da991d99e..f82d521306b7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -998,33 +998,26 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 }
 
 /**
- * snd_soc_remove_dai_link - Remove a DAI link from the list
- * @card: The ASoC card that owns the link
- * @dai_link: The DAI link to remove
+ * snd_soc_remove_pcm_runtime - Remove a pcm_runtime from card
+ * @card: The ASoC card to which the pcm_runtime has
+ * @rtd: The pcm_runtime to remove
  *
- * This function removes a DAI link from the ASoC card's link list.
- *
- * For DAI links previously added by topology, topology should
- * remove them by using the dobj embedded in the link.
+ * This function removes a pcm_runtime from the ASoC card.
  */
-void snd_soc_remove_dai_link(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_link)
+void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
+				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd;
-
 	lockdep_assert_held(&client_mutex);
 
 	/*
 	 * Notify the machine driver for extra destruction
 	 */
 	if (card->remove_dai_link)
-		card->remove_dai_link(card, dai_link);
+		card->remove_dai_link(card, rtd->dai_link);
 
-	rtd = snd_soc_get_pcm_runtime(card, dai_link);
-	if (rtd)
-		soc_free_pcm_runtime(rtd);
+	soc_free_pcm_runtime(rtd);
 }
-EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
+EXPORT_SYMBOL_GPL(snd_soc_remove_pcm_runtime);
 
 /**
  * snd_soc_add_pcm_runtime - Add a pcm_runtime dynamically via dai_link
@@ -1104,7 +1097,7 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	return 0;
 
 _err_defer:
-	soc_free_pcm_runtime(rtd);
+	snd_soc_remove_pcm_runtime(card, rtd);
 	return -EPROBE_DEFER;
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtime);
@@ -1871,7 +1864,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
 	soc_remove_link_components(card);
 
 	for_each_card_rtds_safe(card, rtd, n)
-		snd_soc_remove_dai_link(card, rtd->dai_link);
+		snd_soc_remove_pcm_runtime(card, rtd);
 
 	/* remove auxiliary devices */
 	soc_remove_aux_devices(card);
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index de427881a2ae..e9b660f3116f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -553,7 +553,9 @@ static void remove_link(struct snd_soc_component *comp,
 	kfree(link->cpus->dai_name);
 
 	list_del(&dobj->list);
-	snd_soc_remove_dai_link(comp->card, link);
+
+	snd_soc_remove_pcm_runtime(comp->card,
+			snd_soc_get_pcm_runtime(comp->card, link));
 	kfree(link);
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
