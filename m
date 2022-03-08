Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D96A4D0DB9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 02:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6CE9176B;
	Tue,  8 Mar 2022 02:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6CE9176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646704427;
	bh=pT3PbTMvNl9NGqhvomGdn9GZPC8XKFqHMU1LGeNvG5I=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YPK5Kw6GKrysloj63f4Bb9SpizRjwO3oBcnkvrWqQZxXl1LU99bB4+FCsUkRaxZWh
	 009ykHtOX6ECPguLofPNVmkIO53PtJCdmuIKuamoMjDnjCTKsvQJoPUSjNmwSqOa32
	 E8rnFwjCVdKsrZvO+u8KU773Da3tfnjMOZ8gv2SY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F66F80159;
	Tue,  8 Mar 2022 02:52:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 848DCF8013F; Tue,  8 Mar 2022 02:52:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03417F800E9
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 02:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03417F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HSCYAeLo"
Received: by mail-pj1-x1030.google.com with SMTP id m22so15798413pja.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 17:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=58lwskYug/llHkpIrMRW+dy3O3RN+GbIpdAcgfBEttk=;
 b=HSCYAeLoHcpnnM2uKaIA5lifN/t97U2w1M5ioRJjGdZ++5Thz9qLLXuH5q/V+ioCpJ
 B7idQN5/gHfstOY+ov8+wbbGw2JRhsWSbIXivdKSDdTjBQMdQSKSpbhMs47dVwah6oPX
 Cdw95MMMXeJfH+NbYVToxnzsV4ATd/bMKUbC+mBicPFKU5UwSVTZB6u2IkCPHWFW4ezg
 EiUVoRYJ3oIqF1DqnUZ4HSXwSPgLTtVK+2I/P9IWNrr5wEok0ATlQItCDJ/rHikjkIi/
 3sITJfYrTlT+L13h6lvijlT1xW0UsPl4LoL+AEbFNMRYi8Llyj74Jat8B395qAzctYcr
 Fstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=58lwskYug/llHkpIrMRW+dy3O3RN+GbIpdAcgfBEttk=;
 b=3Qiy+HHp3WHi7srXFmnyCbjTVOZDYBw5jKmtVzLzqlb1pLng/pviHwmfg9A+KlrnqU
 c7lUvZqlH8wpxHPBk91n5uwcK6IfA1w404nSWBxQ6XJ3Hk5AG4dKtKK0rzKg6BjiSFWK
 Ol6fCxWtyS5Y7hyEsTFtfc5ces/u72EOCoE7+J7by1HE7D+ikv81IjJYLmDDWctkzIoC
 P9VZRV1lo+LYJThAmAQgWz5bgwU6V7Tf1iSBFeIx1m1RQjOGz/qvT3wqB2gBVqTL7CLe
 dyxDxI5fbeQxZ6yGjyRKkThaqXTsHpOhaIWNBaIW5bXgqqd8lPqJtTf9ac8FhWOod6Y4
 xZiA==
X-Gm-Message-State: AOAM532NZ9rI1zegB5ZDsMO8Am8LPuG+LSmH8noJu4s+SdDMDUTGfwMQ
 YZH8Fh2zRCVhhmcF7Sn4v+U=
X-Google-Smtp-Source: ABdhPJz6lbpi9VHXqUtR/ZCOi8FTsWcSS1kfqtODKavlvexuo70DQjYtfjWCTLdBrNr2bb1jMtcHAg==
X-Received: by 2002:a17:90b:4b0b:b0:1bf:764c:1bc1 with SMTP id
 lx11-20020a17090b4b0b00b001bf764c1bc1mr2012864pjb.85.1646704351035; 
 Mon, 07 Mar 2022 17:52:31 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 pf15-20020a17090b1d8f00b001bf5d59a8fdsm645663pjb.2.2022.03.07.17.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:52:30 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8192-mt6359: Fix error handling in
 mt8192_mt6359_dev_probe
Date: Tue,  8 Mar 2022 01:52:22 +0000
Message-Id: <20220308015224.23585-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Fixes: 4e28491a7a19 ("ASoC: mediatek: mt8192-mt6359: fix device_node leak")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c       | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index f7daad1bfe1e..ee91569c0911 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1116,8 +1116,10 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
+	if (!card) {
+		ret = -EINVAL;
+		goto put_platform_node;
+	}
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
@@ -1159,20 +1161,24 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto put_hdmi_codec;
+	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = mt8192_afe_gpio_init(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "init gpio error %d\n", ret);
-		return ret;
+		goto put_hdmi_codec;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	of_node_put(platform_node);
+put_hdmi_codec:
 	of_node_put(hdmi_codec);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.17.1

