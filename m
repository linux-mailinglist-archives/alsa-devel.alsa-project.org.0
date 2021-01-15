Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EE2F7D99
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 15:04:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A14BB17C8;
	Fri, 15 Jan 2021 15:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A14BB17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610719486;
	bh=IpbLHl8WrHHQID/tYoOU2h4F3pt+FBELHeCJZACyM5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pX0m/uxLR8wQ2c3rgvUQiN6aXSRKYqbSszc6gSlwRdRTKzmHWNId/GqqaTJT8eT3e
	 U+NXtEbvv0zZTCvbxkcDJVcTzgPBeGwmHNCIj8KITUgbs4OEOK1GY/1tlxqGuoeEk4
	 cchJU82pDxwi6jmRvS/n0eG+CtuavBxs/XgVgiQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD63F804CB;
	Fri, 15 Jan 2021 15:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93140F8026B; Fri, 15 Jan 2021 15:02:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F792F80254
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 15:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F792F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="esP6s1up"
Received: by mail-lj1-x235.google.com with SMTP id f17so10444729ljg.12
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sAP+3CkhcyAzGSOOjeDge3bGII17aWYwDL7K0dtBg44=;
 b=esP6s1upDtlp2uQOrdq1lxKgaCueiDMX/Cduzlzb5LWZedBD0FYmJ7XmN/hYK+jOz5
 55GRMimGODVhKTncYqiCRi5rHvZ189Idn9KaCvVpKNeP6JdPaaA1RC5dOUGjiEfxQ57Y
 16AzaMSCuXU5lde4DqZ383S+jdeuLcJF2mJY3jYj4d0ZX3YAlbsooPwSSk5MV/my7pIX
 Ci0L8OfFpsEZDfC/tCkTUuAcXx43CghtQZ6JfZ49CLxfjDqnNurQSeVCv0ag1Z5nG0wx
 PP+Yn6jfPo+8jlCAZ4DDqtNFKjGRN5T4KSR5XjXFVyGJPelkwAC2TM9HX/xUwd+/1KTr
 JwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sAP+3CkhcyAzGSOOjeDge3bGII17aWYwDL7K0dtBg44=;
 b=BhoMeUrHoiTtCo3PK8bE8bN0ik39U1nqCkbFZT4bypgukw3i5roGcNf8Ge7E1mkpDG
 pFPWMrAtQ0V9t4ekjNsUiY++Nny/7ujR9GTMrVT0GxCBnzfrQVJfsLpTy6A1ULNsNPjF
 o0tCHYV5ILGrbtVLpeEzcmLPTWMG3WFzjT3QOVdbgvztAdZdcrUwqdjM2mzEMsmTum68
 2UbEEPBbZ+J8tYQ+Mypdt/g/M6kreLYr05VW64RvmU/Nsx3h+2WKwGUZ+sj+O+3TtrkE
 HKInStMJaSh0kW+girQ2+8A+7VPnFuG18C2Un0Ru92DJgMojBI76vbH8dYF4LDHRKUQD
 QGaA==
X-Gm-Message-State: AOAM533DJ2VZONwaerSLN4blouoMtBg/kPVubXqwcfam/3Jf63/HjU8z
 6+x3urxXpCNPjjMAmWk3VAc=
X-Google-Smtp-Source: ABdhPJwDsWHwKzdFGUfir57SjL+eIx0jVbGppz6E0440MAgbkTD8QUEuIhW4v5pg8TEZ1W0DSXi/yQ==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr5177200ljj.77.1610719327257;
 Fri, 15 Jan 2021 06:02:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:02:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 4/5] ASoC: tegra: ahub: Use clk_bulk helpers
Date: Fri, 15 Jan 2021 17:01:44 +0300
Message-Id: <20210115140145.10668-5-digetx@gmail.com>
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

Use clk_bulk helpers to make code cleaner.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 30 +++++++-----------------------
 sound/soc/tegra/tegra30_ahub.h |  4 ++--
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 8bd3e83b2c3b..37a847569a40 100644
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
-		return ret;
-	}
-	ret = clk_prepare_enable(ahub->clk_apbif);
-	if (ret) {
-		dev_err(dev, "clk_enable apbif failed: %d\n", ret);
-		clk_disable(ahub->clk_d_audio);
+	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
+	if (ret)
 		return ret;
-	}
 
 	regcache_cache_only(ahub->regmap_apbif, false);
 	regcache_cache_only(ahub->regmap_ahub, false);
@@ -509,19 +500,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
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
index 5a2500b4ea06..063aed5037d7 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -510,8 +510,8 @@ struct tegra30_ahub_soc_data {
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

