Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D8EA1DFC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865781688;
	Thu, 29 Aug 2019 16:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865781688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090459;
	bh=iYwyYTg5Bn4kwhDpsHwtq7hOnN0Bu9rfme6DM9td6Sw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Z/41ckytIs6gRE8l+2vlC72B+bAhP14+ULa3JY/p5fY0B7frsXmxg/lM6Rfa4OFEq
	 lf+TN0ji5OnxydsEDJYB/4IeFgk09JUP8c1KkB5IOoDKBsLHF38EZFosPW3scXIECu
	 t3ZwLGUv6dPDu9+Mh5/+HZq55HUGGKTnuDcBtSK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C56F80760;
	Tue, 27 Aug 2019 21:59:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A3AFF80713; Tue, 27 Aug 2019 21:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB79F806ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB79F806ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vpg+xa0B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mLwhdc61f1fsTUMVyTfwingh4QR4ollQQm6O+N5/vGA=; b=vpg+xa0BPq5J
 iUlAqSGQ2EZIXLO0NI2f0EOA7ejYzzsbW5ZQ2xC9nrSEAElRAfrqJS5TleLvriYDYXZiRomc3lvvR
 B+1tBbnr4/qx99Y4T3B5sxbytLm3Aaka2wL10WZ9u055PN2rQz9RmEdtRGh5JLUYG4WHNC+mSfhgx
 39zGA=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hbb-0001Cr-QO; Tue, 27 Aug 2019 19:58:15 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8D170D02CE8; Tue, 27 Aug 2019 20:58:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195814.8D170D02CE8@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:58:14 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Viorel Suman <viorel.suman@nxp.com>,
 timur@kernel.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: imx-audmix: register the card on a
	proper dev" to the asoc tree
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

   ASoC: imx-audmix: register the card on a proper dev

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

From 9573820eb1951e0cb0f329886abcb4153f2ea798 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Tue, 27 Aug 2019 11:55:15 -0400
Subject: [PATCH] ASoC: imx-audmix: register the card on a proper dev

This platform device is registered from "fsl_audmix", which is
its parent device. If use pdev->dev.parent for the priv->card.dev,
the value set by dev_set_drvdata in parent device will be covered
by the value in child device.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 9e1cb18859ce..71590ca6394b 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -325,14 +325,14 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	priv->card.num_configs = priv->num_dai_conf;
 	priv->card.dapm_routes = priv->dapm_routes;
 	priv->card.num_dapm_routes = priv->num_dapm_routes;
-	priv->card.dev = pdev->dev.parent;
+	priv->card.dev = &pdev->dev;
 	priv->card.owner = THIS_MODULE;
 	priv->card.name = "imx-audmix";
 
 	platform_set_drvdata(pdev, &priv->card);
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
-	ret = devm_snd_soc_register_card(pdev->dev.parent, &priv->card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed\n");
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
