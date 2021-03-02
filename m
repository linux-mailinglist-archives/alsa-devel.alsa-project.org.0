Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0B329C79
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:25:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84F416F6;
	Tue,  2 Mar 2021 12:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84F416F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684321;
	bh=cSGCD0AsLQKnPFlvit9/P5qTgZmUiQp8qmngDcIK+o8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YrR4BCfWmxPYoODEnw6UfN8l6ur9Ia0ohJm9R09wPq7WRVdRDtLFBQApnCtQ3Z+XR
	 HWJ73sNEcitFBWI8T5r1mo1QGEpF/HAJDoXoJHFgVSWoCgmBiRf4r3ecvy8UzeYHTu
	 sTF4ouBAQIcRAPpmeel9BhQieeXNoe0sls6gWHp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F8CF804AA;
	Tue,  2 Mar 2021 12:22:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30585F804AA; Tue,  2 Mar 2021 12:22:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57424F8025B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57424F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ci54oo0j"
Received: by mail-lf1-x133.google.com with SMTP id m22so30718696lfg.5
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 03:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYSsXIFL/dA97lmJWWP+yg2JxmqYfXjZBEAJVyWac2M=;
 b=ci54oo0jfpjRaTbxkLi4tJfpSIl1mFga0eXmodGQUI4Rn4h67dDak2qVVNPv4Yvqcu
 y4q2NUBkaBF8xNxd8NC4ed8/OBX6CwHKbiGjZ5ohSmJ53BbTuJmTr3Caoalg+ACt5R78
 f4dBOUXlvaRgIP9mkUJY2T4wd83Yr+H6/PPQd+hpxiQpYuRzSZIJgDW3nOLphP7+r6XO
 F2nCithL2t1GTTOJ7qdGefyRTX+HnaYCFjG3xI4fri479D8m393nQTiifHT+J0S6YxaO
 hihVoxBvDNaqupw/xuLDaHkKh8lczDauydhCl4xLebw70U2vS3GFCBLwieVX8pHc1BEa
 sTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYSsXIFL/dA97lmJWWP+yg2JxmqYfXjZBEAJVyWac2M=;
 b=o6JsYcMJbZMsXrJUNXT0pPdNJRX5HxW+SgDmlPI18bLEoD8bejD6ATc7mfDtkgzzok
 dq+FQCKa+8VsNLx7ItbScW3/4rosjM/7qHjlu6Tf5jHCK9EdrwxvuB/EEEm+KESKVHnA
 Y1dIa5ALKjA9G/J9yKMRY8ILDaDrXZGZrjSuPAq25zTfzuyc7JJSVJ0auGuHF8vCzFP7
 bN0Le706rVyalRN/tgbVMpuGbyF9DeANo4NeGvbg7l0KTpUQhF5Lqer5KOX1/fmSu+a/
 uXSIr5uKm2p9Pb+2XRXz/Hk+A/Xl+7N6v4i8FPlqJFq+LA3BJCwWc7m+6GvZfNeeNt7j
 kovQ==
X-Gm-Message-State: AOAM5332unDEiM6/4s9WbpQMqj9yOSLswTDFVvOMcVH7IffLMw87t3yQ
 LeB4w1GGXUaCcT388XN00co=
X-Google-Smtp-Source: ABdhPJwuKz3ysLTwy2IgtHLZvpvs9uwhsUqW8y6WzNNyhlxEjSyJnHBV7tE2mWjmRekeQ8dKj18RGA==
X-Received: by 2002:a05:6512:3186:: with SMTP id
 i6mr12040828lfe.17.1614684127901; 
 Tue, 02 Mar 2021 03:22:07 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:22:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v1 5/5] ASoC: tegra30: i2s: Add reset control
Date: Tue,  2 Mar 2021 14:21:23 +0300
Message-Id: <20210302112123.24161-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302112123.24161-1-digetx@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
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

The I2S reset may be asserted at a boot time. Tegra30 I2S driver doesn't
manage the reset control and currently it happens to work because reset
is implicitly deasserted by the Tegra AHUB driver, but the reset of I2C
controller should be synchronous and I2S clock is disabled when AHUB is
reset. Add reset control to the Tegra30 I2S driver.

Note that I2S reset was always specified in Tegra30+ device-trees, hence
DTB ABI changes aren't required. Also note that AHUB touches I2S resets,
hence AHUB resets are now requested in a released state, allowing both
drivers to control the I2S resets together.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
 sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra30_i2s.h  |  1 +
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 9ef05ca4f6c4..1e7803819a17 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,13 +65,17 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
-	ret = reset_control_assert(ahub->reset);
+	ret = reset_control_acquire(ahub->reset);
 	if (ret)
 		return ret;
 
+	ret = reset_control_assert(ahub->reset);
+	if (ret)
+		goto release_reset;
+
 	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
 	if (ret)
-		return ret;
+		goto release_reset;
 
 	usleep_range(10, 100);
 
@@ -92,10 +96,14 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 	if (ret)
 		goto disable_clocks;
 
+	reset_control_release(ahub->reset);
+
 	return 0;
 
 disable_clocks:
 	clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
+release_reset:
+	reset_control_release(ahub->reset);
 
 	return ret;
 }
@@ -579,7 +587,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	ahub->reset = devm_reset_control_array_get_exclusive_released(&pdev->dev);
 	if (IS_ERR(ahub->reset)) {
 		dev_err(&pdev->dev, "Can't get resets: %pe\n", ahub->reset);
 		return PTR_ERR(ahub->reset);
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 6740df541508..01bff9fda784 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -42,6 +43,7 @@ static int tegra30_i2s_runtime_suspend(struct device *dev)
 	regcache_cache_only(i2s->regmap, true);
 
 	clk_disable_unprepare(i2s->clk_i2s);
+	reset_control_release(i2s->reset);
 
 	return 0;
 }
@@ -51,15 +53,41 @@ static int tegra30_i2s_runtime_resume(struct device *dev)
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_acquire(i2s->reset);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(i2s->reset);
+	if (ret)
+		goto release_reset;
+
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
-		return ret;
+		goto release_reset;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(i2s->reset);
+	if (ret)
+		goto disable_clocks;
+
 	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+
+	ret = regcache_sync(i2s->regmap);
+	if (ret)
+		goto disable_clocks;
 
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(i2s->clk_i2s);
+release_reset:
+	reset_control_release(i2s->reset);
+
+	return ret;
 }
 
 static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -418,6 +446,12 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	i2s->dai = tegra30_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
 
+	i2s->reset = devm_reset_control_get_exclusive_released(&pdev->dev, "i2s");
+	if (IS_ERR(i2s->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve i2s reset\n");
+		return PTR_ERR(i2s->reset);
+	}
+
 	ret = of_property_read_u32_array(pdev->dev.of_node,
 					 "nvidia,ahub-cif-ids", cif_ids,
 					 ARRAY_SIZE(cif_ids));
diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index 0b1f3125a7c0..e58375ca0a59 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -235,6 +235,7 @@ struct tegra30_i2s {
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct regmap *regmap;
 	struct snd_dmaengine_pcm_config dma_config;
+	struct reset_control *reset;
 };
 
 #endif
-- 
2.29.2

