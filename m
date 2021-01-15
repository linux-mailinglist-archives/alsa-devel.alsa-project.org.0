Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FE2F7DA0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 15:05:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FC417BE;
	Fri, 15 Jan 2021 15:04:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FC417BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610719526;
	bh=bj/uK1WJWepkw6o0O2w5gMnQPgAzOXGmd4twoAoa7d8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJ7fm3Fa/yKO5k+k9GuesvRje0tIjHLo7G/hJc2v8RO4HfvwqceXyr+rukIu8+NsH
	 MtJJ+5cQhkItZmxP4Ys+zzrBFUC+9DIYj6BbCykV/p57P1lyVM/ePC4wj4q8F7acxE
	 vZzIFwwSu5tSqZukWtma3LfrvNbShXQf73JEvt7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E9CF804E2;
	Fri, 15 Jan 2021 15:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 906DEF801ED; Fri, 15 Jan 2021 15:02:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A31FF80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 15:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A31FF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FRijWLnD"
Received: by mail-lf1-x133.google.com with SMTP id a12so13277189lfl.6
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEFHoCKlwoBTeIV9uQCrZGB8LTusol6OgYk0Nc6MLlc=;
 b=FRijWLnDda9wN+RN+0vI7soeToWea6pd3AKovqBgoqyRyMNR9xc/avXaNJ2mGJL6kR
 dCy61BTRu/KWf6MJanz4XfKYhnO++8hL0ElEha3O+CAcvMhmUinwPcAA9TDhbhVvd3Um
 pIrfTQKbjvIL9NFoATtbEEhDsmlWyDIaKBliihIqVvR9g+cKdJn3jz5gPLJAhH4774v7
 +YukRL+g76cauOARXCY6VzGyXeNoxbPE+Icrq/L8fLBDa/NaYzTLPJSuAvrLX6TPAwYR
 BLtZP4UQSQlRG9YozKsgR/uXW6ko5bHhlI8uMZ5mx3Zvhu/6QXVg5p0ywtHK55E03JMI
 lOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEFHoCKlwoBTeIV9uQCrZGB8LTusol6OgYk0Nc6MLlc=;
 b=Ooor2bMfq38EXqutW2s32+SBRV3dyQZ5AkRFtWnda8+ggG9RMI1q6W5E5SLSErGYwZ
 HZ5qgy8UqoIRa6ndXyEcCq/YgbuAlimajMpKrj0vM7yEcCvs0JX/mcuOVxXNRkbjAeCl
 jK5+TF9+39pqlmWeQO7FDKCDLk76tm1qSFUeU76QBWAx3QW0s8dQFQjQf4GL+Yt2TG+U
 rfJCfffjp4bDUCUfxkUkNHt0LVT/7P2tuY17VdqfXYqBuVpyKrGmp9tdJsuLjVW5FqIm
 PFersOpCtZewhjLAWk0J+e9qgQVhvyt1RLBOFTyKBEsY2LVOSigkbYeASyehk7MluJDL
 HU0Q==
X-Gm-Message-State: AOAM533hrDJ/KRf+Gri1NBAxZSX0ZwBQ5EAzaPKoF1jTHzlWeM+U3qPL
 J+B0hvs0RdmXpXSLq0hD4cwDK9itz7c=
X-Google-Smtp-Source: ABdhPJyhtRastDCvuC3SUd6kji3K08UNSWGIadr4cyeT8jummwWN4RqelpY2jy0Z/c1fU6lmBuTjYg==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr5339672lfm.208.1610719328358; 
 Fri, 15 Jan 2021 06:02:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:02:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 5/5] ASoC: tegra: ahub: Reset hardware properly
Date: Fri, 15 Jan 2021 17:01:45 +0300
Message-Id: <20210115140145.10668-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
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

Assert hardware reset before clocks are enabled and then de-assert it
after clocks are enabled. This brings hardware into a predictable state
and removes relying on implicit de-assertion of resets which is done by
the clk driver.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 43 ++++++++++++++++++++--------------
 sound/soc/tegra/tegra30_ahub.h |  1 +
 2 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 37a847569a40..df4ca2b35566 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,12 +65,32 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
+	ret = reset_control_assert(ahub->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
 	if (ret)
 		return ret;
 
+	ret = reset_control_reset(ahub->reset);
+	if (ret) {
+		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
+		return ret;
+	}
+
 	regcache_cache_only(ahub->regmap_apbif, false);
 	regcache_cache_only(ahub->regmap_ahub, false);
+	regcache_mark_dirty(ahub->regmap_apbif);
+	regcache_mark_dirty(ahub->regmap_ahub);
+
+	ret = regcache_sync(ahub->regmap_apbif);
+	if (ret)
+		return ret;
+
+	ret = regcache_sync(ahub->regmap_ahub);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -462,7 +482,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
-	struct reset_control *rst;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -475,22 +494,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 		return -EINVAL;
 	soc_data = match->data;
 
-	/*
-	 * The AHUB hosts a register bus: the "configlink". For this to
-	 * operate correctly, all devices on this bus must be out of reset.
-	 * Ensure that here.
-	 */
-	rst = of_reset_control_array_get_exclusive(pdev->dev.of_node);
-	if (IS_ERR(rst)) {
-		dev_err(&pdev->dev, "Can't get reset: %pe\n", rst);
-		return PTR_ERR(rst);
-	}
-
-	ret = reset_control_deassert(rst);
-	reset_control_put(rst);
-	if (ret)
-		return ret;
-
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
 	if (!ahub)
@@ -507,6 +510,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(ahub->reset)) {
+		dev_err(&pdev->dev, "Can't get reset: %pe\n", ahub->reset);
+		return PTR_ERR(ahub->reset);
+	}
+
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
 	if (IS_ERR(regs_apbif))
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 063aed5037d7..ceb056575e98 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -510,6 +510,7 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
+	struct reset_control *reset;
 	struct clk_bulk_data clocks[2];
 	unsigned int nclocks;
 	resource_size_t apbif_addr;
-- 
2.29.2

