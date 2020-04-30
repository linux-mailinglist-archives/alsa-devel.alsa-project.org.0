Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC01BF2B1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 10:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302441686;
	Thu, 30 Apr 2020 10:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302441686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588235123;
	bh=Qhgi/O2t7nXOvs/vJBWw84dWIwgdVMXWLzFLsb3k2xI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tRA1CYz0Mx9eYZUilps6uGfa10OeukYoxfAyOAhZkIKOD1oEwS0wo7HjmYJnmG841
	 nNZdJtWyilXPuUpmWL08hJNz7rO2AD+AM6eteM2NMyHTbp1aNnmBZslV5zntI2uPpL
	 b1S/gy+xvBKoi7bzTntA33dvlhofZLCnbpVXd7XU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67914F8028D;
	Thu, 30 Apr 2020 10:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C81E1F8028C; Thu, 30 Apr 2020 10:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75108F80266
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 10:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75108F80266
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="YKkY+vnr"
Received: by mail-yb1-xb49.google.com with SMTP id g17so6900246ybk.4
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=+QbyXCMWScEYIowgLIK0JS5woGAQrFK1EDiEHL1sfVo=;
 b=YKkY+vnrVL9zifogmdXZsTvj2bpRTN8p5ZwHlErBPit7rjaJM9RL9rrt5c8Uv2W5RZ
 nJsGPZDCuBy+6t9Vn8dXrzBP6re6oXEBD4aG84v768xtJrO5xaBKtipWCO0xKdhHgwJM
 5R2luF5LBu5ilU6eJg/fKay+z9WU4uDkvivHhM5eCxgdYVSbGaa4lrrKQs4OcXn9AQxR
 WJisMFp4tErDjrXP2qyH4weY90G9NazBtoiVGrjpSbmFs4OXYlvW+B12GJGB21+r5VOw
 siwp0qNtws194KUcHnLFTgXONa4Y1+8SIT8a0JedKrG7CArolgmmVxNq0Q0dIAl2GuYF
 S98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+QbyXCMWScEYIowgLIK0JS5woGAQrFK1EDiEHL1sfVo=;
 b=Zwrg4VNlpZZA1aXElDCSQ5RFAahYvz8aZjf5VJtvF6j9uBpmYjaqZ1oqVW/iiph1ol
 Ry//Jl5j4vsBgTpOTH8r7b4VjosjdLyQeE3xzKPGPAT6HP6Hd0GP+398Cx5rrsXcBSs1
 acPUntKDARV29D+hVyXGVij53Gz6sPKpelV4nNjAZ84bRMjgkVD1RJF8ilkGw8C48U0K
 qIgfDrhV80ekOgwqecdV6+Ea+Wit7lsb7faxWxoJlOB6EcL1hoFXLqt26p27jwQo0bt3
 WBUe1/rFTOpGCTLSeT5xWqPyEEZ/TzGMFKFlkDfXOsVgJEaGz0e2Ejes7+bAAdz+yG3O
 z3tg==
X-Gm-Message-State: AGi0PuYHi+DkRJ6qYHdue6yXLyc5UcMUDibjgrt5Fz/1xbx6MVIAr80x
 0ZpOb/CQ08Lfe9hdTNgF5ky/FS3lJRPl
X-Google-Smtp-Source: APiQypKkhnbTgkEYC+UYLolSafCNnS1VpVTxc5dEYk4OdTqs2mOC42YyORcQ7Y1wxXX/3szlPxHYQe5u6MaW
X-Received: by 2002:a25:6404:: with SMTP id y4mr4039202ybb.374.1588234963414; 
 Thu, 30 Apr 2020 01:22:43 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:22:26 +0800
In-Reply-To: <20200430082231.151127-1-tzungbi@google.com>
Message-Id: <20200430082231.151127-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200430082231.151127-1-tzungbi@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 1/6] ASoC: rt5682: simplify assertions
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

Simplifies assertions for errors.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt5682.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d36f560ad7a8..e542aab46619 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3462,7 +3462,7 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
 				    ARRAY_SIZE(patch_list));
-	if (ret != 0)
+	if (ret)
 		dev_warn(dev, "Failed to apply regmap patch: %d\n", ret);
 
 	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
@@ -3536,8 +3536,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 
 	rt5682 = devm_kzalloc(&i2c->dev, sizeof(struct rt5682_priv),
 		GFP_KERNEL);
-
-	if (rt5682 == NULL)
+	if (!rt5682)
 		return -ENOMEM;
 
 	i2c_set_clientdata(i2c, rt5682);
@@ -3562,14 +3561,14 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 
 	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(rt5682->supplies),
 				      rt5682->supplies);
-	if (ret != 0) {
+	if (ret) {
 		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
 		return ret;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(rt5682->supplies),
 				    rt5682->supplies);
-	if (ret != 0) {
+	if (ret) {
 		dev_err(&i2c->dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
@@ -3599,7 +3598,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 
 	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
 				    ARRAY_SIZE(patch_list));
-	if (ret != 0)
+	if (ret)
 		dev_warn(&i2c->dev, "Failed to apply regmap patch: %d\n", ret);
 
 	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
-- 
2.26.2.303.gf8c07b1a785-goog

