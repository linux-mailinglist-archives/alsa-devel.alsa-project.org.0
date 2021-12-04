Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE794685B0
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC2723BD;
	Sat,  4 Dec 2021 15:41:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC2723BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628918;
	bh=ey2RRYVXUx0wilOx68X9d3JZZ/Jh56kbfhBqK93ArY0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xv7Pk4khhXlmMzzRdu+ReBHtcfYEQLMrWU/nwxjspZUqXHQnBBZmc2K0PC1V4Nlbt
	 E2NRnT2JuzrS4qcv1HNmCqTlsv3ZebHHSREGen+GbkgeL494lwUX2xOKafDaP8utNz
	 jjeTk5YM83Zf8uZACIdeaXOHxyiFdOFGunVQAOZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE24F80537;
	Sat,  4 Dec 2021 15:38:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E8DFF80507; Sat,  4 Dec 2021 15:37:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 392E6F80240
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 392E6F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CvIzdumJ"
Received: by mail-lf1-x130.google.com with SMTP id c32so13806551lfv.4
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yiWw98T7doYf6/KdnKDQ+eJuYvZvxnbIRrcyi8dmlBQ=;
 b=CvIzdumJO57P7zWKTttzFuuWukezUtQ7SVqlCIDYJOCL+DDGJxa5NRlTzP5ufVTyJ3
 WdBnoPEWjyt/yA9/2yfp5uKl97UlOmh+2/vbgRGtRKHmGAzisdMgBlLyKdImPkUtofUz
 q9BHiVvU3wDb+5i1gQYwAeev/0armeUk1a/euDZjUbwA+gB18AP7AOuRBLxcIZpWo4yY
 gdrBt4VM0+pFbydfe7BjRCAckyhxJp2/NNOMC77qDxxxrT2nUvwqnd7zOcVAdIFgFErp
 YiV3VT6GsX1JEh9CqKnVF0BwtNheR9RH33TRbulARC2YxWbmmzy2zZ36Urf0WDOLiKAr
 r+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yiWw98T7doYf6/KdnKDQ+eJuYvZvxnbIRrcyi8dmlBQ=;
 b=ZM/YN5AHWMduT0zYQ5B+zvdabeIXNQLRwT2UIQfawmsESW7H3px7E4kBjfm6MtCaIY
 72u0U2JsSd31vEuWlErGz4ems7JOpV5/lly3x7mLb0Roymul0SNtichVLxriQGTKgPoX
 Vy9fobGl9AuTUtwbbM0VoBind5Mf6nMKoxBxT8KqjdtTdfW5V37ZEsEpNU3jOcD6lBBZ
 mfspzMXmyLEFLPATpVFZuzK1XIoUiYmMfP5ihJrUqUNPgQ+14qjEZYFbYnVnCQcQ8mno
 2kEMjkCuk9fiiHxXZ88EObjXDQ5kPZJ/r6vxVG3wAf+ZRvbA0Vnnji76glCWxkbPB1/o
 YdXA==
X-Gm-Message-State: AOAM530CLuo/jzedeZ7t52usXJiCRVziYIS0KbRytzHtD2HAE8FvhgeX
 /02caXQr15toAodGALszM1c=
X-Google-Smtp-Source: ABdhPJwGxqR5dlehJ7vaPbP5WBGS9cfxwU4MhdypIIFth3sVfScXSDCGAKQzEHWJmayVj6NGoxgE2w==
X-Received: by 2002:a05:6512:1090:: with SMTP id
 j16mr23911147lfg.568.1638628658719; 
 Sat, 04 Dec 2021 06:37:38 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 09/22] ASoC: tegra20: spdif: Use more resource-managed
 helpers
Date: Sat,  4 Dec 2021 17:37:12 +0300
Message-Id: <20211204143725.31646-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

