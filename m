Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B223376D5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 16:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8830417D6;
	Thu, 11 Mar 2021 16:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8830417D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615476025;
	bh=lM8GOOCpvUTwlOOR+j55s0PnLGsgvCRMd2ds1GLpIqo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtqIvx3idH3G6JLcuB/lzB3sWGN+ix6MWLY7mgHbrG9gWpdGaLLbUPz5h01ZkutE8
	 Tt18/NrFTea/j1nELm3VcWvmJF81EQfnMrJyW8YZepA46EylY+zNK7KGQS+LI08dz4
	 LukSv1RItuxNtBz63vf89+MLbuziG0gZ5jxfd6Jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB93F804AC;
	Thu, 11 Mar 2021 16:17:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44EE8F8032D; Thu, 11 Mar 2021 16:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F20F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 16:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F20F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="efyTR88F"
Received: by mail-lj1-x234.google.com with SMTP id y1so2608748ljm.10
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 07:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
 b=efyTR88FuZ/EWfd8zdy/nRhfsx2cu7cgcFzRLhSVkTz+pFbP+DWxbDR3qq8bqGaXkQ
 KJHJKKPLJjxPuW+SgxTgmhcN3fOilX/K72gigNjciCZtSM1H3eyTp8nzkjqfhNIzCFVq
 +rWlREF3qU58GsnF8gpBkvVvjooWAjlYdj2RGaAZPYSPOo/zq+zww810VvkZ5fIqzVjx
 i8K0nOWtuZj67K8cfQODxQEiW1RoFLaARYQ0swfMCDR+6hdFBXLR5jPbcvf8wux9nmrv
 SjdqvzhxEB9v2Gh0+TmlXX/wu2vtbjogw302OV8svqjlfarX+5fnWG/xcLEeyxkHQ5Ap
 VESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
 b=X2feCJQtFTxd4soy1lV0DVX5mlekvusybuq/PULot9nMoU73krVm21Acctl8FD9CYJ
 uEPZEZ6o7sOtxr5mac1M4x9w682es0+ayT0yqX9y9FD8/R+E0N+G9IrJB2tg5nPzO3t3
 VSrkJhD7LDEFV6RlgtWI1kmx21AAm56nbX7PuIZdEDELqbmBjOrbSOomW+u9QuXj+l0F
 Gd9j6G4XglZei3Ac8Qk9tQD3jG7XqJltAsAo7ImLoRxhTkDw7Y2yvaFoa1/T8KkjnR8i
 L/23asntq+fCgKN24h9kgzYd9dbvSFhBVoyifJIkJJRvcz9IQxSfNO5OP9gaoVPIyuzH
 ScUw==
X-Gm-Message-State: AOAM533oyHI+pQlAzNxaxabPegMsEnYHfGcZRFd9RxtvIcVdOLz3pHJz
 RnhlbBjtc79yULpRpZmLM4k=
X-Google-Smtp-Source: ABdhPJxuzRFej1Px86UaKb3FEtTASiLFxKlnTGK+H5EU5OOkqUeCaBRlXW0zziipgDFzLjTcbUgmGw==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr5145808ljj.96.1615475820463; 
 Thu, 11 Mar 2021 07:17:00 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id m24sm923138lfq.184.2021.03.11.07.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:17:00 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v2 3/5] ASoC: tegra30: i2s: Restore hardware state on runtime
 PM resume
Date: Thu, 11 Mar 2021 18:15:52 +0300
Message-Id: <20210311151554.23982-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311151554.23982-1-digetx@gmail.com>
References: <20210311151554.23982-1-digetx@gmail.com>
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
2.29.2

