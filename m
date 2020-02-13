Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B9B15BF75
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0CC1672;
	Thu, 13 Feb 2020 14:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0CC1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581600896;
	bh=Xrk2k535emUxlhldZzSQ/GRBk4dPAj34ovFRzKNTEAk=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gLcCMjeOvCo1IWC6lVfVbmjc1GUxVm9K/AlewiwzXt5nWeoy/Y2xJlGGCH6Sv90OF
	 qRByoG83RibOzNhoQcICKthWey9fcqw+9+tKLaQZ9Ci+Xl5CPuZz8HD8Mlu8HLMbzf
	 b1tqRqeoBHApUCaLqPI3h10hScRZAm8F+v4s2a6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84FF8F80276;
	Thu, 13 Feb 2020 14:32:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EBEAF80276; Thu, 13 Feb 2020 14:32:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EF1D0F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF1D0F80138
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09EC71063;
 Thu, 13 Feb 2020 05:32:08 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 731923F6CF;
 Thu, 13 Feb 2020 05:32:07 -0800 (PST)
Date: Thu, 13 Feb 2020 13:32:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183-da7219: apply some
	refactors" to the asoc tree
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

   ASoC: mediatek: mt8183-da7219: apply some refactors

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From ff0035e4c22371a29e4e0d4a07cdce5726fe50aa Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 11:27:28 +0800
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: apply some refactors

1. Moves headset jack to card-specific storage.
2. Removes trailing blank line.
3. Moves card registration to the end of probe.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200213112003.4.Ia542007f51d3de753a9e0a83135ee074581dbf71@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index c7f766f24e44..c0c85972cfb7 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -16,8 +16,6 @@
 #include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
 
-static struct snd_soc_jack headset_jack;
-
 enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
 	PIN_TDM_OUT_ON,
@@ -32,6 +30,7 @@ static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
 struct mt8183_da7219_max98357_priv {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+	struct snd_soc_jack headset_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -510,6 +509,8 @@ static int
 mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 {
 	int ret;
+	struct mt8183_da7219_max98357_priv *priv =
+			snd_soc_card_get_drvdata(component->card);
 
 	/* Enable Headset and 4 Buttons Jack detection */
 	ret = snd_soc_card_jack_new(&mt8183_da7219_max98357_card,
@@ -517,12 +518,12 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 				    SND_JACK_HEADSET |
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &headset_jack,
+				    &priv->headset_jack,
 				    NULL, 0);
 	if (ret)
 		return ret;
 
-	da7219_aad_jack_det(component, &headset_jack);
+	da7219_aad_jack_det(component, &priv->headset_jack);
 
 	return ret;
 }
@@ -559,13 +560,6 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
-		return ret;
-	}
-
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -607,7 +601,7 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 				 __func__, ret);
 	}
 
-	return ret;
+	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 #ifdef CONFIG_OF
@@ -634,4 +628,3 @@ MODULE_DESCRIPTION("MT8183-DA7219-MAX98357 ALSA SoC machine driver");
 MODULE_AUTHOR("Shunli Wang <shunli.wang@mediatek.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mt8183_da7219_max98357 soc card");
-
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
