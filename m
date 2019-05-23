Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB027ECE
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252C91680;
	Thu, 23 May 2019 15:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252C91680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558619553;
	bh=H3Gr+uL7fpPwfOUtxmUDpI3z1aw0C5BCnKXeaJ1erRg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=D4KgRYz3UIsbASogA0pXzG3J9d1YiXikn/O5ojmsnn3scsQts6PtoD7pW4pH4gt8z
	 /AmDqZJx/cZPN0RKytD1aDB558PZoXdoJ2LXDt67US0xI0hgOfOJ851dTPcEam54dR
	 8j5Dvzb0WGSMj4uvv5FUTC8rYRumzNuO5rAxG2So=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F33B2F89732;
	Thu, 23 May 2019 15:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9020FF8972C; Thu, 23 May 2019 15:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35542F89715
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 15:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35542F89715
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TNABHAgP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JoiHqqtt4OG0WGA/0z1pluGicYFV1/H2buee19r+gh0=; b=TNABHAgPrrev
 dZcA7ct0s0IAOV39UC5oH6VCKMjTBjeMlBIscEGqrUomKmSEgMz3redc/sZpVnIvxto1fuyX1GOGS
 erH/fZB/jOamwgIHW9VXoCMx3zZvgkshpVJ7FiMJn/g7o0P13uVQU14V0rrNirLU9GOZHzVe7LxAU
 dvKvY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTo5W-0000E0-3X; Thu, 23 May 2019 13:48:54 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 9FB631126D24; Thu, 23 May 2019 14:48:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190522145402.256102-1-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190523134853.9FB631126D24@debutante.sirena.org.uk>
Date: Thu, 23 May 2019 14:48:53 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: move card
	registration to the end of probe" to the asoc tree
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

   ASoC: mediatek: mt8183: move card registration to the end of probe

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

From 63ba8e4d04ab921f8aaa89227d2e0f7ad79725be Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 22 May 2019 22:54:02 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: move card registration to the end of
 probe

mt8183_mt6358_ts3a227_max98357_dev_probe() does not return immediately
if devm_snd_soc_register_card() returns fail.  As a result, the rest of
code still get executed.

Two options to fix:
1. add an extra return statement if devm_snd_soc_register_card()
   returns fail
2. move devm_snd_soc_register_card() to the end of probe

Adopt option 2 which is more clear and common.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 1ba7aa58e4b6..23c422f13808 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -331,7 +331,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
 	struct pinctrl *default_pins;
-	int ret, i;
+	int i;
 
 	card->dev = &pdev->dev;
 
@@ -366,11 +366,6 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
-
 	default_pins =
 		devm_pinctrl_get_select(&pdev->dev, PINCTRL_STATE_DEFAULT);
 	if (IS_ERR(default_pins)) {
@@ -379,7 +374,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(default_pins);
 	}
 
-	return ret;
+	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 #ifdef CONFIG_OF
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
