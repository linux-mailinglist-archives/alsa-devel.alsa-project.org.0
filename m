Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC7846684F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09EFD28F5;
	Thu,  2 Dec 2021 17:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09EFD28F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462582;
	bh=ey2RRYVXUx0wilOx68X9d3JZZ/Jh56kbfhBqK93ArY0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=omUv6qqEAnp7GOYY7TsQTVkSwCsWI9JLMBEFgkm0vxMpcFVt3PRBu5TeDCp8WyTge
	 gZAbTdoZDL/B+Ye2YWUxJT+9OGg6wqBr7IkElKqmnT8N3pERtmX35snxQQpQLxCqhC
	 CcXXBBiOr2QxOd7N2y4Xs+6x9Lfq8sL8u9W+Wy+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1993F80529;
	Thu,  2 Dec 2021 17:25:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3036F804F2; Thu,  2 Dec 2021 17:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9116F804F2
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9116F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BY2hui+y"
Received: by mail-lf1-x12a.google.com with SMTP id b40so72785321lfv.10
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yiWw98T7doYf6/KdnKDQ+eJuYvZvxnbIRrcyi8dmlBQ=;
 b=BY2hui+ymqBNubr2RLJFdndE5KlDZZN7HF+na2hdS98ySqrDKPcpwwjXNFc6ZGBD3p
 dzHmb8tr3soF7wkqbmRKqZ/eGziCAnwNHww0pmHXIGGBSH4lNnPuMYyJKgoHQwNPg9Nx
 E+Qpq5QIaTxq8j4iuGS9CyDCprqmpQmrfW2kUsLLpM3pi6lmEV5m7hzmZuK58JWmHxrd
 O2WLUI6c5vv95pr2ySCDgSw0S9Q1Ujojkodl1hWLZTlUNc3dwWjWiUfZddziCYzitGdD
 Namx4zV8t7BU8enWv9HiIl/whx4n8COQqNMjz+uVT+zp9+9765mTyf0ePLLFSce8veaE
 lxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yiWw98T7doYf6/KdnKDQ+eJuYvZvxnbIRrcyi8dmlBQ=;
 b=eg72Psc+lILrBgeculoqARXB2cXNBTSOcnKBfy/db3eY//cglwvsyo1E9lbshfyaOe
 8GiBwTDQy7akKnZxQGK9S2K9AI91y8XsURc7hAYzT+bx7sffnpoFLupu8aj0md8ATS/4
 UyN08FL38LA3ydZfepqMisbg6lGAMDOoke63TCz8TMZV/XnEf1BevPX/A5ZaZeVlbMdd
 kRYrg+QOpgWKIQs/crlUI/ylaDwsWBfyS3WrUkeBaFK4fDtqkFXINPXESRMxeLf0Y1bP
 ZiITW1gGWbV4SHcRgbgJhm6la1LXGiwVuBxab0eHywLV9O9Lz2uY5g8E7iQY0KFMtu5F
 TeUQ==
X-Gm-Message-State: AOAM531+w+9uSP0GuWamz0vz4p63XMzcL7N74OINUvwk3AaAqUAOzd/H
 CTbpo4NbHCHCpSyKX80d/HM=
X-Google-Smtp-Source: ABdhPJxWPDVin2e4MAwyj16QBHnjKXZD4uyzquss4/NhUWLBMyMEfOIXblXMBEBUPvWoSC5fLfMTeg==
X-Received: by 2002:ac2:5dcd:: with SMTP id x13mr12550709lfq.602.1638462324651; 
 Thu, 02 Dec 2021 08:25:24 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:24 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 09/20] ASoC: tegra20: spdif: Use more resource-managed
 helpers
Date: Thu,  2 Dec 2021 19:23:30 +0300
Message-Id: <20211202162341.1791-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
index d5c618611dbb..7dd263721c2c 100644
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

