Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCA329C7E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A40171F;
	Tue,  2 Mar 2021 12:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A40171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684330;
	bh=j4aUPdKiYoXEoNs6zvEijyuS4laHxmQHyZetALal37k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXcIKtiplJq4PbgDcQZsScH1/5Bi3R6icVT+SOEFHNSxULb+Wd1lrYSH4Pdt/p4DN
	 +qERxteHY8e8T7BjdDkoHNok3qKQWA+458qZGwqrq0f7Uv982azBxUvroqzqqfxysk
	 x1HHx84yVQ8H5tUJiCA/9S4pyllDivjIxlutkMgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B62CF804AE;
	Tue,  2 Mar 2021 12:22:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BC86F804A9; Tue,  2 Mar 2021 12:22:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82B3F802A9
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82B3F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hE2yP80G"
Received: by mail-lj1-x22d.google.com with SMTP id r23so23440752ljh.1
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 03:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yx3Rm9jzGKCPBq80QBACsTq0WbETqkrvY2ZCaXbwiog=;
 b=hE2yP80GuxnR3XsGAANyFMzvuOLz/ZpQMmTFhEXv43SCND/ao7TCA1fIEYkLQj8+4L
 imhR5/xMGH/9jV6IfXoGd3td3KezpfkN6EmkACmpfdwZkv0a4YBFb0JNbsdN4Quv2p0R
 lIq3zf41LbLwYrmma2SKnbmdKihfqo4Cro/FlGxFgoD4uA49etZzOTcTmTKcbhRRd6Zn
 gk9CuB9NpjbpDq981M+f9ZzngXrF0+1SIBUdeiMKwk0gAj/Ic8IwUDKlDXigqfwgFeKg
 EojB3Y8kXjzTLpTpoL3GrPXDlTyTvWvmUX/t7QR19qJPZDUCEcLh6jEXfJKhcvn6XaaU
 NFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yx3Rm9jzGKCPBq80QBACsTq0WbETqkrvY2ZCaXbwiog=;
 b=nr6eY+7xNu1Rt7iM4gi63yu2XeptreSUQtwBDvMGfRle+fiQxYhrHEOyHOGpM/IWcO
 qo9m3ciXysn/GizVW0slWBNEp//8t+lGlSHhI9O0hz21pYNkiLav2mDFfwYOQaYN2cDM
 Im4HACm3OzSTYc9BipI0CLwixHQo9YVoRMiEsBp3yuHwuiVahatViQLG0DpID7E3q4TZ
 XZTGzjsL6cEZ7YxYPOYhmljzcpjP3EWhAWHkeDEaz6OZPL+uvYE7WYl8MO2LyphQ2MEJ
 2vOOwBDpqF/Q0pUafaqhgPhtxt0suY1YPoqS5wpU0Qa2w7Qw14kVuLsaNNzIYnZaKAML
 tovA==
X-Gm-Message-State: AOAM530bx5rlpGJvScrX4T9MIL/mYwR8dnZ0Mx/zC2HazeaVDCzjgcGU
 ftGotFBQ+62CtXQe050Khy0=
X-Google-Smtp-Source: ABdhPJxY2V/3+YiXrVWJXhoxQHtaDT4E8zOniFwbDdn0KZP5+Xumkdt/bDgK3eQ0vw4Uvj7C2vdlTQ==
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr10165943ljc.0.1614684127193;
 Tue, 02 Mar 2021 03:22:07 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:22:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v1 4/5] ASoC: tegra20: i2s: Add reset control
Date: Tue,  2 Mar 2021 14:21:22 +0300
Message-Id: <20210302112123.24161-5-digetx@gmail.com>
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

The I2S reset may be asserted at a boot time, in particular this is the
case on Tegra20 AC100 netbook. Tegra20 I2S driver doesn't manage the
reset control and currently it happens to work because reset is implicitly
deasserted by the tegra-clk driver when I2S clock is enabled. The I2S
permanently stays in a reset once tegra-clk is fixed to not touch the
resets, which it shouldn't be doing. Add reset control to the Tegra20
I2S driver.

Note that I2S reset was always specified in Tegra20 device-tree, hence
DTB ABI changes aren't required.

Tested-by: Paul Fertser <fercerpav@gmail.com> # T20 AC100
Reported-by: Paul Fertser <fercerpav@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 31 +++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_i2s.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d7a3d046c8f8..c0af5352b483 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -37,6 +38,8 @@ static int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 
+	regcache_cache_only(i2s->regmap, true);
+
 	clk_disable_unprepare(i2s->clk_i2s);
 
 	return 0;
@@ -47,13 +50,35 @@ static int tegra20_i2s_runtime_resume(struct device *dev)
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_assert(i2s->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
 		return ret;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(i2s->reset);
+	if (ret)
+		goto disable_clocks;
+
+	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+
+	ret = regcache_sync(i2s->regmap);
+	if (ret)
+		goto disable_clocks;
+
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(i2s->clk_i2s);
+
+	return ret;
 }
 
 static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -339,6 +364,12 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	i2s->dai = tegra20_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
 
+	i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, "i2s");
+	if (IS_ERR(i2s->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve i2s reset\n");
+		return PTR_ERR(i2s->reset);
+	}
+
 	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
diff --git a/sound/soc/tegra/tegra20_i2s.h b/sound/soc/tegra/tegra20_i2s.h
index 628d3ca09f42..8233e5fa2eff 100644
--- a/sound/soc/tegra/tegra20_i2s.h
+++ b/sound/soc/tegra/tegra20_i2s.h
@@ -144,6 +144,7 @@ struct tegra20_i2s {
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct regmap *regmap;
+	struct reset_control *reset;
 };
 
 #endif
-- 
2.29.2

