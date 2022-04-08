Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EDB4F9281
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 12:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CBB41918;
	Fri,  8 Apr 2022 12:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CBB41918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649412259;
	bh=7aHzyVPCnMbT48dv6/sj26UQnUENElqSseXlPZuP1OQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZLDMi3uTivCttC7/m8yjBvEgJmA827aAGZLIoPMlwlFmIM5GCQf84ufEEayKglDLe
	 EWx9nV8Ag2IQRi18XKjGBlEJwDzkJPzuKJ9/0smTNWkZs5jQ3qPqRhdltOWr4TBYk8
	 WersHgALJfA7MYsuEzgG3Lcx4qSHir+k9EsPeWMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15757F80311;
	Fri,  8 Apr 2022 12:03:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFDF7F8014E; Fri,  8 Apr 2022 12:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91C9AF80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 12:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C9AF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o1UGymQO"
Received: by mail-qv1-xf31.google.com with SMTP id hu11so7084145qvb.7
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpqWb+qabLme++eyAmbSMoF69YNe99IcopaKHvnYnE8=;
 b=o1UGymQOBCjDdm5i0afuF4mfy7UgESaASrEg+kHv98rKvf2kjfs+KLgyy67VV1mSF/
 TW3edcjv3JT293ZlEsNVZgP0MplS+xLZLyUtF5jxOmE1zr+siFaLmEXjl7AUw2IliXkF
 z5FEh0vmlu3QfcRNNe7tVcTzcWkk1FOcteC8cvXuPZbNYxdpqKy8Rer2q30XPevLMxQn
 7hBXhC2Y5kTk98vwDs9E842kKJrhCEERlH5rjFV8oNTPfbYnkMcM1LbaiXZ49JVV3RhX
 vRj5WIUXlcgZk6u+e00dyv5GGYih2AOX1ktcDT59USWYDn1pcANUcA9QijkSUhkRb32d
 ltMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpqWb+qabLme++eyAmbSMoF69YNe99IcopaKHvnYnE8=;
 b=NLm1OrNIzaMEUp0pJOr0msti6ereQYCf14vks1WhhD5V9QrM5VqApEpxPqrSKYgEFz
 8p2stvXD8R8iGdztHIU6SEAypqAhAAYaIknLpIyrg4yM0rnTdg5piLudpCtfuAGxM9kW
 NT5VocX2Kp+wJDhnqrCO9dmAUQusTvXHXVyWphRcEWCE6hT+IG/uY4BfjWdmb/sA2phg
 CwtejDN8qMc87dRTv2RhT38PWZI7PzcF5S+P/deiDx3jE00lIyIeEz76BTCxmSpr1trq
 lgbdKjqIXbAKztm6q0iSMqLZnbOcyWZn61XPljrxv1gVHu7cDniYeOYQBI1ygEFbYKF7
 pXtg==
X-Gm-Message-State: AOAM5338NS2fAAQ9N7kMfFYeT+jX6s4pU3FlhjqfRXcNkhhG34DrnJ0L
 RwnJ+Ds65/TasFgW0OFZyQI=
X-Google-Smtp-Source: ABdhPJwmwY5DgTWhekwLTVj5UPKZKwOWKCsva1KAAGSWO7vxkZYgMV8T2DFwn5GOULQY015v2y5Uvw==
X-Received: by 2002:ad4:5de4:0:b0:443:5d80:e379 with SMTP id
 jn4-20020ad45de4000000b004435d80e379mr14863077qvb.37.1649412198101; 
 Fri, 08 Apr 2022 03:03:18 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e13-20020ac85dcd000000b002eb9458498esm17174364qtx.95.2022.04.08.03.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 03:03:17 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH] ASoC: mediatek: mt8195: Make sure of_device_id table are NULL
 terminated
Date: Fri,  8 Apr 2022 10:03:09 +0000
Message-Id: <20220408100309.2495462-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lv Ruyi <lv.ruyi@zte.com.cn>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, Zeal Robot <zealci@zte.com.cn>,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Fix the following coccicheck review:
./sound/soc/mediatek/mt8195/mt8195-mt6359.c:1657:1-2:
mt8195_mt6359_dt_match is not NULL terminated at line 1657

Fixes: 86a6b9c9dfff ("ASoC: mediatek: mt8195: add machine support for max98390 and rt5682")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index bc8c30b33969..262a54e590e8 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1655,6 +1655,7 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8195_mt6359_max98390_rt5682",
 		.data = &mt8195_mt6359_max98390_rt5682_card,
 	},
+	{},
 };
 #endif
 
-- 
2.25.1

