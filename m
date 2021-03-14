Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A023533A5C7
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:51:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469FB17B9;
	Sun, 14 Mar 2021 16:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469FB17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737097;
	bh=1WHFvNA0wc7rqLRfOJ+5TuPs3ziUU1A1jZTl4Ri/kPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWgSbuXcAbZ+1P/yvncsH6ZJkyKCnmDH0YWz0NSxu/N/++ohXUxpIUHuVp7pLIDzx
	 NfrL3aaPV2WTFAFdy7LFzV6issurdHT70950q1R5BR5e8hAEA6a7uoq/GLYdChsn9r
	 sC5DDNNc2M5hfazlfKjRLsHxkyUsMpok4Qe9DUF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7398EF80507;
	Sun, 14 Mar 2021 16:45:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33A14F804E6; Sun, 14 Mar 2021 16:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767D8F804AE
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767D8F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i/b/ENnV"
Received: by mail-wm1-x32c.google.com with SMTP id g25so6681951wmh.0
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2VvKGS2IBfU/FyzkzlhapnFhEuPDgTyFY3A2pVCWuc=;
 b=i/b/ENnVfmEm7gJZEiJN2YTGqMz6qL70iprAM+NYUEEBXgzljDTTvb+IEgAQrdAlzw
 RRI/kUonxFW04TF69GppVa/5TpkFs5NyObtXDqlVb23mxcCNI0YRN647B/M6ANMtF6qd
 1mWai9P7B6/XNLswXwsbfAjNZ6lEfjwmZrZEcC/zUm7M6D7OBaN+CfuQjAu/+mHcMEiI
 vEMgGMQotDEac0bFpZEG/2i6miMI9hZz5mCgwZuC2y4cXXm+49oxYO2YEDOdrh8Yu2Ep
 tfOqLmAAI2Z06dhzpWb84yxjGXkJ0ug9HBDC22uUwwFXyoVh0PQ+h1OMZ4EEQZQvImhr
 b77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2VvKGS2IBfU/FyzkzlhapnFhEuPDgTyFY3A2pVCWuc=;
 b=Rz1g5gBFssG72v2vZHB1AEdTrP16jAZz5RiXcxSx9xltrrT8uIYeinqrP2NmNdvDq7
 kB8elNe1M7thG9X815JtkddF5geMSueyXvBZPOavi0EJGTn81AU2W3eLSD+kHHsw8WYt
 T+5rgMAtI5awHpVu8W/hELGfFU852/xTm5Vyhwg4oZdCtrJzwJD4izZPW3B4mxRc6j+S
 oxU4qIVW94D63ljkpTZImKRwsaHyQ9Bp9gq2VqM0b79IFz8w+hs46dPCRqNIszQcYvGf
 SxZeTbJkQLlRKmrtUf48VwWUtcCng++DCYOMAH8OmIDPjXg0LRplcurXLOh4VuSKixWE
 plcA==
X-Gm-Message-State: AOAM5303Q1l/ANlR+9/4aHu8n10lJwcKZ60R5vDrX7hVgTxUPNREOH/x
 yaOoQxTT/Y+rmWSDgVpg8HQ=
X-Google-Smtp-Source: ABdhPJzPUOQiE4u6hODiaXeNZpPVy34v31wjC2p8noKP8thVkp98ivhkzcje9/QeTF2Dt9Lhmeo10Q==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr22842264wmo.36.1615736738237; 
 Sun, 14 Mar 2021 08:45:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:38 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 17/17] ASoC: tegra30: ahub: Remove handing of disabled
 runtime PM
Date: Sun, 14 Mar 2021 18:44:59 +0300
Message-Id: <20210314154459.15375-18-digetx@gmail.com>
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

Runtime PM is always available on Tegra since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence there is no need to
handle the case of a disabled RPM by Tegra drivers. Remove handing
of a disabled runtime PM from Tegra30 AHUB driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index e64b41bc5fdf..d1718f3af3cd 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -584,18 +584,11 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	regcache_cache_only(ahub->regmap_ahub, true);
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra30_ahub_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
-	}
 
 	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 
 	return 0;
 
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
 err_unset_ahub:
 	ahub = NULL;
 
@@ -605,8 +598,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 static int tegra30_ahub_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra30_ahub_runtime_suspend(&pdev->dev);
 
 	ahub = NULL;
 
-- 
2.30.2

