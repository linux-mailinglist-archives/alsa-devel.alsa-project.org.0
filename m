Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359B479369
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D9A2859;
	Fri, 17 Dec 2021 18:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D9A2859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764026;
	bh=Vl/41kvfdFpyRHJ6pNDcrzc48X1FAH4DBnCBilQ1CLE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwwhEUimoUFLTHIDzuqVgL6xCTfP5xRcG8o26eEaIGeEaCPFVoZehADmrC+hkF3Jz
	 a0xoFHhS/RJqb8zsBtPVVCzRZikzJRAlzECZ45wfSfgYma4n/RqXZCTvNlB1jr59dH
	 c0TDf4lV1+D1YeFtK2hYTf/pEsVJ7bf+Q/2oExk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93726F80161;
	Fri, 17 Dec 2021 18:58:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15BB0F804FA; Fri, 17 Dec 2021 18:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB07F800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB07F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hp038EhP"
Received: by mail-lf1-x136.google.com with SMTP id cf39so6239654lfb.8
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aa9yOoBAsbVbHG/p5jLgnwkk1qHi5k7LSoJyKHkxWf8=;
 b=Hp038EhPsEX/h9Yl3bv4AclbmQNLVpsMCwmu+Kap3o46DhCTol4mS+RxfvPnIndB+W
 337wZ6Qeji9i20vF3dYXIufPjaTC5zEeeAro27XaYktqAqdzx0f1sHUNaoz6723np3C8
 tg9prHr8luMRr9nwPCzZ3pvGOeNQgXohRf+7ACcOEOuseMgIKL11x5na7fzW4cJ1JP6S
 /NwIqyso0eqSOfGhK0+AQJnpPQPVzcexsSRgHr8Q9QsrlgeiEcD5LUQAtD5m3BNWNRk8
 MrAxR5p/h/W80Av/jEoAOarE7gcJCdBMjO1G/cCh72JJvu78aVRg1JJediQlhSHXHNiu
 Dp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aa9yOoBAsbVbHG/p5jLgnwkk1qHi5k7LSoJyKHkxWf8=;
 b=7TXyF6UV69eBJmYDenl15PjBete1Zum7/1bocTb8o9BiNT5eHLH+kYtS6+Jqq4g8oU
 32/4yNbchsDgSjA21h9NSDXDecLWse57pIbKTTqIkAAhbbExkVbmleEKwUgAtdnC9kzQ
 dEkCLXKyK0Lc1709GF7mSuXojuNt1gsFuT232tIINvh5lBBM+AIGYtQphS/lNH3WL5GW
 huidbuDDxh2cAKXg/HUI0zSEXO9u9fOVR4pTx7ZQRuzxmjGOUo/FunM47xoJp/gaauxH
 XwMeSEn+Q6aCytJ+NdXO8y/lo5FBkHHkHyl6Kulyvnq9CTjvlQ4aBXwavDgwWSQHbzi3
 xykA==
X-Gm-Message-State: AOAM53373B1gQRfK0znuORi9iPvdqRYpBmm8iEfC8AVs2FBMPdmY7u17
 xJAcu+1DrTA2QNjXcMzRygI=
X-Google-Smtp-Source: ABdhPJxDbG9C/hfS2qMWQsIB4NCcsWLXQr40hT4oghlO4QZ/abjfdAKcGOjou7Lqh1mV0z92cH0Wuw==
X-Received: by 2002:a05:6512:b14:: with SMTP id
 w20mr3659502lfu.164.1639763887504; 
 Fri, 17 Dec 2021 09:58:07 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 05/11] ASoC: tegra20: spdif: Support device-tree
Date: Fri, 17 Dec 2021 20:56:00 +0300
Message-Id: <20211217175606.22645-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
References: <20211217175606.22645-1-digetx@gmail.com>
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

Tegra20 S/PDIF driver was added in a pre-DT era and was never used since
that time. Revive driver by adding device-tree support.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index e45e371edc42..801784915004 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -270,7 +271,7 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
+	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		pr_err("Can't retrieve spdif clock\n");
 		ret = PTR_ERR(spdif->clk_spdif_out);
@@ -340,10 +341,17 @@ static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 			   tegra20_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id tegra20_spdif_of_match[] = {
+	{ .compatible = "nvidia,tegra20-spdif", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
+
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &tegra20_spdif_pm_ops,
+		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
 	.remove = tegra20_spdif_platform_remove,
@@ -354,4 +362,3 @@ module_platform_driver(tegra20_spdif_driver);
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.33.1

