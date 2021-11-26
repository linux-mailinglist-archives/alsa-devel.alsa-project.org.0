Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE745F1C2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C408D1A9F;
	Fri, 26 Nov 2021 17:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C408D1A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943775;
	bh=8Jq3Q1/m+dsROHk9hVl8I3G5iOiKajzkzheVO2tqvI0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOJmCLedQVAM45YyO3dt7hYIX80PNYgLf7wSjnTJ55tDPgw022xd6w0IAUiXHuAyZ
	 nzJyLdbDitMv/0/RKsnEe3E/aS2/bhs9BpxNOBTLgLdGm6hsHAlBVvgOwwzbOgCdKO
	 YFv0lz6K5Btv5LUI41qZWsY5aEe7l4RCJ7dHt/Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDA5F80517;
	Fri, 26 Nov 2021 17:20:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E45C4F804F3; Fri, 26 Nov 2021 17:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF6A9F80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF6A9F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="La5mOtY3"
Received: by mail-lf1-x12c.google.com with SMTP id k37so25544943lfv.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qt8PrFF5rWy8Gj1ABxOEOakxJdpJR0LJrG627NKAlx8=;
 b=La5mOtY3/M8w++da9HHf3ilhXsZ1KGsAAtaZV6vw0DQtGrZlfepS5+oQzw89vUZXdZ
 lFXq50dzCiYjF/19pzaZNoMDOyzLK1aGieF+/wulJTKPNonb6qX7ISF4ZLLmpW3V2Kvk
 x6nFm9PE8F2T5bE1xAy/B0YX2lMzGE4af7HknxwurhPLjqtN32zHNgsiah4xM8Gk4gf+
 yJBaKEOAjG0fPpY6gIvunJyG01Vh1uYp7WMRpC3kEUgmd5tltyYNO3enXRcLoOaQVa+s
 l8VtGxr8jrx6cMJYCZWm7PRQODYvS6y8lWmt61Syz5Nzaqhpp93Nd0c4PYI+izwaMKpX
 H/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qt8PrFF5rWy8Gj1ABxOEOakxJdpJR0LJrG627NKAlx8=;
 b=B6bsVRnKssIGIJrOEfrOhZfoG4g3dUBthN/+bD0+OxPR3R8JKBt1si+DBECnWztuBy
 lL0SvFHydBkAoUracjvv5ruA5iYZYbKq55pJo/VGammIkWAj4OmiZdjxx9bwHtCCPI+L
 zrGcM7zWvKJD4d7vasEnw3AW3XAZxqQYIj+MnYg5gnNvg0QQkyTguHUvBzAOJmfaBGvY
 SFd160gLgkGodOlotZB3B1rWVmhkXF18DBA8SbzjEN+64ucwW8RANeCMCPbyGpKmVA4/
 3MvaK/glUK+qmIp/rOK0O+6nVuxUPfJMULBFeFAAorDh+p/B3elBoyfOpNsJUCB2kGrw
 3L3A==
X-Gm-Message-State: AOAM533dyTD2ADifToNILCHBIRiIdc2P+toOVNscbEcn+FI9I3emTKr2
 OtMyQeQ6UUKj20dkdvbjLD8=
X-Google-Smtp-Source: ABdhPJxvQfHFCUgjvQyYJWDy3x5QSXmLFgMMVvGsAr0GSOiFc5UtsOFPEdBBiLzH2+GMGjuVrVz/sg==
X-Received: by 2002:a19:7019:: with SMTP id h25mr31884909lfc.464.1637943588560; 
 Fri, 26 Nov 2021 08:19:48 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 09/20] ASoC: tegra20: spdif: Use more resource-managed
 helpers
Date: Fri, 26 Nov 2021 19:17:56 +0300
Message-Id: <20211126161807.15776-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Use resource-managed helpers to make code cleaner. Driver's remove callback
isn't needed anymore since driver is completely resource-managed now.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 33 +++++++++------------------------
 sound/soc/tegra/tegra_pcm.c     |  6 ++++++
 sound/soc/tegra/tegra_pcm.h     |  1 +
 3 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 9383683aa4e9..6ca48bc322ae 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -289,38 +289,24 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
-	ret = snd_soc_register_component(&pdev->dev, &tegra20_spdif_component,
-					 &tegra20_spdif_dai, 1);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &tegra20_spdif_component,
+					      &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
-	ret = tegra_pcm_platform_register(&pdev->dev);
+	ret = devm_tegra_pcm_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
-		goto err_unregister_component;
+		return ret;
 	}
 
-	return 0;
-
-err_unregister_component:
-	snd_soc_unregister_component(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static int tegra20_spdif_platform_remove(struct platform_device *pdev)
-{
-	tegra_pcm_platform_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
@@ -342,7 +328,6 @@ static struct platform_driver tegra20_spdif_driver = {
 		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
-	.remove = tegra20_spdif_platform_remove,
 };
 module_platform_driver(tegra20_spdif_driver);
 
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index ef1e74d95236..468c8e77de21 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -48,6 +48,12 @@ int tegra_pcm_platform_register(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_platform_register);
 
+int devm_tegra_pcm_platform_register(struct device *dev)
+{
+	return devm_snd_dmaengine_pcm_register(dev, &tegra_dmaengine_pcm_config, 0);
+}
+EXPORT_SYMBOL_GPL(devm_tegra_pcm_platform_register);
+
 int tegra_pcm_platform_register_with_chan_names(struct device *dev,
 				struct snd_dmaengine_pcm_config *config,
 				char *txdmachan, char *rxdmachan)
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index d602126c65b7..2a36eea1740d 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -32,6 +32,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 				    struct snd_pcm_substream *substream);
 int tegra_pcm_platform_register(struct device *dev);
+int devm_tegra_pcm_platform_register(struct device *dev);
 int tegra_pcm_platform_register_with_chan_names(struct device *dev,
 				struct snd_dmaengine_pcm_config *config,
 				char *txdmachan, char *rxdmachan);
-- 
2.33.1

