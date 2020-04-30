Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A65841BF2BF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 10:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 567CD1669;
	Thu, 30 Apr 2020 10:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 567CD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588235246;
	bh=r7QPJFsBmb5bBMH5TAYZgtgR/TJ+H0D0gtfu6SMYTKI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJt6qYXPXJ2jsnFRASNY6Tv80KqpV+bTWl3Ec39OPyCTdxH5HLf/yGezueNKf5T6r
	 yrFL4fcJEp5EW6MjJNqyn038XQ+4kVH3y7gAfkhW7oEXsTx6YUVWoe1nnqvt8FLiIn
	 h3nfOpFPILeQ3KnOd/+J7zMoyjxeHTQ+IED9Wzxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B69F802C4;
	Thu, 30 Apr 2020 10:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAD18F802A0; Thu, 30 Apr 2020 10:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF35F8029A
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 10:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF35F8029A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rRGqA7JZ"
Received: by mail-yb1-xb4a.google.com with SMTP id h185so6859280ybg.6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=grXX/zNEQT8tX1//Vo8J6acH4d/plf8sUJ7kVimoPtU=;
 b=rRGqA7JZ80BLPpljGg6xDSzjLfY2GYLObc0fSocJNhoZD5zamqZQUCT8dTUOV47Ms9
 xsB5TU30rlWWs8w5jkn25Bg2AK5SXg2B07UDcnFUhaUp32nYgTfpD7D2eNiEGNs5XaB0
 xdSoJYqVmtH/l6qzUI+HgwrwOeoFQIkh58bIX1W9oqKj1YJP+BmniCbNPuONgtxHRa/J
 wZ29oooArGCoNK+0X7E1hXB6FPOpPOfoLuryBbQWVODKf9uQA1Kj0F+wrbIOCuKzRJNz
 KsT/V9Bc9okXuP+RAGAM5+yF4oFpcgjs69C4Srztc0bifQOhMK55XfrerJRuMGWKiAs4
 7BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=grXX/zNEQT8tX1//Vo8J6acH4d/plf8sUJ7kVimoPtU=;
 b=QYGy+aA+7sf7O11pXjw7eubZeACsEzCoJPKmUhpBfxZN/Iwq2hAfy8keVlvXhRMa+B
 BupbKiqcSj75Et7jsWdIYaDIpGlvL6feu2nDeemrkVNtOsY4yRU+YAe32imgcaIC1Fsw
 DYKniLdrJx2mF4XZTNlDzLEPb3qgb5p5UCfZgtQevZXl0AN/+4Bk2GXY4jzUWIULlSqT
 pHQQT46yH2HYQgLbY7AJJWJXNHz+hJ2AMjh8x4F3Lo+9j+uDraoZwmW5q03m7iH+r3qr
 EsfKrF5VEUbpx/9rpQ1PEDsyH0AWHKGhR/mQQppTgyLmu83rTEQW4hcWfgZA3mVXm/fK
 m+pw==
X-Gm-Message-State: AGi0PuZLr6QHPfjIyWNUOh0GK07KOcNs41rRMUpT3uaVV/ZFhOqjxWPl
 QSq7zohh5OolSl9ZvdhSW2s2+pQdqhm7
X-Google-Smtp-Source: APiQypIE+KmbkbjcwYJQHKCqulNArhl3h+VK26SxchorERYvcF+2jZ38L4ju+VGSkCWK2NXGu3a2yYp9H4Ra
X-Received: by 2002:a25:af4a:: with SMTP id c10mr4175960ybj.270.1588234974300; 
 Thu, 30 Apr 2020 01:22:54 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:22:29 +0800
In-Reply-To: <20200430082231.151127-1-tzungbi@google.com>
Message-Id: <20200430082231.151127-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20200430082231.151127-1-tzungbi@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 4/6] ASoC: rt5682: replace message printing from pr_() to
 dev_()
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

Replaces message printing from pr_() to dev_().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt5682.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d38b2e8a7f43..bfe542dcc7ba 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -857,7 +857,7 @@ static int rt5682_button_detect(struct snd_soc_component *component)
 	val = snd_soc_component_read32(component, RT5682_4BTN_IL_CMD_1);
 	btn_type = val & 0xfff0;
 	snd_soc_component_write(component, RT5682_4BTN_IL_CMD_1, val);
-	pr_debug("%s btn_type=%x\n", __func__, btn_type);
+	dev_dbg(component->dev, "%s btn_type=%x\n", __func__, btn_type);
 	snd_soc_component_update_bits(component,
 		RT5682_SAR_IL_CMD_2, 0x10, 0x10);
 
@@ -1189,7 +1189,8 @@ static int rt5682_div_sel(struct rt5682_priv *rt5682,
 	int i;
 
 	if (rt5682->sysclk < target) {
-		pr_err("sysclk rate %d is too low\n", rt5682->sysclk);
+		dev_err(rt5682->component->dev,
+			"sysclk rate %d is too low\n", rt5682->sysclk);
 		return 0;
 	}
 
@@ -1206,7 +1207,8 @@ static int rt5682_div_sel(struct rt5682_priv *rt5682,
 	}
 
 	if (target * div[i] < rt5682->sysclk)
-		pr_err("sysclk rate %d is too high\n", rt5682->sysclk);
+		dev_err(rt5682->component->dev,
+			"sysclk rate %d is too high\n", rt5682->sysclk);
 
 	return size - 1;
 }
@@ -3272,7 +3274,7 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 	}
 
 	if (count >= 60)
-		pr_err("HP Calibration Failure\n");
+		dev_err(rt5682->component->dev, "HP Calibration Failure\n");
 
 	/* restore settings */
 	regmap_write(rt5682->regmap, RT5682_PWR_ANLG_1, 0x02af);
@@ -3391,7 +3393,7 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
 	if (val != DEVICE_ID) {
-		pr_err("Device with ID register %x is not rt5682\n", val);
+		dev_err(dev, "Device with ID register %x is not rt5682\n", val);
 		return -ENODEV;
 	}
 
@@ -3562,7 +3564,8 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 
 	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
 	if (val != DEVICE_ID) {
-		pr_err("Device with ID register %x is not rt5682\n", val);
+		dev_err(&i2c->dev,
+			"Device with ID register %x is not rt5682\n", val);
 		return -ENODEV;
 	}
 
-- 
2.26.2.303.gf8c07b1a785-goog

