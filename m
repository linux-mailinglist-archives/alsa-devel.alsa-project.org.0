Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F647EC44
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 07:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8656918EB;
	Fri, 24 Dec 2021 07:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8656918EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640328614;
	bh=fat8ERIjNb/d9G6sRZhbkJZJ0TDZGgqXbAL0+CPMLmk=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWiQQEFY/5j8dVgCilvEp0Ac54clS1P1G1zuM/726OiJGJAA/cw1hYClg9Fj5zrm9
	 4ixfUeHMbbDuJB+sfO+aMeFzO/nwKBqd/FkzlPBBLDfIglnmRzpFEblTarfepv5Mle
	 9ufl//X50pio4pYZ4/fIJ8wz9W/irgquexhGe9lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C4C9F804FE;
	Fri, 24 Dec 2021 07:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58808F804FA; Fri, 24 Dec 2021 07:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E270AF80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 07:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E270AF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IhFEYiHN"
Received: by mail-yb1-xb49.google.com with SMTP id
 l28-20020a25b31c000000b005c27dd4987bso14071914ybj.18
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 22:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DBV9yG4yD62rmNt2YrqNkuvo/t1I5YaVkAjhfMcjpIc=;
 b=IhFEYiHNbbNskWmqICyQc3io1R+U13Gkw6mYuUgmqj10czL0iX6p1i3zpuQy/e3zBf
 D7wtBhFOGrx7On0no/J0mr5dshh3paiQYrR3Ft4xMuzyZewET8kSGUwXqj62h1wfFcrE
 naz/rJVLGczT42Yv3vvv+wOYQFLycXsscdpPqmsNK0AXzNjQAf6rLx+rpjpRe7/Yv+8g
 fv4SqbXhM4NqiLwHrPciTIyUCFBKDkW1lDb4hWv6/m+JuNY2XIg4dYq7HbDsiBH5JJM3
 j/M+Lvj7pqp2se4qoQelIjMEU7ucwURLUtVhJqG0iTbXPeBfFJv1wqmcAoaFNcKGTYzD
 D1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DBV9yG4yD62rmNt2YrqNkuvo/t1I5YaVkAjhfMcjpIc=;
 b=lziNkx6R3CJweQXDW/BD8yFHX9oH+m6RhywSFBssAT3pFHZNPRDxCvzUte/zjQbqIf
 8eKHL4+bf53P3BSlMyhml4Q83HTVLxNzPsFOpgDHneh94HpF8Qxe6XAQohi10yyI9nD+
 iae24buDtq7QfywKeMGoUNLhT57jWUzy3Zgi4xS/LnP8WCbbNYZvI///03bClrGhdJje
 S8a61Y0UItYkJw9/GRnyxypXZbO5upXjjzcphiwO72NKbU1gne4wROblpBbY/VNHS1lu
 pWy82hOaby67YFGhaANpTsjA4uFNW0ATBg9/HdZIIlK2k+1SyKcGZGmS60iYv1B/mly7
 DT1A==
X-Gm-Message-State: AOAM532j5Iv/czPfCluwDpD3YQemZCku/O9ABX3ebULM7sEQfbYjtQf5
 BTMnUlF0YOkzkiUP6HIyl2rob2ySImkV
X-Google-Smtp-Source: ABdhPJzOmzSaGu5Bci32//Ef94ycXo1SLKLBT/R696dPf76k71CTArknUChrmIrmlOpu5yKXjwlOsw4lo6+I
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:af4e:fb49:1227:527b])
 (user=tzungbi job=sendgmr) by 2002:a25:e811:: with SMTP id
 k17mr4122391ybd.121.1640328473973; Thu, 23 Dec 2021 22:47:53 -0800 (PST)
Date: Fri, 24 Dec 2021 14:47:18 +0800
In-Reply-To: <20211224064719.2031210-1-tzungbi@google.com>
Message-Id: <20211224064719.2031210-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20211224064719.2031210-1-tzungbi@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 3/4] ASoC: mediatek: mt8173: reduce log verbosity in probe()
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

Eliminates error messages if snd_soc_register_card() failed.  Kernel
emits messages if device probe error anyway.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c      | 3 ---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 3 ---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 3 ---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c        | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 65941dd2295d..4cb90da89262 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -177,9 +177,6 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
 
 	of_node_put(codec_node);
 	of_node_put(platform_node);
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 227b0b72c66e..b55122b99f07 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -215,9 +215,6 @@ static int mt8173_rt5650_rt5514_dev_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
 
 	of_node_put(platform_node);
 	return ret;
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 8df2ff2f2aab..5716d9299066 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -282,9 +282,6 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
 
 	of_node_put(platform_node);
 	return ret;
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 16ddf9f8bbcb..fc164f4f95f8 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -320,9 +320,6 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
 
 	of_node_put(platform_node);
 	return ret;
-- 
2.34.1.448.ga2b2bfdf31-goog

