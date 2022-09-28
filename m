Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE895EE91E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 00:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB0C1E0;
	Thu, 29 Sep 2022 00:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB0C1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664402724;
	bh=nnh0LoPolAz79GiigEcQIVF+B25cFqMGxkghGrrdxQU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lrHDc7PCUCyk9v2Q8pHVUUn1CYnDlw2kGJZ9Q3EDNqxOoXp31GgWknfSlNDGSzfgM
	 i/auAbVBsDoLDCbWsVfamIFSBZkcs6TbC6n5tkVK5v6a3TXgKkxHbCtcX10mum/eL/
	 6s9slaLRCW/5v07z7IhKBZBOJOv9+5SOwVgmbInI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE3BF80109;
	Thu, 29 Sep 2022 00:04:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79360F80310; Thu, 29 Sep 2022 00:04:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE420F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 00:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE420F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KU1oYI3X"
Received: by mail-wm1-x336.google.com with SMTP id o5so9348790wms.1
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 15:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2wqVo0aD55CNjK+hEjl9Jhtj7J/Tr6/AA4pMGSEV/1g=;
 b=KU1oYI3X0FsdCE4047IjtG+VQWOsp23dQ1ziNPvW9YTUtXJgabEeqWTqAfXnORtk7Q
 EgXtEwk7lbwjqPFgg+cMC4IgeJbda9fq7SzSgYlCFtfPJMX7NuKM+LFQ+pTHNQ3MeFK9
 jgS88jZoYJlre/fYBan0YOURD6Scp5FEFXjLTzFVPlQhmsyEJYk0Tff9Bsut8aew+9hx
 L5WKAeV7f/VMlkXKEVA1qoXAx7ml8wcjhgpA+5bZrRzw2vf2ETSiFReCmZWh1M3Cirtq
 Gff1LMaLcri9HXdR38v1ZbHtBO0e61ybtU4mAW21b1ayAXZsjKUmnJ2k3Nl0iX/fbqxt
 uPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2wqVo0aD55CNjK+hEjl9Jhtj7J/Tr6/AA4pMGSEV/1g=;
 b=Lq+PQWQ7TS9J3KIJAPcL8f8RrtqtwELrvdb2gnonX7wy7dpw8TJ9SqEoifrJt3SmkZ
 dxxjuBr/ZYZOJ2J2x8WpcGlYr9wlq7AcKNKtntDLIfd11cVQP97G78w19bO+vTWcsEJM
 KlM5fTtfoDvTindGBeny2gIXUu9QmzNJrBxSzuXkGbo6cR2iGVPFIeNJl5PZDQwuR7UH
 YLk6IL9kdjuAUzKC5uFteJGSJndog1Oh1DopWgj82Hq8b458V9EkhuKVmrF6KzZpjgU7
 vn4RRylk3ydHjz+aUMXIzWcFOkrxneffyDT6UEvx3JWxHZge20zLDFgtBCqpRBG+O4B3
 JlZg==
X-Gm-Message-State: ACrzQf0YWbShvQmfLKs5tXNanwpRn7S1myWUM4QwNDr0ESQuKyiwnxRN
 beQRzO7P0kJSn4PYp8m7L64=
X-Google-Smtp-Source: AMsMyM5C5bvoufyf0RMPrn0G1wm8CeA8ImmPUYZ3eH2K2m1PZUZoa1b7sFlsXXS6Dva1sReyJbuqKQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c618:180d with SMTP id
 g11-20020a05600c310b00b003b4c618180dmr76898wmo.25.1664402658808; 
 Wed, 28 Sep 2022 15:04:18 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4203000000b0022acb7195aesm5121019wrq.33.2022.09.28.15.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 15:04:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8186: Fix spelling mistake "slect" ->
 "select"
Date: Wed, 28 Sep 2022 23:04:17 +0100
Message-Id: <20220928220417.66799-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There are some spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 274c0c8ec2f2..eda913fa147a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -170,25 +170,25 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 	if (enable) {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MISO CLK ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO CLK ON select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MISO DAT ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO DAT ON select fail!\n", __func__);
 			return ret;
 		}
 	} else {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MISO DAT OFF slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO DAT OFF select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MISO CLK OFF slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
 			return ret;
 		}
 	}
-- 
2.37.1

