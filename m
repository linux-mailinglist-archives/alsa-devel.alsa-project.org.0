Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C14649D6
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:39:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6303216AE;
	Wed, 10 Jul 2019 17:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6303216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562773193;
	bh=gRhtGO1H7PExuWzHHqVag3mVyJYxGH9Jq8o5F8UZygY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cCWTlspjp0wMXQIdwPErln2kI1oH+WTSpjGSBSpnU0q28gHfPhNrZU0dR3yCeSIll
	 i1j8FrxKwN8aDLaOGk4qOdaHaeujzYPA5h8H8AgnQuT78qpE2r5imWAv/vDcw55TDC
	 7oYrpglpYk4601DSv82VUOMusI9m7ObFnXjrwdl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72754F8038F;
	Wed, 10 Jul 2019 17:34:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05AF6F80367; Wed, 10 Jul 2019 17:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A76BF80307
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A76BF80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G6WFmVtN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GHgUPkVgLt5WdVv9Sq+leNmeBcsj16fbggOBYETA+hw=; b=G6WFmVtNSeV5
 8FT5XZwNLA8KfDyZqRnLnhJ7AIf7GMdBQH858703K1WJk86SvekXoUs0XXl7PlWYOVL/lxeTdG+HZ
 jz2XGNTHfKvpI2pz4cAHVwSN7Qi/UP6TgF+xXatzhSuxb68e9g2Lc7h46xD9UuV4t0ugX8SwzebZ2
 xZ2lk=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcL-00083K-Oi; Wed, 10 Jul 2019 15:34:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 71C0BD02D7C; Wed, 10 Jul 2019 16:34:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190708141901.68797-1-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190710153449.71C0BD02D7C@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:49 +0100 (BST)
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, dgreid@google.com, cychiang@google.com
Subject: [alsa-devel] Applied "ASoC: max98357a: use mdelay for sdmode-delay"
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

   ASoC: max98357a: use mdelay for sdmode-delay

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

From 6cd249cfad68a231336983e2216d75b3ddfde1d6 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 8 Jul 2019 22:19:01 +0800
Subject: [PATCH] ASoC: max98357a: use mdelay for sdmode-delay

max98357a_daiops_trigger() is possible to be called in atomic context if
the .nonatomic flag is equal to 0 in the DAI links.

When cancel_delayed_work_sync() in max98357a_daiops_trigger() is called
in atomic context, kernel emits the following message: "BUG: sleeping
function called from invalid context".

According to the DT binding document, value less than or equal to 5ms of
sdmod-delay should be sufficient to avoid the pop noise.  Use mdelay
(i.e. busy loop) for such low delay should be acceptable.

Fixes: cec5b01f8f1c ("ASoC: max98357a: avoid speaker pop when playback
startup")

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20190708141901.68797-1-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98357a.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 6f0e28f903bf..16313b973eaa 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -20,20 +20,10 @@
 #include <sound/soc-dapm.h>
 
 struct max98357a_priv {
-	struct delayed_work enable_sdmode_work;
 	struct gpio_desc *sdmode;
 	unsigned int sdmode_delay;
 };
 
-static void max98357a_enable_sdmode_work(struct work_struct *work)
-{
-	struct max98357a_priv *max98357a =
-	container_of(work, struct max98357a_priv,
-			enable_sdmode_work.work);
-
-	gpiod_set_value(max98357a->sdmode, 1);
-}
-
 static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
@@ -46,14 +36,12 @@ static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		queue_delayed_work(system_power_efficient_wq,
-				&max98357a->enable_sdmode_work,
-				msecs_to_jiffies(max98357a->sdmode_delay));
+		mdelay(max98357a->sdmode_delay);
+		gpiod_set_value(max98357a->sdmode, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		cancel_delayed_work_sync(&max98357a->enable_sdmode_work);
 		gpiod_set_value(max98357a->sdmode, 0);
 		break;
 	}
@@ -112,30 +100,25 @@ static int max98357a_platform_probe(struct platform_device *pdev)
 	int ret;
 
 	max98357a = devm_kzalloc(&pdev->dev, sizeof(*max98357a), GFP_KERNEL);
-
 	if (!max98357a)
 		return -ENOMEM;
 
 	max98357a->sdmode = devm_gpiod_get_optional(&pdev->dev,
 				"sdmode", GPIOD_OUT_LOW);
-
 	if (IS_ERR(max98357a->sdmode))
 		return PTR_ERR(max98357a->sdmode);
 
 	ret = device_property_read_u32(&pdev->dev, "sdmode-delay",
 					&max98357a->sdmode_delay);
-
 	if (ret) {
 		max98357a->sdmode_delay = 0;
 		dev_dbg(&pdev->dev,
-			"no optional property 'sdmode-delay' found, default: no delay\n");
+			"no optional property 'sdmode-delay' found, "
+			"default: no delay\n");
 	}
 
 	dev_set_drvdata(&pdev->dev, max98357a);
 
-	INIT_DELAYED_WORK(&max98357a->enable_sdmode_work,
-				max98357a_enable_sdmode_work);
-
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
 			&max98357a_dai_driver, 1);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
