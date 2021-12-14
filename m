Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC1473AA9
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD0741AFE;
	Tue, 14 Dec 2021 03:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD0741AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448109;
	bh=6VCsq0zPRtndlyARduu6CGAoY4V9TBkprQN5VbC3dtM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDyt20yLgECms91+G+XYJWYZdZ8GNbP43/jgX7QxUEF6NobWbbfyOIQKpjsu1bUAE
	 kwk6jOFsSMrWQgFRoV3+oOFmmaDCY//I+ZeZ2zrHNZTDL5pnRZGXMFq3MkMWBzkBgz
	 FgQiu7CKYql23/FGg7rMuvMLZmQLsnnc61Vh1sDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6420CF8058C;
	Tue, 14 Dec 2021 03:10:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 053D2F8055B; Tue, 14 Dec 2021 03:09:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D0D2F8051B
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0D2F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XmOcDYld"
Received: by mail-pl1-x62c.google.com with SMTP id p18so12476046plf.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=01SNm5V6Ok+GPemak/uYh+NgF0ENZPJa+gfjvOiRKJk=;
 b=XmOcDYldtrKZFw9RUMgYWcoX1uSdplZj4y7C5eKtdLhaKgwBHlsXqTN0ZiQau7U0YV
 BCB+fgMIHBOkZemXMP/y6cEMyk9uIzwW50OxMqK2hTuJP5x9L0lBMRt/sVLE1fsqKhAg
 Z//JHN4SjJsxw1Mg2dVboWmahVJoBzVv0cB6YTotutkZoEIwDI/mp+fAccTJ0PFUno74
 KUa+r9VfBioOfm19okTNo1wZ2iL+bNkFCY8+Rqyw/tGTsHX31JUkzozL+gxFbZD/YIeO
 kaNO2HsKAs0bZUjzxcKpHZpJmXGBC51tRiJy8iVP2mWkQ1k5bqsWaDYZhznQNCjiZOgH
 7+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=01SNm5V6Ok+GPemak/uYh+NgF0ENZPJa+gfjvOiRKJk=;
 b=y2hEUnazyAYs1faTmungsuneYKDx+WLLdwqe3DYOcofaWLDdys2QwtUBsFyQ6A0d0M
 DxUuwdwtieQ+rzNNFZCd3HYNgobCo24z04S1EQid5Ez+J44bRUMjqFKjssdwnI6U9g3t
 HHzbWAdUyhHExmc0zM2dgG2aRjdl5lRcQW+O+7vXALabMNkAi8a5Cwpwzf5P48JDkh66
 zr6a+sRkUqZZrKzdX5keD/E/jRI76B7hMlHO6NaZheuC3fPJ0MmXXFet5UfzOp+wveJ3
 LgE7dmTGxVILUuBcjAK/jdLuCHlGORaaV2NqejyaBeQ93PaMMtlTU8Srk28dDe8L5L1D
 ewxw==
X-Gm-Message-State: AOAM530GTEQsierhW0MXGuVtP8JAyomUkWeSR/ffqDQRmyNX2+TjlF6w
 05/YVFCw5YTYO6CoO7CDM+8=
X-Google-Smtp-Source: ABdhPJwcQ3Tvt8xl03QbSarxcNhqe4OFtRxpcPul3p6pi0tS5O6vgna+6rojac2eOwiF3+SmjSZZAw==
X-Received: by 2002:a17:90a:1b67:: with SMTP id
 q94mr2234252pjq.119.1639447783938; 
 Mon, 13 Dec 2021 18:09:43 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:43 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 15/22] ASoC: img: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:36 +0900
Message-Id: <20211214020843.2225831-16-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/img/img-i2s-in.c             |  8 +++-----
 sound/soc/img/img-i2s-out.c            | 24 +++++++++---------------
 sound/soc/img/img-parallel-out.c       | 24 +++++++++---------------
 sound/soc/img/img-spdif-in.c           |  8 +++-----
 sound/soc/img/img-spdif-out.c          | 24 +++++++++---------------
 sound/soc/img/pistachio-internal-dac.c |  9 +++------
 6 files changed, 36 insertions(+), 61 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 1bf5d6edbd32..f1f36f15a503 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -451,11 +451,9 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	i2s->channel_base = base + (max_i2s_chan_pow_2 * 0x20);
 
 	i2s->clk_sys = devm_clk_get(dev, "sys");
-	if (IS_ERR(i2s->clk_sys)) {
-		if (PTR_ERR(i2s->clk_sys) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'sys'\n");
-		return PTR_ERR(i2s->clk_sys);
-	}
+	if (IS_ERR(i2s->clk_sys))
+		return dev_err_probe(dev, PTR_ERR(i2s->clk_sys),
+				     "Failed to acquire clock 'sys'\n");
 
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 4f90d36dc7df..28f48ca1508a 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -457,25 +457,19 @@ static int img_i2s_out_probe(struct platform_device *pdev)
 	i2s->channel_base = base + (max_i2s_chan_pow_2 * 0x20);
 
 	i2s->rst = devm_reset_control_get_exclusive(&pdev->dev, "rst");
-	if (IS_ERR(i2s->rst)) {
-		if (PTR_ERR(i2s->rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "No top level reset found\n");
-		return PTR_ERR(i2s->rst);
-	}
+	if (IS_ERR(i2s->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->rst),
+				     "No top level reset found\n");
 
 	i2s->clk_sys = devm_clk_get(&pdev->dev, "sys");
-	if (IS_ERR(i2s->clk_sys)) {
-		if (PTR_ERR(i2s->clk_sys) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'sys'\n");
-		return PTR_ERR(i2s->clk_sys);
-	}
+	if (IS_ERR(i2s->clk_sys))
+		return dev_err_probe(dev, PTR_ERR(i2s->clk_sys),
+				     "Failed to acquire clock 'sys'\n");
 
 	i2s->clk_ref = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(i2s->clk_ref)) {
-		if (PTR_ERR(i2s->clk_ref) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'ref'\n");
-		return PTR_ERR(i2s->clk_ref);
-	}
+	if (IS_ERR(i2s->clk_ref))
+		return dev_err_probe(dev, PTR_ERR(i2s->clk_ref),
+				     "Failed to acquire clock 'ref'\n");
 
 	i2s->suspend_ch_ctl = devm_kcalloc(dev,
 		i2s->max_i2s_chan, sizeof(*i2s->suspend_ch_ctl), GFP_KERNEL);
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index ce0f08d3777c..800f247283cd 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -229,25 +229,19 @@ static int img_prl_out_probe(struct platform_device *pdev)
 	prl->base = base;
 
 	prl->rst = devm_reset_control_get_exclusive(&pdev->dev, "rst");
-	if (IS_ERR(prl->rst)) {
-		if (PTR_ERR(prl->rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "No top level reset found\n");
-		return PTR_ERR(prl->rst);
-	}
+	if (IS_ERR(prl->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(prl->rst),
+				     "No top level reset found\n");
 
 	prl->clk_sys = devm_clk_get(&pdev->dev, "sys");
-	if (IS_ERR(prl->clk_sys)) {
-		if (PTR_ERR(prl->clk_sys) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'sys'\n");
-		return PTR_ERR(prl->clk_sys);
-	}
+	if (IS_ERR(prl->clk_sys))
+		return dev_err_probe(dev, PTR_ERR(prl->clk_sys),
+				     "Failed to acquire clock 'sys'\n");
 
 	prl->clk_ref = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(prl->clk_ref)) {
-		if (PTR_ERR(prl->clk_ref) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'ref'\n");
-		return PTR_ERR(prl->clk_ref);
-	}
+	if (IS_ERR(prl->clk_ref))
+		return dev_err_probe(dev, PTR_ERR(prl->clk_ref),
+				     "Failed to acquire clock 'ref'\n");
 
 	ret = clk_prepare_enable(prl->clk_sys);
 	if (ret)
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 6364eb742f6d..95914d0612fe 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -739,11 +739,9 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 	spdif->base = base;
 
 	spdif->clk_sys = devm_clk_get(dev, "sys");
-	if (IS_ERR(spdif->clk_sys)) {
-		if (PTR_ERR(spdif->clk_sys) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'sys'\n");
-		return PTR_ERR(spdif->clk_sys);
-	}
+	if (IS_ERR(spdif->clk_sys))
+		return dev_err_probe(dev, PTR_ERR(spdif->clk_sys),
+				     "Failed to acquire clock 'sys'\n");
 
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index 858e1b853820..c3189d9ff72f 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -342,25 +342,19 @@ static int img_spdif_out_probe(struct platform_device *pdev)
 	spdif->base = base;
 
 	spdif->rst = devm_reset_control_get_exclusive(&pdev->dev, "rst");
-	if (IS_ERR(spdif->rst)) {
-		if (PTR_ERR(spdif->rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "No top level reset found\n");
-		return PTR_ERR(spdif->rst);
-	}
+	if (IS_ERR(spdif->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(spdif->rst),
+				     "No top level reset found\n");
 
 	spdif->clk_sys = devm_clk_get(&pdev->dev, "sys");
-	if (IS_ERR(spdif->clk_sys)) {
-		if (PTR_ERR(spdif->clk_sys) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'sys'\n");
-		return PTR_ERR(spdif->clk_sys);
-	}
+	if (IS_ERR(spdif->clk_sys))
+		return dev_err_probe(dev, PTR_ERR(spdif->clk_sys),
+				     "Failed to acquire clock 'sys'\n");
 
 	spdif->clk_ref = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(spdif->clk_ref)) {
-		if (PTR_ERR(spdif->clk_ref) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to acquire clock 'ref'\n");
-		return PTR_ERR(spdif->clk_ref);
-	}
+	if (IS_ERR(spdif->clk_ref))
+		return dev_err_probe(dev, PTR_ERR(spdif->clk_ref),
+				     "Failed to acquire clock 'ref'\n");
 
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
diff --git a/sound/soc/img/pistachio-internal-dac.c b/sound/soc/img/pistachio-internal-dac.c
index fe181c2e51d6..802c0ee63aa2 100644
--- a/sound/soc/img/pistachio-internal-dac.c
+++ b/sound/soc/img/pistachio-internal-dac.c
@@ -161,12 +161,9 @@ static int pistachio_internal_dac_probe(struct platform_device *pdev)
 		return PTR_ERR(dac->regmap);
 
 	dac->supply = devm_regulator_get(dev, "VDD");
-	if (IS_ERR(dac->supply)) {
-		ret = PTR_ERR(dac->supply);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to acquire supply 'VDD-supply': %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dac->supply))
+		return dev_err_probe(dev, PTR_ERR(dac->supply),
+				     "failed to acquire supply 'VDD-supply'\n");
 
 	ret = regulator_enable(dac->supply);
 	if (ret) {
-- 
2.25.1

