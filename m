Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA664165156
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:06:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDFC169E;
	Wed, 19 Feb 2020 22:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDFC169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146410;
	bh=EyufY38Z9nGUxmcEP1ZllO/CxlUOwLG40fEWwHRg0tU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YDd3DnIiqv9V/oBid4bQpTwVt8dCpTyBstabZRw56tHWkyUWiW3N0IF2K9zeCSmj1
	 yZGRFQlbchAVfVQu3NeRT+S2dQLOs1meN2GO6k4aWlETbBkJqv40u1sG+knagEPY9c
	 08achLuHcGjsDd23yDuk4GFdrnN4AnyBnSxW4jnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE9C2F80331;
	Wed, 19 Feb 2020 21:57:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D1DF80321; Wed, 19 Feb 2020 21:57:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5A0A3F80306
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A0A3F80306
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92B67FEC;
 Wed, 19 Feb 2020 12:57:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177803F68F;
 Wed, 19 Feb 2020 12:57:48 -0800 (PST)
Date: Wed, 19 Feb 2020 20:57:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Applied "ASoC: mediatek: mt8183-da7219: use SND_SOC_DAPM_PINCTRL in
 TDM out" to the asoc tree
In-Reply-To: <20200219170951.2.I7ed16ef57d9e0bcafc37e766142f68cbad5b54c6@changeid>
Message-Id: <applied-20200219170951.2.I7ed16ef57d9e0bcafc37e766142f68cbad5b54c6@changeid>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, cychiang@google.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: mediatek: mt8183-da7219: use SND_SOC_DAPM_PINCTRL in TDM out

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

From c77b8317ee3ab43634421afb73fdb1ea253d3d47 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 19 Feb 2020 17:38:39 +0800
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: use SND_SOC_DAPM_PINCTRL in
 TDM out

Uses SND_SOC_DAPM_PINCTRL in TDM out to simplify code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200219170951.2.I7ed16ef57d9e0bcafc37e766142f68cbad5b54c6@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 98 ++-----------------
 1 file changed, 10 insertions(+), 88 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index c0c85972cfb7..03d104fbe185 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -16,20 +16,7 @@
 #include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
 
-enum PINCTRL_PIN_STATE {
-	PIN_STATE_DEFAULT = 0,
-	PIN_TDM_OUT_ON,
-	PIN_TDM_OUT_OFF,
-	PIN_STATE_MAX
-};
-
-static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
-	"default", "aud_tdm_out_on", "aud_tdm_out_off",
-};
-
 struct mt8183_da7219_max98357_priv {
-	struct pinctrl *pinctrl;
-	struct pinctrl_state *pin_states[PIN_STATE_MAX];
 	struct snd_soc_jack headset_jack;
 };
 
@@ -259,47 +246,6 @@ SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static int mt8183_da7219_tdm_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct mt8183_da7219_max98357_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	int ret;
-
-	if (IS_ERR(priv->pin_states[PIN_TDM_OUT_ON]))
-		return PTR_ERR(priv->pin_states[PIN_TDM_OUT_ON]);
-
-	ret = pinctrl_select_state(priv->pinctrl,
-				   priv->pin_states[PIN_TDM_OUT_ON]);
-	if (ret)
-		dev_err(rtd->card->dev, "%s failed to select state %d\n",
-			__func__, ret);
-
-	return ret;
-}
-
-static void mt8183_da7219_tdm_shutdown(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct mt8183_da7219_max98357_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	int ret;
-
-	if (IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF]))
-		return;
-
-	ret = pinctrl_select_state(priv->pinctrl,
-				   priv->pin_states[PIN_TDM_OUT_OFF]);
-	if (ret)
-		dev_err(rtd->card->dev, "%s failed to select state %d\n",
-			__func__, ret);
-}
-
-static struct snd_soc_ops mt8183_da7219_tdm_ops = {
-	.startup = mt8183_da7219_tdm_startup,
-	.shutdown = mt8183_da7219_tdm_shutdown,
-};
-
 static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 	/* FE */
 	{
@@ -455,7 +401,6 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-		.ops = &mt8183_da7219_tdm_ops,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
@@ -482,10 +427,13 @@ static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls[] = {
 static const
 struct snd_soc_dapm_widget mt8183_da7219_max98357_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_PINCTRL("TDM_OUT_PINCTRL",
+			     "aud_tdm_out_on", "aud_tdm_out_off"),
 };
 
 static const struct snd_soc_dapm_route mt8183_da7219_max98357_dapm_routes[] = {
 	{"Speakers", NULL, "Speaker"},
+	{"I2S Playback", NULL, "TDM_OUT_PINCTRL"},
 };
 
 static struct snd_soc_card mt8183_da7219_max98357_card = {
@@ -534,6 +482,7 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_da7219_max98357_priv *priv;
+	struct pinctrl *pinctrl;
 	int ret, i;
 
 	card->dev = &pdev->dev;
@@ -566,39 +515,12 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
-	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(priv->pinctrl)) {
-		dev_err(&pdev->dev, "%s devm_pinctrl_get failed\n",
-			__func__);
-		return PTR_ERR(priv->pinctrl);
-	}
-
-	for (i = 0; i < PIN_STATE_MAX; i++) {
-		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
-							   mt8183_pin_str[i]);
-		if (IS_ERR(priv->pin_states[i])) {
-			ret = PTR_ERR(priv->pin_states[i]);
-			dev_info(&pdev->dev, "%s Can't find pin state %s %d\n",
-				 __func__, mt8183_pin_str[i], ret);
-		}
-	}
-
-	if (!IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF])) {
-		ret = pinctrl_select_state(priv->pinctrl,
-					   priv->pin_states[PIN_TDM_OUT_OFF]);
-		if (ret)
-			dev_info(&pdev->dev,
-				 "%s failed to select state %d\n",
-				 __func__, ret);
-	}
-
-	if (!IS_ERR(priv->pin_states[PIN_STATE_DEFAULT])) {
-		ret = pinctrl_select_state(priv->pinctrl,
-					   priv->pin_states[PIN_STATE_DEFAULT]);
-		if (ret)
-			dev_info(&pdev->dev,
-				 "%s failed to select state %d\n",
-				 __func__, ret);
+	pinctrl = devm_pinctrl_get_select(&pdev->dev, PINCTRL_STATE_DEFAULT);
+	if (IS_ERR(pinctrl)) {
+		ret = PTR_ERR(pinctrl);
+		dev_err(&pdev->dev, "%s failed to select default state %d\n",
+			__func__, ret);
+		return ret;
 	}
 
 	return devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.20.1

