Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE12104207
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD51B172F;
	Wed, 20 Nov 2019 18:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD51B172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574270645;
	bh=2dA+gMUlRZoOmzD4pYArIo11F7XjfnxYr+W2nMp1Ib4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ii9LSeEUCf14Akb5dZxveeTzZYx1r48H2XdKMPi6so8DHu3IcSv46RWWWXyJuQZDI
	 MfdKZFRpu/PmzjWcWM6RIah2POLmk63iGrk4EI7/rKx7Q83eamTSf9hX3fb/cR0HEK
	 NWl4a4k8nyYN0cY6K4Mz31p18vVOAhuPVYCuwYuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E44F80213;
	Wed, 20 Nov 2019 18:18:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60FCCF801EC; Wed, 20 Nov 2019 18:18:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D7F7F8015A
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7F7F8015A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 161E0113E;
 Wed, 20 Nov 2019 09:18:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81A153F703;
 Wed, 20 Nov 2019 09:18:16 -0800 (PST)
Date: Wed, 20 Nov 2019 17:18:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8xax88g.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87o8xax88g.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: remove soc_pcm_private_free()"
	to the asoc tree
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

   ASoC: soc-pcm: remove soc_pcm_private_free()

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

From 0ced7b050224b18ca73e38e7068f36be8e708c06 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 18 Nov 2019 10:51:11 +0900
Subject: [PATCH] ASoC: soc-pcm: remove soc_pcm_private_free()

soc-topology adds extra dai_link by using snd_soc_add_dai_link(),
and removes it by snd_soc_romove_dai_link().

This snd_soc_add/remove_dai_link() and/or its related
functions are unbalanced before, and now, these are balance-uped.
But, it finds the random operation issue, and it is reported by
Pierre-Louis.

When card was released, topology will call snd_soc_remove_dai_link()
via (A).

	static void soc_cleanup_card_resources(struct snd_soc_card *card)
	{
		struct snd_soc_dai_link *link, *_link;

		/* This should be called before snd_card_free() */
	(A)	soc_remove_link_components(card);

		/* free the ALSA card at first; this syncs with pending operations */
		if (card->snd_card) {
	(B)		snd_card_free(card->snd_card);
			card->snd_card = NULL;
		}

		/* remove and free each DAI */
	(X)	soc_remove_link_dais(card);

		for_each_card_links_safe(card, link, _link)
	(C)		snd_soc_remove_dai_link(card, link);

		...
	}

At (A), topology calls snd_soc_remove_dai_link().
Then topology rtd, and its related all data are freed.

Next, (B) is called, and then, pcm->private_free = soc_pcm_private_free()
is called.

	static void soc_pcm_private_free(struct snd_pcm *pcm)
	{
		struct snd_soc_pcm_runtime *rtd = pcm->private_data;

		/* need to sync the delayed work before releasing resources */
		flush_delayed_work(&rtd->delayed_work);
		snd_soc_pcm_component_free(rtd);
	}

Here, it gets rtd via pcm->private_data.
But, topology related rtd are already freed at (A).
Normal sound card has no damage, becase it frees rtd at (C).

These are finalizing rtd related data.
Thus, these should be called when rtd was freed, not sound card
was freed. It is very natural and understandable.

In other words, pcm->private_free = soc_pcm_private_free()
is no longer needed.

Extra issue is that there is zero chance to call
soc_remove_dai() for topology related dai at (X).
Because (A) removes rtd connection from card too, and,
(X) is based on card connected rtd.

This means, (X) need to be called before (C) (= for normal sound)
and (A) (= for topology).

Now, I want to focus this patch which is the reason why
snd_card_free() = (B) is located there.

	commit 4efda5f2130da033aeedc5b3205569893b910de2
	("ASoC: Fix use-after-free at card unregistration")

Original snd_card_free() was called last of this function.
But moved to top to avoid use-after-free issue.
The issue was happen at soc_pcm_free() which was pcm->private_free,
today it is updated/renamed to soc_pcm_private_free().

In other words, (B) need to be called before (C) (= for normal sound)
and (A) (= for topology), because it needs (not yet freed) rtd.
But, (A) need to be called before (B),
because it needs card->snd_card pointer.

If we call flush_delayed_work() and snd_soc_pcm_component_free()
(= same as soc_pcm_private_free()) when rtd was freed (= (C), (A)),
there is no reason to call snd_card_free() at top of this function.
It can be called end of this function, again.

But, in such case, it will likely break unbind again, as Takashi-san
reported. When unbind is performed in a busy state, the code may
release still-in-use resources.
At least we need to call snd_card_disconnect_sync() at the first place.

The final code will be...

	static void soc_cleanup_card_resources(struct snd_soc_card *card)
	{
		struct snd_soc_dai_link *link, *_link;

		if (card->snd_card)
	(Z)		snd_card_disconnect_sync(card->snd_card);

	(X)	soc_remove_link_dais(card);
	(A)	soc_remove_link_components(card);

		for_each_card_links_safe(card, link, _link)
	(C)		snd_soc_remove_dai_link(card, link);

		...
		if (card->snd_card) {
	(B)		snd_card_free(card->snd_card);
			card->snd_card = NULL;
		}
	}

To avoid release still-in-use resources,
call snd_card_disconnect_sync() at (Z).

(X) is needed for both non-topology and topology.

    topology removes rtd via (A), and
non topology removes rtd via (C).

snd_card_free() is no longer related to use-after-free issue.
Thus, locating (B) is no problem.

Fixes: df95a16d2a9626 ("ASoC: soc-core: fix RIP warning on card removal")
Fixes: bc7a9091e5b927 ("ASoC: soc-core: add soc_unbind_dai_link()")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87o8xax88g.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 19 +++++++++++--------
 sound/soc/soc-pcm.c  | 10 ----------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 977a7bfad519..e3a53ef1db04 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -419,6 +419,9 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 
 	list_del(&rtd->list);
 
+	flush_delayed_work(&rtd->delayed_work);
+	snd_soc_pcm_component_free(rtd);
+
 	/*
 	 * we don't need to call kfree() for rtd->dev
 	 * see
@@ -1945,19 +1948,14 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
 {
 	struct snd_soc_dai_link *link, *_link;
 
-	/* This should be called before snd_card_free() */
-	soc_remove_link_components(card);
-
-	/* free the ALSA card at first; this syncs with pending operations */
-	if (card->snd_card) {
-		snd_card_free(card->snd_card);
-		card->snd_card = NULL;
-	}
+	if (card->snd_card)
+		snd_card_disconnect_sync(card->snd_card);
 
 	snd_soc_dapm_shutdown(card);
 
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
+	soc_remove_link_components(card);
 
 	for_each_card_links_safe(card, link, _link)
 		snd_soc_remove_dai_link(card, link);
@@ -1972,6 +1970,11 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
 	/* remove the card */
 	if (card_probed && card->remove)
 		card->remove(card);
+
+	if (card->snd_card) {
+		snd_card_free(card->snd_card);
+		card->snd_card = NULL;
+	}
 }
 
 static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c624d30bfa3c..2c4f50c44591 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2892,15 +2892,6 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 	return ret;
 }
 
-static void soc_pcm_private_free(struct snd_pcm *pcm)
-{
-	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
-
-	/* need to sync the delayed work before releasing resources */
-	flush_delayed_work(&rtd->delayed_work);
-	snd_soc_pcm_component_free(rtd);
-}
-
 /* create a new pcm */
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 {
@@ -3042,7 +3033,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		return ret;
 	}
 
-	pcm->private_free = soc_pcm_private_free;
 	pcm->no_device_suspend = true;
 out:
 	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
