Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEBAE230C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 21:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23AF1671;
	Wed, 23 Oct 2019 21:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23AF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857357;
	bh=PoMlp/qjMP+IVY1YZSdHmEqlNRWTrBSVgwcgW7cesWs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QBP6MxNRjJ78H6prm1xOGptAHM7oGN4WAYtrxnb9MuDtWOEeQo7RlEvQAw+asIX+f
	 foBilCgSn9LqCSaSSPs6pBMhrgbDLkB8uopXmwHqJQWaGsMP44B8OZxVFL2Eyuj9b/
	 0bH3O5bbfp2EBNaKddy4Ov0sTVR1/Wcon+fvGrjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F07F80672;
	Wed, 23 Oct 2019 20:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8F83F8060F; Wed, 23 Oct 2019 20:56:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E812F805E2
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E812F805E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iv00GsxY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=bNZX7T8W8ZWiWMxnaEM8Q77UWl6mlZDIiuqRRJ9VYNw=; b=iv00GsxY2fM0
 tojT0Z/wgxw47lJyecMNUooXEPghX609vVBBwv2VP9wbIWJ/2mRE5fFNtENUrnecA6ChEdQVjrOk4
 LUgc33rkZYQO0a0MIdcj6rluedBLaYrtyxVtMUTjNhFVrKl5EWpiaQV4I08XwsyjD/t7wPeUflRx9
 mpu8g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLnj-0001BL-K5; Wed, 23 Oct 2019 18:56:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 188AB2743021; Wed, 23 Oct 2019 19:56:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
In-Reply-To: <E1iNGyK-0004oF-6A@rmk-PC.armlinux.org.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191023185607.188AB2743021@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:06 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.armlinux.org.uk,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: kirkwood: fix external clock probe
	defer" to the asoc tree
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

   ASoC: kirkwood: fix external clock probe defer

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

From 4523817d51bc3b2ef38da768d004fda2c8bc41de Mon Sep 17 00:00:00 2001
From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Wed, 23 Oct 2019 14:46:44 +0100
Subject: [PATCH] ASoC: kirkwood: fix external clock probe defer

When our call to get the external clock fails, we forget to clean up
the enabled internal clock correctly.  Enable the clock after we have
obtained all our resources.

Fixes: 84aac6c79bfd ("ASoC: kirkwood: fix loss of external clock at probe time")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Link: https://lore.kernel.org/r/E1iNGyK-0004oF-6A@rmk-PC.armlinux.org.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 61226fefe1c4..9575a636d016 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -555,10 +555,6 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	err = clk_prepare_enable(priv->clk);
-	if (err < 0)
-		return err;
-
 	priv->extclk = devm_clk_get(&pdev->dev, "extclk");
 	if (IS_ERR(priv->extclk)) {
 		if (PTR_ERR(priv->extclk) == -EPROBE_DEFER)
@@ -574,6 +570,10 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = clk_prepare_enable(priv->clk);
+	if (err < 0)
+		return err;
+
 	/* Some sensible defaults - this reflects the powerup values */
 	priv->ctl_play = KIRKWOOD_PLAYCTL_SIZE_24;
 	priv->ctl_rec = KIRKWOOD_RECCTL_SIZE_24;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
