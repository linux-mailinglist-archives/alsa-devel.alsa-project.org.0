Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A72F2FBE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:02:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98200171E;
	Tue, 12 Jan 2021 14:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98200171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456563;
	bh=lAlujD2zMkA8jsUeK7vh2jDQzc6/HCoUqLaNxZaggZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=euyquUM6yoVjZOFIFY+yWykIzSGXpgp0zO51iBJSpkbH7MChqXqJoD+RsVf3IpIq+
	 oy6njJZ7z+QtnevnQ7Z0flaDE1juRAMeb2/kWsbeWjXxcQ0bfTunvwCMHemLIpTv6T
	 Cyi7pIMHDf1LMEWnURTwOTsnnXiwtpfPjXwb7RC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A89F804F3;
	Tue, 12 Jan 2021 13:59:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74332F804E2; Tue, 12 Jan 2021 13:59:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92268F804D6
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 13:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92268F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rClqpU4R"
Received: by mail-lj1-x232.google.com with SMTP id n8so2744593ljg.3
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6GtQ1NMerYE2VXfkjD0awJM9c14fA0uLhnuFd5ReVg=;
 b=rClqpU4RHdEeRNfl2B7s/W6CLCwbG6gTtFf+04dfQiJLrYeyw6DF1xLW8YUgTFGyzY
 eJ7fcnGQrVtNVDyasYBBtxu2l6VtTtdsUtO+Uq3y51c39HZRuQS5rcs5wvdvhuOwUsSS
 +3qnY6q6tehOG2Y9UpSO2QYE07Ml2rmVqUwYXjRDtyJ2K07693eLOXk/g7p/Y0WLDcta
 zQ2/k5lq2R14Dh9u2NWAOYuFPF3bCFVnC2LCmWqmjdS0BC1t14sOSf/MYIo3hIcdfKZz
 YWMOdCw5jL+G0k88GACjXm6wyT1CQL8dAZQF/LIF0kYcq21Kxt1Y0KBz863khILci9AD
 7KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6GtQ1NMerYE2VXfkjD0awJM9c14fA0uLhnuFd5ReVg=;
 b=HXmOX3E7+DozFfggWhITAkYmj0nlmP0ECRRyuAluSGB9mG2H7uxjYlj3u5YNzrI9wZ
 WOl1Fo6ZewxR/bV9g6/oCENpvbB2CaVC/cp0ZBtSB6A2f9+il/3yw40US8uSKy3bRQsq
 8VqDbE+dTWN8j4MZwO6XlV+iKcGXK5b7madJWTmAyYVN9HYRkMgWyhHZixXJu0aHWpcf
 XyVGIXAJ/qbun4s4jcc5AVfCj+Yz6byLBlJsFndLTah1Ey4chGMD0PBbB7G2wwf5e9nO
 jBygK5VThaiGQsMfABeDBiFS+FVK9BdE2fEONg3CR5QImrBGnUVXzTjXQ6f9r7ZIWwcz
 6GzQ==
X-Gm-Message-State: AOAM530/P4ddt4mn7Jr0GkXUOkYIG1VxhXQPZZNN+BIpRVt38HzyESgO
 vvWp+dPb7TXYU4CbcUVx1gg=
X-Google-Smtp-Source: ABdhPJwOkp2bw3DDCg37hiVed+o60utA9Fo0A0qC/6V34IHbxcJcSNZMHviVRYHnYznUlpUrv995Ng==
X-Received: by 2002:a2e:918a:: with SMTP id f10mr1881603ljg.302.1610456365858; 
 Tue, 12 Jan 2021 04:59:25 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:59:25 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
Date: Tue, 12 Jan 2021 15:58:34 +0300
Message-Id: <20210112125834.21545-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
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
 sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
 sound/soc/tegra/tegra30_ahub.h |  1 +
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 4dbb58f7ea36..246cf6a373a1 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
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
 
@@ -462,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
-	struct reset_control *rst;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -475,22 +484,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 		return -EINVAL;
 	soc_data = match->data;
 
-	/*
-	 * The AHUB hosts a register bus: the "configlink". For this to
-	 * operate correctly, all devices on this bus must be out of reset.
-	 * Ensure that here.
-	 */
-	rst = of_reset_control_array_get_exclusive(pdev->dev.of_node);
-	if (IS_ERR(rst)) {
-		dev_err(&pdev->dev, "Can't get reset: %p\n", rst);
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
@@ -507,6 +500,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(ahub->reset)) {
+		dev_err(&pdev->dev, "Can't get reset: %p\n", ahub->reset);
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

