Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E79473AAD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 418261F0A;
	Tue, 14 Dec 2021 03:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 418261F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448171;
	bh=G/gXzfcOae33cY/vE0/j3vTxh+cwnR1jyA3jx4MMVQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDNqjHRVgooHHJVzgR3yDbUhj5rkMGgC6KFEY0b+vSeq+FCWQB2nORC01ogpWBsl9
	 91ZLzUq/xtPEtKrb5uGFk4APqwJlVHmeGjCdV4+ItbPhK0wt9mMAJ/OR4mob/OXbTb
	 kyBS25rI9klybdSS3tdoq1zRDOsi4IpBbRG1RIZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119FDF80568;
	Tue, 14 Dec 2021 03:10:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB5A5F80589; Tue, 14 Dec 2021 03:10:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 551C5F80552
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 551C5F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Anb5vi/3"
Received: by mail-pj1-x102d.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso14921207pjb.0
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYuF3cunzVF8DbiuvOSu5sxkCcpYnIGwnCywNS3hTk4=;
 b=Anb5vi/39ixVTX1HOgkwbTDhc7fD3qG8p4mFhbpqEkyJgIbidfmui3f+gMz5LayMzr
 AHmhIM3FlM4pQ1H4PElZwvfjuk1+ode7gHN9Tu0zXM0P1f4q/vFEipIg5QKl0Rr75FjO
 dDohsC2AoQImwleD6wsowNsTogyanFb+6pixggVSuFeoW9D4+Azm+nZSxMny2oHJwHwm
 WrOTjLaCPFswIm3eEDZs8Q6R5QOyGKV3rXMvY2lT+ymjsbPlV/0BgeUS5Iwjj3X/LTf+
 0LsvihDtmUegB7SxYrQ2bJu+e1kCWoO6njiRm6Kp8okdYC1UftFuNuZdmmfU94Ocbwwb
 9a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xYuF3cunzVF8DbiuvOSu5sxkCcpYnIGwnCywNS3hTk4=;
 b=GzODpfIfEnt4PXTD2iGA3zvV0Tg2q6aiggMrppEqZo7wv+pZZmDDVV9MaLqtB1ltaK
 7W8H3fi3OobzAnPM9pAytj7ax+8NTQ9M0wT3nYikuWUfu85nlMSzNpmcMcdOrMKYSBVk
 YiFSHRPzi/YCBc1TyOyj7GGxhnNa/JVzcUrEx2vnf0wrAtCNKlGV78hjtgZ5QLcaxeJP
 KW2n7D5rGRVpbFOmocCCUYLz/00tJOQhvSZK0ZJpp3iWFNqGojFdYXERv3NOYCEXxrLZ
 P6mu72g3e7lfXW2ZOTKNbv6ZF1uW+/Bxt3ggnBVj64TUFLxUOyBslw6tzl1zyI4TgZLX
 rQ0A==
X-Gm-Message-State: AOAM533rLUdQbf0hd4dYPsAtKtj6MFkbh1zFDlEZZaNxMZob4KEQccnD
 y8Njm+nSeeEwqnIiJbbWPk4=
X-Google-Smtp-Source: ABdhPJxEFCzGChQLyEFZ/+1gQsHosqGqZNfte1nqYchP8M4/TIbWphZJHSmouHUbslSHPp2SFqro1Q==
X-Received: by 2002:a17:90b:50c:: with SMTP id
 r12mr2290910pjz.71.1639447790933; 
 Mon, 13 Dec 2021 18:09:50 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:50 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 20/22] ASoC: samsung: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:41 +0900
Message-Id: <20211214020843.2225831-21-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/samsung/aries_wm8994.c   | 17 +++++++----------
 sound/soc/samsung/arndale.c        |  5 ++---
 sound/soc/samsung/littlemill.c     |  5 ++---
 sound/soc/samsung/lowland.c        |  5 ++---
 sound/soc/samsung/odroid.c         |  4 +---
 sound/soc/samsung/smdk_wm8994.c    |  4 ++--
 sound/soc/samsung/smdk_wm8994pcm.c |  4 ++--
 sound/soc/samsung/snow.c           |  9 +++------
 sound/soc/samsung/speyside.c       |  5 ++---
 sound/soc/samsung/tm2_wm5110.c     |  3 +--
 sound/soc/samsung/tobermory.c      |  5 ++---
 11 files changed, 26 insertions(+), 40 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 313ab650f8d9..5265e546b124 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -585,19 +585,16 @@ static int aries_audio_probe(struct platform_device *pdev)
 
 	extcon_np = of_parse_phandle(np, "extcon", 0);
 	priv->usb_extcon = extcon_find_edev_by_node(extcon_np);
-	if (IS_ERR(priv->usb_extcon)) {
-		if (PTR_ERR(priv->usb_extcon) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get extcon device");
-		return PTR_ERR(priv->usb_extcon);
-	}
+	if (IS_ERR(priv->usb_extcon))
+		return dev_err_probe(dev, PTR_ERR(priv->usb_extcon),
+				     "Failed to get extcon device");
 	of_node_put(extcon_np);
 
 	priv->adc = devm_iio_channel_get(dev, "headset-detect");
-	if (IS_ERR(priv->adc)) {
-		if (PTR_ERR(priv->adc) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get ADC channel");
-		return PTR_ERR(priv->adc);
-	}
+	if (IS_ERR(priv->adc))
+		return dev_err_probe(dev, PTR_ERR(priv->adc),
+				     "Failed to get ADC channel");
+
 	if (priv->adc->channel->type != IIO_VOLTAGE)
 		return -EINVAL;
 
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index 606ac5e33a8e..a5dc640d0d76 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -174,9 +174,8 @@ static int arndale_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"snd_soc_register_card() failed: %d\n", ret);
+		dev_err_probe(&pdev->dev, ret,
+			      "snd_soc_register_card() failed\n");
 		goto err_put_of_nodes;
 	}
 	return 0;
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 390f2dd735ad..34067cc314ff 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -325,9 +325,8 @@ static int littlemill_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 998d10cf8c94..7b12ccd2a9b2 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -183,9 +183,8 @@ static int lowland_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ca643a488c3c..4ff12e2e704f 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -311,9 +311,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "snd_soc_register_card() failed: %d\n",
-				ret);
+		dev_err_probe(dev, ret, "snd_soc_register_card() failed\n");
 		goto err_put_clk_i2s;
 	}
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 7661b637946d..821ad1eb1b79 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -179,8 +179,8 @@ static int smdk_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index 029448f5bedb..d77dc54cae9c 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -118,8 +118,8 @@ static int snd_smdk_probe(struct platform_device *pdev)
 
 	smdk_pcm.dev = &pdev->dev;
 	ret = devm_snd_soc_register_card(&pdev->dev, &smdk_pcm);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card failed %d\n", ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 6da674e901ca..02372109c251 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -212,12 +212,9 @@ static int snow_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"snd_soc_register_card failed (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "snd_soc_register_card failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index f5f6ba00d073..37b1f4f60b21 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -330,9 +330,8 @@ static int speyside_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index a2c77e6defec..d611ec9e5325 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -612,8 +612,7 @@ static int tm2_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to register card: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to register card\n");
 		goto dai_node_put;
 	}
 
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 15223d860cb7..8d3149a47a4c 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -229,9 +229,8 @@ static int tobermory_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 
 	return ret;
 }
-- 
2.25.1

