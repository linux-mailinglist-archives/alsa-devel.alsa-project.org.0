Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75747EC43
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 07:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6F418D8;
	Fri, 24 Dec 2021 07:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6F418D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640328599;
	bh=Bk4rlE2ysNzzU1zqKjEJEAO/iRBb9Ct8VPBowJEwsW8=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t1/AOxATiSNkRxrbi/S7Y7PLD4goRTa3N7QaqCQ8nsssXMjLjkZi8YqZwELDgE+bf
	 bwtvm/mX9VoZECk8oHoxlSw+6K3O8f7OJWUD+aFi8IQM2qGwkGQR30MnxRmonkoSFy
	 f2gkBSTn3FQ2FoJwnPIWlnYNeEIV4uk6ZYlhiZck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C54F804FB;
	Fri, 24 Dec 2021 07:48:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E078F804FB; Fri, 24 Dec 2021 07:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3121CF804EC
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 07:48:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3121CF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="TuhSmrb9"
Received: by mail-yb1-xb49.google.com with SMTP id
 w9-20020a25c709000000b00608a9489fc1so13937241ybe.20
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 22:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=nYgqirlztHzfWpxQ6fJoFC5JQqfRpMl4u4un11X0W2c=;
 b=TuhSmrb9SXoyY4A3qeqP1jKo6kyDZ0/9Y+nXC0W45/0yR1VbXn1KaRt9O5t/07DF+R
 sUIUPxi2haKkH62i4K7mMfrNax0QRuy/SGtKwRqIrkBHFyZUZpogymWNKLV//YgZZ/v/
 r0oWvqzQJOsKbRMOaA/rXPOOC/YWwDbf+nJAtpn/QUCSGpyL5yRX7FudXcbZNisBBL+W
 S/8u8afkSDW8MqBL4YUj88SUAZ826FfbZmaEAn07JPr1ZSmOVfL5rEkbC4JWeLVXUK39
 6GBpifhqmaRSC2ycoCccQC3AgjGuWTBPgMx8q3sZZbtWsAaL+vRhB0AElcG3/Gu4AQF5
 YK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=nYgqirlztHzfWpxQ6fJoFC5JQqfRpMl4u4un11X0W2c=;
 b=URL2YWWsGXUGsPZ7ft3XXUVw0YdY+XXHVGfmh4S2hsCx7k/tdc/WzV1/MRQv5OkLlf
 xU36NBLY7humsQlvfxc1CFFscOfWhEkHIPYxiEtzczTX6pOnXgvwhHyhCbWfXs/Vd0Jf
 +hc8cpxN8U2rLzzyRf4rHtvjv1E4WDhdgqlN3702dCAj5piV8OyEVsUMLda4qhz4hHGu
 4Qwql0e1iGrEw66CF4IPJgaRTdylQJyn+ZYqpPN3lv2KHUntgRKFTIw2fpTvgFr5+1/R
 2gC3W3WCISCpqVsB3zNsLOa1KfYLGsCrRcTMy6aPAX3nsnORexzWZSsIepvPBwT+dZiJ
 W3cQ==
X-Gm-Message-State: AOAM533du0THhqdmXP4POztjHIwrOcDyyUVGz6n18LnKGPd69a7a/Gu6
 tZ7NIP2IXXBDJzgoeZP1AU+USTtqNcYc
X-Google-Smtp-Source: ABdhPJxP2Ww0hO5KrF6uagjLAK4PFmUIkEKMYU+IyL5YV8BNlWGh9ncUPd9Sb1LcKItVOX5oA7BL0gy63Ml2
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:af4e:fb49:1227:527b])
 (user=tzungbi job=sendgmr) by 2002:a25:547:: with SMTP id
 68mr7693849ybf.69.1640328479659; 
 Thu, 23 Dec 2021 22:47:59 -0800 (PST)
Date: Fri, 24 Dec 2021 14:47:19 +0800
In-Reply-To: <20211224064719.2031210-1-tzungbi@google.com>
Message-Id: <20211224064719.2031210-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20211224064719.2031210-1-tzungbi@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 4/4] ASoC: mediatek: mt8195: release device_node after
 snd_soc_register_card
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
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

Device nodes can be released after components have bound.

Shortens the lifecycle of the device nodes.  Releases the reference
counts after snd_soc_register_card.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 53 +++++----------
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 64 ++++++-------------
 2 files changed, 36 insertions(+), 81 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index 9cf907c49ea8..ce8dace6527c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -31,9 +31,6 @@
 #define RT5682S_DEV0_NAME	"rt5682s.2-001a"
 
 struct mt8195_mt6359_rt1011_rt5682_priv {
-	struct device_node *platform_node;
-	struct device_node *hdmi_node;
-	struct device_node *dp_node;
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -1047,6 +1044,7 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8195_mt6359_rt1011_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1011_rt5682_priv *priv;
+	struct device_node *platform_node, *dp_node, *hdmi_node;
 	int is5682s = 0;
 	int ret, i;
 
@@ -1065,38 +1063,35 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->platform_node = of_parse_phandle(pdev->dev.of_node,
-					       "mediatek,platform", 0);
-	if (!priv->platform_node) {
+	platform_node = of_parse_phandle(pdev->dev.of_node,
+					 "mediatek,platform", 0);
+	if (!platform_node) {
 		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
 		return -EINVAL;
 	}
 
+	dp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,dptx-codec", 0);
+	hdmi_node = of_parse_phandle(pdev->dev.of_node,
+				     "mediatek,hdmi-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
 		if (!dai_link->platforms->name)
-			dai_link->platforms->of_node = priv->platform_node;
+			dai_link->platforms->of_node = platform_node;
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			priv->dp_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,dptx-codec", 0);
-
-			if (!priv->dp_node) {
+			if (!dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
-				dai_link->codecs->of_node = priv->dp_node;
+				dai_link->codecs->of_node = dp_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
 			}
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			priv->hdmi_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,hdmi-codec", 0);
-			if (!priv->hdmi_node) {
+			if (!hdmi_node) {
 				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
 			} else {
-				dai_link->codecs->of_node = priv->hdmi_node;
+				dai_link->codecs->of_node = hdmi_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
@@ -1113,28 +1108,13 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		of_node_put(priv->hdmi_node);
-		of_node_put(priv->dp_node);
-		of_node_put(priv->platform_node);
-	}
 
+	of_node_put(platform_node);
+	of_node_put(dp_node);
+	of_node_put(hdmi_node);
 	return ret;
 }
 
-static int mt8195_mt6359_rt1011_rt5682_dev_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(card);
-
-	of_node_put(priv->hdmi_node);
-	of_node_put(priv->dp_node);
-	of_node_put(priv->platform_node);
-
-	return 0;
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id mt8195_mt6359_rt1011_rt5682_dt_match[] = {
 	{.compatible = "mediatek,mt8195_mt6359_rt1011_rt5682",},
@@ -1156,7 +1136,6 @@ static struct platform_driver mt8195_mt6359_rt1011_rt5682_driver = {
 		.pm = &mt8195_mt6359_rt1011_rt5682_pm_ops,
 	},
 	.probe = mt8195_mt6359_rt1011_rt5682_dev_probe,
-	.remove = mt8195_mt6359_rt1011_rt5682_dev_remove,
 };
 
 module_platform_driver(mt8195_mt6359_rt1011_rt5682_driver);
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index fdd444138728..c15c58170e9d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -43,10 +43,6 @@ struct sof_conn_stream {
 };
 
 struct mt8195_mt6359_rt1019_rt5682_priv {
-	struct device_node *platform_node;
-	struct device_node *adsp_node;
-	struct device_node *hdmi_node;
-	struct device_node *dp_node;
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -1257,6 +1253,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv;
+	struct device_node *platform_node, *adsp_node, *dp_node, *hdmi_node;
 	int is5682s = 0;
 	int init6359 = 0;
 	int sof_on = 0;
@@ -1278,19 +1275,21 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->platform_node = of_parse_phandle(pdev->dev.of_node,
-					       "mediatek,platform", 0);
-	if (!priv->platform_node) {
+	platform_node = of_parse_phandle(pdev->dev.of_node,
+					 "mediatek,platform", 0);
+	if (!platform_node) {
 		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
 		return -EINVAL;
 	}
 
-	/* dai link */
-	priv->adsp_node = of_parse_phandle(pdev->dev.of_node,
-					   "mediatek,adsp", 0);
-	if (priv->adsp_node)
+	adsp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,adsp", 0);
+	if (adsp_node)
 		sof_on = 1;
 
+	dp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,dptx-codec", 0);
+	hdmi_node = of_parse_phandle(pdev->dev.of_node,
+				     "mediatek,hdmi-codec", 0);
+
 	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
 		ret = mt8195_dailink_parse_of(card, pdev->dev.of_node,
 					      "mediatek,dai-link");
@@ -1306,31 +1305,25 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, dai_link) {
 		if (!dai_link->platforms->name) {
 			if (!strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")) && sof_on)
-				dai_link->platforms->of_node = priv->adsp_node;
+				dai_link->platforms->of_node = adsp_node;
 			else
-				dai_link->platforms->of_node = priv->platform_node;
+				dai_link->platforms->of_node = platform_node;
 		}
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			priv->dp_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,dptx-codec", 0);
-			if (!priv->dp_node) {
+			if (!dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
-				dai_link->codecs->of_node = priv->dp_node;
+				dai_link->codecs->of_node = dp_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
 			}
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			priv->hdmi_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,hdmi-codec", 0);
-			if (!priv->hdmi_node) {
+			if (!hdmi_node) {
 				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
 			} else {
-				dai_link->codecs->of_node = priv->hdmi_node;
+				dai_link->codecs->of_node = hdmi_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
@@ -1357,30 +1350,14 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		of_node_put(priv->hdmi_node);
-		of_node_put(priv->dp_node);
-		of_node_put(priv->platform_node);
-		of_node_put(priv->adsp_node);
-	}
 
+	of_node_put(platform_node);
+	of_node_put(adsp_node);
+	of_node_put(dp_node);
+	of_node_put(hdmi_node);
 	return ret;
 }
 
-static int mt8195_mt6359_rt1019_rt5682_dev_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(card);
-
-	of_node_put(priv->hdmi_node);
-	of_node_put(priv->dp_node);
-	of_node_put(priv->platform_node);
-	of_node_put(priv->adsp_node);
-
-	return 0;
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id mt8195_mt6359_rt1019_rt5682_dt_match[] = {
 	{.compatible = "mediatek,mt8195_mt6359_rt1019_rt5682",},
@@ -1402,7 +1379,6 @@ static struct platform_driver mt8195_mt6359_rt1019_rt5682_driver = {
 		.pm = &mt8195_mt6359_rt1019_rt5682_pm_ops,
 	},
 	.probe = mt8195_mt6359_rt1019_rt5682_dev_probe,
-	.remove = mt8195_mt6359_rt1019_rt5682_dev_remove,
 };
 
 module_platform_driver(mt8195_mt6359_rt1019_rt5682_driver);
-- 
2.34.1.448.ga2b2bfdf31-goog

