Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1A1B6AE
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 15:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB9E16FA;
	Mon, 13 May 2019 15:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB9E16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557752764;
	bh=RduBxLMBVdtanfc0pYWMCT6Lml/ryAoVtN0UFynhxZI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vmnvLRQf9TJjaFejRDBqYEcxR3qKctGlUbwfWF1azgXPzJJOj9hy2+NWHkCH+mC7j
	 L1vXIewzK7xL4/gyUgRbO+Fj0WxlMLFxxLI/jPNeiqLivUAZHtMHMP30wnOAwj47t/
	 7NaFmq2y5aMZC4TA9KbjtUlISzRKUqBz6BwT8wEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98E7BF8973B;
	Mon, 13 May 2019 15:01:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3640DF89736; Mon, 13 May 2019 14:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 338DEF8973A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 338DEF8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JXfvZimZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jIlxRHUoM9Foab8i71XDSO/iG+88tlgzECxfBVkANrE=; b=JXfvZimZOWQm
 YVFvZZmAvohqXTCyHAyKN1jXt9p2G5mdwsYfn38moiCX4WHkbPdARjr8ZAQucgYIPWzf8RqqjFlzk
 hA5FZaksYc+Ij0nOE1rJmGxCF34eI+Yua28UfsSq6RSi+o9mTVhoPOowdiiY+QDmeXpER6z95NfWR
 +Wkmk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA69-0006Wl-3e; Mon, 13 May 2019 12:30:29 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 2FBE81129233; Mon, 13 May 2019 13:30:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190509030454.216079-1-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123028.2FBE81129233@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:28 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tiwai@suse.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: max98357a: request GPIO when device get
	probed" to the asoc tree
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

   ASoC: max98357a: request GPIO when device get probed

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

From bcd9382288af236321c83d27b0db196bf8814559 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 9 May 2019 11:04:54 +0800
Subject: [PATCH] ASoC: max98357a: request GPIO when device get probed

devm_gpiod_get_optional() returns EBUSY after component rebound.

Request GPIO in max98357a_platform_probe() to support component
rebinding.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98357a.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index d037a3e4d323..80080a6415b3 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -59,21 +59,7 @@ static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
 	{"Speaker", NULL, "HiFi Playback"},
 };
 
-static int max98357a_component_probe(struct snd_soc_component *component)
-{
-	struct gpio_desc *sdmode;
-
-	sdmode = devm_gpiod_get_optional(component->dev, "sdmode", GPIOD_OUT_LOW);
-	if (IS_ERR(sdmode))
-		return PTR_ERR(sdmode);
-
-	snd_soc_component_set_drvdata(component, sdmode);
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver max98357a_component_driver = {
-	.probe			= max98357a_component_probe,
 	.dapm_widgets		= max98357a_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(max98357a_dapm_widgets),
 	.dapm_routes		= max98357a_dapm_routes,
@@ -112,16 +98,20 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 
 static int max98357a_platform_probe(struct platform_device *pdev)
 {
+	struct gpio_desc *sdmode;
+
+	sdmode = devm_gpiod_get_optional(&pdev->dev,
+				"sdmode", GPIOD_OUT_LOW);
+	if (IS_ERR(sdmode))
+		return PTR_ERR(sdmode);
+
+	dev_set_drvdata(&pdev->dev, sdmode);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
 			&max98357a_dai_driver, 1);
 }
 
-static int max98357a_platform_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id max98357a_device_id[] = {
 	{ .compatible = "maxim,max98357a" },
@@ -145,7 +135,6 @@ static struct platform_driver max98357a_platform_driver = {
 		.acpi_match_table = ACPI_PTR(max98357a_acpi_match),
 	},
 	.probe	= max98357a_platform_probe,
-	.remove = max98357a_platform_remove,
 };
 module_platform_driver(max98357a_platform_driver);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
