Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149552FC5E3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:35:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B1218E1;
	Wed, 20 Jan 2021 01:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B1218E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611102937;
	bh=+K9BhcV6GU3gdI2Vps8DRgMjTap0eB2pLiIbCYq3Ff4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inj7iX9JFmKkpP9rD8ScIOPzyuoZwrkZsAdMTbv4f9GPGWFRkaxnaeS0+GBWut/RS
	 KK774Pmcw2UpzgJjv8+A4Lbt1X6pZy3AaGXmAQNvahEKRMigkqIhAj48j9Gf90JALu
	 RXPDVyeG2p9leBx7K8V4CMCR0L/7QV16+QCboz7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F66AF804EC;
	Wed, 20 Jan 2021 01:32:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78F7DF804E2; Wed, 20 Jan 2021 01:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE9D7F804D8
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE9D7F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eHPJ/J8U"
Received: by mail-lj1-x22d.google.com with SMTP id f11so24049589ljm.8
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aatWsRJD4mwUOaOb6poYIVDK+GvKkMOS2h0/TSRhmb0=;
 b=eHPJ/J8Uzbq6l2zEzSk8SetHfqX7mqZvfIEH0BjDbmZIW83RnqwvLiLu0P4xVhc74P
 n/FZ3EEBQvOiM6rTQNNcFNlHU5xfwr4g5zi35IbOvGK3H/HUOTEXhspu29+yQ16Hug5e
 KsQsarAwaPpJ5ZPvUZAjRd40vZW/7K6W0OmpDFAXLl4piU8aE6saqZcJDs1wK5x9ZxvL
 ZhvklnhnUCngfD3iXYw0uZfKCY8gvWzqs17AOYJyzNBNDg42lnpdYRWXITb63XHDS759
 unZ6PGyCy8c7p+KoFdh/7ucwXQ1+wR60NkZ2vTObxKTmj182bJsf3k8ptzDnhxWNPIzc
 B9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aatWsRJD4mwUOaOb6poYIVDK+GvKkMOS2h0/TSRhmb0=;
 b=SFci11tJNz47lt8dPcDT9LrPeNXatD/Iris5/sdkLq6K24GmVsc9qMdznfgzb014IZ
 5c7g+AEHPWIooa2V7H+Hb87fakl/OTRHvmNCyDEQeRMNiKgc/2M0mnfguu5LzMDJYVi0
 nPXRL5gpJogbohOFfg1U9IgT7wqQL50/u2X1Utv6GWwWdO4Hfov43hyB2S58HvCkOgt5
 4Kbt39jHFzAOq6HKfVOP/+ou8cS4n9IGZmQ8YAKNcHT2b+e5/YPyr8im1hLi91MPQ0aT
 LSEtzoleAH+GnEKD7Bbn3KV6Wr4NIHDzXYYSpnYI/F45p7+KMI8jOS3Edx/EQLzjd5Jb
 soIg==
X-Gm-Message-State: AOAM531mgcwQJqeJfmXLxbxbN5ckLUX4Y6lHKj16vXv098B120TXsir3
 IMcSmqEW0V5Vd5c0TIzwx0s=
X-Google-Smtp-Source: ABdhPJwKsRA1CF0WCIsSHBi3hk6qkZb3hrjO0ONfS+GEn6OeMZnsK/EjuMgSHZYjHMbVLZKl2MxAhg==
X-Received: by 2002:a05:651c:112c:: with SMTP id
 e12mr3096600ljo.66.1611102728442; 
 Tue, 19 Jan 2021 16:32:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:32:08 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Matt Merhar <mattmerhar@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 6/6] ASoC: tegra: ahub: Reset hardware properly
Date: Wed, 20 Jan 2021 03:31:54 +0300
Message-Id: <20210120003154.26749-7-digetx@gmail.com>
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

Assert hardware resets before clocks are enabled and then de-assert them
after clocks are enabled. This brings hardware into a predictable state.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Tested-by: Dmitry Osipenko <digetx@gmail.com> # Nexus7 T30 audio works
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 36 ++++++++++++++++++++++++++++++----
 sound/soc/tegra/tegra30_ahub.h |  1 +
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 12ca8e3ca4f6..9ef05ca4f6c4 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,14 +65,39 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
+	ret = reset_control_assert(ahub->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
 	if (ret)
 		return ret;
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(ahub->reset);
+	if (ret)
+		goto disable_clocks;
+
 	regcache_cache_only(ahub->regmap_apbif, false);
 	regcache_cache_only(ahub->regmap_ahub, false);
+	regcache_mark_dirty(ahub->regmap_apbif);
+	regcache_mark_dirty(ahub->regmap_ahub);
+
+	ret = regcache_sync(ahub->regmap_apbif);
+	if (ret)
+		goto disable_clocks;
+
+	ret = regcache_sync(ahub->regmap_ahub);
+	if (ret)
+		goto disable_clocks;
 
 	return 0;
+
+disable_clocks:
+	clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
+
+	return ret;
 }
 
 int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
@@ -519,7 +544,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	/*
 	 * The AHUB hosts a register bus: the "configlink". For this to
 	 * operate correctly, all devices on this bus must be out of reset.
-	 * Ensure that here.
 	 */
 	for (i = 0; i < ARRAY_SIZE(configlink_mods); i++) {
 		if (!(configlink_mods[i].mod_list_mask &
@@ -535,10 +559,8 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		ret = reset_control_deassert(rst);
+		/* just check presence of the reset control in DT */
 		reset_control_put(rst);
-		if (ret)
-			return ret;
 	}
 
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
@@ -557,6 +579,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(ahub->reset)) {
+		dev_err(&pdev->dev, "Can't get resets: %pe\n", ahub->reset);
+		return PTR_ERR(ahub->reset);
+	}
+
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
 	if (IS_ERR(regs_apbif))
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 01480d7dc940..3b85244f87f1 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -511,6 +511,7 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
+	struct reset_control *reset;
 	struct clk_bulk_data clocks[2];
 	unsigned int nclocks;
 	resource_size_t apbif_addr;
-- 
2.29.2

