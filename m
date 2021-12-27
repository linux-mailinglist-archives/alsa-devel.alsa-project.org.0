Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DD47FA80
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 07:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9DB016C7;
	Mon, 27 Dec 2021 07:22:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9DB016C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640586196;
	bh=CpAojC5mPBqkuumNMq4p+STbqSnkwC9muvvAN5YJn9k=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qGn552NiQuhbpFt//Y1QueDYkIeHW5iNIJPGXO+ct4+kzrNqhuuLQNn4QAmF8DA1Y
	 ZOihZYu17FtvXPf4aud75wKOjBFfyO3fKMnS5qp//MWkP/HRuNjsY6/SuFYgPmaOwz
	 sOn1HPpGky5C25eN2bF3yY6qFkecLmgbDV3ISzQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3567FF80161;
	Mon, 27 Dec 2021 07:22:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5881F80158; Mon, 27 Dec 2021 07:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36659F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 07:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36659F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WoqvxKT/"
Received: by mail-yb1-xb49.google.com with SMTP id
 c5-20020a25f305000000b0060bbdf755f7so9149230ybs.14
 for <alsa-devel@alsa-project.org>; Sun, 26 Dec 2021 22:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=PhQu6tKs8sHHI72z8t/Ty8w/d9S/kK1n0+e8U02bpOo=;
 b=WoqvxKT/FL2eKYg9a6FNFSffyRsAzxMDKf2lxIBusMo2ttHa1hXdYv5a3aCP7Jcr78
 3Cp/LPi8RnkLYIiPZ+VDCP47NGw+hmnwYg6BYz3hLZQ22eW82axqSMKirJrW+e/ClPT2
 BznkgUdRUwuzCSpBx6+UcbjQx3Xrjxeqo2epNu+D7F5MrB8tAG4U/SsiJ6QXtP+NeaOX
 +7v2Rr+4f4fjwGZ5pM73HPoWO/zT5G6rObOG2c2jKeKDAdxZFc2RmJ5ZaW9qqz3uIpfA
 q2djZ4dRUyAyNJPWZ0sxbIxIeZuqV0/08mjsKxu0W43wXSUEXfymBx8VwbBfPdoujHw/
 YcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=PhQu6tKs8sHHI72z8t/Ty8w/d9S/kK1n0+e8U02bpOo=;
 b=7QNJn4VC2JA2r44ei40BCSuSGG4QUBdId6ubdMTRIEQfqLDsLK6m8gn8ajO7t/vPoU
 Gr0hg01v0kgTkZGllFJUmmDIEyZiy9ESKHC9D0o/lnPReIDz56crkHhStmoNfejJemnv
 I+IqVHEJui5LCuyLXBBnGVDwp/jmuhUi3t6lTUWCdIA5/EyVD/hF6fA9zk6ad2vxC+XJ
 i6uLCLkcrVH7Oj8lObU/rES8zW/52FS3gVQQ26rOqSyo9GAqZwEW9W0SRlk9h3GZr6at
 JYwTdQkrAQ6bKO36gmIuDettMAotA/cdQ2QUJ1A0rg6Qppp3lA8AfVW788LY3KD2C+Ri
 zBqQ==
X-Gm-Message-State: AOAM533IT9gA6AjeFrY+eN5neEDkdE/Pxp05IBvFjy9nL/b0MprSLi8K
 WF8n/bRsRZud5aPV71U9ntOoXvEEb96J
X-Google-Smtp-Source: ABdhPJxJqBjkXmkFXRzjcs2rSCseMVbs3WtSgPgtNeweQWod0uIpUlOl6Sj1kzSBnH6DALlQne/TnSGKDRvh
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:54d5:2689:9e4f:dcad])
 (user=tzungbi job=sendgmr) by 2002:a25:c41:: with SMTP id
 62mr19160134ybm.748.1640586119975; 
 Sun, 26 Dec 2021 22:21:59 -0800 (PST)
Date: Mon, 27 Dec 2021 14:21:53 +0800
Message-Id: <20211227062153.3887447-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] ASoC: mediatek: use of_device_get_match_data()
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Uses of_device_get_match_data() helper to clean some boilerplate code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 7 ++-----
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 7 ++-----
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 7 ++-----
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index ca893feab7eb..718505c75418 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -685,7 +685,6 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_da7219_max98357_priv *priv;
 	struct pinctrl *pinctrl;
-	const struct of_device_id *match;
 	int ret, i;
 
 	platform_node = of_parse_phandle(pdev->dev.of_node,
@@ -695,11 +694,9 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
-	if (!match || !match->data)
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
+	if (!card)
 		return -EINVAL;
-
-	card = (struct snd_soc_card *)match->data;
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 19f8aead775d..b0ec5ebd4f2d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -637,7 +637,6 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	struct device_node *platform_node, *ec_codec, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
-	const struct of_device_id *match;
 	int ret, i;
 
 	platform_node = of_parse_phandle(pdev->dev.of_node,
@@ -647,11 +646,9 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
-	if (!match || !match->data)
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
+	if (!card)
 		return -EINVAL;
-
-	card = (struct snd_soc_card *)match->data;
 	card->dev = &pdev->dev;
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 2552f30d8fe4..f7daad1bfe1e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1106,7 +1106,6 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	struct device_node *platform_node, *hdmi_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
-	const struct of_device_id *match;
 	struct mt8192_mt6359_priv *priv;
 
 	platform_node = of_parse_phandle(pdev->dev.of_node,
@@ -1116,11 +1115,9 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
-	if (!match || !match->data)
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
+	if (!card)
 		return -EINVAL;
-
-	card = (struct snd_soc_card *)match->data;
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
-- 
2.34.1.448.ga2b2bfdf31-goog

