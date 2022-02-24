Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D74C2AAF
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0453F1811;
	Thu, 24 Feb 2022 12:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0453F1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701549;
	bh=weJYzImlb8PYqxKjpCG0T3WpHF3vng06j6VcZzOxVc8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/PnbH/UjTyvbwltV55/Zb75YeiG9S4bmAnlemkOz9lwDOgNiu3OIQ/rldGyEKxeO
	 0lazpImT0RqRf/eQxZ9cUkFxAqoZulYTnQIo6XDBtEA+0beG7XRIZCWOpuCO9Tsj3g
	 vTWrPYsBXhwLrBi+Q9XHlIGaZuuQCWZLOBMWnois=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39ABBF80511;
	Thu, 24 Feb 2022 12:17:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F06C6F800B6; Thu, 24 Feb 2022 12:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C29ECF800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C29ECF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="himXMgwq"
Received: by mail-wr1-x42e.google.com with SMTP id b5so1474928wrr.2
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceUQI8pUhjwWr7cwe8PfSIpA4DyG+G2Rz7beXile+P0=;
 b=himXMgwqxUWpRMrFbC97dlxMwb1qkLSvrgWmiX0R+wVTPDdmvC0ZMKzn5lLCPKOeXL
 fjcncNVLW9vUQpZy24Zu8rY2s0sc+Qt8JhEF9bMaMJV9rdVk9ha0qZOaL4v84ItkAg1m
 PBUjNz51VnrHBZpvsf0ZsT60sZeEyP/XG9woWpL9zXF+tARotwNUZKL+LcKUbTO0E6Hr
 vv/D0XM4U7yvkJ7+GkIvoYepaSPKvR5jFVZxDd8Fp4NhPn9mgOB/dLf6S6w2fpkMv0WZ
 2efScThgcgILM861QEvBNEFjGXUo37ZknHn/CbTHNs1KT1fyKGuFVrgoR5LHN58tFZbQ
 fq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceUQI8pUhjwWr7cwe8PfSIpA4DyG+G2Rz7beXile+P0=;
 b=nfaftfDuAJlic/xXHd5ymu1kpxg92F+vqAxtkCkjlr9G5/2w7v4dWp0rPOia+KwHpc
 XFE7XkoR7zhph+KA/bzwmCGaWpm2X7ofrvVoVQdAzDIKg9vsmyr8BgwJld8wny3RF2H3
 eDgpUVMA9vi3ssyQVjkAAOqBJwAtObWVXzvsgPjnL+krdgS5jy8XSBmw2iZlOWm7prdg
 9eozr5FoXZolNPePu5mkh9+a73i0aHz07UYr6jNAXPBOKG2FYR3PzCFaeyDz31xiqYQi
 ViqSCzo3dRu0ohbJJekvRfZmeYniED89w4OwnK0WCze0rpWslMqX9ZEYtNJMegicO4M0
 BIOw==
X-Gm-Message-State: AOAM532HRSF7n1wJB8awqV/zR3MZpVlum7uvmXrK4hD8L1OiEJvazOH/
 8QJ7dK8usUnnkI5tzBGief+yjA==
X-Google-Smtp-Source: ABdhPJyF9hlhdYn3QgLA1hMGpxlSnPQtvk5TT0UYfuCo7gdjJ6fCLnBsBQreeycYv1PvBEnz4lzOTg==
X-Received: by 2002:a5d:6108:0:b0:1e3:3a73:d34a with SMTP id
 v8-20020a5d6108000000b001e33a73d34amr1819381wrt.290.1645701443219; 
 Thu, 24 Feb 2022 03:17:23 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 01/16] ASoC: codecs: va-macro: move to individual clks from
 bulk
Date: Thu, 24 Feb 2022 11:17:03 +0000
Message-Id: <20220224111718.6264-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Using bulk clocks and referencing them individually using array index is
not great for readers.
So move them to individual clocks handling and also remove some unnecessary
error handling in the code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 65 ++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index e14c277e6a8b..ff8120886eca 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -193,7 +193,9 @@ struct va_macro {
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *macro;
+	struct clk *dcodec;
 	struct clk_hw hw;
 
 	s32 dmic_0_1_clk_cnt;
@@ -1321,7 +1323,7 @@ static const struct clk_ops fsgen_gate_ops = {
 
 static int va_macro_register_fsgen_output(struct va_macro *va)
 {
-	struct clk *parent = va->clks[2].clk;
+	struct clk *parent = va->mclk;
 	struct device *dev = va->dev;
 	struct device_node *np = dev->of_node;
 	const char *parent_clk_name;
@@ -1404,15 +1406,18 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
-	va->clks[0].id = "macro";
-	va->clks[1].id = "dcodec";
-	va->clks[2].id = "mclk";
 
-	ret = devm_clk_bulk_get_optional(dev, VA_NUM_CLKS_MAX, va->clks);
-	if (ret) {
-		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
-		return ret;
-	}
+	va->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(va->macro))
+		return PTR_ERR(va->macro);
+
+	va->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(va->dcodec))
+		return PTR_ERR(va->dcodec);
+
+	va->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(va->mclk))
+		return PTR_ERR(va->mclk);
 
 	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
 				   &sample_rate);
@@ -1425,12 +1430,6 @@ static int va_macro_probe(struct platform_device *pdev)
 			return -EINVAL;
 	}
 
-	/* mclk rate */
-	clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
-	ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
-	if (ret)
-		return ret;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
@@ -1444,21 +1443,41 @@ static int va_macro_probe(struct platform_device *pdev)
 	}
 
 	dev_set_drvdata(dev, va);
-	ret = va_macro_register_fsgen_output(va);
+
+	/* mclk rate */
+	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+
+	ret = clk_prepare_enable(va->macro);
 	if (ret)
 		goto err;
 
+	ret = clk_prepare_enable(va->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(va->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = va_macro_register_fsgen_output(va);
+	if (ret)
+		goto err_clkout;
+
 	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
 	if (ret)
-		goto err;
+		goto err_clkout;
 
-	return ret;
+	return 0;
 
+err_clkout:
+	clk_disable_unprepare(va->mclk);
+err_mclk:
+	clk_disable_unprepare(va->dcodec);
+err_dcodec:
+	clk_disable_unprepare(va->macro);
 err:
-	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
-
 	return ret;
 }
 
@@ -1466,7 +1485,9 @@ static int va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
+	clk_disable_unprepare(va->mclk);
+	clk_disable_unprepare(va->dcodec);
+	clk_disable_unprepare(va->macro);
 
 	return 0;
 }
-- 
2.21.0

