Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD3473AB0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5051EE0;
	Tue, 14 Dec 2021 03:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5051EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448231;
	bh=lxAU7VGCnpr1v/qe6wfwLAdRvSE/Dndg9uHO+ubkWB8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=du11XwWM9iDNUuJoEsUqhhdvcvM2VsYTRcCm6HXcEzRoXV2CjRhCyB/b6p9PkODPo
	 S+L7K4CWITWilJf5abMq6jNreNrecquRARDuGBIY0kgNqiVJrvDoAnxTRyWpFFdHfJ
	 zhy5lzoWhAxuGOKfKHb05Gs80XfpUEXEnuXqAHKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0676F805D8;
	Tue, 14 Dec 2021 03:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A696EF805B2; Tue, 14 Dec 2021 03:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498C9F80558
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498C9F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f00kQMjN"
Received: by mail-pl1-x633.google.com with SMTP id u17so12498167plg.9
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bcdwNfmVIz+Zc7t7fhAOrKufC1ZzzEtCVOKmBYgFl/M=;
 b=f00kQMjNaZVLuKSPsaYz8XBW534TFLMV/YqZDz1slVt1ItEJr5cFzuwxsjINfXToT5
 5qxhSZZd/QcWGO5HcYmw2eyotf7+THVD856u8lcCuHWssYwlmeLrjFIOftmtqgRdPsPY
 JEBhzXCVe0oLLv+3rciRQ0w1SgeziC/iNquKCJa4R2m8QnAkzYSvDTNKX0viezjhPY4X
 JmvIK22+3anOBii1od1TJ4szN4mLUHRBeK22gLggnM2O3qqKcrlkHsp1gafewwQm8m3e
 QbHl3+buOV28k+ucQfy1wZ3757a7cZtY4mcoQvA2qLeaRs/YcCgkfDvYXBFdAW8yEL4/
 56Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bcdwNfmVIz+Zc7t7fhAOrKufC1ZzzEtCVOKmBYgFl/M=;
 b=ioml67shIdKyTrIqfwTkX+OkV9gzfhGZ+5252nhnXPbF4ZTHGpmL4M5xMCKNC1K/Yt
 8JQi3nOtCYe4wNRE9xdrgrbDI7TKvmFqeX1d2UxACL6un1u2KFB6dFzUIEFX34OR84Ch
 +1ujQMfJDs73itA5sRsG3bQ3M52I1JY1Ra1udFv8hOCQEMcA0YvpOFqFKn6Osh/hDDww
 9YS5AoV/RwfhZyV9EwtITQ3tKoKhzrD2oibPMxo2JlQ/wfVmIhtKY60MD4564gq0+hdC
 9ZuByJKDrlk/AiPJvD9ctobpidL1sN/X1NR4x/ZfeaHdFZx4Srf9BiXZhjM370cROqtD
 TXMg==
X-Gm-Message-State: AOAM5321f46XOI6zHQzl0Ak6OkCPTbnDqGb2Do0yYiC5nyGACSC/3oH3
 m06EPci5kcRRKOo5L2RwvW0=
X-Google-Smtp-Source: ABdhPJwlyQ85z871/DBjtVjY8mpJVS8oRcEkcWeOvT0xNX4qnkfZg8OnW4RHxUnG1JI3x7NfpNJEiA==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr2230080pjb.75.1639447792439; 
 Mon, 13 Dec 2021 18:09:52 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:52 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 21/22] ASoC: stm: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:42 +0900
Message-Id: <20211214020843.2225831-22-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_i2s.c     | 62 ++++++++++++-----------------------
 sound/soc/stm/stm32_sai.c     | 37 ++++++++-------------
 sound/soc/stm/stm32_sai_sub.c | 25 +++++---------
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++----------------
 4 files changed, 57 insertions(+), 111 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 24327cabd32a..ac5dff4d1677 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1045,36 +1045,24 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 
 	/* Get clocks */
 	i2s->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(i2s->pclk)) {
-		if (PTR_ERR(i2s->pclk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get pclk: %ld\n",
-				PTR_ERR(i2s->pclk));
-		return PTR_ERR(i2s->pclk);
-	}
+	if (IS_ERR(i2s->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->pclk),
+				     "Could not get pclk\n");
 
 	i2s->i2sclk = devm_clk_get(&pdev->dev, "i2sclk");
-	if (IS_ERR(i2s->i2sclk)) {
-		if (PTR_ERR(i2s->i2sclk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get i2sclk: %ld\n",
-				PTR_ERR(i2s->i2sclk));
-		return PTR_ERR(i2s->i2sclk);
-	}
+	if (IS_ERR(i2s->i2sclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->i2sclk),
+				     "Could not get i2sclk\n");
 
 	i2s->x8kclk = devm_clk_get(&pdev->dev, "x8k");
-	if (IS_ERR(i2s->x8kclk)) {
-		if (PTR_ERR(i2s->x8kclk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get x8k parent clock: %ld\n",
-				PTR_ERR(i2s->x8kclk));
-		return PTR_ERR(i2s->x8kclk);
-	}
+	if (IS_ERR(i2s->x8kclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->x8kclk),
+				     "Could not get x8k parent clock\n");
 
 	i2s->x11kclk = devm_clk_get(&pdev->dev, "x11k");
-	if (IS_ERR(i2s->x11kclk)) {
-		if (PTR_ERR(i2s->x11kclk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get x11k parent clock: %ld\n",
-				PTR_ERR(i2s->x11kclk));
-		return PTR_ERR(i2s->x11kclk);
-	}
+	if (IS_ERR(i2s->x11kclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->x11kclk),
+				     "Could not get x11k parent clock\n");
 
 	/* Register mclk provider if requested */
 	if (of_find_property(np, "#clock-cells", NULL)) {
@@ -1097,12 +1085,10 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 
 	/* Reset */
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(rst)) {
-		if (PTR_ERR(rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Reset controller error %ld\n",
-				PTR_ERR(rst));
-		return PTR_ERR(rst);
-	}
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "Reset controller error\n");
+
 	reset_control_assert(rst);
 	udelay(2);
 	reset_control_deassert(rst);
@@ -1145,21 +1131,15 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 	i2s->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "pclk",
 						i2s->base, i2s->regmap_conf);
-	if (IS_ERR(i2s->regmap)) {
-		if (PTR_ERR(i2s->regmap) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Regmap init error %ld\n",
-				PTR_ERR(i2s->regmap));
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
+				     "Regmap init error\n");
 
 	pm_runtime_enable(&pdev->dev);
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
 					 i2s->dai_drv, 1);
diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 058757c721f0..8e21e6f886fc 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -173,29 +173,20 @@ static int stm32_sai_probe(struct platform_device *pdev)
 
 	if (!STM_SAI_IS_F4(sai)) {
 		sai->pclk = devm_clk_get(&pdev->dev, "pclk");
-		if (IS_ERR(sai->pclk)) {
-			if (PTR_ERR(sai->pclk) != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "missing bus clock pclk: %ld\n",
-					PTR_ERR(sai->pclk));
-			return PTR_ERR(sai->pclk);
-		}
+		if (IS_ERR(sai->pclk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(sai->pclk),
+					     "missing bus clock pclk\n");
 	}
 
 	sai->clk_x8k = devm_clk_get(&pdev->dev, "x8k");
-	if (IS_ERR(sai->clk_x8k)) {
-		if (PTR_ERR(sai->clk_x8k) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "missing x8k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x8k));
-		return PTR_ERR(sai->clk_x8k);
-	}
+	if (IS_ERR(sai->clk_x8k))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sai->clk_x8k),
+				     "missing x8k parent clock\n");
 
 	sai->clk_x11k = devm_clk_get(&pdev->dev, "x11k");
-	if (IS_ERR(sai->clk_x11k)) {
-		if (PTR_ERR(sai->clk_x11k) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "missing x11k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x11k));
-		return PTR_ERR(sai->clk_x11k);
-	}
+	if (IS_ERR(sai->clk_x11k))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sai->clk_x11k),
+				     "missing x11k parent clock\n");
 
 	/* init irqs */
 	sai->irq = platform_get_irq(pdev, 0);
@@ -204,12 +195,10 @@ static int stm32_sai_probe(struct platform_device *pdev)
 
 	/* reset */
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(rst)) {
-		if (PTR_ERR(rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Reset controller error %ld\n",
-				PTR_ERR(rst));
-		return PTR_ERR(rst);
-	}
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "Reset controller error\n");
+
 	reset_control_assert(rst);
 	udelay(2);
 	reset_control_deassert(rst);
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 95cd38a502bb..dd636af81c9b 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1379,12 +1379,9 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 	 */
 	sai->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					    sai->regmap_config);
-	if (IS_ERR(sai->regmap)) {
-		if (PTR_ERR(sai->regmap) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Regmap init error %ld\n",
-				PTR_ERR(sai->regmap));
-		return PTR_ERR(sai->regmap);
-	}
+	if (IS_ERR(sai->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sai->regmap),
+				     "Regmap init error\n");
 
 	/* Get direction property */
 	if (of_property_match_string(np, "dma-names", "tx") >= 0) {
@@ -1472,12 +1469,9 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 
 	of_node_put(args.np);
 	sai->sai_ck = devm_clk_get(&pdev->dev, "sai_ck");
-	if (IS_ERR(sai->sai_ck)) {
-		if (PTR_ERR(sai->sai_ck) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Missing kernel clock sai_ck: %ld\n",
-				PTR_ERR(sai->sai_ck));
-		return PTR_ERR(sai->sai_ck);
-	}
+	if (IS_ERR(sai->sai_ck))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sai->sai_ck),
+				     "Missing kernel clock sai_ck\n");
 
 	ret = clk_prepare(sai->pdata->pclk);
 	if (ret < 0)
@@ -1551,11 +1545,8 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 		conf = &stm32_sai_pcm_config_spdif;
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not register pcm dma\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Could not register pcm dma\n");
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index a9ccdc2c5867..6f7882c4fe6a 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -406,12 +406,9 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 	int ret;
 
 	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
-	if (IS_ERR(spdifrx->ctrl_chan)) {
-		if (PTR_ERR(spdifrx->ctrl_chan) != -EPROBE_DEFER)
-			dev_err(dev, "dma_request_slave_channel error %ld\n",
-				PTR_ERR(spdifrx->ctrl_chan));
-		return PTR_ERR(spdifrx->ctrl_chan);
-	}
+	if (IS_ERR(spdifrx->ctrl_chan))
+		return dev_err_probe(dev, PTR_ERR(spdifrx->ctrl_chan),
+				     "dma_request_slave_channel error\n");
 
 	spdifrx->dmab = devm_kzalloc(dev, sizeof(struct snd_dma_buffer),
 				     GFP_KERNEL);
@@ -930,12 +927,9 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	spdifrx->phys_addr = res->start;
 
 	spdifrx->kclk = devm_clk_get(&pdev->dev, "kclk");
-	if (IS_ERR(spdifrx->kclk)) {
-		if (PTR_ERR(spdifrx->kclk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get kclk: %ld\n",
-				PTR_ERR(spdifrx->kclk));
-		return PTR_ERR(spdifrx->kclk);
-	}
+	if (IS_ERR(spdifrx->kclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(spdifrx->kclk),
+				     "Could not get kclk\n");
 
 	spdifrx->irq = platform_get_irq(pdev, 0);
 	if (spdifrx->irq < 0)
@@ -987,12 +981,9 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	spdifrx->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "kclk",
 						    spdifrx->base,
 						    spdifrx->regmap_conf);
-	if (IS_ERR(spdifrx->regmap)) {
-		if (PTR_ERR(spdifrx->regmap) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Regmap init error %ld\n",
-				PTR_ERR(spdifrx->regmap));
-		return PTR_ERR(spdifrx->regmap);
-	}
+	if (IS_ERR(spdifrx->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(spdifrx->regmap),
+				     "Regmap init error\n");
 
 	ret = devm_request_irq(&pdev->dev, spdifrx->irq, stm32_spdifrx_isr, 0,
 			       dev_name(&pdev->dev), spdifrx);
@@ -1002,12 +993,10 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	}
 
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(rst)) {
-		if (PTR_ERR(rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Reset controller error %ld\n",
-				PTR_ERR(rst));
-		return PTR_ERR(rst);
-	}
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "Reset controller error\n");
+
 	reset_control_assert(rst);
 	udelay(2);
 	reset_control_deassert(rst);
@@ -1016,11 +1005,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 
 	pcm_config = &stm32_spdifrx_pcm_config;
 	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
 
 	ret = snd_soc_register_component(&pdev->dev,
 					 &stm32_spdifrx_component,
-- 
2.25.1

