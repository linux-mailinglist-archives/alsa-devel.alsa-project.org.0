Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05753366A70
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 14:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A441699;
	Wed, 21 Apr 2021 14:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A441699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619006888;
	bh=C33DTRE2PxEosLBmz9kVsY2VAAlAu8loX1FZONKfnIU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JyfPbOOhcVG+XSx0gCQ8hrLY7KoR6FdAfS6gqTzU2cyCmsXqImvzQ1aq06+fGes7i
	 mXhVxT9bKUDwqsSKC6EwIjdGMCqhoChn5SLJITOeUpx1zgtC+V/OpYrBVqJBtn4574
	 qcfH67hTHg9lfU48sxL8iki2SgT4YBgMAMRQS6Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBB4F80425;
	Wed, 21 Apr 2021 14:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCA93F802C4; Wed, 21 Apr 2021 14:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346BAF8025A
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 14:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346BAF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tMGUqLts"
Received: by mail-ej1-x62b.google.com with SMTP id x12so42376586ejc.1
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4saZG/mBOFusi/3PnhTOED3xRGrc2E/DVPqnSP5N1B4=;
 b=tMGUqLts//zB8lVUZgdr7LIydq5ZvwLd5wA32lz8Yo+EJbTv8+Cr7Dfr7hG/1UatVP
 XGWHgeupRgOA2jANdmYFSgsNqZvTwYYu1R8pPvZBPsqfYZB7+uu7PymmaAxVUvuspXwQ
 yNLwj2lyMNyIvnKlYpR8yOZKqGvRg+QoBA9EZY6kg0ewtjCX5pgFWYEI+qc8hVnTldcG
 IRSomtgfm36I9+ccZVfUX/mNRRDS5hp84jbCl0KotEgiZ8mTqaon154bQ7ZoCneaZ1dR
 h2OSF45ajUGGoQlr2ooa1OkkFez8BwdBoZygjy0A+NpkryfDRtUleThg9eD48mL9+EsF
 flOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4saZG/mBOFusi/3PnhTOED3xRGrc2E/DVPqnSP5N1B4=;
 b=RVdlCdFXX85dzLfSLjZrPFGeLZJm/mlJ4iE8ZVIZttQiOIlvkAc4ofoS9pZrcQ6bA+
 G/UG/Up76mA4/bofTNBgfjKkafzPCFYs6MV/aoXAufjI99jA1xWT2AWpKLUUWl/qZxi9
 87QGxIA0egibQchUtOwOmrVwCcru8r6U8nlQTQg8OSp8qXhL3jw6x0lT3CwJz4J3icWr
 va0MOKP9+VAH5HfzMLKD6dpZT85rSJasqAOPlzxe6uNgcHiuMk1W+hTme6SoNEUc5L2/
 BQ0bycV7/FsFql7oX0TfjZr+F7VbQvICJEjq0lNTSI92cPENtb4syin/3elx9w5U+YcP
 JVTQ==
X-Gm-Message-State: AOAM530xAle1Ijp60I8y/lYAsAD+Rx1RDaLu9XMrZdT95byzMaV6ihzJ
 LM0RIPq7qVNSl599tA0ktUcHBQ==
X-Google-Smtp-Source: ABdhPJxwGk9Wjg5LehSvoZoZIWOwfhhtktCyjSV7rPgIolUcHr7yn1CofvWtPlVgcxdCTTfMWNbVVA==
X-Received: by 2002:a17:906:1c83:: with SMTP id
 g3mr12999618ejh.93.1619006739977; 
 Wed, 21 Apr 2021 05:05:39 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n2sm3151431edi.32.2021.04.21.05.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:05:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 4/5] ASoC: lpass: use the clock provider API
Date: Wed, 21 Apr 2021 14:05:11 +0200
Message-Id: <20210421120512.413057-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421120512.413057-1-jbrunet@baylibre.com>
References: <20210421120512.413057-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Clock providers should be registered using the clk_hw API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/lpass-va-macro.c  |  7 ++-----
 sound/soc/codecs/lpass-wsa-macro.c | 11 +++--------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 5294c57b2cd4..56c93f4465c9 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1343,7 +1343,7 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
 	if (ret)
 		return ret;
 
-	return of_clk_add_provider(np, of_clk_src_simple_get, va->hw.clk);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &va->hw);
 }
 
 static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
@@ -1452,12 +1452,10 @@ static int va_macro_probe(struct platform_device *pdev)
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
 	if (ret)
-		goto soc_err;
+		goto err;
 
 	return ret;
 
-soc_err:
-	of_clk_del_provider(pdev->dev.of_node);
 err:
 	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
 
@@ -1468,7 +1466,6 @@ static int va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	of_clk_del_provider(pdev->dev.of_node);
 	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
 
 	return 0;
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e79a70386b4b..1a7fa5492f28 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2337,10 +2337,9 @@ static const struct clk_ops swclk_gate_ops = {
 	.recalc_rate = swclk_recalc_rate,
 };
 
-static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
+static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 {
 	struct device *dev = wsa->dev;
-	struct device_node *np = dev->of_node;
 	const char *parent_clk_name;
 	const char *clk_name = "mclk";
 	struct clk_hw *hw;
@@ -2358,11 +2357,9 @@ static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	hw = &wsa->hw;
 	ret = clk_hw_register(wsa->dev, hw);
 	if (ret)
-		return ERR_PTR(ret);
-
-	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+		return ret;
 
-	return NULL;
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
 
 static const struct snd_soc_component_driver wsa_macro_component_drv = {
@@ -2438,8 +2435,6 @@ static int wsa_macro_remove(struct platform_device *pdev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
 
-	of_clk_del_provider(pdev->dev.of_node);
-
 	clk_bulk_disable_unprepare(WSA_NUM_CLKS_MAX, wsa->clks);
 
 	return 0;
-- 
2.31.1

