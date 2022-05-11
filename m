Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6004522941
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 03:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA72164F;
	Wed, 11 May 2022 03:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA72164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652234203;
	bh=PgvpHHOHwsmJCNnJ4zapiqEpdpjOxYaAR0Cuw6A8sxU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ld4uAIkG7daPgPBr9uIi5t6mItcWOugk2XHlScr4d63nhOkFoql+X4pz4XzLzsTEq
	 kd83uCsnCCyaoFRjLDaKoCwzCVWaPQVb5tUoCAX4TjZSMFku7Dtb8M8qb+I3VHlqwK
	 qSY0lAtMv/ZHe4OAbUE/dGhF8zwVd8bOBTDxfNSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58E6F80212;
	Wed, 11 May 2022 03:55:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 683B9F8015B; Wed, 11 May 2022 03:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B99B8F80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 03:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99B8F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yf0OpUrx"
Received: by mail-pj1-x1034.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so3523232pjb.5
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ba9RlsMQZXWIx36Z7u38zcXmSCVXQjEy1o7bWz6s8w=;
 b=Yf0OpUrx+nfUoeezT84Ho8jYoJAtvR8bMUSrPF3q+WTRu6Ojay2B4dj6RtDYjvaror
 vetcXq+m1RFeUa2gXq0i8ncujVkNNI5wScGQZ+j5D8fsb5aeLgzfnl4eRVK5S8cPRRtv
 m2cck0UeO9+0JSlBuQxaTFfxD20DXCW/FzuKwWD4cNp8w8HtZIMS4jX/sWjjTE6yb2Qr
 e9VRzGOsNBuBOJ5I4gCg8KX0Ff5oXJ65u5xRBJpYerfPiyXjaNfNH3KQD+ZEC48GjlgI
 0ek7wC2HHcwTIgOMmqGkhoq6/i1lme5dq07X39Xm9TyjLxaxIP7a/rQN4UlBb9F4EwEw
 8YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ba9RlsMQZXWIx36Z7u38zcXmSCVXQjEy1o7bWz6s8w=;
 b=x5P01yUpyJDUEiRwqTgolRyKi1Ewplix8Nzjt5+I5NZiXR/hJ3MVRLBdhQ2easNyfE
 loGmjoa45tt95Ah6kCv9dvP3BrmQWQSSBHZWQwTWoqV2idWTjc2OYS4Y1USXVJk8PZh6
 jrjqnFfI5NHOANUCakyAaX5ljOofzg2vce+EZQeuGPMVp/2nKGBBLeRVH5cLQiMT6gph
 eGQclcLZVulVdH5SY7kV0NKUp/NM1A5ILP0doCNoyFWGyK2j6g+/t9ySaSxogTSzICex
 XdOXKlDjUVwo61u94Yvhi84tx1oA4E6tEuF/lRig4/oq0ii16hkpZPbWc0AeDnPmi/nU
 1VAw==
X-Gm-Message-State: AOAM531dz8NO5kkq8OPAd8mrzg2gfJwBSJnMcYceQirF9rQfG2Gd8yAw
 r5R85CpCQOGdW30sts9EtA==
X-Google-Smtp-Source: ABdhPJxoDtoqqDlHuOkZKONoO7zzvmWFvWXx00E4kWjd9G64OYb3ea98eE0UH2enSRVwLWVdAFpW5Q==
X-Received: by 2002:a17:902:fe01:b0:15e:e178:e2e3 with SMTP id
 g1-20020a170902fe0100b0015ee178e2e3mr22853345plj.40.1652234134968; 
 Tue, 10 May 2022 18:55:34 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 f12-20020aa79d8c000000b0050dc76281f2sm207807pfq.204.2022.05.10.18.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 18:55:34 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: cs42l56: Fix the error handling of
 cs42l56_i2c_probe()
Date: Wed, 11 May 2022 09:55:14 +0800
Message-Id: <20220511015514.1777923-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510155410.GC38351@ediswmail.ad.cirrus.com>
References: <20220510155410.GC38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Zheyu Ma <zheyuma97@gmail.com>
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

The driver should goto label 'err_enable' when failing at regmap_read().

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
Changes in v2:
    - Fix the typo in the subject
---
 sound/soc/codecs/cs42l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 2c4e09b43199..dc23007336c5 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1245,7 +1245,7 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 	ret = regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
 	if (ret) {
 		dev_err(&i2c_client->dev, "Failed to read chip ID: %d\n", ret);
-		return ret;
+		goto err_enable;
 	}
 
 	devid = reg & CS42L56_CHIP_ID_MASK;
-- 
2.25.1

