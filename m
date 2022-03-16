Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC554DA76D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 02:42:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4E3171C;
	Wed, 16 Mar 2022 02:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4E3171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647394942;
	bh=aLzIhP6unNTfHt5/BhLiwCeL+zpPY9MdRQOxexvSKRs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9oJNUOIjLsyjnHjVrD1jwsA3d9cbMKDy2Gw0elHtTjszNDBnF4mriBqkQXnz2i87
	 +6cpTGmYqSHhXuRzHZKDH86KfFd3PpD3H8NV8P8nZHInxRt9N8WLjhQeckBs4N9xts
	 Fna9200LTpt1ITouE+3NRe4L7uK1CBP2eVcLs/10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C689F80095;
	Wed, 16 Mar 2022 02:41:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E64EF80162; Wed, 16 Mar 2022 02:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC93BF800FF
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 02:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC93BF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fp6lcFh5"
Received: by mail-pf1-x434.google.com with SMTP id s8so1724559pfk.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=5TN7lZdXFXxg1iaTCPv4OVG95Uy6qF3btAwL8YcaPoo=;
 b=fp6lcFh5R0fHZgw6XCRFpUL7I5I1gXmE8/vyIb2woJggGoKpx50bjig+qMBd33Y7WJ
 kVuGkMUNDOsxAT0LxoZMiZktQafTk6zX8IBjtpBWOr6JKAc+pGnn41DSEGPcj+K5e5j7
 9eEPSz1tMiJuALgTV9pauBZGx9f0iZO8XsNtGu7s/plgCrynSjgc15H4XiFvzXE5sjlr
 ZhVXs0KI7GY5UGlPLEaDuBg3g0I3YVUzZiXewCh6skyTB6rGNJOvcKadRTiLEn7VaWUh
 ZsVBekxVVg3Q4R57fTjai04UeQos0/OyCC9zSRyl+l1y5I893f5j9Li8nS1yujnNx0qj
 BZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=5TN7lZdXFXxg1iaTCPv4OVG95Uy6qF3btAwL8YcaPoo=;
 b=rIVVf/V7rvZKpAPL8s+uT6XSjzzEKYlUvyCtXrsi40XPoCaoy9Ix/ukgeNLKXMzlOQ
 sVLJD4BfDnI5xuUDibQrEsLvOUGFhjw2H0zxyZID0ek88gD1nvFdgXSYHSb5gSvPqCrS
 gkjwmZGW6W/6btunAilXy0+7VNxQGvFTwWqQkUTKI9gG0UfHWd231cq4t0n4vecMCIFc
 clp11sxjl7TamoJHFLkXhW4BykQM/RezkP0n92ZzIPMAR+MPmuDKZdMnuhDy4sXGSvfg
 Y/zfaOm/C6/0PqXDf2M7Y4oU3VhM7RwEcW2FWaR16WDy+0JTwFyByafMiqosLlV8vywF
 6xew==
X-Gm-Message-State: AOAM531MIeTZcExY6Oo3GQy+Zk/EoF1JHnTVvCcBQMO7/+udEPnSEGKB
 JwX3YZthUMfvkcEf7M+trsw=
X-Google-Smtp-Source: ABdhPJxK7nJ6x3EXhO8mMTf3wXoWFtWkzGi6+LnIsadkdyjrPZjF5qTX1txO598/jtLONqY44bQ5Jw==
X-Received: by 2002:a63:8e:0:b0:380:93d7:e85f with SMTP id
 136-20020a63008e000000b0038093d7e85fmr26142946pga.177.1647394866646; 
 Tue, 15 Mar 2022 18:41:06 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 me5-20020a17090b17c500b001c63699ff60sm4485594pjb.57.2022.03.15.18.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 18:41:06 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, Shunli Wang <shunli.wang@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Date: Wed, 16 Mar 2022 01:40:57 +0000
Message-Id: <20220316014059.19292-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <Yia5XgkGyLbIRc1f@google.com>
References: <Yia5XgkGyLbIRc1f@google.com>
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
Fix this by calling of_node_put() in error handling too.

Fixes: 5bdbe9771177 ("ASoC: mediatek: mt8183-da7219: use hdmi-codec")
Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- update Fixes tag.
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 718505c75418..f090dee0c7a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -695,8 +695,11 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
+	if (!card) {
+		ret = -EINVAL;
+		goto put_platform_node;
+	}
+
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
@@ -761,12 +764,15 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	if (!mt8183_da7219_max98357_headset_dev.dlc.of_node) {
 		dev_err(&pdev->dev,
 			"Property 'mediatek,headset-codec' missing/invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_hdmi_codec;
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto put_hdmi_codec;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -775,13 +781,16 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		ret = PTR_ERR(pinctrl);
 		dev_err(&pdev->dev, "%s failed to select default state %d\n",
 			__func__, ret);
-		return ret;
+		goto put_hdmi_codec;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	of_node_put(platform_node);
+
+put_hdmi_codec:
 	of_node_put(hdmi_codec);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.17.1

