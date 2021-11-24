Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0BC45CFDC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:11:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7BF17D5;
	Wed, 24 Nov 2021 23:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7BF17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791902;
	bh=0Y0EQKphoKVU8LA+mSh/t0dDqSxkfRn2A9TEReYxdBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IgF26ARKzB2DdpeNBT2t7+Vdpw/a4cgc/ALsUlVs2iN9bOOI9iyiru/kiAk1aJrei
	 Kkw7H+O7go8xqiUhiGupZn5NxQoE+E6JNDFymsZI5S2WX+IvKVBY3hAzqzo5+NSdUh
	 oFvK0XNc5yfIJNm8ElSnUH3FUR/Mj0N6wgplocGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E40DDF80538;
	Wed, 24 Nov 2021 23:07:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF6AF8051E; Wed, 24 Nov 2021 23:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32A16F804F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32A16F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Nzn1Zr7Z"
Received: by mail-lj1-x22c.google.com with SMTP id d11so8360081ljg.8
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tbG85K+O8+Dl5om1+PZ6lAYg/7hr7N71/G0INRgPxNw=;
 b=Nzn1Zr7Z1nrg0JoFWQhRq9L6857jELbFKXYHMYwkcAr3l2KmVk92FB6xiCfv7NZi6+
 +79xgqINhBea0Mt2rHsc4kMwePIQSqTr1mM/3DmnJ1Q73J771ltws6e4Ia7lCLFwqon8
 m1WSOw/krg9QDhakKFvjIAqwlnBj9JLjAsGE+5aYhtlniSIuv74r6LdiYRxhfwERkQ44
 iCT/T+p9BKBNTeN9UeCJAHlndr+i4hlMXqg7B0IWtBQMh4iN7Q8cyZslbTNCjcmr+sfX
 sTHrU55G3En6fqjIubE0HN+82/mkpGCVXuJfmo39JKTNfhYe1tcGcqjF+5Hc2JOxTzrA
 9Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tbG85K+O8+Dl5om1+PZ6lAYg/7hr7N71/G0INRgPxNw=;
 b=jzcfjtirsKjjO790c8deadajNLgOF8tziWaS8iAyV0O89Fev0OgOjUTMlPG50o9pGV
 oAK1WhwacTkJXvZ32AB5DwCxJvK8/ZcjE3Y7jaOQQcctzxMB8Q5ZA9VcQ2Jo1Lzle09d
 hRKu659ovhDUKUtzmzKAPSg68MCyrR/eyh1Quk8uWudbck4XyyooEsAxsF5kB3lJfbyC
 Z9Bbpxh6a+F25DGLTF91ywaisPkHUcMCjh4ilZ90/aZJpxeXEuMvZ+ASTASz0r73aiZO
 kSgmdL4gfwbFP5+LCGupMNm68wEO/szWkmfjjxz7uga/SZd420JH9Qc3IIA0ZchnIDvB
 QX3g==
X-Gm-Message-State: AOAM531xapoWzLNuq1BhIgxim8sa6d2Y4RJ8+SDqj66iHSiyUSNhhtit
 uR68f/GT+8jXvw5yXKJZRxk=
X-Google-Smtp-Source: ABdhPJzaAFS/CuP9FcblCUP9M0RxRCSGVXKhjQ/HQPDgaShaCJTYQsOF2UuaQNEsHiWi0iHYhadZZw==
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr19439402ljp.362.1637791599105; 
 Wed, 24 Nov 2021 14:06:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 10/20] ASoC: tegra20: spdif: Reset hardware
Date: Thu, 25 Nov 2021 01:00:47 +0300
Message-Id: <20211124220057.15763-11-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

Reset S/PDIF controller on runtime PM suspend/resume to ensure that we
always have a consistent hardware state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_spdif.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6ca48bc322ae..8b9bac30d5cd 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -14,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -27,6 +29,8 @@ static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 
+	regcache_cache_only(spdif->regmap, true);
+
 	clk_disable_unprepare(spdif->clk_spdif_out);
 
 	return 0;
@@ -37,13 +41,35 @@ static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_assert(spdif->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(spdif->clk_spdif_out);
 	if (ret) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
 		return ret;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(spdif->reset);
+	if (ret)
+		goto disable_clocks;
+
+	regcache_cache_only(spdif->regmap, false);
+	regcache_mark_dirty(spdif->regmap);
+
+	ret = regcache_sync(spdif->regmap);
+	if (ret)
+		goto disable_clocks;
+
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(spdif->clk_spdif_out);
+
+	return ret;
 }
 
 static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
@@ -268,6 +294,12 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
+	spdif->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(spdif->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve spdif reset\n");
+		return PTR_ERR(spdif->reset);
+	}
+
 	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		dev_err(&pdev->dev, "Could not retrieve spdif clock\n");
diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index 1973ffc2d5c7..ff4b79e2052f 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -451,6 +451,7 @@ struct tegra20_spdif {
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct regmap *regmap;
+	struct reset_control *reset;
 };
 
 #endif
-- 
2.33.1

