Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D992CA30
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDD5183C;
	Tue, 28 May 2019 17:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDD5183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056678;
	bh=a5IiEQ/v4L1l4PkSxzSGTSFeI1hsL4PHJC8a3MxAyUY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MMjevrAA9b86gBLwfXDqTKtUSL59pOsueQGQwujH22LXP4HV40YAvT4Jn2aPPLBaj
	 DBPBCSGj+RALimF1mQDNzBKJswKxxYoy1yKJlZziBCYrvmNlpoiacjXKbYTnEjCnR1
	 CKGkBE80ebvFEl1KVsET3wAjPbkNrG/bBFwmdU9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13149F89773;
	Tue, 28 May 2019 17:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9BDF8974C; Tue, 28 May 2019 17:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 249BDF8971D
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 249BDF8971D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MKQgZZgz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IpVKaU6OqUQC83ZhAoqSepQlrtSSCT9MXgLEr0fYWds=; b=MKQgZZgzzaKy
 O8kZQBEPHCI0F1GUMDUNfz4K89mF9dYT8pZyIo9ecj3HBJeBVs54vIa65n5BuojSpZIf65BSFEggF
 YP+z4FLrEPOcliWmwmofo63BOHygcTGEuKdOv5hISA89WX/FP+T8gSgJOxEjL9cz3lzPtmYINklSK
 SrjcY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgx-0002ps-IJ; Tue, 28 May 2019 15:07:07 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id EEE96440046; Tue, 28 May 2019 16:07:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhn8s60h.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150706.EEE96440046@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:07:06 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: soc-core: fixup references at
	soc_cleanup_card_resources()" to the asoc tree
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

   ASoC: soc-core: fixup references at soc_cleanup_card_resources()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 29040d1ac569606fece70966179de272cfc0d4db Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 27 May 2019 16:51:34 +0900
Subject: [PATCH] ASoC: soc-core: fixup references at
 soc_cleanup_card_resources()

commit 53e947a0e1f7 ("ASoC: soc-core: merge card resources cleanup
method") merged cleanup method of snd_soc_instantiate_card() and
soc_cleanup_card_resources().

But, after this commit, if user uses unbind/bind to Component factor
drivers, Kernel might indicates refcount error at
soc_cleanup_card_resources().

The 1st reason is card->snd_card is still exist even though
snd_card_free() was called, but it is already cleaned.
We need to set NULL to it.

2nd is card->dapm and card create debugfs, but its dentry is still
exist even though it was removed. We need to set NULL to it.

Fixes: 53e947a0e1f7 ("ASoC: soc-core: merge card resources cleanup method")
Cc: stable@vger.kernel.org # for v5.1
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 7 ++++++-
 sound/soc/soc-dapm.c | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7c9415987ac7..46042d41b79b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -228,7 +228,10 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 
 static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
 {
+	if (!card->debugfs_card_root)
+		return;
 	debugfs_remove_recursive(card->debugfs_card_root);
+	card->debugfs_card_root = NULL;
 }
 
 static void snd_soc_debugfs_init(void)
@@ -2039,8 +2042,10 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 static int soc_cleanup_card_resources(struct snd_soc_card *card)
 {
 	/* free the ALSA card at first; this syncs with pending operations */
-	if (card->snd_card)
+	if (card->snd_card) {
 		snd_card_free(card->snd_card);
+		card->snd_card = NULL;
+	}
 
 	/* remove and free each DAI */
 	soc_remove_dai_links(card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 62e27defce56..5fc57af9cb6f 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2192,7 +2192,10 @@ static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 
 static void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 {
+	if (!dapm->debugfs_dapm)
+		return;
 	debugfs_remove_recursive(dapm->debugfs_dapm);
+	dapm->debugfs_dapm = NULL;
 }
 
 #else
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
