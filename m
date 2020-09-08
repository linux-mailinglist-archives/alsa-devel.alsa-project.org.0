Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD1260B7D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 09:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AED1775;
	Tue,  8 Sep 2020 09:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AED1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599548601;
	bh=qBdUsuxe1NSfWczf9V3iKBaOrowKcZoqR6JM0ysjyFA=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pq3UORSQQCNMKK7rOEGDAqESr5OiWsq2ZamALiBRE3t1+Fs8lvvtHCPI/A4BV1p85
	 fY+CYLsTU7e/o/+rTJH3ks4kCeqirKZnknbx8ZHxKM+Qy5viOPTG8mEi3KoW85ipET
	 7tIRRiij6Gef8ftiwalyKk5X4VjV1Udh3sEqQmSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 484A6F8026F;
	Tue,  8 Sep 2020 09:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4D1BF80264; Tue,  8 Sep 2020 09:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88D36F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 09:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D36F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="S8Pqi4NX"
Received: by mail-pg1-x549.google.com with SMTP id 8so2580689pgz.15
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 00:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=GGO09v4RsoA264YQ6kRkEpuItBUA5pTf+ywKZtOwt4I=;
 b=S8Pqi4NXQayFPEsxd8n6xAPCW7RbwGqrft1PGOfCY3V7JItEI5OmZz0tB+2L2Infw1
 it2H2rgLhPREMvb7AwuTU3/OZKs08xhRf3stq7TLtmp5K4cUoHgpeULeSTYAgRhUIKmj
 vz8Up/lJcw+YGNSXMswqjnrwcyC8QVr55M2F8pZkNoI+1H4ToCYGQ9zfJa6iZFrja3vy
 TYhaWWkbZbdtp5fvCmvl8rfObzkLDWGucZivk4oa0mzmSDGjsLfmq+72Z0GOaoUDbwIb
 L46bg2urzY4cTvKvd3lcvkdqBCQy/yIDXfBiytlkoY/M0l7xMaVKA7vG/AL/mECzFZWZ
 c6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=GGO09v4RsoA264YQ6kRkEpuItBUA5pTf+ywKZtOwt4I=;
 b=sjR120FbTAkxzM/hKh3ATTqxR8EL/EdE7isXLcqB7BGH9bIPIUNZIn5T4v3s2OI+hO
 358oprt4aWRlOMrj9ikpnz45iFUA3GHsUA7Vw5pFOAOB32o+q0Ll5l1OmYR4Kl3XMxwN
 N7IwT2wQwpjfDjx6HNwg14cutgjPJsPtPbMCCCL8YAPuwmJ8FaOElT/T1eeBJ9DTcXAu
 bYai8RUQvBfdRHWPdJB8m1zH2zZ+L3z4dPIHnYKG+WbrGfWPARdUpyxP8UgC7Q2lR6K9
 9sj4Xf1NYBCEHIssJj/eV9ULtsa+pZ7OlMWOnmwykPTV6XaU24CshtS7fUJKkotk3V/F
 6xLg==
X-Gm-Message-State: AOAM531Qp4gU6WvCEbm/Ras54sJkwuS4RVtXohozM99TnKYT+OVAAzr0
 ZC2rOss97ikeygIz38SkIoRjlRHY0+S6
X-Google-Smtp-Source: ABdhPJyyWf+zX3jQmr1NwyyD6EfFM7Z5I2vo1dE34iE7m1AWJldL9aVo9FHgBP/A2vVd2bQAXV60tDRrwFCa
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6a00:a:: with SMTP id
 h10mr15587280pfk.150.1599548491669; Tue, 08 Sep 2020 00:01:31 -0700 (PDT)
Date: Tue,  8 Sep 2020 15:00:44 +0800
Message-Id: <20200908070044.1142644-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH] ASoC: mt6359: fix failed to parse DT properties
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, jiaxin.yu@mediatek.com
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

Mt6359 platform device is instantiated by mfd_add_devices().  In the
case, dev->of_node is NULL so that mt6359_parse_dt() always fails to
parse the desired DT properties.

Gets the DT properties via dev->parent->of_node.

Fixes: 8061734ab654 ("ASoC: mediatek: mt6359: add codec driver")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Previous discussion: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-September/173773.html

 sound/soc/codecs/mt6359.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 72f05335b420..81aafb553bdd 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2636,8 +2636,13 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 {
 	int ret;
 	struct device *dev = priv->dev;
+	struct device_node *np;
 
-	ret = of_property_read_u32(dev->of_node, "mediatek,dmic-mode",
+	np = of_get_child_by_name(dev->parent->of_node, "mt6359codec");
+	if (!np)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, "mediatek,dmic-mode",
 				   &priv->dmic_one_wire_mode);
 	if (ret) {
 		dev_warn(priv->dev, "%s() failed to read dmic-mode\n",
@@ -2645,7 +2650,7 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 		priv->dmic_one_wire_mode = 0;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "mediatek,mic-type-0",
+	ret = of_property_read_u32(np, "mediatek,mic-type-0",
 				   &priv->mux_select[MUX_MIC_TYPE_0]);
 	if (ret) {
 		dev_warn(priv->dev, "%s() failed to read mic-type-0\n",
@@ -2653,7 +2658,7 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 		priv->mux_select[MUX_MIC_TYPE_0] = MIC_TYPE_MUX_IDLE;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "mediatek,mic-type-1",
+	ret = of_property_read_u32(np, "mediatek,mic-type-1",
 				   &priv->mux_select[MUX_MIC_TYPE_1]);
 	if (ret) {
 		dev_warn(priv->dev, "%s() failed to read mic-type-1\n",
@@ -2661,7 +2666,7 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 		priv->mux_select[MUX_MIC_TYPE_1] = MIC_TYPE_MUX_IDLE;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "mediatek,mic-type-2",
+	ret = of_property_read_u32(np, "mediatek,mic-type-2",
 				   &priv->mux_select[MUX_MIC_TYPE_2]);
 	if (ret) {
 		dev_warn(priv->dev, "%s() failed to read mic-type-2\n",
-- 
2.28.0.526.ge36021eeef-goog

