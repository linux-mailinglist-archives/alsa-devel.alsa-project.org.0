Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1637B2FC5E5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A673F18E3;
	Wed, 20 Jan 2021 01:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A673F18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611102951;
	bh=GcwtOtZ7PMrrwaXGrYjQd8wAXMcnNKD1acPSllTy2U4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKRp3xyiUlVA488C9pBwVTBDgQsVHdBdKZ4Z97KWmrUUsRBa2gm9Ace5f4abEwCOY
	 Ss0Zr9ViSYMIKORjLd+QBvuzwmC97hVZAFHBzhbYf/rG//S3bY/0XXnRn8o442iese
	 twdetfb5CS3DPBuSMq60ZYaPr0ICGgljFWCfeR3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABA4F804F3;
	Wed, 20 Jan 2021 01:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE5D3F804D8; Wed, 20 Jan 2021 01:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA201F8029B
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA201F8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bNI7tICp"
Received: by mail-lf1-x132.google.com with SMTP id u25so31756210lfc.2
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BkfpoZ2DBwSy/7t/sBd6cTgmevAql8zxb6PjlBGFGSg=;
 b=bNI7tICpC2sSxM+jFdetoek/0rllgf412sOwXeAK52dua6iYcRfrnCuidmz/E8ImyA
 fzN1emYj1lXszYgyRzRxm4glcj6nWI5YQxfdwO4MTti4iNG7w4VrULdM6uW+4GFmJeGy
 PubOftElxQhjan5XtAC1GMAb0bZMBqxBd3f3O6bTKBrkThnDH0GNyCGQSXw87t/99XUU
 1acn1BmhM6vD1I2Iv1p5NIJabRU3FyLq3pcEdAe316roNwD2cDvUFUii0EUxTQExSVqr
 I4tbhJx3dbc0Dg46Uneew7hSGWDa6DlRDKRBW9FvxgX4EEwa4aGJv37ZpEVwFSrXPLZp
 gStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BkfpoZ2DBwSy/7t/sBd6cTgmevAql8zxb6PjlBGFGSg=;
 b=DA6A+TDq3yLBKCtRUgIEmHeUOVQX2Z3WU2DFo4VRvc4VDS5l6FrDYHZCMYvNrxLPvk
 fF0hXjFh2gp4mIbyEj/7vWrkJiZTgs0E7qFB4u6Fn185eWPmSAR5itHRZ41q6ZPDqVxi
 KST3HWplHMgjz7OUWi1zlRgL1/V5Mjh8BjK/tTXaYjIimRRbVCnqKO5oLe02fp4Dw4ql
 7maPaauNn5iJOdoinkismbiOnrfie/gbRjL1DM8zYTUZhQnQWY1Lav91WmEDZwP4nyNZ
 1c4CZEf4q26lh+HB2+a8LHYHCfPaz2Y+xEhv+9WNpACEZOh5OHhEBugrHUR2VKWzaOUx
 QS3w==
X-Gm-Message-State: AOAM531E41D8uPIV9fgV3Vz+wy4EYdUL2O6solaevbs9Og3DBlXkER82
 oHVPSJbMfp6n9Ql0OGlnpJs=
X-Google-Smtp-Source: ABdhPJyTAco6YeHEkpZ58zIIIX/ydrEE4NFxobStGLQQuhnnjM6HsFJjK7DUyqXmg2Av2KKLSlPQ9g==
X-Received: by 2002:ac2:4d56:: with SMTP id 22mr2948792lfp.15.1611102727477;
 Tue, 19 Jan 2021 16:32:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:32:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Matt Merhar <mattmerhar@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 5/6] ASoC: tegra: ahub: Use clk_bulk helpers
Date: Wed, 20 Jan 2021 03:31:53 +0300
Message-Id: <20210120003154.26749-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Use clk_bulk helpers to make code cleaner.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Tested-by: Dmitry Osipenko <digetx@gmail.com> # Nexus7 T30 audio works
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 30 +++++++-----------------------
 sound/soc/tegra/tegra30_ahub.h |  4 ++--
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 8c32333cc08c..12ca8e3ca4f6 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -45,8 +45,7 @@ static int tegra30_ahub_runtime_suspend(struct device *dev)
 	regcache_cache_only(ahub->regmap_apbif, true);
 	regcache_cache_only(ahub->regmap_ahub, true);
 
-	clk_disable_unprepare(ahub->clk_apbif);
-	clk_disable_unprepare(ahub->clk_d_audio);
+	clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
 
 	return 0;
 }
@@ -66,17 +65,9 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
-	ret = clk_prepare_enable(ahub->clk_d_audio);
-	if (ret) {
-		dev_err(dev, "clk_enable d_audio failed: %d\n", ret);
+	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
+	if (ret)
 		return ret;
-	}
-	ret = clk_prepare_enable(ahub->clk_apbif);
-	if (ret) {
-		dev_err(dev, "clk_enable apbif failed: %d\n", ret);
-		clk_disable(ahub->clk_d_audio);
-		return ret;
-	}
 
 	regcache_cache_only(ahub->regmap_apbif, false);
 	regcache_cache_only(ahub->regmap_ahub, false);
@@ -559,19 +550,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	ahub->soc_data = soc_data;
 	ahub->dev = &pdev->dev;
 
-	ahub->clk_d_audio = devm_clk_get(&pdev->dev, "d_audio");
-	if (IS_ERR(ahub->clk_d_audio)) {
-		dev_err(&pdev->dev, "Can't retrieve ahub d_audio clock\n");
-		ret = PTR_ERR(ahub->clk_d_audio);
-		return ret;
-	}
+	ahub->clocks[ahub->nclocks++].id = "apbif";
+	ahub->clocks[ahub->nclocks++].id = "d_audio";
 
-	ahub->clk_apbif = devm_clk_get(&pdev->dev, "apbif");
-	if (IS_ERR(ahub->clk_apbif)) {
-		dev_err(&pdev->dev, "Can't retrieve ahub apbif clock\n");
-		ret = PTR_ERR(ahub->clk_apbif);
+	ret = devm_clk_bulk_get(&pdev->dev, ahub->nclocks, ahub->clocks);
+	if (ret)
 		return ret;
-	}
 
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 6889c5f23d02..01480d7dc940 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -511,8 +511,8 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
-	struct clk *clk_d_audio;
-	struct clk *clk_apbif;
+	struct clk_bulk_data clocks[2];
+	unsigned int nclocks;
 	resource_size_t apbif_addr;
 	struct regmap *regmap_apbif;
 	struct regmap *regmap_ahub;
-- 
2.29.2

