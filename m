Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF27BFEC
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E7941718;
	Wed, 31 Jul 2019 13:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E7941718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572826;
	bh=kzj1yUtCEkle1THER+3sd6WvhA3oN4bf8uVpJbA3Epo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Xz8voR+WInU3pYg6c30vlgq97ycDUUSbDh8sv4xw3VW15hGeLHMjaZgY11vgy4RRw
	 AEMIOn64au0W89XeqNW8q5qs87lJ/g6mmp7W6Zbji4pf1gOYJ2aDCWP0fkvtoYIXoo
	 zb0yk6YPp4G+QJzClNDp4+uRj3pvyWrXLpLoKZrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C886F80528;
	Wed, 31 Jul 2019 13:30:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58B59F8049B; Wed, 31 Jul 2019 13:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39792F8048E
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39792F8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="N6PA8EFI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=tz9OrYsm/JIIYaZu0FAWVndUQ54ZCNsvNKCY3ncuXbk=; b=N6PA8EFIsUJy
 su8vlR6Ru8/5cQYPmUszlmF4msTGe+rAnP2cILm7o76udCBkZ2DDfifaVzOqI4JU/UuGSqxl1T2tu
 Fd3GuPCgrG22U6TiNyJfeV57tMot4NB7lLYJTqEG8o/VMnpPu0+7AmElzXwzvFi+vy2EwML/skXHM
 vTnwo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmni-0001md-Eh; Wed, 31 Jul 2019 11:29:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A62C72742CDE; Wed, 31 Jul 2019 12:29:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190724060023.31302-1-christophe.jaillet@wanadoo.fr>
X-Patchwork-Hint: ignore
Message-Id: <20190731112945.A62C72742CDE@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:45 +0100 (BST)
Cc: brian.austin@cirrus.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs4271: Fix a typo in the
	CS4171_NR_RATIOS" to the asoc tree
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

   ASoC: cs4271: Fix a typo in the CS4171_NR_RATIOS

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

From 0c03e37af47efcb8600f95f399783c082fcf2f93 Mon Sep 17 00:00:00 2001
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 24 Jul 2019 08:00:23 +0200
Subject: [PATCH] ASoC: cs4271: Fix a typo in the CS4171_NR_RATIOS

This should be CS4271_NR_RATIOS.
Fix it and use it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/20190724060023.31302-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4271.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 1d03a1348162..04b86a51e055 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -334,7 +334,7 @@ static struct cs4271_clk_cfg cs4271_clk_tab[] = {
 	{0, CS4271_MODE1_MODE_4X, 256,  CS4271_MODE1_DIV_2},
 };
 
-#define CS4171_NR_RATIOS ARRAY_SIZE(cs4271_clk_tab)
+#define CS4271_NR_RATIOS ARRAY_SIZE(cs4271_clk_tab)
 
 static int cs4271_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
@@ -383,13 +383,13 @@ static int cs4271_hw_params(struct snd_pcm_substream *substream,
 		val = CS4271_MODE1_MODE_4X;
 
 	ratio = cs4271->mclk / cs4271->rate;
-	for (i = 0; i < CS4171_NR_RATIOS; i++)
+	for (i = 0; i < CS4271_NR_RATIOS; i++)
 		if ((cs4271_clk_tab[i].master == cs4271->master) &&
 		    (cs4271_clk_tab[i].speed_mode == val) &&
 		    (cs4271_clk_tab[i].ratio == ratio))
 			break;
 
-	if (i == CS4171_NR_RATIOS) {
+	if (i == CS4271_NR_RATIOS) {
 		dev_err(component->dev, "Invalid sample rate\n");
 		return -EINVAL;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
