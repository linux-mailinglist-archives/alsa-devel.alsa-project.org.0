Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1DE2314
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 21:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4620C167E;
	Wed, 23 Oct 2019 21:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4620C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857483;
	bh=/S8XA1kCzJASOYG/bQhzbn1FcbuZXihQJ7qOrHcwew0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iEAbv3A7Mxc16fsPcyWPjAAisBTQs4oqdEtyZ3BBaYrHJT5Qm2z5u0zay9Y3vfjQi
	 z/jguJ1QbEb6texwflOyJNE5zqXVkTdmKQJBEaq1bJ6YWkTxVQNLfFryEE8a0rvrBq
	 19b1ssG6ZxKw9jOXnlpvBb1SazSng7dXCIJc9yZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B9D5F806ED;
	Wed, 23 Oct 2019 20:56:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0408CF80633; Wed, 23 Oct 2019 20:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D185AF805FA
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D185AF805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="f+LP7blZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ne7aPXNEX5k/8fn0BauyA/A+J87iFI+fypVrthTODdI=; b=f+LP7blZIEQi
 ICrFv07A20I3MwsQL/F4F4LKz8IT9bgaAKQyMAwRgHFqLdq9qj3FlwrpuOEOyAcMp31zqONFO2ixx
 M060e8QC1uP0zcqPMBC40scFI8UEaL9hQKjuRNx5McatmHDVIWvxKKyc5R49COJC0C/U/wqCHf9rf
 +vyz0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLnh-0001Ah-Fb; Wed, 23 Oct 2019 18:56:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8793F2743021; Wed, 23 Oct 2019 19:56:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
In-Reply-To: <E1iNGyP-0004oN-BA@rmk-PC.armlinux.org.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191023185604.8793F2743021@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:04 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.armlinux.org.uk,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: kirkwood: fix device remove ordering"
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

   ASoC: kirkwood: fix device remove ordering

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

From dc39596a906d5b604f4e64597b6e904fc14625e8 Mon Sep 17 00:00:00 2001
From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Wed, 23 Oct 2019 14:46:49 +0100
Subject: [PATCH] ASoC: kirkwood: fix device remove ordering

The devm conversion of kirkwood was incorrect; on removal, devm takes
effect after the "remove" function has returned.  So, the effect of
the conversion was to change the order during remove from:

  - snd_soc_unregister_component() (unpublishes interfaces)
  - clk_disable_unprepare()
  - cleanup resources

After the conversion, this became:

  - clk_disable_unprepare() - while the device may still be active
  - snd_soc_unregister_component()
  - cleanup resources

Hence, it introduces a bug, where the internal clock for the device
may be shut down before the device itself has been shut down.  It is
known that Marvell SoCs, including Dove, locks up if registers for a
peripheral that has its clocks disabled are accessed.

Fixes: f98fc0f8154e ("ASoC: kirkwood: replace platform to component")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Link: https://lore.kernel.org/r/E1iNGyP-0004oN-BA@rmk-PC.armlinux.org.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 9575a636d016..2a4ffe945177 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -587,7 +587,7 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 		priv->ctl_rec |= KIRKWOOD_RECCTL_BURST_128;
 	}
 
-	err = devm_snd_soc_register_component(&pdev->dev, &kirkwood_soc_component,
+	err = snd_soc_register_component(&pdev->dev, &kirkwood_soc_component,
 					 soc_dai, 2);
 	if (err) {
 		dev_err(&pdev->dev, "snd_soc_register_component failed\n");
@@ -610,6 +610,7 @@ static int kirkwood_i2s_dev_remove(struct platform_device *pdev)
 {
 	struct kirkwood_dma_data *priv = dev_get_drvdata(&pdev->dev);
 
+	snd_soc_unregister_component(&pdev->dev);
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
 	clk_disable_unprepare(priv->clk);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
