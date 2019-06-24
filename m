Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E28528BE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 11:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0398F1678;
	Tue, 25 Jun 2019 11:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0398F1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561456654;
	bh=hZUoNGZdzO4jrV9R5arYf6EGcs8e3QjfkXuw+iG91LE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kiW75/s2fmQg/SUJJhhsGOcUK02TPOhSZ4aYbrKlN4JD8afLLbhvmUjlxdXDXJ7Ec
	 8EV5ohlA8RnKeBmA/gxLGbJfO+OHg/oBgC4KfxlEJXxncYtrF98N06+TQvzLrOF/9r
	 Xz1yJUaV7mT+BnVHOCDuqAWSoZEPvN+TqAs3r2HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E182FF89735;
	Tue, 25 Jun 2019 11:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1505DF896FC; Tue, 25 Jun 2019 11:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61826F896FC
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 11:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61826F896FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RBv91j8u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8m3+YNIeEGA6ffd5VMQOwZiPt5lmGTpYXOpEEm+49Nc=; b=RBv91j8uZMaT
 eik1TbTD9fFjSxcaMMzinuRiPBfWxG4Gkyed+FBlEZ44QMkVCbpQi2hWkV75Y+gIA3Y/mu2CbiNtu
 /A7Ok2sN68BpIngAYFjGsQjsJHXnqiUvImdoW5e7DjpiOF2a1O2DRoU/VCfrTWiMbS67IEHZVkx22
 fYE8k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfi9G-0004mb-Ik; Tue, 25 Jun 2019 09:53:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6D18144005B; Mon, 24 Jun 2019 17:32:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20190621113357.8264-1-broonie@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190624163214.6D18144005B@finisterre.sirena.org.uk>
Date: Mon, 24 Jun 2019 17:32:14 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: core: Adapt for debugfs API change" to
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

   ASoC: core: Adapt for debugfs API change

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

From c2c928c93173f220955030e8440517b87ec7df92 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Fri, 21 Jun 2019 12:33:56 +0100
Subject: [PATCH] ASoC: core: Adapt for debugfs API change

Back in ff9fb72bc07705c (debugfs: return error values, not NULL) the
debugfs APIs were changed to return error pointers rather than NULL
pointers on error, breaking the error checking in ASoC. Update the
code to use IS_ERR() and log the codes that are returned as part of
the error messages.

Fixes: ff9fb72bc07705c (debugfs: return error values, not NULL)
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9138fcb15cd3..6aeba0d66ec5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -158,9 +158,10 @@ static void soc_init_component_debugfs(struct snd_soc_component *component)
 				component->card->debugfs_card_root);
 	}
 
-	if (!component->debugfs_root) {
+	if (IS_ERR(component->debugfs_root)) {
 		dev_warn(component->dev,
-			"ASoC: Failed to create component debugfs directory\n");
+			"ASoC: Failed to create component debugfs directory: %ld\n",
+			PTR_ERR(component->debugfs_root));
 		return;
 	}
 
@@ -212,18 +213,21 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
-	if (!card->debugfs_card_root) {
+	if (IS_ERR(card->debugfs_card_root)) {
 		dev_warn(card->dev,
-			 "ASoC: Failed to create card debugfs directory\n");
+			 "ASoC: Failed to create card debugfs directory: %ld\n",
+			 PTR_ERR(card->debugfs_card_root));
+		card->debugfs_card_root = NULL;
 		return;
 	}
 
 	card->debugfs_pop_time = debugfs_create_u32("dapm_pop_time", 0644,
 						    card->debugfs_card_root,
 						    &card->pop_time);
-	if (!card->debugfs_pop_time)
+	if (IS_ERR(card->debugfs_pop_time))
 		dev_warn(card->dev,
-			 "ASoC: Failed to create pop time debugfs file\n");
+			 "ASoC: Failed to create pop time debugfs file: %ld\n",
+			 PTR_ERR(card->debugfs_pop_time));
 }
 
 static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
