Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC49216FD
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 12:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D990D16C6;
	Fri, 17 May 2019 12:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D990D16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558089395;
	bh=5gv+NwK6byu+yVw6//bPvTAvgEAhkCBDV5ySHEI31ik=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gqc4M0nXQxcXPuYJRrXSykj/gGXXtzYZWdAi8wqfXeFlsXy9+64elA8VJ+POnnqTH
	 5jrQEJxRDWhCc1jUg1YnXG+nXHVzma1XYGPo/ba4iezDjdU6WnoKWZ0Y70CHyCyipi
	 7zsWkNSDuTFHUPYlTSb318XckPlF9gdruqzBzSd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB130F896B8;
	Fri, 17 May 2019 12:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9280F8968A; Fri, 17 May 2019 12:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B48D8F80C18
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 12:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B48D8F80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s29sQGfK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=OKdDrU1lFWdXayu76ojzkhM6P19Gv62PlFxoKKvTCgk=; b=s29sQGfKZewU
 1n4TIX62DJqE1DDXD4khiPWafGv3MEwkyi6+PenA/ztzkAmwFXarMg57i8ZHd4ddgR+d8vPe74ilh
 D38zT/xVxSA1mBagekWKtOjEdx1RKko4cG6rV4xmavKSyMwGGASk/2z2JjyikoALAMxXtv15J1cBK
 keffs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRaCF-0001gV-J1; Fri, 17 May 2019 10:34:39 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 130F41126D71; Fri, 17 May 2019 11:34:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: S.j. Wang <shengjiu.wang@nxp.com>
In-Reply-To: <95eb314ef6d47ee6581094a406516a6069278d56.1557986457.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190517103439.130F41126D71@debutante.sirena.org.uk>
Date: Fri, 17 May 2019 11:34:39 +0100 (BST)
Cc: brian.austin@cirrus.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs42xx8: Add reset gpio handling" to
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

   ASoC: cs42xx8: Add reset gpio handling

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From bfe95dfa4dacefbe20a8532bdac0a19da0708be4 Mon Sep 17 00:00:00 2001
From: "S.j. Wang" <shengjiu.wang@nxp.com>
Date: Thu, 16 May 2019 06:04:58 +0000
Subject: [PATCH] ASoC: cs42xx8: Add reset gpio handling

Handle the reset GPIO and reset the device every time we
start it.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index ebb9e0cf8364..3e8dbf63adbe 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm_params.h>
@@ -45,6 +46,7 @@ struct cs42xx8_priv {
 	bool slave_mode;
 	unsigned long sysclk;
 	u32 tx_channels;
+	struct gpio_desc *gpiod_reset;
 };
 
 /* -127.5dB to 0dB with step of 0.5dB */
@@ -467,6 +469,13 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap)
 		return -EINVAL;
 	}
 
+	cs42xx8->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
+							GPIOD_OUT_HIGH);
+	if (IS_ERR(cs42xx8->gpiod_reset))
+		return PTR_ERR(cs42xx8->gpiod_reset);
+
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
+
 	cs42xx8->clk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(cs42xx8->clk)) {
 		dev_err(dev, "failed to get the clock: %ld\n",
@@ -547,6 +556,8 @@ static int cs42xx8_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(cs42xx8->supplies),
 				    cs42xx8->supplies);
 	if (ret) {
@@ -585,6 +596,8 @@ static int cs42xx8_runtime_suspend(struct device *dev)
 	regulator_bulk_disable(ARRAY_SIZE(cs42xx8->supplies),
 			       cs42xx8->supplies);
 
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 1);
+
 	clk_disable_unprepare(cs42xx8->clk);
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
