Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C821AEAE
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E9515E0;
	Fri, 10 Jul 2020 07:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E9515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594358979;
	bh=qrimL7S3JsAXPMWHFcaQcqkSKO6TJv2+4NhSTo/Agd0=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+ckXV4iz5FX63FOvHmbOo4xpy4gHf4wZj4AAm1XFJcDIjc7zFyJ+62WUCx9Ci6cb
	 ocG6sJc9UfknhZROsSKK7t5yAXLbrOljFl61ubmfrodtonDn26wE5LsR6dDU7zIpO1
	 QiIpKaDki2G8lXjvM6Lu47ExU45Z9YLsFHd7egxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C79F802DB;
	Fri, 10 Jul 2020 07:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B637F802A0; Fri, 10 Jul 2020 07:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F2E8F8015D
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2E8F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rutmYKmp"
Received: by mail-yb1-xb49.google.com with SMTP id g10so5816624ybd.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=tgx1/z4Ge0ad0sjsQ0jzGb9TfRKIZ57I3cV4cHGoXqQ=;
 b=rutmYKmpo55/0BSQcjnPDCi6fy7cob+iyDnew8FHrRmGG6eK5GPZxfao7BsnRL0Eqj
 ceILUQ7K4tgLgE8urMWT9//tvXOzb6nvwEHswxIcio3V8HPjz+Fc23yTsYu1dfdDvN/q
 Hc5ipY/vWNIaMza/1gXL2b66T50xc8INqmaFMcjauJn/jyuFt9VAzAWY0Rpksww4rMC5
 sh33Z51bw6daP+mA+kFHaaT9+j7GGJgmFlmAh8WVXTTMQGnvJJziw8Quh4+sK4cnkW2R
 nucDGElIpNXT0aN2gMdjxbphdpx3SqNHEwH2m0BgIJ5O+m69dnKe/wUKoAyYZEGWBcyr
 huHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tgx1/z4Ge0ad0sjsQ0jzGb9TfRKIZ57I3cV4cHGoXqQ=;
 b=QJnr0rmf92s/d6haqXTYbZILmc2BikLXDW1pLDbV5W2p3tQnHAJHMsbAg7ZH6NDDLw
 mOqkmUFUVPqqjRLnWR7ZWO+tRVdBZJppAaVIFn+26n6b0q7Gw+SEzRumUDQEWBIGLxJW
 w/QP9rbECN4dngZb27GNvOHKEmlui+Oi4qkkc18xw5cTSz9oCmDOY3FpCdR0Wpa5sVwa
 X5Dpuz3qC1e8Pu8WAaIUFLRgC3RFl54zpv5HmbGENtxAsAOXZUz6E/6RnmUzw8U/cAq1
 Kf9VNSxneqAnysRx8PCsqfAXF2v312C2+BbUM65t/uWKyWj3o7BYmO09ER/2LlkGeHIT
 iPYA==
X-Gm-Message-State: AOAM532JefXLc7i3+6Fa+aaRrA/MlrAAEk8LJ8PeNlICDGFFK9wdruQE
 cVOYOGY53z5Y4e/LIIMlq/8MsdqmDsle
X-Google-Smtp-Source: ABdhPJyMCZkNSLsFKUn19G/Sps8R3ThNMrUeAs+hIRt2DUgCQ+qabdLdWdlMWWvA+cdoaIq0gJlmVD+jPP7f
X-Received: by 2002:a25:f603:: with SMTP id t3mr20443714ybd.49.1594358732859; 
 Thu, 09 Jul 2020 22:25:32 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:25:04 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 5/6] ASoC: mediatek: mt8183-da7219: use hdmi-codec
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Adds DAI link to use hdmi-codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index bc551a4af25f..cbef4a538224 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -354,7 +354,7 @@ SND_SOC_DAILINK_DEFS(i2s5,
 
 SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
@@ -627,7 +627,7 @@ static struct snd_soc_card mt8183_da7219_rt1015_card = {
 static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node;
+	struct device_node *platform_node, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_da7219_max98357_priv *priv;
 	struct pinctrl *pinctrl;
@@ -648,6 +648,9 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	card = (struct snd_soc_card *)match->data;
 	card->dev = &pdev->dev;
 
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "I2S3") == 0) {
 			if (card == &mt8183_da7219_max98357_card) {
@@ -679,6 +682,9 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
+			dai_link->codecs->of_node = hdmi_codec;
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
-- 
2.27.0.383.g050319c2ae-goog

