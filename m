Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE07E1D43
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 15:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CDB91676;
	Wed, 23 Oct 2019 15:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CDB91676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571838586;
	bh=EPj1h/rV+kI3H7724BOu1YbD1xx41+3siG7M9h5gDJk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hollo/ytNtxJMWjXzfePw4VvFGJ7nV57iIYJ1gj17EEEs/uP2zq4axA/FTrh2LXhV
	 T08bvs5JQDUTADTMQK0xILYK2PK3Il9AItM9tQy1pEelNi3H/D+wXLide7Wms1LUft
	 G3A3/9e6+e8cnSZ2UYkOOvWxl+SogrmfNu2Z+zoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F24BF80112;
	Wed, 23 Oct 2019 15:47:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAC9AF8058C; Wed, 23 Oct 2019 15:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF67BF8036F
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 15:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF67BF8036F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="pekETQ3R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IsfLscaMlV3XXR0DrLWblrwvvj8us1q6d7Uop7PR2hc=; b=pekETQ3RujtXW+HJ0zLylQIIrI
 uL4tJpyRAXexjMxreK+XbkhoC+IwZuS8ifrt9LHqgEek4I/LOO5EElXreDOY9zpaT8BuY619Yxc5F
 ObAO6ePyoHww5v3HUxhxAVAiRhwpZ8HE8nkAuPY4WRaa0HR+15YI2CbsFosQKq9TZJgxLRrI9sR9b
 CA8CKXccDOBsUAGVNFyClivKFvhZ8Winigy84+KdooDTkle+9Esv4bo1MPKg3mIC0CYTjhIYRTHzO
 D7AY9ulsLDfuLZ28q7dCpovvbVbu+0WhnWoba66XiCGvtz31PrYQCoWcYgzHHQQcaVPOM0SpnwHIb
 QbEA40BA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:51166 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1iNGyQ-0005Dl-34; Wed, 23 Oct 2019 14:46:50 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1iNGyP-0004oN-BA; Wed, 23 Oct 2019 14:46:49 +0100
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1iNGyP-0004oN-BA@rmk-PC.armlinux.org.uk>
Date: Wed, 23 Oct 2019 14:46:49 +0100
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.armlinux.org.uk
Subject: [alsa-devel] [PATCH] ASoC: kirkwood: fix device remove ordering
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
---
 sound/soc/kirkwood/kirkwood-i2s.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index c323ae314b55..eb38cdb37f0e 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -591,7 +591,7 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 		priv->ctl_rec |= KIRKWOOD_RECCTL_BURST_128;
 	}
 
-	err = devm_snd_soc_register_component(&pdev->dev, &kirkwood_soc_component,
+	err = snd_soc_register_component(&pdev->dev, &kirkwood_soc_component,
 					 soc_dai, 2);
 	if (err) {
 		dev_err(&pdev->dev, "snd_soc_register_component failed\n");
@@ -614,6 +614,7 @@ static int kirkwood_i2s_dev_remove(struct platform_device *pdev)
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
