Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76021189D7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E70131668;
	Tue, 10 Dec 2019 14:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E70131668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984627;
	bh=1p+SbEKBYEz7w1MzG1NqIcvi6pzYGkLTX5wmYHx0qow=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rnt3vUjjCWV9wW2WiHIVLFBfB0I6Y6GSJ8RDvMILmpmlL0A7v+SpgBITWn6YDSUGy
	 gTSpCvRv3OzghRMjxJJzE8SIvSjvigz1n/nQ2iBD7UU+joI9vJrdB3AHn4otu4SqrO
	 Zouv+Tv60zGicIRct82I1srJI/L3lks1YwXYq140=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC677F802DD;
	Tue, 10 Dec 2019 14:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 249EEF802A0; Tue, 10 Dec 2019 14:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CDEE0F8028F
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDEE0F8028F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFAE311B3;
 Tue, 10 Dec 2019 05:22:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9633F52E;
 Tue, 10 Dec 2019 05:22:54 -0800 (PST)
Date: Tue, 10 Dec 2019 13:22:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e35yq5w.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-877e35yq5w.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: rename snd_soc_add_dai_link()
	to snd_soc_add_pcm_runtime()" to the asoc tree
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

   ASoC: soc-core: rename snd_soc_add_dai_link() to snd_soc_add_pcm_runtime()

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

From 0c04800424c42ec3fbe87422d3e04b5c978fc177 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 10 Dec 2019 09:34:19 +0900
Subject: [PATCH] ASoC: soc-core: rename snd_soc_add_dai_link() to
 snd_soc_add_pcm_runtime()

Now soc-core and soc-topology is using snd_soc_add_dai_link().
The abstract of this function is "create pcm_runtime from
dai_link information and connect it to card".
Thus, "add dai_link" is wrong/confusable naming.
This patch renames function name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/877e35yq5w.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  4 ++--
 sound/soc/soc-core.c     | 18 +++++++++---------
 sound/soc/soc-topology.c |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 09d3d9b615c2..b223b2d39950 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1323,8 +1323,8 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct snd_soc_dai_link *dai_link);
 void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link);
 
-int snd_soc_add_dai_link(struct snd_soc_card *card,
-				struct snd_soc_dai_link *dai_link);
+int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
+			    struct snd_soc_dai_link *dai_link);
 void snd_soc_remove_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *dai_link);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index bf5bbb1f3cdb..af9da991d99e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1027,18 +1027,18 @@ void snd_soc_remove_dai_link(struct snd_soc_card *card,
 EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
 
 /**
- * snd_soc_add_dai_link - Add a DAI link dynamically
- * @card: The ASoC card to which the DAI link is added
- * @dai_link: The new DAI link to add
+ * snd_soc_add_pcm_runtime - Add a pcm_runtime dynamically via dai_link
+ * @card: The ASoC card to which the pcm_runtime is added
+ * @dai_link: The DAI link to find pcm_runtime
  *
- * This function adds a DAI link to the ASoC card's link list.
+ * This function adds a pcm_runtime ASoC card by using dai_link.
  *
- * Note: Topology can use this API to add DAI links when probing the
+ * Note: Topology can use this API to add pcm_runtime when probing the
  * topology component. And machine drivers can still define static
  * DAI links in dai_link array.
  */
-int snd_soc_add_dai_link(struct snd_soc_card *card,
-			 struct snd_soc_dai_link *dai_link)
+int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
+			    struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link_component *codec, *platform;
@@ -1107,7 +1107,7 @@ int snd_soc_add_dai_link(struct snd_soc_card *card,
 	soc_free_pcm_runtime(rtd);
 	return -EPROBE_DEFER;
 }
-EXPORT_SYMBOL_GPL(snd_soc_add_dai_link);
+EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtime);
 
 static void soc_set_of_name_prefix(struct snd_soc_component *component)
 {
@@ -1929,7 +1929,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	/* add predefined DAI links to the list */
 	card->num_rtd = 0;
 	for_each_card_prelinks(card, i, dai_link) {
-		ret = snd_soc_add_dai_link(card, dai_link);
+		ret = snd_soc_add_pcm_runtime(card, dai_link);
 		if (ret < 0)
 			goto probe_end;
 	}
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index cbd605b96722..de427881a2ae 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1945,7 +1945,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
 	list_add(&link->dobj.list, &tplg->comp->dobj_list);
 
-	snd_soc_add_dai_link(tplg->comp->card, link);
+	snd_soc_add_pcm_runtime(tplg->comp->card, link);
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
