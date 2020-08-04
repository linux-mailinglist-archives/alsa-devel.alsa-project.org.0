Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8323B190
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 02:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC591676;
	Tue,  4 Aug 2020 02:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC591676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596499753;
	bh=7v+C0Tq6jHojhPVXEd2eOjPd6q3hapJ/jP0S1mJ6RnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogEWsstKBarGFeRCybR4QfQbvxrJMAYkfLEQdih/veQ93knMU6rtIOYlkokl9gRTI
	 xshrIU824qDHR6GLIUD8ANjvzmLZbAuiRIB1o9TB1mJ80bYG5DbN2C2SL4lNBUr2PL
	 U3ZTDCqXrnZVJN1Fw7/dmkvP/hOSo88EfF4lPDPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67813F802E2;
	Tue,  4 Aug 2020 02:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA486F802D2; Tue,  4 Aug 2020 02:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC813F800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 02:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC813F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kSXUbVgM"
Received: by mail-pj1-x1044.google.com with SMTP id f9so1014326pju.4
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 17:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYxlPxktLYpTU+ajRvocUmvWDtHWUPhy8uwzwzVSk3I=;
 b=kSXUbVgMYfHIPmXvbDKDf53m5ed9n1Gm6wnE6Vy5a4s1jaI4+9yrAkwN4xh9jxDUCj
 WQlzPLz+ANy+WsdXd6S24HWI0jcEtM+EQeiagJNqQZZIftIkdToSDqBWVkXMifVxXbvd
 gxYItY//3bUQS8cwCayYMupFA/eJoX86S2fbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XYxlPxktLYpTU+ajRvocUmvWDtHWUPhy8uwzwzVSk3I=;
 b=ObaWtv1svs+PjMyAToxOnj+OB4Uzm7r2NIu2OMT4a8xOlpILYHs0vqT78pi0XKJdlK
 HYoE90cTQHEBvjyBZ4mhHAeDKTjrZyzUR4e9bEFGLUHlwpKPFHQYHGnN1ksOKb5uum8x
 mMOMfbbQYS9EqQFVwtsvOaq2ePpdIfedYH9huvfnm3kzUhJbL2180YpDFNpkE8YUgMdj
 2YOdoxC42uyLZFjUROQxRyOnaBciuACHoXDzGEdR46zJLpRoVA0iiVOOAPP3PWrQM2Wf
 q4y3gjN7LH26VFFPPb03lupKZKFYz+BmcIvgFzHkIegv8OqXPB1uThSVgDkPTHG/Nh87
 31Zg==
X-Gm-Message-State: AOAM531FL2M3YixXU9JkocN6nscdHvqj7aR7Yhh1zg6LkqTOF2keunpe
 5iCjyiM8VaXNFvVArYzDNKGbPg==
X-Google-Smtp-Source: ABdhPJy0Kl39KCvp6CQkcZipctw4cxaao9j76i19pk33xNx5VtGJDatjpizlaD3AgEZ9rDJKr/SibQ==
X-Received: by 2002:a17:90a:33e8:: with SMTP id
 n95mr1683693pjb.183.1596499535212; 
 Mon, 03 Aug 2020 17:05:35 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e28sm12332756pfl.124.2020.08.03.17.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:05:34 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 3/3] ASoC: rt5682: Use clk_hw based APIs for registration
Date: Mon,  3 Aug 2020 17:05:31 -0700
Message-Id: <20200804000531.920688-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200804000531.920688-1-swboyd@chromium.org>
References: <20200804000531.920688-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Shuming Fan <shumingf@realtek.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

The (new?) style of clk registration uses clk_hw based APIs so that we
can more easily see the difference between clk providers and clk
consumers. Use the clk_hw based APIs to do this and migrate to devm for
the clkdev creation so that we can reduce the amount of code.

Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/codecs/rt5682.c | 47 +++++++++------------------------------
 sound/soc/codecs/rt5682.h |  2 --
 2 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d8a1973a4624..bfb26fec7137 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2755,8 +2755,6 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
 	struct device *dev = component->dev;
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct rt5682_platform_data *pdata = &rt5682->pdata;
-	struct clk *dai_clk;
-	struct clk_lookup *dai_clk_lookup;
 	struct clk_hw *dai_clk_hw;
 	int i, ret;
 
@@ -2784,8 +2782,7 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
 			break;
 		default:
 			dev_err(dev, "Invalid clock index\n");
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		init.name = pdata->dai_clk_names[i];
@@ -2793,39 +2790,26 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
 		init.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_GATE;
 		dai_clk_hw->init = &init;
 
-		dai_clk = devm_clk_register(dev, dai_clk_hw);
-		if (IS_ERR(dai_clk)) {
-			dev_warn(dev, "Failed to register %s: %ld\n",
-				 init.name, PTR_ERR(dai_clk));
-			ret = PTR_ERR(dai_clk);
-			goto err;
+		ret = devm_clk_hw_register(dev, dai_clk_hw);
+		if (ret) {
+			dev_warn(dev, "Failed to register %s: %d\n",
+				 init.name, ret);
+			return ret;
 		}
-		rt5682->dai_clks[i] = dai_clk;
 
 		if (dev->of_node) {
 			devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
 						    dai_clk_hw);
 		} else {
-			dai_clk_lookup = clkdev_create(dai_clk, init.name,
-						       "%s", dev_name(dev));
-			if (!dai_clk_lookup) {
-				ret = -ENOMEM;
-				goto err;
-			} else {
-				rt5682->dai_clks_lookup[i] = dai_clk_lookup;
-			}
+			ret = devm_clk_hw_register_clkdev(dev, dai_clk_hw,
+							  init.name,
+							  dev_name(dev));
+			if (ret)
+				return ret;
 		}
 	}
 
 	return 0;
-
-err:
-	do {
-		if (rt5682->dai_clks_lookup[i])
-			clkdev_drop(rt5682->dai_clks_lookup[i]);
-	} while (i-- > 0);
-
-	return ret;
 }
 #endif /* CONFIG_COMMON_CLK */
 
@@ -2882,15 +2866,6 @@ static void rt5682_remove(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
-#ifdef CONFIG_COMMON_CLK
-	int i;
-
-	for (i = RT5682_DAI_NUM_CLKS - 1; i >= 0; --i) {
-		if (rt5682->dai_clks_lookup[i])
-			clkdev_drop(rt5682->dai_clks_lookup[i]);
-	}
-#endif
-
 	rt5682_reset(rt5682);
 }
 
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 6d94327beae5..354acd735ef4 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1411,8 +1411,6 @@ struct rt5682_priv {
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[RT5682_DAI_NUM_CLKS];
-	struct clk_lookup *dai_clks_lookup[RT5682_DAI_NUM_CLKS];
-	struct clk *dai_clks[RT5682_DAI_NUM_CLKS];
 	struct clk *mclk;
 #endif
 
-- 
Sent by a computer, using git, on the internet

