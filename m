Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F2473A9B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:12:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AAB1A9C;
	Tue, 14 Dec 2021 03:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AAB1A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447931;
	bh=8mENnwnLudAgiscCKuUa0a1MsnPocXpzFVl8HaH3Q4c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7EIOHASx/crtunYZMYAKXDOPmWKm77j9OmSi9Oyjc+h6qvLnv/SnQcraUFZx9OmR
	 nu9CX0fGerDCZTXTuQULDW+AH0g97E/YE3PgdC0hdLljdSU6U1YlnpmLDukXmZqw/K
	 hqXpk0GteuPX4x5LV3BMSaDx7xTBquASjPR+TeDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B77F8051D;
	Tue, 14 Dec 2021 03:09:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF4AF8051F; Tue, 14 Dec 2021 03:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2C6BF80271
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C6BF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LtzqYycG"
Received: by mail-pg1-x52c.google.com with SMTP id f125so16193145pgc.0
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PV7a3dHfH7qP0MxYbLp/fe30OwkAoRYz0SswjQ/RoQ8=;
 b=LtzqYycGHXVATgijafwLOl61h9TSlzvKp8kLVKakdpMqvAXopBkNtRjpmt6ZF4aERK
 sR8+ATKSgMkcZMsf1Srb3VrEdlNP9+cJhi8Y0ozilGWzu/sMqcdEtOKdHYZ456IJEp14
 Zb4Q8neSBFNYK3rZzL8ZZjfFelYzfK55awP3sCXW3Vj2R29UpxFsbidYg4sMEXjZ+aHt
 vqfSpV1C0LwXYsiG0TFdzUvYFcj2DIdRlMq+terbDIkhsUoo0zfyFfcELQVLuT3KcMh7
 sb9X8cF5POYPzflbjGo/RAc5CW982rZVji/1C5OrGR6gMgDWPKUaI3El5/W89uwdHtFl
 3AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PV7a3dHfH7qP0MxYbLp/fe30OwkAoRYz0SswjQ/RoQ8=;
 b=TWaAX0OFSAIpCLIgYqWXfPxKg2mMxsTIguE/osFTqEgUBdGP4HEqqi5I5R5DgA07Dh
 GA7yp9tjxhypWAXST0GJDGwu/WlPam5JKN4X40XqZtINrEyEBsBVSOe4ISpsgXSwVdDS
 KiyquaNssBGgkFFtvHik+SnmMpnmzAI6opTc8ms3fQ/hn0+qdttRWz/yUng1syCjXbyE
 3+v2ysRAEub7x1eo9khdwGY1CifTX4omSHON7vZE+IvB9XP0Xc9JhnHnvg6zUbwlAMIs
 Hrzz1GxI8wGlCREZvTT6gpIrdkzWD1qTj7mSpP7wJU5QS2ZRpLpHAF1KvzbdueC7uV+j
 AN+Q==
X-Gm-Message-State: AOAM531McqB6rQwqulBQGb/jdf6iSIgTeoXv97ipFcdueVQvGZldBpv9
 yrJOvYH02txt08lpfQCU5FX3FrgrHgo=
X-Google-Smtp-Source: ABdhPJzselY3fDGD7so0ephdkpiuHmOLe15aw6P9ehm8dSnBgBK+uvBs6BJNh8BWPCgJNu/HBOj7VA==
X-Received: by 2002:a05:6a00:16c6:b0:4a8:261d:6013 with SMTP id
 l6-20020a056a0016c600b004a8261d6013mr1740050pfc.82.1639447766777; 
 Mon, 13 Dec 2021 18:09:26 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:26 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/22] ASoC: codecs: max9759: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:24 +0900
Message-Id: <20211214020843.2225831-4-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max9759.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/max9759.c b/sound/soc/codecs/max9759.c
index 00e9d4fd1651..d75fd61b9032 100644
--- a/sound/soc/codecs/max9759.c
+++ b/sound/soc/codecs/max9759.c
@@ -140,7 +140,6 @@ static int max9759_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct max9759 *priv;
-	int err;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -149,29 +148,20 @@ static int max9759_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	priv->gpiod_shutdown = devm_gpiod_get(dev, "shutdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_shutdown)) {
-		err = PTR_ERR(priv->gpiod_shutdown);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'shutdown' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->gpiod_shutdown))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_shutdown),
+				     "Failed to get 'shutdown' gpio");
 
 	priv->gpiod_mute = devm_gpiod_get(dev, "mute", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_mute)) {
-		err = PTR_ERR(priv->gpiod_mute);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'mute' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->gpiod_mute))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_mute),
+				     "Failed to get 'mute' gpio");
 	priv->is_mute = true;
 
 	priv->gpiod_gain = devm_gpiod_get_array(dev, "gain", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_gain)) {
-		err = PTR_ERR(priv->gpiod_gain);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'gain' gpios: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->gpiod_gain))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_gain),
+				     "Failed to get 'gain' gpios");
 	priv->gain = 0;
 
 	if (priv->gpiod_gain->ndescs != 2) {
-- 
2.25.1

