Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFDBBDDE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 23:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E16016A4;
	Mon, 23 Sep 2019 23:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E16016A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569273941;
	bh=VkDqPm5yM0lEvyNOmG3FOEW9+HwWPHbC8A0+WdpdeI0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RxBaougjmnlVxhltKycgcHhnwsWXBVIHyxtlzPoeOPdT/neG6Oc92iDFOj6WtfRHe
	 J2wir9smhK7o9V0XOffZ/RJWCn2JaF8+91bv17c/6rPiZEZvpRF8vuzCEE33LghI/y
	 7selCUq+HXaos2nOfF7++GHzlQZH8aRKGxHSR5CU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B932F8060F;
	Mon, 23 Sep 2019 23:23:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24419F805FA; Mon, 23 Sep 2019 23:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29733F80307
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 23:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29733F80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SN5JixZE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z30npgjJlfsX3pcTiPkG0AL67G6fDNe+i+Vmfku2RTI=; b=SN5JixZECNnp
 KI8DVqCg95UnVrrspPqxew/gm2Ds+7MkbiFVeEkA990dDCSvzz/HQdHcvCjubGAziBfYZBbdot4Aq
 DQJPbZjeHIP1DI0Gy0/+B+okYNLR5xGb/L8GwJ3mqqRttUAUz/tSA40HF2h7omqp83kRK6I4TU2GZ
 j1LH0=;
Received: from [12.157.10.114] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iCVnR-0005WT-3u; Mon, 23 Sep 2019 21:23:01 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7F00DD02FE4; Mon, 23 Sep 2019 22:22:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20190920130218.32690-3-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20190923212259.7F00DD02FE4@fitzroy.sirena.org.uk>
Date: Mon, 23 Sep 2019 22:22:59 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Subject: [alsa-devel] Applied "ASoC: samsung: arndale: Add missing OF node
	dereferencing" to the asoc tree
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

   ASoC: samsung: arndale: Add missing OF node dereferencing

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

From fb629fa2587d0c150792d87e3053664bfc8dc78c Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 20 Sep 2019 15:02:11 +0200
Subject: [PATCH] ASoC: samsung: arndale: Add missing OF node dereferencing

Ensure there is no OF node references kept when the driver
is removed/unbound.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20190920130218.32690-3-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/arndale_rt5631.c | 34 ++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index c213913eb984..fd8c6642fb0d 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -5,6 +5,7 @@
 //  Author: Claude <claude@insginal.co.kr>
 
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 
@@ -74,6 +75,17 @@ static struct snd_soc_card arndale_rt5631 = {
 	.num_links = ARRAY_SIZE(arndale_rt5631_dai),
 };
 
+static void arndale_put_of_nodes(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	for_each_card_prelinks(card, i, dai_link) {
+		of_node_put(dai_link->cpus->of_node);
+		of_node_put(dai_link->codecs->of_node);
+	}
+}
+
 static int arndale_audio_probe(struct platform_device *pdev)
 {
 	int n, ret;
@@ -103,18 +115,31 @@ static int arndale_audio_probe(struct platform_device *pdev)
 		if (!arndale_rt5631_dai[0].codecs->of_node) {
 			dev_err(&pdev->dev,
 			"Property 'samsung,audio-codec' missing or invalid\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_put_of_nodes;
 		}
 	}
 
 	ret = devm_snd_soc_register_card(card->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
+		goto err_put_of_nodes;
+	}
+	return 0;
 
-	if (ret)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
-
+err_put_of_nodes:
+	arndale_put_of_nodes(card);
 	return ret;
 }
 
+static int arndale_audio_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+
+	arndale_put_of_nodes(card);
+	return 0;
+}
+
 static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
 	{ .compatible = "samsung,arndale-rt5631", },
 	{ .compatible = "samsung,arndale-alc5631", },
@@ -129,6 +154,7 @@ static struct platform_driver arndale_audio_driver = {
 		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
 	},
 	.probe = arndale_audio_probe,
+	.remove = arndale_audio_remove,
 };
 
 module_platform_driver(arndale_audio_driver);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
