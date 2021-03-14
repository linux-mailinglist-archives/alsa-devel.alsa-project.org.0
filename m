Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801B33A5B3
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E36841759;
	Sun, 14 Mar 2021 16:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E36841759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615736831;
	bh=IxCjM6FpLQMmJ8e3A0t15J7rwJV/nDGQAr2vOD9Albk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZPmN085mruVPiLcl0q5fXLJ1nJUJcIiXG4R3hG7mU1zqUKLFrsa4LIDZggxnoygV
	 KovBrWOa5Iwp8xG2bzKErdmGbuS+fkMKeO7GeQAdkzwQx5sojbflTirZ67Arv+moFL
	 buuTz6D23IrwqA+45PxWGh5lQOmFgwat9fwnK3J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFD1F80100;
	Sun, 14 Mar 2021 16:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 011A7F80272; Sun, 14 Mar 2021 16:45:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35EFF80100
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35EFF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BAcofkLp"
Received: by mail-wr1-x42d.google.com with SMTP id a18so7413027wrc.13
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtKR/4JVn6yx/XuU0tntwFP7lcedHE2V/O3j4vKQs0c=;
 b=BAcofkLpBVqClJbWenCsK37zvuwHpYUCtRAMipTF1ZFfV8xbbw2FzWy5r6jPqBWl70
 g9CcWRDzX8dTSa1K9aVJ2QvgNhFRLIlHks/a7w8LuxXObfqWWqoFW9NWTd+sYf+aec/Q
 tSr8A1wP+qezUHSY4j117N0rupg47RHvCjlUSfYmbGTZJPggI+ppViZoWoCPnLw0yG8n
 GwBmrVBXKUvskz47SYfIfsu1FqSPmGljLXM/t4QZmPnd/xviKmDaF/1F3Z2udLn/YxUL
 5aVuafMBKbECt1mhet7fJyaRrCVabbyG7VISG6VUp4MkuiSIZb7uVRR7BJBfCWVZ/HLY
 kIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtKR/4JVn6yx/XuU0tntwFP7lcedHE2V/O3j4vKQs0c=;
 b=nEq7kaEWiwa6n5/m6UcIzXFqHwIt1oFu/bLp/5zEQdMu1hBfc09cCai5iFm8k5v+yS
 CvC9pKpYKaqR7KwnwLBeckD36dU/HH/KHl3SskUOW1M3xO9HK/MoQ2bg0jxe7Y2k1/Rv
 sZ85bKLX07jVLx/WxgH83urJXZZWEFZRzB4pmT6abe3bU3mm4Knit/sYfgU1FbHvWl6n
 tz3Lke+UvxdGRBIYJZeg/K8dYyJGe+J+C0047++p5R89f8vRXvNIKdTGRIexFHTeRmqd
 +e83+uNCnHHLh06ZM5HZJ9j2ERWfURaaeLwQjEhPT3spfYvJIKduY7LfQt9r6BKP93Kg
 uk/w==
X-Gm-Message-State: AOAM533pS0KpiznDBc8KwECfjV5PJNYSWp4CA2r0PoDd9ArN76oI95n3
 NqFTDP3T+b97mYKHQukeMns=
X-Google-Smtp-Source: ABdhPJwAdPZZkDkI3WDmf7HRnWoB6/a6rLAZYs+/kSq8ULgrEagkE3iJo2VjjuK5TrEdqm4M7tF/8A==
X-Received: by 2002:a5d:6290:: with SMTP id k16mr22532255wru.177.1615736723601; 
 Sun, 14 Mar 2021 08:45:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:23 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 03/17] ASoC: tegra30: i2s: Restore hardware state on
 runtime PM resume
Date: Sun, 14 Mar 2021 18:44:45 +0300
Message-Id: <20210314154459.15375-4-digetx@gmail.com>
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

Tegra30 I2S driver syncs regmap cache only on resume from system suspend,
but hardware is reset across the runtime suspend because RPM of the parent
AHUB driver resets the I2S hardware, hence h/w state is lost after each
RPM resume. The problem isn't visible because hardware happens to be fully
reprogrammed after each RPM resume. Move hardware syncing to RPM resume in
order to restore h/w state properly.

Fixes: ed9ce1ed2239 ("ASoC: tegra: ahub: Reset hardware properly")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 40 +++++++++++------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 6740df541508..3d22c1be6f3d 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -58,8 +58,18 @@ static int tegra30_i2s_runtime_resume(struct device *dev)
 	}
 
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
+
+	return ret;
 }
 
 static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -551,37 +561,11 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra30_i2s_suspend(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-
-	regcache_mark_dirty(i2s->regmap);
-
-	return 0;
-}
-
-static int tegra30_i2s_resume(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
-		return ret;
-	}
-	ret = regcache_sync(i2s->regmap);
-	pm_runtime_put(dev);
-
-	return ret;
-}
-#endif
-
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
 			   tegra30_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra30_i2s_suspend, tegra30_i2s_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_i2s_driver = {
-- 
2.30.2

