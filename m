Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFF33A5C5
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:51:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB7517A3;
	Sun, 14 Mar 2021 16:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB7517A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737068;
	bh=o9/2WZdCaUa+QkYNEcg0Icl0y2lZcjRJFyiT8bFS5aM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFLPAjZH3ScLc88Mkd29cBCdlJxIrYjN2mRZ/A+0Iy7nx50ZbLGSTaegYRRV3Nd6x
	 xp+5PodtE1XJm4gxETedRP975B33QSsHiSVV4b4nQQthZUg0FhBnjDDSO2NJOpamPZ
	 wwhKb43bDuulj/1o0Bw9MJdfpV0wLuKQGT+/BDew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C95F804FC;
	Sun, 14 Mar 2021 16:45:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62596F804E4; Sun, 14 Mar 2021 16:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85EF1F8026A
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85EF1F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TUB6ZqWK"
Received: by mail-wm1-x332.google.com with SMTP id l19so6689589wmh.1
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Po6yTPVbMrwXaB6ZlYM0aFdBrruf9pmKm6CRlvbqNmk=;
 b=TUB6ZqWKBf+vvC1EIslpgdFrBDvkkdqcaNjKoddwfk/Z9korua/YsHDelq9B0vAIVh
 e0KVXvCDTzkmH4JDFR+33V6hXGqF5rXQ0wT3EdLacm58cBVZi+hMeMWPmW4aSNm2Ka7r
 DF35QArb4r07vGxrk0JT9JzPNLshYDnPl0akdxz17EZWguwdNpHzUHDEXikilDqHyP7g
 5vir1R2BSLApYX292BaXt2ah9bmtNwquLNxHrILvqPlB9hxd8pFCK5kRjrOyuNV5to7c
 C9ffX9oo1LkxzgXGmsLmeXrOLf7tfaPtr1q38PkzNK3AqVMPUxcnh9wi9fnzhUCDfXED
 Tz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Po6yTPVbMrwXaB6ZlYM0aFdBrruf9pmKm6CRlvbqNmk=;
 b=IpmULaRe1fGbKpxs5zKjyRRyFwUs7UsflDqjzAS6bko93/0zcWFT6nknCO+8d8badC
 eqwvdsfF8fwg0mVDaXvOBXCOF9DgyYonhKbQWKobcrTKeU0R86N7gpFZNpqU/3h47Bf7
 rX9hBu7wlccKpOotczEV2h08yRyLYNYvrs7eooJDZEmhJEZp5TDZPFl3TC+8rVlJiMbo
 SqJaQmYf+N9E8lRdu1CdGV9/tOQLCQSMt2gPpYzd3brxtRwEWirufUvmzpg1+vkQ/Xfk
 QwCe4WlZ7cKZsKWfSYQ3G+4osNj9ExW9xVe7tb9nMkbLxLTcwY2NB9/B8bVwA5I4L1TG
 gdKw==
X-Gm-Message-State: AOAM5323Blp4urXV8SkPIFSFd4hBpxMVLJY4auzhBr4OfvbzrOScUpjP
 NezBt2M+SPlG60z86to6GNA=
X-Google-Smtp-Source: ABdhPJw26GydCpYmCDmlt82Wx3Xvlld1x34VTdacYYDUaLUi/tUiYVWgRGR6xA14rPfuyNnhFg7Dpg==
X-Received: by 2002:a05:600c:247:: with SMTP id
 7mr22283600wmj.116.1615736736293; 
 Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 15/17] ASoC: tegra30: ahub: Reset global variable
Date: Sun, 14 Mar 2021 18:44:57 +0300
Message-Id: <20210314154459.15375-16-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Tegra30 AHUB uses global variable that is never reset by the driver on
a probe failure and on driver removal, meaning that driver will never try
to re-probe and can't be unbound. Make driver to reset the variable.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d24c26f4960d..409a259e6343 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -518,9 +518,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
-	if (ahub)
-		return -ENODEV;
-
 	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
 	if (!match)
 		return -EINVAL;
@@ -544,19 +541,21 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 	ret = devm_clk_bulk_get(&pdev->dev, ahub->nclocks, ahub->clocks);
 	if (ret)
-		return ret;
+		goto err_unset_ahub;
 
 	ret = devm_reset_control_bulk_get_exclusive(&pdev->dev, ahub->nresets,
 						    ahub->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't get resets: %d\n", ret);
-		return ret;
+		goto err_unset_ahub;
 	}
 
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
-	if (IS_ERR(regs_apbif))
-		return PTR_ERR(regs_apbif);
+	if (IS_ERR(regs_apbif)) {
+		ret = PTR_ERR(regs_apbif);
+		goto err_unset_ahub;
+	}
 
 	ahub->apbif_addr = res0->start;
 
@@ -565,20 +564,22 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (IS_ERR(ahub->regmap_apbif)) {
 		dev_err(&pdev->dev, "apbif regmap init failed\n");
 		ret = PTR_ERR(ahub->regmap_apbif);
-		return ret;
+		goto err_unset_ahub;
 	}
 	regcache_cache_only(ahub->regmap_apbif, true);
 
 	regs_ahub = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(regs_ahub))
-		return PTR_ERR(regs_ahub);
+	if (IS_ERR(regs_ahub)) {
+		ret = PTR_ERR(regs_ahub);
+		goto err_unset_ahub;
+	}
 
 	ahub->regmap_ahub = devm_regmap_init_mmio(&pdev->dev, regs_ahub,
 					&tegra30_ahub_ahub_regmap_config);
 	if (IS_ERR(ahub->regmap_ahub)) {
 		dev_err(&pdev->dev, "ahub regmap init failed\n");
 		ret = PTR_ERR(ahub->regmap_ahub);
-		return ret;
+		goto err_unset_ahub;
 	}
 	regcache_cache_only(ahub->regmap_ahub, true);
 
@@ -595,19 +596,20 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
+err_unset_ahub:
+	ahub = NULL;
 
 	return ret;
 }
 
 static int tegra30_ahub_remove(struct platform_device *pdev)
 {
-	if (!ahub)
-		return -ENODEV;
-
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra30_ahub_runtime_suspend(&pdev->dev);
 
+	ahub = NULL;
+
 	return 0;
 }
 
-- 
2.30.2

