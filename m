Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF32FCD60
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 10:24:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A871813;
	Wed, 20 Jan 2021 10:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A871813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611134686;
	bh=A81KaJe1lkujKGuPtj1KJQEstELnl/GkWrbGXxb55vI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lg0T1MV4q7u7hB7eUquMGYt6rhwuB3xoeZyzA8zIY3l9xsMECfR7KeZHdbMY+nS85
	 9MsTJp5lXGJ3CcxbXw9R51ybjJnL+PT4BowjR4tXHt1ZjRcCci8G6wxKQ37R8bBS1r
	 oWW9DOzucEhn3i82oNInwt8D7ESuzHkRfieyUpHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0ADCF8012C;
	Wed, 20 Jan 2021 10:23:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C95F804C3; Wed, 20 Jan 2021 10:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2526CF8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2526CF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IAwuYLgl"
Received: by mail-pl1-x649.google.com with SMTP id 98so16124024pla.12
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Y00UrHedJpZF0IpYWdvSW+wueab0rsNryEHBE00VosA=;
 b=IAwuYLgl8AG+14JB1PAWtHLh2KCeBqOCzEdYPNoqDYxhy9UE11G4WA5byUbexbxaWs
 iwJ57xuAiRZf/kOKHkffEd5sYw3WKBcG12nL3R+aOscsa8jPa14Z0dD89ARmSmLIPh/L
 1lE0y6tNK8N0Iy8ACLulEcNIKd+0tTA+U8qHLnil65P7LWHcT0K+NGDjNfmpCzuUofK3
 7tYAlCcb4wDBp7ie7V1KEFoiqevgug6Cyv3tLD2xCWtX9qMVRSElsd+kYZbd5deBDQ21
 exQwA4z6hwa0fdN/HVAhnpxZ5HXDjIqe67BaxfjTs3X/B1T+EfdQyHSyloL6mir5fJly
 eGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y00UrHedJpZF0IpYWdvSW+wueab0rsNryEHBE00VosA=;
 b=Ek3383WA74NYbbSxEbBVTyU2g5gKfve0rl1ZcCyJOAp1ey3K3EMB9kNNX34Cm/+Kcv
 E0Lbv5BrOm18QQ86uZ8ISkVPA2jN1Yqj1fFoQ2+RCC/Zcw0tGxFOMhDSguxHHGmjZ5Eg
 YzkwuMqDW+8L1C2RcqVDhoSVV0dFesGpgN9R1j66BJy4FzgEcD4ENjDz7JFV+80NveJY
 KhMsZeC4ue0hOP4cG03hhxfV/OwKScGWvVULO93Z7ZpV/vTwYqtQ3bkw6stYwBGYJAcL
 kv9ZrKInYWW4Vhb8es9ahl50WM49xeFDxKRdCfrH0OPfufxLmrcgiaj0azAJZZZSQSiE
 k/Zw==
X-Gm-Message-State: AOAM5326aaapzg0MdRTC4mRpGSHB9bSA+thSa6LH5y+Z4VPviNzlaaHk
 WHKlGvV9m3SMQIcnFp5O5ZNwwjWhGYhM
X-Google-Smtp-Source: ABdhPJy3AdQKUc7zva+2GcJmCw3m+W6Os4bEYYvteFDBAVqFBYAJN4VBmdNUT8YqfEVX7M4m+CPMA1zxfKKH
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:1164:8893:969a:b338])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:aa8d:: with SMTP id
 l13mr7826pjq.0.1611134572178; Wed, 20 Jan 2021 01:22:52 -0800 (PST)
Date: Wed, 20 Jan 2021 17:22:36 +0800
In-Reply-To: <20210120092237.1553938-1-tzungbi@google.com>
Message-Id: <20210120092237.1553938-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210120092237.1553938-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 1/2] ASoC: mediatek: mt8183-mt6358: ignore TDM DAI link by
 default
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

hdmi-codec is an optional property.  Ignore to bind TDM DAI link
if the property isn't specified.

Fixes: f2024dc55fcb ("ASoC: mediatek: mt8183: use hdmi-codec")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 0e4892245035..3cf8aeab042c 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -509,6 +509,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_tdm_ops,
+		.ignore = 1,
 		.init = mt8183_mt6358_ts3a227_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
@@ -655,8 +656,10 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 						    SND_SOC_DAIFMT_CBM_CFM;
 		}
 
-		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
 			dai_link->codecs->of_node = hdmi_codec;
+			dai_link->ignore = 0;
+		}
 
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

