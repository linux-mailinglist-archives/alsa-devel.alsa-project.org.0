Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F1150299
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 09:30:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD2E1685;
	Mon,  3 Feb 2020 09:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD2E1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580718629;
	bh=M5+NSyOS47rjE4KriJWo1dm7/DTk4v7KzN5ywkfg8Ig=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvQs6mxJkfAQL8K+gl4AKRwUNkTUWBky+qmIZdoCZzvARr9IPojJUkLo1cd8j+CYX
	 VvZjAcvIflTU8LPgN2Ms89n3DCODtrYkiHB52hGMlQW6nlWWBwbWN73Xz7pNI11AF5
	 tjBxsw/XVnjt3COlzlBu5xJE0sBY5vsrZf0ei8A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10373F80264;
	Mon,  3 Feb 2020 09:27:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3560F80274; Mon,  3 Feb 2020 09:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C2BF80264
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 09:27:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C2BF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="XBtVXCyo"
Received: by mail-pj1-x104a.google.com with SMTP id d22so7770528pjz.0
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=jRE5YctnhREGEzvzaz37kAkC6vHVXD4/7D5M3YqRd04=;
 b=XBtVXCyozSDljvzVOsnnk2jbQGsOD8dOpItbjzAeuiUS5eDU+yX3WnmCd+W6CTxD32
 3+ib0tdeRJzHZkCQY4GzzV7beh0vzuP+jn7Gme+MZ/5NoBRHwxBvV49TMtplFEmqfFdu
 8DCAWccyqcOQ1IBBSz0CohNaLdF3IezC4c5XInyeRtu8FUdQAUoMwte3/v+gKRLgDJZN
 Jn5YSqYKQI8rH7FOawK+4+/ULe8t34hWnC4lW2bhEb/c9c0hVTxrF4PUcJi5Ncn7XT9i
 lGi+JezWaR8Feo/T8WuA7Mv0ekaSlK7nxy7gaxiO+8z9KLmuN7BvoiX7Tjqz4to8UI5f
 /kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jRE5YctnhREGEzvzaz37kAkC6vHVXD4/7D5M3YqRd04=;
 b=HZT6Pq4gS1BIEG9VQW+XiAoVwE+gEHmcr4f1KJSdpbFY/jJT28IYX4bBDhYVHNegpJ
 OfWWIkIXxeht3WevUNilbLWCemfzD4b2CtOe/WV6WKBCvBS11J1JXUEL/VKQHHgQOXvW
 MWS59lBxlIKWikaUcWyGK/AgfaZP2UeK2yXo5G12fyj+PAZiHlNziQX0yAV+ZVvIVFVJ
 bSM/ozKo0TUtTgwhk7LMpOX9zUNpR8U3LudKHOpj2KFEKqASUbDL6EU2o8WOSEqj20jH
 ge/0RbgcyeoNrCrw4qXhfii/rctAR0J0xf4uAnQxQsnaPZ/cpK7k0hTiXJZvd4jJw3YO
 pIsg==
X-Gm-Message-State: APjAAAW8uqCVk/mEEiwxIJxdC1o7XzZUKVFA04v7LDR2TCIDMMuB8Zm5
 tNABYK+J0lyYaAYpimWO0/Q8UCcfxTJ2
X-Google-Smtp-Source: APXvYqzfEDnU4rS8T+YWltksmDaJW6CvAiH7kmH8K7oI4QzX2riRkywtu3IEnjj05qbxnHTZEQl71nTrvMQd
X-Received: by 2002:a63:778f:: with SMTP id s137mr25003421pgc.49.1580718459438; 
 Mon, 03 Feb 2020 00:27:39 -0800 (PST)
Date: Mon,  3 Feb 2020 16:27:16 +0800
In-Reply-To: <20200203082718.59614-1-tzungbi@google.com>
Message-Id: <20200203151250.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid>
Mime-Version: 1.0
References: <20200203082718.59614-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 2/4] ASoC: mediatek: mt8183-da7219: pull TDM
 GPIO pins down when probed
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

1. Switch TDM GPIO pins according to playback on or off.
2. Pull TDM GPIO pins down when probed to avoid current leakage.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 104 +++++++++++++++++-
 1 file changed, 98 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index b7d4bfd04b37..450fb1efa239 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -18,6 +18,22 @@
 
 static struct snd_soc_jack headset_jack;
 
+enum PINCTRL_PIN_STATE {
+	PIN_STATE_DEFAULT = 0,
+	PIN_TDM_OUT_ON,
+	PIN_TDM_OUT_OFF,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
+	"default", "aud_tdm_out_on", "aud_tdm_out_off",
+};
+
+struct mt8183_da7219_max98357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -244,6 +260,47 @@ SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+static int mt8183_da7219_tdm_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8183_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	if (IS_ERR(priv->pin_states[PIN_TDM_OUT_ON]))
+		return PTR_ERR(priv->pin_states[PIN_TDM_OUT_ON]);
+
+	ret = pinctrl_select_state(priv->pinctrl,
+				   priv->pin_states[PIN_TDM_OUT_ON]);
+	if (ret)
+		dev_err(rtd->card->dev, "%s failed to select state %d\n",
+			__func__, ret);
+
+	return ret;
+}
+
+static void mt8183_da7219_tdm_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8183_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	if (IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF]))
+		return;
+
+	ret = pinctrl_select_state(priv->pinctrl,
+				   priv->pin_states[PIN_TDM_OUT_OFF]);
+	if (ret)
+		dev_err(rtd->card->dev, "%s failed to select state %d\n",
+			__func__, ret);
+}
+
+static struct snd_soc_ops mt8183_da7219_tdm_ops = {
+	.startup = mt8183_da7219_tdm_startup,
+	.shutdown = mt8183_da7219_tdm_shutdown,
+};
+
 static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 	/* FE */
 	{
@@ -395,6 +452,8 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
+		.ops = &mt8183_da7219_tdm_ops,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
@@ -451,7 +510,7 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8183_da7219_max98357_card;
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
-	struct pinctrl *default_pins;
+	struct mt8183_da7219_max98357_priv *priv;
 	int ret, i;
 
 	card->dev = &pdev->dev;
@@ -485,12 +544,45 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	default_pins =
-		devm_pinctrl_get_select(&pdev->dev, PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(default_pins)) {
-		dev_err(&pdev->dev, "%s set pins failed\n",
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(priv->pinctrl)) {
+		dev_err(&pdev->dev, "%s devm_pinctrl_get failed\n",
 			__func__);
-		return PTR_ERR(default_pins);
+		return PTR_ERR(priv->pinctrl);
+	}
+
+	for (i = 0; i < PIN_STATE_MAX; i++) {
+		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
+							   mt8183_pin_str[i]);
+		if (IS_ERR(priv->pin_states[i])) {
+			ret = PTR_ERR(priv->pin_states[i]);
+			dev_info(&pdev->dev, "%s Can't find pin state %s %d\n",
+				 __func__, mt8183_pin_str[i], ret);
+		}
+	}
+
+	if (!IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF])) {
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_TDM_OUT_OFF]);
+		if (ret)
+			dev_info(&pdev->dev,
+				 "%s failed to select state %d\n",
+				 __func__, ret);
+	}
+
+	if (!IS_ERR(priv->pin_states[PIN_STATE_DEFAULT])) {
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_DEFAULT]);
+		if (ret)
+			dev_info(&pdev->dev,
+				 "%s failed to select state %d\n",
+				 __func__, ret);
 	}
 
 	return ret;
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
