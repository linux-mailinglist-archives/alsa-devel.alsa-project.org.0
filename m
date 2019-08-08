Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C586BA4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:37:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 376F51612;
	Thu,  8 Aug 2019 22:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 376F51612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565296624;
	bh=+4EYqCiBkuBybi6vw23AyTBDeKhyKGorg2crT8SUCKI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fNaTnReXxgxVgrQG9CKqWKfXExy07gcsuzGr0ksr5lyD93qW7oisS70mn7xxxHoC+
	 LEeAZDpA56xPr5vfMObZqsIxpQlAfMltKWKy24HvVU3UTmFADv1ynD71e7X1CAU8Vw
	 Xx1jcqKFnhNwBOk1S4z4W+TuBcVI9VgrDsQAI3YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A70CFF805AA;
	Thu,  8 Aug 2019 22:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89CA0F805F9; Thu,  8 Aug 2019 22:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73D2FF804FF
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73D2FF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wle2yC67"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/iQJyV1HgHLjZAcIIJYeoj8GBGRj81i675xwyL3rMes=; b=wle2yC67kjzY
 pVQ6xicS7deALwFzv2N5QeVAuve92BrQ43OVTt9+xcn023zedoctVaSycEloPK7hV2U+MDDv4ZJQH
 vLAfvEgYcHi3JOxueD+6zNBMgJefjllQNnQMWqsiWEX11BA6/iBIUJVwQTvgKY73dpyz52OFDb70l
 J9lS0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6T-00041O-Eo; Thu, 08 Aug 2019 20:33:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 805C52742B42; Thu,  8 Aug 2019 21:33:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e7paho1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203340.805C52742B42@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:40 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup for
	card->deferred_resume_work" to the asoc tree
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

   ASoC: soc-core: tidyup for card->deferred_resume_work

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

From b3da42519c3e6ad977af844d61c31d0e5f874f1c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 7 Aug 2019 10:31:24 +0900
Subject: [PATCH] ASoC: soc-core: tidyup for card->deferred_resume_work

card->deferred_resume_work is used if CONFIG_PM_SLEEP was defined.
but
	1) It is defined even though CONFIG_PM_SLEEP was not defined
	2) random ifdef code is difficult to read.
This patch tidyup these issues.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e7paho1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  5 +++--
 sound/soc/soc-core.c | 14 ++++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6ac6481b4882..85ad971e9432 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1058,8 +1058,6 @@ struct snd_soc_card {
 	int num_of_dapm_routes;
 	bool fully_routed;
 
-	struct work_struct deferred_resume_work;
-
 	/* lists of probed devices belonging to this card */
 	struct list_head component_dev_list;
 	struct list_head list;
@@ -1079,6 +1077,9 @@ struct snd_soc_card {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_card_root;
+#endif
+#ifdef CONFIG_PM_SLEEP
+	struct work_struct deferred_resume_work;
 #endif
 	u32 pop_time;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6b0042835233..25b26caea4e0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -701,9 +701,18 @@ int snd_soc_resume(struct device *dev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_resume);
+
+static void soc_resume_init(struct snd_soc_card *card)
+{
+	/* deferred resume work */
+	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
+}
 #else
 #define snd_soc_suspend NULL
 #define snd_soc_resume NULL
+static inline void soc_resume_init(struct snd_soc_card *card)
+{
+}
 #endif
 
 static const struct snd_soc_dai_ops null_dai_ops = {
@@ -1984,10 +1993,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 
 	soc_init_card_debugfs(card);
 
-#ifdef CONFIG_PM_SLEEP
-	/* deferred resume work */
-	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
-#endif
+	soc_resume_init(card);
 
 	ret = snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
 					card->num_dapm_widgets);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
