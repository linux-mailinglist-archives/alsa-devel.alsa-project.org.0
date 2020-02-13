Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E828415B7C5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 04:31:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8681677;
	Thu, 13 Feb 2020 04:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8681677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581564687;
	bh=6f5PtrIK8zZP0uFArOKQJhlQWmnlDuizLab8oV/RXPc=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t87sG4YTuUVp6NDsy+OLWchfiSYyrkGiVu1Dji9sLhsYn72NIUTnExOR1rHnLuJSY
	 ln5yG9iBRbt9vDyB/TQXvwrUE6WT12SQxuOS1fc1tsnJJ6ntEjAxCq9ImxBF8tczLY
	 Rn/9hi+PS7pzlOBr9IiS9hP6nHyZC3rlpiu8kaEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3EFDF80277;
	Thu, 13 Feb 2020 04:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2351EF80218; Thu, 13 Feb 2020 04:28:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B83F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 04:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B83F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="X2c70U7z"
Received: by mail-qk1-x749.google.com with SMTP id c206so2841804qkg.6
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 19:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E8XGL+aWSCUS5wxSR4Mb7Xw8cB7NMNQcId090CzAdf0=;
 b=X2c70U7zuMgkw/dU9EktkpTjUexjIWBqK63Dkafrpd0LziWsamJbiSG5SSY2MX7fsc
 CkA46/edzwGlg6p+xNpyTa5DgwDZJ/kkbyxBCPbaqJBDLDfFibBQjOJJGmCKTxbL1itk
 IMjNJ0Bp7zINvc+B0z54oYR5aCWTFn/BWeRm4S1Y6PrXQunzWZIzXhv0KZ+Is6jBz/Cw
 qGoDS0c30pVNUV7pbV67Ks5AV+gj5ArbFLS8g3fTQQwuxMDsTEWve5OQUUG+U3Nh5xG7
 qLTbCyAZkB4jBWROgoujRGEbrpixyxs6jI4xaEE1BlTpvawyq/Id0pv0tfEZhRBxcI0l
 SwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E8XGL+aWSCUS5wxSR4Mb7Xw8cB7NMNQcId090CzAdf0=;
 b=ssiNDQK86wommvBF93XTVUtOOjWNhsZT84VMOSeB4ze5VN8K4WXpTBlqn2m2C2Hg0D
 GK5WK2IeWode5JLubqVnl/arUs2HZcwrqXR1CS+dkZBmISVfrs7pA+R5Q8G4fG/9BoEh
 oUtASO97lWefyEpBUhxyOV/htkQKJJycbnbZbE2OdMtWLzq74b3f6I46u499UTb048kH
 z77UbsdU3YYrQDO+hrHeE9qdZdZBlsLmZEJjg+0/qWebaCLMYxXbigLskew7OYFN4+9c
 uitugjH9aLVauxivVAzOBnMzKb0qBCWWXfvdj8ygJ4vqZU1xB7fZnP+jF9L2mW1MfjnW
 OSAw==
X-Gm-Message-State: APjAAAW9ghot5VEogrWVagNuaoGZXDH+SJpt1mgGNGxyxumytdY0CSB7
 qh76xTTPuOM75TYAeI/pn6j8W+wEwPom
X-Google-Smtp-Source: APXvYqwDK9WTwkNNGulURpe49iGFFYSxfkeDdVr+CG0UVvGpr4fPcdoRHAY9eCUBlAygyGxpcK3+z+71mF+7
X-Received: by 2002:a0c:f193:: with SMTP id m19mr9563746qvl.154.1581564491960; 
 Wed, 12 Feb 2020 19:28:11 -0800 (PST)
Date: Thu, 13 Feb 2020 11:27:26 +0800
In-Reply-To: <20200213032728.199462-1-tzungbi@google.com>
Message-Id: <20200213112003.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid>
Mime-Version: 1.0
References: <20200213032728.199462-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [RESEND PATCH 2/4] ASoC: mediatek: mt8183-da7219: pull
 TDM GPIO pins down when probed
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
index b52ffed882a7..d7685916a5cb 100644
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
@@ -470,7 +529,7 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8183_da7219_max98357_card;
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
-	struct pinctrl *default_pins;
+	struct mt8183_da7219_max98357_priv *priv;
 	int ret, i;
 
 	card->dev = &pdev->dev;
@@ -504,12 +563,45 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
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
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
