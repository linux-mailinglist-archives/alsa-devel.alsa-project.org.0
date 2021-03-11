Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D4337BA1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 19:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C283617B9;
	Thu, 11 Mar 2021 19:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C283617B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615485801;
	bh=j4aUPdKiYoXEoNs6zvEijyuS4laHxmQHyZetALal37k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=krpA3D9Mnuno/N/CXeeWNu4oNLGOg9ny0MBYssD1b0gqSIFr+zx6/8F+oGwan+uZn
	 WDmb1kjAqIPSJBRerGQTS3wzLM5g3kb3DMszIZpZ4KHbr/xo6xGNNKJ9Q08kKkt8OE
	 AzwQK/DZfqgNijFIkQbw7faSQkCnrTvhHHacc+00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED05F80431;
	Thu, 11 Mar 2021 19:00:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB3AF8032C; Thu, 11 Mar 2021 19:00:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25EB5F80227
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 19:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25EB5F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RfazgWpy"
Received: by mail-lj1-x233.google.com with SMTP id f16so3301326ljm.1
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yx3Rm9jzGKCPBq80QBACsTq0WbETqkrvY2ZCaXbwiog=;
 b=RfazgWpy9p7PrRnmKyR8+2NTMO03Sr+kHm3ECVQQpNf+cYTLxB9o7UzQSvUlAyjtb2
 v9+ubFIaklLJ+oaCyOvj4U5eSqjsPU1mCih7jGwlw+vy4hcl49esTDD9TLLybfaS47aL
 4luzmPqVamTZUPGAw9XFOrEQMjXXFv3EkOu/0rtYbgNUCuvWJ3+3cupyxZwEwQs5H6r2
 Y0/SyoH4W3ahSTKd5YVUq3JRTdb9E1Oc26MLSf4WSWit1RWaQLXjIihA0xYvi8T0/8c8
 rr+aDyuJD5FV6YoDl1Fx3s7MKwTJX1wUBSPhzGsL5CAgmvpPwtxzjD2MZ2TLFB92EnVc
 a6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yx3Rm9jzGKCPBq80QBACsTq0WbETqkrvY2ZCaXbwiog=;
 b=Zwo5mH8MK+l2ZfSjWGMKyKqh/F0iS0MXdW72IkD3pN0JkGNPk4yWBPxdp7gM4Cpx08
 T5HhYba0A9ic9ENbw4fkFTJ4dDOjpSRqcxiTMd8l61UO8C0YwOCJVgiWJdei9G27uoXu
 WWHlh9Q5L/giOvyqBmZaT04NIkz4e1LbkTt42RqEOjA0lTvKhz6Vg5xfLmoFxSVOfCjk
 jKa5kVtEOYwwBZO6HLr7iiKlKuyB7Vg87RBJ64zTOD3W1XHhcd1TcjdIb/LwQ/Pvs66m
 LE0L4gJfMpJOAwaAmIfU7rnIhjoXQs7zl1ftjNt4rBzRLe0F1Vw7K4Ci8GvMDAyEi5fl
 OAkA==
X-Gm-Message-State: AOAM532YNoDsnJGtC1Ez87itCth6TZ1LXdqFXjVGc/dT6SwBi+N2bZ0r
 JgzmU2jBrpIkqxx32ryym6s=
X-Google-Smtp-Source: ABdhPJwEDL0cJGc6NP26XyZSzQK2KvCQdi/cIkV0fkYk3M2bND0hldvpC1t3fb8CkXoaMXu4Q54CuA==
X-Received: by 2002:a05:651c:1033:: with SMTP id
 w19mr40842ljm.191.1615485609423; 
 Thu, 11 Mar 2021 10:00:09 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id k18sm1014075lfm.88.2021.03.11.10.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 10:00:09 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v4 2/5] ASoC: tegra20: i2s: Add reset control
Date: Thu, 11 Mar 2021 20:59:55 +0300
Message-Id: <20210311175958.7433-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311175958.7433-1-digetx@gmail.com>
References: <20210311175958.7433-1-digetx@gmail.com>
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

