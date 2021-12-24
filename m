Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E594947EC41
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 07:49:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F2A186E;
	Fri, 24 Dec 2021 07:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F2A186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640328570;
	bh=LOADherWWa6FuUqHDL12Th0Qd9laRT03IyiBRCdT7rg=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iowsgiTD2UsGKIs2nw0mssTT504DaS4PXF9TlFBC2o4dPe73XcTMaCQpGhkRqYWdi
	 Zjpv+cG9aIWFpioBIWJ/rF71uL2jm5TZLI6gQIlZ0oHbS/u/da9cqHzN/wiqUTQp2L
	 YWzK0uuENLz/eKaqSv5o0K0fTOG0WZaGWcxHz4bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A30F80162;
	Fri, 24 Dec 2021 07:47:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A759FF8014B; Fri, 24 Dec 2021 07:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52438F800FD
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 07:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52438F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="W6EkA2Y7"
Received: by mail-yb1-xb49.google.com with SMTP id
 l28-20020a25b31c000000b005c27dd4987bso14071423ybj.18
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 22:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DuyyQrdRujaQuOc09Kz85J5yTDB7+92eu48NIv/9FJY=;
 b=W6EkA2Y7jc6l/3YLTZe22Y9Bl+izH6HcuPxl0YdyxvQqwcncPMRyJ6hqNSjnsps2VL
 CdCF+sP3jpvTsqcnhCK2aj05x2ruXpeNgE2/u86tH4aQN3GsqocmYiRmtS2Us9D9oKCq
 C1ZD0+9A7LuqGJhSDGH4HLY4sqRi+X+ByOi6Zcv4oG+AKMA4Gf8YKvmSUEe/VxbbiMeh
 RM6bgwdnHWyL4tb3lnt82LVQ7tLPoGJVpVIaFtUkDI6SwuhuTT/JOU0fzitkqikD/66P
 G+uq5ycJWcUR2rLYUJt2uE9vJTOECpgR72NGEnwbUEIogs0KZWGXyifbpXJS0EhaiLWc
 oqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DuyyQrdRujaQuOc09Kz85J5yTDB7+92eu48NIv/9FJY=;
 b=tcPH+86DNKYn+VkYQuy/bXg5O6dyDux2tBwtf8Be7gGONX4xLBVGW39IRE8pOxQYEZ
 4vu328usIO4WDQS7e8g89LlYbuZSB21UA9k4su+RR3DycrBNKX30/Je91xYddaSUIPtP
 bzEafV9eMSknCIjAURjAJ6TjTLD2/b7+w0ZeJAGPUKlE5Nd1ii/OVWL2uOv5vECQ8hue
 vzAJDqkh5SZvHLjX1fC9ZcP3agFLgCVpkwlkOhOLzqXBl0DRHttbd1ztPb3niq+GH2Mi
 7lbufEJv/UuKBoKK4vmRFujuotEdVVVnNkz2sSbwXRh7mm5R5xgSA46ztD2w/yst8mGc
 /TmQ==
X-Gm-Message-State: AOAM530eLD0MAQOsQZ0whZ5uvU0xW2lknLR5edWahrP53UafU++XWi/x
 K1EtkWRAUEh/odz4tuLfFagl0t57SQqq
X-Google-Smtp-Source: ABdhPJyxyOnobBFotEC9H3Y7XfYxbJppr7R71ZgBQtEMh1CduuG//5rKz4ocBoBYUBy4Vd1zee30pqaBUFtI
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:af4e:fb49:1227:527b])
 (user=tzungbi job=sendgmr) by 2002:a25:d756:: with SMTP id
 o83mr7325462ybg.394.1640328462794; Thu, 23 Dec 2021 22:47:42 -0800 (PST)
Date: Fri, 24 Dec 2021 14:47:16 +0800
In-Reply-To: <20211224064719.2031210-1-tzungbi@google.com>
Message-Id: <20211224064719.2031210-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20211224064719.2031210-1-tzungbi@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 1/4] ASoC: mediatek: mt8173: fix device_node leak
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

Fixes the device_node leak.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c      | 3 +++
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 ++
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 2 ++
 sound/soc/mediatek/mt8173/mt8173-rt5650.c        | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 2408c9d3d9b3..65941dd2295d 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -180,6 +180,9 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(codec_node);
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index e6e824f3d24a..227b0b72c66e 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -218,6 +218,8 @@ static int mt8173_rt5650_rt5514_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index ba6fe3d90bfc..8df2ff2f2aab 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -285,6 +285,8 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 9b933cce0b20..16ddf9f8bbcb 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -323,6 +323,8 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.34.1.448.ga2b2bfdf31-goog

