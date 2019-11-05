Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD897F0ACD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:00:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E2116F0;
	Wed,  6 Nov 2019 00:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E2116F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998442;
	bh=1xeJb5MgVMiqwulBS6ITgGb+bPkwH+3Qo43niKhJKtg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EvIROCO1ISsOgHl7ESW/iT3/wJckF7WKR42syzRZIVNWAJIszRhIYw1t6I5oCIcCF
	 6rLF84cF4EW/omqgQIyPchuAwfP+8Vrvc3Lu432RoKkpAvMKGlqtswBLMV73gr7rav
	 sgBdHmLxmJxnScp6dXQrwaW3rj2yiuTWH8Z213yU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6B61F8070E;
	Wed,  6 Nov 2019 00:51:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C312F80659; Wed,  6 Nov 2019 00:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332AFF805FF
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 332AFF805FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CeoLCih1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LzyFpX0VxqzjUGe09TAVlGeEdlO/ljek/sQ8VN4vV50=; b=CeoLCih16IJ4
 Wl4jM3nXSBOcNojw/oMXVaXl+oq2APgvdWtXf3MzznJg6ieE3keGqHmvr+/nK6EpWlZMMMhC84lQx
 Efy0jtTBuQUksRylQUIxABnrx94fEIXT0ma1Zps/wvJ5Ro6emXus3DeZq1nO4OJtUif3MYHHOIYY5
 xsipA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bb-00081v-MN; Tue, 05 Nov 2019 23:51:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2119B2743280; Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235123.2119B2743280@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: add soc_unbind_dai_link()" to
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

   ASoC: soc-core: add soc_unbind_dai_link()

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

From bc7a9091e5b927ecc20dbb3bc07a5a09783fc27b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:25 +0900
Subject: [PATCH] ASoC: soc-core: add soc_unbind_dai_link()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

ALSA SoC has soc_bind_dai_link(), but its paired soc_unbind_dai_link()
is not implemented.
More confusable is that soc_remove_pcm_runtimes() which should be
soc_unbind_dai_link() is implemented without synchronised
to soc_bind_dai_link().

This patch cleanup this unbalance.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/877e4e3jni.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e8ff6f2f58ba..1e8dd19cba24 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -470,14 +470,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	return NULL;
 }
 
-static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd, *_rtd;
-
-	for_each_card_rtds_safe(card, rtd, _rtd)
-		soc_free_pcm_runtime(rtd);
-}
-
 struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
 		const char *dai_link)
 {
@@ -1037,6 +1029,16 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return 0;
 }
 
+static void soc_unbind_dai_link(struct snd_soc_card *card,
+				struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_pcm_runtime *rtd;
+
+	rtd = snd_soc_get_pcm_runtime(card, dai_link->name);
+	if (rtd)
+		soc_free_pcm_runtime(rtd);
+}
+
 static int soc_bind_dai_link(struct snd_soc_card *card,
 	struct snd_soc_dai_link *dai_link)
 {
@@ -1466,6 +1468,8 @@ void snd_soc_remove_dai_link(struct snd_soc_card *card,
 		card->remove_dai_link(card, dai_link);
 
 	list_del(&dai_link->list);
+
+	soc_unbind_dai_link(card, dai_link);
 }
 EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
 
@@ -1974,8 +1978,6 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	for_each_card_links_safe(card, link, _link)
 		snd_soc_remove_dai_link(card, link);
 
-	soc_remove_pcm_runtimes(card);
-
 	/* remove auxiliary devices */
 	soc_remove_aux_devices(card);
 	soc_unbind_aux_dev(card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
