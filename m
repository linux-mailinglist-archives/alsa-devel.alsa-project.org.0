Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19F164095
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 10:41:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544ED1695;
	Wed, 19 Feb 2020 10:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544ED1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582105300;
	bh=E+0slooCSG9BioJSZQ1BmBJ4LSqlI8jE2MUXjjvMV4o=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLxsbxoNCGQlLRuIkt4ityMRC4WlRuqBpWzhVswFysbIo0jg5TglNzzSFFL1Hljp6
	 r1O25WdelYnMKcXIxOSb5YyUdHnk44sZpKsGkd1ylyZTwb/yroaHmkMSXAnHXsqGNs
	 xJQNEwp2BWBlDGhayDNfxuAXIvW85Hf88+3K1by8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06306F80276;
	Wed, 19 Feb 2020 10:39:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E2F1F80273; Wed, 19 Feb 2020 10:38:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC31CF801F4
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC31CF801F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="azLn6BGP"
Received: by mail-vs1-xe4a.google.com with SMTP id x1so1836407vsj.17
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pj5VCG1MPaTGtnRrJLH6+mF9GNS2bP/wgfbDqZ0XUMM=;
 b=azLn6BGPPuwLVZtVkjMP+vhlzJ7rJhyBnxWT5W4FT9oTxeEDPoGMvpXw7IEgpSUyvL
 xBjLcaL8uZjBgnMMUksiJ4i5Ex6758Z598h3AANbsUrckoaq7xrn/8j0yoFe0IIKWmh3
 96clJA6WfHROVtCNoQLDegomEXSJfi77cEJ9SAh2RQnomXmgBwfXHTj/utF5oXly0kJX
 TENYfArF/yLqhQSbO7DpLCicaioGxgnlJ5y0zN2AWMv4TPkC/nsvml4xjy3JbyyQwWT2
 mOesvd2GA9BnowjepZIi39P2yKyo9d31ag7bY4pIFvzFppV1SasM7j3mLVvXYghXT1dw
 WJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pj5VCG1MPaTGtnRrJLH6+mF9GNS2bP/wgfbDqZ0XUMM=;
 b=IFlq/xQt6IDSCR6pbma+ttIJ5rch/xbUE8m2uY4xO5D881QJdcCTYsEhmBLmHsC4FC
 bgOsT20C046Bbpxdzcwi2HohuCQLHJ5qPR30WkjwBBrHrM85IweEh+mEkM6gTgbGqBlq
 3z61BVYJh7+eCIPgPMW8gv6DC7fIhGpVDYA1Ao+CqL06eSev9a8JFMJsy1kMkLqbezbz
 WLTgmKN1DlZtK7Zc+Kg5d7fzz+UOfO5dbIF3vZn80sn45SSaShzHl3XLo+QJzNbxal0w
 f8M/ju8RHde70BYU5pvRMHxqCjIC+WJZQEPKMWMj+Atkd7AwQe3JJE8j3YqjNOfW2Pp+
 IziQ==
X-Gm-Message-State: APjAAAV5ZcGpTs57V8Ayb4Mj6a+7Xif1AtkDVStrT0oEmGrD5h5VoFSp
 aAHJ6aFvwqNU2RvpvrsieN/vA61S+Yu4
X-Google-Smtp-Source: APXvYqw6VSaWFAJe/GE5FRIBuj+vGf1X+LC28V8aRtMCEIocQi8HY5Sdie25HAEX0nFz/6XIAx4xPuj9Oe8R
X-Received: by 2002:a67:ce93:: with SMTP id c19mr12956859vse.64.1582105134705; 
 Wed, 19 Feb 2020 01:38:54 -0800 (PST)
Date: Wed, 19 Feb 2020 17:38:39 +0800
In-Reply-To: <20200219093839.6212-1-tzungbi@google.com>
Message-Id: <20200219170951.2.I7ed16ef57d9e0bcafc37e766142f68cbad5b54c6@changeid>
Mime-Version: 1.0
References: <20200219093839.6212-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [RFC PATCH 2/2] ASoC: mediatek: mt8183-da7219: use
 SND_SOC_DAPM_PINCTRL in TDM out
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
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

Uses SND_SOC_DAPM_PINCTRL in TDM out to simplify code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.25.0.265.gbab2e86ba0-goog

