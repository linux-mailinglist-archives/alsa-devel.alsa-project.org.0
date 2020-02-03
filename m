Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736581502A0
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 09:31:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218721696;
	Mon,  3 Feb 2020 09:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218721696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580718705;
	bh=oos5Y3tEGJUvdtxY9fqysadngryLu3Tt0nq1/shd7iA=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdfnVBG4J2rkGJChk8lP7y21WRo0csnqPEZ38IBdPg7jkADqB2KqV+iEmHrRFD5NS
	 T05qGc9xs9Szb/uh60ww4DxUmCFeo8YeX1rTtuK2s91l3tevGNmF+oevNtvBHuc3L+
	 QtqfKk0WbY3e2eRgN41fo79F7wRlOCm2Mzg3imfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE66F8028B;
	Mon,  3 Feb 2020 09:27:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB9A9F8028A; Mon,  3 Feb 2020 09:27:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9ACCF80273
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 09:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9ACCF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jNlK2AFU"
Received: by mail-qv1-xf49.google.com with SMTP id z9so9022255qvo.10
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 00:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4D3+flXDlkLj/FPRWkt9/EexkIE9XS3rKY8bH/Ln4QM=;
 b=jNlK2AFUWtL7A1/zZsh0g1YiSK9WW07lLanW+BrJcKXX/osBwI+OTRuSzAnQFYMsEy
 C1pCN4movrxAK/UNBcf56TT1JtCs7RzZfrJLhD2ukXEofiXFDZIVg1Xel+yJcOegFRXB
 FHO4t7I+nuFC1kfsLD6SMh5zPnnQfQFunipENg5SiEv0FAJLRBU1oy61CJfi5xsGop0Q
 9xdAU9qwJ8qexzhWaReQHahhxduaiLgD9u9FMgjAhrX6FzHzZUKt7tjtbJrhfFgxG78S
 Rh+FrEBmzAFn9JlbkmqQIGGIZHHTrIYidZkliLHKPWPxFXYMNK5eFn34IawnpIz641qx
 oNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4D3+flXDlkLj/FPRWkt9/EexkIE9XS3rKY8bH/Ln4QM=;
 b=VuEcQ1aDHili4xWAiqQyA+8WEgPP/NqZhJGOmzibuDF6JPatGNWrHTkCZ98Km48XKn
 zsLyRvKKz3maEZbNwqr9ekHYgcuKCRclH6QvIIU/C1hzn0inDOCczdwjfsnCiuGWtVKZ
 oKjJQQJdh21l7ZY5kHQ4D0qfl3EMF5viDsRL4BpNoiMNe2MiyMqVYpxpd6/tyPx473VI
 oPubPn13ZlPzPfzqnF20SjKUQAaCy56pRrPuN8cnSBJniRlzw6AY6E+6GhXJPtPsKmLO
 nTg/OFC0UZ9YZ0uaU8XhXmN09LVPQgVA1kDKj6I2sQDV/lISMta4aYgSjU4cC5SxYC5Q
 mKCg==
X-Gm-Message-State: APjAAAWI2kvLXaWzufyVWrU7IjBI2QcQsUEWmrXnJf7Xb03ACFTzbb+0
 8LwZRCHGakNkQ1YrphNBRby9qaHwqk1G
X-Google-Smtp-Source: APXvYqxm4iTeJgEfhMOxqn3k/qpfFZr9inigo6scxMHuxKvPBzycRrh/QvVH3NBUZd+B5q98zaW0oVkv0Qiz
X-Received: by 2002:ae9:ed4a:: with SMTP id c71mr8933538qkg.501.1580718469533; 
 Mon, 03 Feb 2020 00:27:49 -0800 (PST)
Date: Mon,  3 Feb 2020 16:27:18 +0800
In-Reply-To: <20200203082718.59614-1-tzungbi@google.com>
Message-Id: <20200203151250.4.Ia542007f51d3de753a9e0a83135ee074581dbf71@changeid>
Mime-Version: 1.0
References: <20200203082718.59614-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 4/4] ASoC: mediatek: mt8183-da7219: apply some
	refactors
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

1. Moves headset jack to card-specific storage.
2. Removes trailing blank line.
3. Moves card registration to the end of probe.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 7052210e8325..ecc8082a824d 100644
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
@@ -491,6 +490,8 @@ static int
 mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 {
 	int ret;
+	struct mt8183_da7219_max98357_priv *priv =
+			snd_soc_card_get_drvdata(component->card);
 
 	/* Enable Headset and 4 Buttons Jack detection */
 	ret = snd_soc_card_jack_new(&mt8183_da7219_max98357_card,
@@ -498,12 +499,12 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
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
@@ -540,13 +541,6 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
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
@@ -588,7 +582,7 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 				 __func__, ret);
 	}
 
-	return ret;
+	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 #ifdef CONFIG_OF
@@ -615,4 +609,3 @@ MODULE_DESCRIPTION("MT8183-DA7219-MAX98357 ALSA SoC machine driver");
 MODULE_AUTHOR("Shunli Wang <shunli.wang@mediatek.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mt8183_da7219_max98357 soc card");
-
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
