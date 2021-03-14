Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A059533A5BF
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:49:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46354179E;
	Sun, 14 Mar 2021 16:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46354179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615736974;
	bh=bGLfxfoc97+Wm7TDtKJmLVizjezZOPD9Fy03oG8L+QA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gW9cZrmMQNNv3hPUeKuiPsErvV9nG/LUG7bZPFz8H6X3j/QvH+JC2FeORrVTg7NJG
	 UcObTHCYsBFAeEvINhmwcXG6Y86a7ylf4oz1lH7y21U1g9LPZMpxE04gV/IKNJsPBp
	 Qw2dZjPuiwMaEBgxehRX94JwySoaSuJyQEzemqA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80F02F8026A;
	Sun, 14 Mar 2021 16:45:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1899DF804B0; Sun, 14 Mar 2021 16:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A746F8032C
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A746F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FricUU/Z"
Received: by mail-wm1-x330.google.com with SMTP id g25so6681860wmh.0
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uwOwpk83R+cdKaOIdKgxM+y8AmMlhEg4nEbu82oea8Y=;
 b=FricUU/Zao/xfxzFKTc/T0yHKvS5FKBGmCGggEL+kCVwYG10h72X7XZDuRwAeTS8ip
 5F49BIStvN+EtFtHbcAWlS4gZAB1quwkgVHafSXe2mKDqSTnF/U9UPj27kcKuW49WYwY
 8c+6lqTeuZJfDkrSIIUb4eeqbPQu44Z3d1cqOk/pODSIXib2UHUCO0/7ApureugiyYnT
 Q3An7Ku5jD4618Z1DIF3m3sxdxKiQTE3D7qZF+8Mxv+X/3NGj3eZQzF1pPS+uc0+IdKp
 3feJFt+mpxCi3ZsYL7HFBiYYPTHAA7ewSEDHvjis31OEfWaAZXLqy9NbGgWqAwbTvniW
 gX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uwOwpk83R+cdKaOIdKgxM+y8AmMlhEg4nEbu82oea8Y=;
 b=U9gElvZ+noEmxu3i28570HxbI6VAmelRBTVX7SL7G1G5dgQI22o+Or48tx9zwOvpim
 QVAMVNsIr/bGm9443Wfd6+IXit0ipOE3ClUi1z3szWrtwLn6Fk+M9K3m1zbG6UL0zPK+
 tuv6UeBuJpqLbde78s7y9+KiuscEkgqOTgfErn9zcMj187Lei7+bdwaLWVp8B4xHZ10p
 dRuQKXMqFQ59xAJKTC9EyIl8bwr08kpZVn6p+4QAdfaZkabSOb4c32ioduacxAIakRwb
 JY8P7/A5770zTGZhIIYpvF24KDFsO9rTkzepsNgYz30f8ZhZ9TRX5X+dYIDP5RiRAy15
 vrZw==
X-Gm-Message-State: AOAM5339dagNiMR/H2Q3H9b28UpSfqAccWnBgzJ75dDfyYlyGmhK90Q1
 iNAkTKSvN6xH2sEx4LZiMOg13q8B1dM=
X-Google-Smtp-Source: ABdhPJz5OaywGExFLiRmwwnO3hyEECgOoB4oHGxY5YtIYXgA3PAkWwqN8R9YoMcN8/QUH/w8/RFJAA==
X-Received: by 2002:a05:600c:22cd:: with SMTP id
 13mr21770353wmg.90.1615736730659; 
 Sun, 14 Mar 2021 08:45:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 10/17] ASoC: tegra20: i2s: Use devm_clk_get()
Date: Sun, 14 Mar 2021 18:44:52 +0300
Message-Id: <20210314154459.15375-11-digetx@gmail.com>
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

Use resource-managed variant of clk_get() to simplify code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 0f2bdc2e8598..fe569198b17a 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -370,7 +370,7 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->reset);
 	}
 
-	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
+	i2s->clk_i2s = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
 		ret = PTR_ERR(i2s->clk_i2s);
@@ -381,7 +381,7 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	regs = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
-		goto err_clk_put;
+		goto err;
 	}
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
@@ -389,7 +389,7 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		ret = PTR_ERR(i2s->regmap);
-		goto err_clk_put;
+		goto err;
 	}
 
 	i2s->capture_dma_data.addr = mem->start + TEGRA20_I2S_FIFO2;
@@ -430,16 +430,12 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 		tegra20_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_clk_put:
-	clk_put(i2s->clk_i2s);
 err:
 	return ret;
 }
 
 static int tegra20_i2s_platform_remove(struct platform_device *pdev)
 {
-	struct tegra20_i2s *i2s = dev_get_drvdata(&pdev->dev);
-
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
@@ -447,8 +443,6 @@ static int tegra20_i2s_platform_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra20_i2s_runtime_suspend(&pdev->dev);
 
-	clk_put(i2s->clk_i2s);
-
 	return 0;
 }
 
-- 
2.30.2

