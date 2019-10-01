Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6880C3363
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B86E167D;
	Tue,  1 Oct 2019 13:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B86E167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930867;
	bh=Xu+qR5gkhwLMuJ2Lv8puCdWOSNfWdNCBxgTUBvt8QEM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p4pPhiQq+My892zf4+D1DCJmvLAoSBx/vWXREnUmzPddwI64x8OWZfQEMEkdQHei7
	 trDhYn8qxt0RcfwNsOXIextxegc7SSvTLi7USX5m33q63lT1sFGb7NiTU6mZgvCBg6
	 mWz1T2iLhPOMsH/TgptRAJrilNM0gY69ru+ZZnWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B063F8077D;
	Tue,  1 Oct 2019 13:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BFC7F806F0; Tue,  1 Oct 2019 13:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA8BF805FC
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA8BF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="t2bgkGL6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=s3p4rmlmUbzDJNW2fuWXnTHtv9wgy3UZVTXQUqDOxJA=; b=t2bgkGL61/EQ
 NasEQORrsiv1oP8DusXqEB9PqgFwMTA8myX6iX4Y2jKZ0sI4VEUJpvN7L/xb7w6aKoUt6+j5S7wc6
 W+W/gHb2vIGcqFyTuk8q3/qq0IsjroTXVmFCB0ZTboX4oNHk0im2iREOHL22DcIH+Y56LiM0V4Osk
 ejWXo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWP-0004Tf-EI; Tue, 01 Oct 2019 11:40:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E624927429C0; Tue,  1 Oct 2019 12:40:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878squf7oi.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114048.E624927429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:48 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge soc_free_pcm_runtime()
	and soc_rtd_free()" to the asoc tree
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

   ASoC: soc-core: merge soc_free_pcm_runtime() and soc_rtd_free()

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

From b7c5bc45ee94a03a0dc45a862180e17db8ea8e9d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:41:01 +0900
Subject: [PATCH] ASoC: soc-core: merge soc_free_pcm_runtime() and
 soc_rtd_free()

"rtd"      is handled by soc_xxx_pcm_runtime(), and
"rtd->dev" is handled by soc_rtd_xxx().

There is no reason to separate these, and it makes code complex.
We can free these in the same time.

Here soc_rtd_free() (A) which frees rtd->dev is called from
soc_remove_link_dais() many times (1).
Then, it is using dev_registered flags to avoid multi kfree() (2).
This is no longer needed if we can merge these functions.

	static void soc_remove_link_dais(...)
	{
		...
(1)		for_each_comp_order(order) {
(1)			for_each_card_rtds(card, rtd) {

(A)				soc_rtd_free(rtd);
				...
			}
		}
	}

(A)	static void soc_rtd_free(...)
	{
(2)		if (rtd->dev_registered) {
			/* we don't need to call kfree() for rtd->dev */
			device_unregister(rtd->dev);
(2)			rtd->dev_registered = 0;
		}
	}

This patch merges soc_rtd_free() into soc_free_pcm_runtime().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/878squf7oi.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  1 -
 sound/soc/soc-core.c | 24 ++++++++----------------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f264c6509f00..d93cb46c536d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1148,7 +1148,6 @@ struct snd_soc_pcm_runtime {
 	struct list_head component_list; /* list of connected components */
 
 	/* bit field */
-	unsigned int dev_registered:1;
 	unsigned int pop_wait:1;
 	unsigned int fe_compr:1; /* for Dynamic PCM */
 };
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6abc1bc9a236..8a37850291bd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -369,6 +369,14 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	kfree(rtd->codec_dais);
 	snd_soc_rtdcom_del_all(rtd);
 	list_del(&rtd->list);
+
+	/*
+	 * we don't need to call kfree() for rtd->dev
+	 * see
+	 *	soc_release_rtd_dev()
+	 */
+	if (rtd->dev)
+		device_unregister(rtd->dev);
 	kfree(rtd);
 }
 
@@ -434,8 +442,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->num = card->num_rtd;
 	card->num_rtd++;
 
-	rtd->dev_registered = 1;
-
 	return rtd;
 
 free_rtd:
@@ -1169,7 +1175,6 @@ static int soc_probe_dai(struct snd_soc_dai *dai, int order)
 	return 0;
 }
 
-static void soc_rtd_free(struct snd_soc_pcm_runtime *rtd); /* remove me */
 static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	int i;
@@ -1179,10 +1184,6 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-
-			/* finalize rtd device */
-			soc_rtd_free(rtd);
-
 			/* remove the CODEC DAI */
 			for_each_rtd_codec_dai(rtd, i, codec_dai)
 				soc_remove_dai(codec_dai, order);
@@ -1460,15 +1461,6 @@ void snd_soc_remove_dai_link(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
 
-static void soc_rtd_free(struct snd_soc_pcm_runtime *rtd)
-{
-	if (rtd->dev_registered) {
-		/* we don't need to call kfree() for rtd->dev */
-		device_unregister(rtd->dev);
-		rtd->dev_registered = 0;
-	}
-}
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
