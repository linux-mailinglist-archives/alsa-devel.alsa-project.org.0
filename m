Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02869479370
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:01:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75606179B;
	Fri, 17 Dec 2021 19:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75606179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764098;
	bh=oStwOQFSzZFNTEX57YYfd7fgakSTr9Y9N0zm1cpE7HU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+l8jn0EC3wjRO6VaNawCCHSDxsg7flEm42BV5ORl3LmUpMSqsp2h8T8ZOT9idSSE
	 uE6oqwAMOZWj6XH33Mu/pTz28yTXzMBTnzyrQgBkQryzBFMdEBwb5TXwVvLMk41z/p
	 lkwfhBEv4QR5ptHn+eh20N3Hkz44mgRIYpyKPCAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D49F80525;
	Fri, 17 Dec 2021 18:58:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F9FAF804E2; Fri, 17 Dec 2021 18:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87D29F80163
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D29F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eVsiYbxg"
Received: by mail-lj1-x22b.google.com with SMTP id 207so4557689ljf.10
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqLuVXC4jwufxGK1dX3uLmtIMBuslaR2IYjyNFht/Gg=;
 b=eVsiYbxgI3SySynHVDPZjsz0AyNzwxQlGuvam0ExZRcWjLsqMPtnMrX938mJ3xZOtu
 Jqdh44zdQuqX+HpZQJiTNx1xGLtx/q2IDMBBwEnW3k1qsg0991IRHMmm5xzWyGwDoyGb
 ZJGFfaQFEYOe4iFSNmFDc+wgYH4RsGWTYzDiiMReUr7JqXUFiRYGUwoCLLX+aP/2ihLn
 7nxqZ7ruNTZ1zk6h/73+0b+51k2Pcek0meD56cPUAbmKSRDwMRO5TQY46FT8CqyRA5i/
 TmHP8eUFlgOGAzzN0FdzdsZZH/tbnZHvNipUbp2+1qA7aenRwYYn1fdhgegXmN1O6ufw
 ykZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqLuVXC4jwufxGK1dX3uLmtIMBuslaR2IYjyNFht/Gg=;
 b=tc9BXF7QvAirMvlC7Nw4xJu2ksKxLUWZI7ZyEGv05TTkDx2xHd2aTrIVOkAwE8GKjO
 o6qaTKHiSVJ2XcWoJO92cDj9cZwN1imFFwVq6zNBeF/BHV0FASjNpBT3s3ispRiVic7l
 +7GkUIQqxdJ5s2G9DarTBmQjDWb1tVHGE2+VeBrnx5cB1aHOlq/8z4Cq6PhRX5CitQHj
 9K/AKifBQK+YDKI4c10SLnt7HnseClBL7pDDLsOL+J9noICz5v2W8XcNbguRDKsg8kUr
 FY176JmXOkV+6SiAmMx/l9GvVKIIC89RJ3jm1XkjjM3IuYyhO7PR2JV0ZmTWm+vggWMA
 z1Sg==
X-Gm-Message-State: AOAM530ngaFTYleJ4SIXf3lkV2skSiK8BLGcGwQQHt9/pzeqgIhpDGoX
 d1pZ5MyzmAFjeeVRgxtsAvXCBzeBVcE=
X-Google-Smtp-Source: ABdhPJyOv4C4jOeRdPJOG+B9sXUeBtRuepkZaN8QgUTqZOcmKtNHWB40FMVBmrpbEHpup8ZgQVAvlQ==
X-Received: by 2002:a2e:5d7:: with SMTP id 206mr3790803ljf.133.1639763888185; 
 Fri, 17 Dec 2021 09:58:08 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 06/11] ASoC: tegra20: spdif: Improve driver's code
Date: Fri, 17 Dec 2021 20:56:01 +0300
Message-Id: <20211217175606.22645-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
References: <20211217175606.22645-1-digetx@gmail.com>
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

- Clean up whitespaces, defines and variables.

- Remove obsolete code.

- Adhere to upstream coding style.

- Don't override returned error code.

- Replace pr_err with dev_err.

No functional changes are made by this patch. This is a minor code's
refactoring that will ease further maintenance of the driver.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 49 ++++++++++++---------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 801784915004..d5c618611dbb 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -23,8 +23,6 @@
 
 #include "tegra20_spdif.h"
 
-#define DRV_NAME "tegra20-spdif"
-
 static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
@@ -49,11 +47,10 @@ static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 }
 
 static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params,
-				struct snd_soc_dai *dai)
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
 {
-	struct device *dev = dai->dev;
-	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 	unsigned int mask = 0, val = 0;
 	int ret, spdifclock;
 
@@ -106,7 +103,7 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	ret = clk_set_rate(spdif->clk_spdif_out, spdifclock);
 	if (ret) {
-		dev_err(dev, "Can't set SPDIF clock rate: %d\n", ret);
+		dev_err(dai->dev, "Can't set SPDIF clock rate: %d\n", ret);
 		return ret;
 	}
 
@@ -127,9 +124,9 @@ static void tegra20_spdif_stop_playback(struct tegra20_spdif *spdif)
 }
 
 static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
-				struct snd_soc_dai *dai)
+				 struct snd_soc_dai *dai)
 {
-	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -151,7 +148,7 @@ static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
-	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 
 	dai->capture_dma_data = NULL;
 	dai->playback_dma_data = &spdif->playback_dma_data;
@@ -160,26 +157,26 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
-	.hw_params	= tegra20_spdif_hw_params,
-	.trigger	= tegra20_spdif_trigger,
+	.hw_params = tegra20_spdif_hw_params,
+	.trigger = tegra20_spdif_trigger,
 };
 
 static struct snd_soc_dai_driver tegra20_spdif_dai = {
-	.name = DRV_NAME,
+	.name = "tegra20-spdif",
 	.probe = tegra20_spdif_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
-				SNDRV_PCM_RATE_48000,
+			 SNDRV_PCM_RATE_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.ops = &tegra20_spdif_dai_ops,
 };
 
 static const struct snd_soc_component_driver tegra20_spdif_component = {
-	.name		= DRV_NAME,
+	.name = "tegra20-spdif",
 };
 
 static bool tegra20_spdif_wr_rd_reg(struct device *dev, unsigned int reg)
@@ -260,7 +257,7 @@ static const struct regmap_config tegra20_spdif_regmap_config = {
 static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 {
 	struct tegra20_spdif *spdif;
-	struct resource *mem, *dmareq;
+	struct resource *mem;
 	void __iomem *regs;
 	int ret;
 
@@ -273,27 +270,19 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
-		pr_err("Can't retrieve spdif clock\n");
-		ret = PTR_ERR(spdif->clk_spdif_out);
-		return ret;
+		dev_err(&pdev->dev, "Could not retrieve spdif clock\n");
+		return PTR_ERR(spdif->clk_spdif_out);
 	}
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-	if (!dmareq) {
-		dev_err(&pdev->dev, "No DMA resource\n");
-		return -ENODEV;
-	}
-
 	spdif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
-					    &tegra20_spdif_regmap_config);
+					      &tegra20_spdif_regmap_config);
 	if (IS_ERR(spdif->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
-		ret = PTR_ERR(spdif->regmap);
-		return ret;
+		return PTR_ERR(spdif->regmap);
 	}
 
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
@@ -306,7 +295,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 					 &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
-		ret = -ENOMEM;
 		goto err_pm_disable;
 	}
 
@@ -349,14 +337,13 @@ MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
 
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
-		.name = DRV_NAME,
+		.name = "tegra20-spdif",
 		.pm = &tegra20_spdif_pm_ops,
 		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
 	.remove = tegra20_spdif_platform_remove,
 };
-
 module_platform_driver(tegra20_spdif_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-- 
2.33.1

