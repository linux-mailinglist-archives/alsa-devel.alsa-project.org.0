Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35446524465
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 06:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72DD193B;
	Thu, 12 May 2022 06:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72DD193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652330389;
	bh=Ne0k6j4b2Yrrxec+DtVh+mShOwGUQe6Y7G1fKBvUrPA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LzzMBoDsoNvGoXf7DpkViEWjQKyl9inp2INJKdGHq7rb6e+bcyfQpOG0+W3Nm9FVa
	 aHfdB6qT9QfXKOIZSE6O3QHiWWv9OW3EJ48iv1wcWef4u1pTd4HfcnkjgClN9ruXPc
	 9GQxHd3trZcarwxUD3gMAe04zVNzj6Z2SEjzabJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33E31F80249;
	Thu, 12 May 2022 06:38:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2258FF8010B; Thu, 12 May 2022 06:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BA50F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 06:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA50F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ndNUfPvV"
Received: by mail-pj1-x1030.google.com with SMTP id iq10so4124209pjb.0
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 21:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qeatecpI5VBsmshnC6au00bIeak7l+cm/LdiNwjT/c0=;
 b=ndNUfPvViUWmtHv/CwYTGkFHMtGEOJ8yY5z5NK+5vl7ANwwIpU/KiLEnlBjaT/AFVX
 thndiuRJZy5kMs6BnRW7N1Xc7Einl3HPYGHoYa2mWJqsi+B5RkyMKwGFprJ+NYeiuLth
 Rpz8h11jpfxHuiyQw05812e2fT2Rl6i02d7lwQaC07tva+Trzy4lioTO6YKC+yQd7Iq4
 sViqW+VLFl9eM+4GPuVH9wL4S64LbBsHSLOHkQa62KQ5r0Gsf69xoe/yfRSNQf6JJlIp
 qO8xSBC0K/gJUoPSL4TejJPtehuSQ7lpZIMxTkTkwPQLMWXNd2/4dI8hpHw+y+8bbJ2V
 VvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qeatecpI5VBsmshnC6au00bIeak7l+cm/LdiNwjT/c0=;
 b=uEk2U3wIlNP/1JjoDy8aZ9jxKG2GScyPRBJkM9+tKncujV1doSl8E+R7OU1BtFbinV
 0FSOtzOS1gssSbi5JxYNiXSen/Z5ZZ0B+JqzDuhK+ChMzglA37lEmEhG4xdoLYnwyn+r
 U5v0CRtum3MwI4568uTqVSwCXPWJwjZ4RRUGAMn/cplsSlf63iEsrUak9gdCS2jwCkk0
 K5yp5svyT9hyJE7VpzToJh/8Bzt6Z2x+ITQPbXh4YT5TvKQ/bL0o/xjBS3hGSy3t2XMh
 4tm/BDWHGPrm/KjoFyLFV7nIRxLBj4AFmKNh3Q3/W+fFuP8PeAfLq1X1AoMpF/zHG2qv
 TshQ==
X-Gm-Message-State: AOAM532EQ84Wjo7k6lJhEiW543YM9acP5oNwwc+iH6STq79n+AhabdgH
 hok+/E893IBahBnz7ZvCHXI=
X-Google-Smtp-Source: ABdhPJxAVJ1FIYvRsnYjOBa/CyoO2jvWFCUmu+eGDJ0Ftz3NpcBnK2gsn0/MPoUBnks7zZsYB7vK3g==
X-Received: by 2002:a17:90b:1d03:b0:1dc:f0d0:f165 with SMTP id
 on3-20020a17090b1d0300b001dcf0d0f165mr8963314pjb.25.1652330318461; 
 Wed, 11 May 2022 21:38:38 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 j35-20020a634a63000000b003c18ab7389asm759665pgl.36.2022.05.11.21.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 21:38:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: samsung: Fix refcount leak in aries_audio_probe
Date: Thu, 12 May 2022 08:38:28 +0400
Message-Id: <20220512043828.496-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linmq006@gmail.com
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
If extcon_find_edev_by_node() fails, it doesn't call of_node_put()
Calling of_node_put() after extcon_find_edev_by_node() to fix this.

Fixes: 7a3a7671fa6c ("ASoC: samsung: Add driver for Aries boards")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/samsung/aries_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 5265e546b124..83acbe57b248 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -585,10 +585,10 @@ static int aries_audio_probe(struct platform_device *pdev)
 
 	extcon_np = of_parse_phandle(np, "extcon", 0);
 	priv->usb_extcon = extcon_find_edev_by_node(extcon_np);
+	of_node_put(extcon_np);
 	if (IS_ERR(priv->usb_extcon))
 		return dev_err_probe(dev, PTR_ERR(priv->usb_extcon),
 				     "Failed to get extcon device");
-	of_node_put(extcon_np);
 
 	priv->adc = devm_iio_channel_get(dev, "headset-detect");
 	if (IS_ERR(priv->adc))
-- 
2.25.1

