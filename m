Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B56FF8F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDABE178D;
	Mon, 22 Jul 2019 14:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDABE178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798350;
	bh=VnqH659zFXUf1CBds46Z+PAets8O0iDFwOgabCHw4kw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DjSTsrORAVFeW99MZOU8URZJzWeiuxvByujUK61UMGVrF8/+XB/s47dWgtEe1B++5
	 oV7ODgY4AxtgFFoaNX//kc7xWB9LeabAw1uHBEzVLZPLdOlSs9fdY04IzMFRLa068b
	 bOvoF1FWI+rDfaKryF2pfa1iXV+I6JJHbDxgHVe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD57DF8049B;
	Mon, 22 Jul 2019 14:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F095F8049A; Mon, 22 Jul 2019 14:22:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1461F803F3
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1461F803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qvZYpcvf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Wo4/zlRZTk4/NetkkUklMz6RtXowuHCuG8Atk8CkqXQ=; b=qvZYpcvfeVFN
 Cv5uL8xac07qoN+mKDnpmsrI1JZvtSdJZZuXcMzZt46fEPFmdo7JF+ZHH4lr7cF5TJDOXBXnoNijb
 dGNALfXtwgozAGSYROlOlcw0J8O7iOQOCNZvRiu3D28DRQgMlcVrJ9lszHK6g8Uh7nwljnFMTUMjr
 5kz5A=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKR-0007cM-Fq; Mon, 22 Jul 2019 12:22:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B62D427429D9; Mon, 22 Jul 2019 13:22:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20190719143637.2018-1-l.stach@pengutronix.de>
X-Patchwork-Hint: ignore
Message-Id: <20190722122206.B62D427429D9@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:06 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, "Andrew F. Davis" <afd@ti.com>
Subject: [alsa-devel] Applied "ASoC: tlv320aic31xx: suppress error message
	for EPROBE_DEFER" to the asoc tree
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

   ASoC: tlv320aic31xx: suppress error message for EPROBE_DEFER

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

From 907256f4aa6761f3830bf2ca06434778ab5f5596 Mon Sep 17 00:00:00 2001
From: Lucas Stach <l.stach@pengutronix.de>
Date: Fri, 19 Jul 2019 16:36:37 +0200
Subject: [PATCH] ASoC: tlv320aic31xx: suppress error message for EPROBE_DEFER

Both the supplies and reset GPIO might need a probe deferral for the
resource to be available. Don't print a error message in that case, as
it is a normal operating condition.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Andrew F. Davis <afd@ti.com>
Link: https://lore.kernel.org/r/20190719143637.2018-1-l.stach@pengutronix.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 9b37e98da0db..26a4f6cd3288 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1553,7 +1553,8 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
 	aic31xx->gpio_reset = devm_gpiod_get_optional(aic31xx->dev, "reset",
 						      GPIOD_OUT_LOW);
 	if (IS_ERR(aic31xx->gpio_reset)) {
-		dev_err(aic31xx->dev, "not able to acquire gpio\n");
+		if (PTR_ERR(aic31xx->gpio_reset) != -EPROBE_DEFER)
+			dev_err(aic31xx->dev, "not able to acquire gpio\n");
 		return PTR_ERR(aic31xx->gpio_reset);
 	}
 
@@ -1564,7 +1565,9 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
 				      ARRAY_SIZE(aic31xx->supplies),
 				      aic31xx->supplies);
 	if (ret) {
-		dev_err(aic31xx->dev, "Failed to request supplies: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(aic31xx->dev,
+				"Failed to request supplies: %d\n", ret);
 		return ret;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
