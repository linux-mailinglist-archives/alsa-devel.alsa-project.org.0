Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71133A5CF
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C6DB1849;
	Sun, 14 Mar 2021 16:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C6DB1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737215;
	bh=pbfmxMajxGv+lyHQTMVaQ4SRgFvlXILuf1dcbhvorTE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8WaBrUf6kq84S8+zMzlpFpvcT1waNUacqYJ3fmcTGn9r0x3S2TrJYYs24b3C+las
	 olbFQP1kGYVmbl87uTMXsxyL8B5fbNZIC4WDdjycmKHhCcBGiQQCWgjXg424Ua/pWm
	 fUTu/8YhjWKcr3gqg8FU/xPwbZQojwckiu0UzcCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECFCF8053A;
	Sun, 14 Mar 2021 16:46:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B03CF80510; Sun, 14 Mar 2021 16:45:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E42A6F8049C
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E42A6F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="abtm9MxN"
Received: by mail-wm1-x335.google.com with SMTP id l19so6689604wmh.1
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gWjZKVNCnhVgYQ/8NhksOw3cbjmVx93WVZKmCK3l6c=;
 b=abtm9MxNfLHcix+/FQw/rNeDglWV4BUl8lzzCjJFCMRtuhj/+6yel89bpO0ouFcki0
 BXDiav8ardhQyt0WAoVbEzxFDuMxJoYJ6BTnM9MEKx5yaR/iFoRNgxUwbNTAiCe/6ZZI
 s9zdeYKz/v6b9syBmJB67b//GEPdvpm8gbVqivCXVG92zQz9UTIvDeX96+28pltUzA+X
 PJzyWrg+K4Zft4AGhFCpH45Mf1I38XJdojXiUqH7WkGyIGi0kCGtQeUo8LzJiCRV1S0X
 3m/EGAv7qBwpPh+dgMvxIORFXx6M6caH7BIB8V4/c/bbfFQNCDnXHgCty4xKx8VhK0io
 ikow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gWjZKVNCnhVgYQ/8NhksOw3cbjmVx93WVZKmCK3l6c=;
 b=lsKiYyrZ9sFP4tHeF7cPBrafwgotHIJRbZHEojm1oPAh0v/e3Jcf1VizSg+4ypISoZ
 34NzgaIb5cCI+7WSyvPE8HQ2+8BrwHKJXOhqQq2JOUIGh8nlcgKE2n9x3gMsQ2QzfW5t
 zWMjecSQ8WT1C5op7GOkE54fwYeqtLdpeqY9Gw8HJqiBSssFxQ5CWsu1ttYKIK9T1tWn
 4pUWKmIkfhctf7KfzxpJxY/GWg0zwGMcT52ugQ+p85ntklvRl1R5kBR5Y0+ON6XOC60j
 jF0ORPB95dl+gwCJrREgyk6NC1f3QbvWCEY4vursmyNlg3PZvLn2U304qCTfm/KNZCTk
 auzA==
X-Gm-Message-State: AOAM530kIANyYB6w3bWO72Uxivnju3nugU5nD7L/tE0fS4ABjsptJmwU
 69GYX3Utd8yII9Jydvt4tQa+MJjYnlQ=
X-Google-Smtp-Source: ABdhPJxgG1keItrwFks9hEM0/7+x4JA1tAmy+rjay3Yt2mmi5atU+WjDNSkfDgoSHCLjUmDzxJStqw==
X-Received: by 2002:a05:600c:2d42:: with SMTP id
 a2mr22510522wmg.77.1615736737227; 
 Sun, 14 Mar 2021 08:45:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:37 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 16/17] ASoC: tegra30: ahub: Correct suspend-resume callbacks
Date: Sun, 14 Mar 2021 18:44:58 +0300
Message-Id: <20210314154459.15375-17-digetx@gmail.com>
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

Tegra30 AHUB driver always syncs hardware state on a runtime PM resume,
hence there is no needed to re-sync the state on system resume. Replace
the suspend-resume callbacks with a generic helpers which ensure that
AHUB is suspended using RPM callbacks across system suspend-resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 409a259e6343..e64b41bc5fdf 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -613,36 +613,11 @@ static int tegra30_ahub_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra30_ahub_suspend(struct device *dev)
-{
-	regcache_mark_dirty(ahub->regmap_ahub);
-	regcache_mark_dirty(ahub->regmap_apbif);
-
-	return 0;
-}
-
-static int tegra30_ahub_resume(struct device *dev)
-{
-	int ret;
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
-		return ret;
-	}
-	ret = regcache_sync(ahub->regmap_ahub);
-	ret |= regcache_sync(ahub->regmap_apbif);
-	pm_runtime_put(dev);
-
-	return ret;
-}
-#endif
-
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
 			   tegra30_ahub_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra30_ahub_suspend, tegra30_ahub_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_ahub_driver = {
-- 
2.30.2

