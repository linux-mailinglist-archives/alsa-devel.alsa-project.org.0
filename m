Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1F2FCD61
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 10:25:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4291864;
	Wed, 20 Jan 2021 10:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4291864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611134718;
	bh=CciW1P1/nXfoHnf5jefh+AbJWTFycGlo4cOKyw5anZQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDqOO3IZizqVbsPnT4Wpjq1h/SYLsMRtFdVvkW3zNs3WjHvre3A8rdP9Jiz6KGmnh
	 Nm0ePUqxaX6kOO7rX3fZkNW9TBqNji+HVm/P0VGItnv7cpX9Woxw9CdQshK+r4jGy0
	 tDycGTG8S+RjPV3SPks8ynmX8QOccJmd8B2FhLc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A16F804D6;
	Wed, 20 Jan 2021 10:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18AA1F804D2; Wed, 20 Jan 2021 10:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F2E2F804CA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F2E2F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="AWQhkHrl"
Received: by mail-pl1-x64a.google.com with SMTP id 98so16124076pla.12
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=tc/R+CinKu1ch13hojWSasQwGtQKWPAxE07/EUndZq0=;
 b=AWQhkHrlM1MoVG+pEi2evm5iJghqp7tBazX6fzoOz5z6CC7r0hrGcaWBluvz7TYVb2
 iGyK3q3grkUUIvcCRWSf2zcii9TrhN1Qas3lIlCQYnl2d+/qi8l1jYb+brcKxPM1CTj3
 Yz9rdDmaOcT9X+YilhkgCEFfT+Zf+o0NzGDApSji/OAPjXDCXUlwPVZu0pijIA4DOBi3
 zr+uKQR/sBDF4Y5DHHqLaLpNs5NyuQ3Gg6Xf3gUoiKqER3IAhcpP2U5PfuKZqW0g6EvX
 n2BhOfQoX36WlJi19diggHoDdPp0y6i2T/wixPZt9JmF49YkktabEe300Pji+vM6RxBv
 VGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tc/R+CinKu1ch13hojWSasQwGtQKWPAxE07/EUndZq0=;
 b=ZQxFssTdCMRLrsKGRztQ8naAXK4VZrlUwtRBQ1EHyX9nuJqd4EBZCmQhtabxPgVTww
 GAxdJ2OZScXZtwdGuIpUUaBh/QrguLcPzvwNsTgTmN5ABQa9F/CWxpl8Wxk/bEVjnugS
 yZ9BzVpMMzTpZBrJK8UMZA3uWm9/S6K619HS8N16uPAnL1n1C8FY5vL5WsMO/YJLP+ay
 xEtObI1y8Smn/M1XPAOXdlbLkU9tHGg1F3nzWcNeA25y8qfClgJUukMmW+pR8+48rslK
 vgNDt80rRN4vz4lzUsQvejq4KeF4ono82fDc/izpiMdssPjCfXZy3s0XkqNsTKF/RE00
 +4Dg==
X-Gm-Message-State: AOAM533l29gvxCZE/VYH4RqgZell9e3jN3f2uxY0n0l5Ldd6ZUJqdRln
 csDh2JzOgwvx0TBsB3CX2rNDv/oy8KsZ
X-Google-Smtp-Source: ABdhPJwmNfrvZTIMVZHVRLOTc3W2V8TVVcY8sVbo5j3iBy2nDDW1g2XCv8qy/cGejyoEwjRcPRMxNQmV8bXI
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:1164:8893:969a:b338])
 (user=tzungbi job=sendgmr) by 2002:a17:902:9309:b029:db:c725:d19c with SMTP
 id bc9-20020a1709029309b02900dbc725d19cmr9236708plb.39.1611134577701; Wed, 20
 Jan 2021 01:22:57 -0800 (PST)
Date: Wed, 20 Jan 2021 17:22:37 +0800
In-Reply-To: <20210120092237.1553938-1-tzungbi@google.com>
Message-Id: <20210120092237.1553938-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210120092237.1553938-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 2/2] ASoC: mediatek: mt8183-da7219: ignore TDM DAI link by
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

Fixes: 5bdbe9771177 ("ASoC: mediatek: mt8183-da7219: use hdmi-codec")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 870cdfd17fff..a4d26a6fc849 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -526,6 +526,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
+		.ignore = 1,
 		.init = mt8183_da7219_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
@@ -748,8 +749,10 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 			}
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

