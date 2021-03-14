Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D133A5B6
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C9C8175F;
	Sun, 14 Mar 2021 16:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C9C8175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615736868;
	bh=9Y/3q+1+DQN2mntAF/q3iuvJArkqhGtcBAxftmx9hkM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shbJOZznd2TYjeYb4s2gOPKqdIJyxEUqEz57Di3cW2aOt+m+UbI57cLq+OplCTmH9
	 zNx7YBhTp4ys00PJ1wAZuC7yENi7mSdBO61/WTiJxfTdUUEJhm6pEXu/XU4PqYWffj
	 o4dL9SQVwYtUniFwnf/2lASuzLcege3dMXIkWGdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76514F80475;
	Sun, 14 Mar 2021 16:45:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDD29F80100; Sun, 14 Mar 2021 16:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59831F8010E
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59831F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X+zebKcy"
Received: by mail-wr1-x42b.google.com with SMTP id x13so4446440wrs.9
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBgS52ohSAjwSwQTAebOyEnKVyU7OG0mf9DfTmO+cgo=;
 b=X+zebKcylQMfOnYwAUFh7t8xptvxbwzHwUOH625furvKhQuj6ln5p/kzWVCEwGRmZb
 55SaLGoBeWMJ/vn9d1ht/tgSucCOXw7FyVpuL7bXMUZ9ZYiOP+uP0nb5nNepnLNcY4gk
 QDEsre5SdcTmkeJTTrgXn7PmeT04qT7OECCJ3SXv1IDFodjYNK7rhOtLt+pnbisIRNnh
 9v0hYgfj5pUVozFJFjWaZI0DbYksfpAvXplv5z5GRPXQo4i1n1x5AcgwRjIcL9R7iiTB
 ZBe3Bj4y7TtOP4TJWKwfo9oA0WMsGV/1cJYheUtgh72gMjLoDZgoBvEf6FAz+z+TaAXJ
 sPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBgS52ohSAjwSwQTAebOyEnKVyU7OG0mf9DfTmO+cgo=;
 b=qyV+F2jX09rUO1QgSErBWG0zdhM9bhuILNqBVfh7j+blC28YOXVdTCnr/RYU7yM/e0
 7nkpS0O09cop1xvN+cUBkXDRZLZcspKI1+qTa4PE5OH1hCqgYOT/nfA1piPiN9V+VG0A
 k/CH7ZwLcrF+VdRFEZ7PXHoHUmM/rCLGyfubiIofupTGoFEFq58nw7sB6Oqer8U2ndis
 2YAZAcUl0pSzvWItzOOLLOUMh1FFia9ucmG5/Wz14jF8WC9iKdL0ym8HlbN86PaZv2lJ
 VWk0qUZI93G54MXf5aekn30vugYjQ+GUHDEad6slkT6iYtmDSDe3Yxb62a4q6C3Nzlvm
 dUOw==
X-Gm-Message-State: AOAM532kxMrZdO8OiUZtkkXU/lv2Fw4BNlw2JzHEAZhwRNN/Ybx/uo4z
 x+6go9Ij/cnrjxKebWTadh8=
X-Google-Smtp-Source: ABdhPJyoI95cmUGK/SHTgeoy4AUqf/z5xjCWBJ2BUkvvLV0H+UuGu+1JYvF/ArmDD4zPjywBzBE0Kw==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr23913441wrt.18.1615736722488; 
 Sun, 14 Mar 2021 08:45:22 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 02/17] ASoC: tegra20: i2s: Add reset control
Date: Sun, 14 Mar 2021 18:44:44 +0300
Message-Id: <20210314154459.15375-3-digetx@gmail.com>
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
2.30.2

